--[[
< CATHERINE > - A free role-playing framework for Garry's Mod.
Development and design by L7D.

Catherine is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Catherine.  If not, see <http://www.gnu.org/licenses/>.
]]--

catherine.intro = catherine.intro or {
	status = true,
	loading = true,
	backAlpha = 255,
	loadingAlpha = 0,
	rotate = 0,
	startTime = 0,
	
	firstStageShowingTime = nil,
	firstStage = false,
	firstStageEnding = false,
	firstStageX = ScrW( ),
	firstStageEffect = false,
	
	secondStageShowingTime = nil,
	secondStage = false,
	secondStageEnding = false,
	secondStageX = ScrW( ),
	secondStageAlpha = 255,
	secondStageEffect = false,
	
	introDone = false
}
local entityCaches = { }
local nextEntityCacheWork = CurTime( )
local toscreen = FindMetaTable( "Vector" ).ToScreen
local OFFSET_PLAYER = Vector( 0, 0, 30 )
local OFFSET_AD_ESP = Vector( 0, 0, 50 )
local frameworkLogoMat = Material( catherine.configs.frameworkLogo )
local gradientUpMat = Material( "gui/gradient_up" )
local gradientCenterMat = Material( "gui/center_gradient" )
local introBooA = 0

function GM:HUDShouldDraw( name )
	for k, v in pairs( catherine.hud.blockedModules ) do
		if ( v != name ) then continue end
		
		return false
	end
	
	return true
end

function GM:ContextMenuOpen( )
	return false
end

function GM:HUDPaintBackground( )
	local lp = LocalPlayer( )
	if ( !lp:IsAdmin( ) or !lp:IsNoclipping( ) ) then return end
	
	for k, v in pairs( player.GetAllByLoaded( ) ) do
		if ( lp == v ) then continue end
		local pos = toscreen( v:LocalToWorld( v:OBBCenter( ) + OFFSET_AD_ESP ) )

		draw.SimpleText( v:Name( ), "catherine_normal15", pos.x, pos.y, team.GetColor( v:Team( ) ), 1, 1 )

		hook.Run( "AdminESPDrawed", lp, v, pos.x, pos.y )
	end
end

function GM:SpawnMenuOpen( )
	return LocalPlayer( ):IsAdmin( )
end

function GM:ShouldDrawLocalPlayer( pl )
	if ( pl:GetNetVar( "isActioning" ) ) then
		return true
	end
end

function GM:CalcView( pl, pos, ang, fov )
	local viewData = self.BaseClass.CalcView( self.BaseClass, pl, pos, ang, fov ) or { }

	if ( catherine.intro.status ) then
		viewData = {
			origin = Vector( 0, 0, 200000 )
		}
		
		return viewData
	end
	
	if ( pl:GetNetVar( "isActioning" ) ) then
		local data = util.TraceLine( {
			start = pos, 
			endpos = pos - ( ang:Forward( ) * 100 )
		} )

		viewData = {
			origin = data.Fraction < 1 and ( data.HitPos + data.HitNormal * 5 ) or data.HitPos
		}
		
		return viewData
	end
	
	if ( IsValid( catherine.vgui.character ) or !pl:IsCharacterLoaded( ) ) then
		viewData = {
			origin = catherine.configs.schematicViewPos.pos,
			angles = catherine.configs.schematicViewPos.ang
		}
		
		return viewData
	end

	local ent = Entity( pl:GetNetVar( "ragdollIndex", 0 ) )

	if ( IsValid( ent ) and ent:GetClass( ) == "prop_ragdoll" and catherine.player.IsRagdolled( pl ) ) then
		local index = ent:LookupAttachment( "eyes" )
		
		if ( index ) then
			local data = ent:GetAttachment( index )

			viewData = {
				origin = data and data.Pos,
				angles = data and data.Ang
			}
			
			return viewData
		end
	end
	
	return self.BaseClass.CalcView( self.BaseClass, pl, pos, ang, fov )
end

function GM:HUDDrawScoreBoard( )
	if ( LocalPlayer( ):IsCharacterLoaded( ) or ( catherine.intro.introDone and catherine.intro.backAlpha <= 0 ) ) then return end
	local scrW, scrH = ScrW( ), ScrH( )

	// Backgrounds
	draw.RoundedBox( 0, 0, 0, scrW, scrH, Color( 255, 255, 255, catherine.intro.backAlpha ) )
	surface.SetDrawColor( 200, 200, 200, catherine.intro.backAlpha )
	surface.SetMaterial( gradientUpMat )
	surface.DrawTexturedRect( 0, 0, scrW, scrH )

	if ( catherine.intro.status ) then
		catherine.intro.backAlpha = Lerp( 0.03, catherine.intro.backAlpha, 255 )
	else
		catherine.intro.backAlpha = Lerp( 0.03, catherine.intro.backAlpha, 0 )
	end

	if ( catherine.intro.loading ) then
		catherine.intro.loadingAlpha = Lerp( 0.03, catherine.intro.loadingAlpha, 255 )
	else
		catherine.intro.loadingAlpha = Lerp( 0.03, catherine.intro.loadingAlpha, 0 )
	end
	
	// Intro codes
	if ( catherine.intro.status and catherine.intro.startTime != 0 ) then
		if ( catherine.intro.startTime + 5 <= CurTime( ) ) then
			catherine.intro.firstStage = true

			if ( catherine.intro.firstStageX >= scrW / 2 - 512 / 2 ) then
				catherine.intro.firstStageX = math.Approach( catherine.intro.firstStageX, scrW / 2 - 512 / 2, 33 )
			end
			
			if ( !catherine.intro.firstStageEffect ) then
				introBooA = 255
				surface.PlaySound( "CAT/intro_slide.wav" ) // Tooong!
				catherine.intro.firstStageEffect = true
			end
			
			if ( !catherine.intro.firstStageShowingTime ) then
				catherine.intro.firstStageShowingTime = CurTime( )
			end
			
			if ( catherine.intro.firstStageShowingTime + 4 <= CurTime( ) ) then
				if ( !catherine.intro.secondStageShowingTime ) then
					catherine.intro.secondStageShowingTime = CurTime( )
				end
			
				catherine.intro.secondStage = true
				
				if ( !catherine.intro.secondStageEffect ) then
					introBooA = 255
					surface.PlaySound( "CAT/intro_slide.wav" ) // Tooong!
					catherine.intro.secondStageEffect = true
				end
				
				catherine.intro.firstStageX = math.Approach( catherine.intro.firstStageX, 0 - 512, 33 )
				
				if ( !catherine.intro.secondStageEnding ) then
					catherine.intro.secondStageX = math.Approach( catherine.intro.secondStageX, scrW / 2 - 512 / 2, 33 )
				end
				
				if ( catherine.intro.firstStageEnding ) then
					catherine.intro.firstStage = false
				else
					if ( catherine.intro.firstStageX <= 0 - 512 ) then
						catherine.intro.firstStageEnding = true
					end
				end
				
				if ( catherine.intro.secondStageShowingTime + 4 <= CurTime( ) ) then
					catherine.intro.secondStageX = math.Approach( catherine.intro.secondStageX, 0 - 512, 33 )

					if ( !catherine.intro.secondStageEnding ) then
						surface.PlaySound( "CAT/UI/intro_done.wav" ) // Sike!
						catherine.intro.secondStageEnding = true
					end

					if ( catherine.intro.secondStageX <= 0 - 512 and !catherine.intro.introDone ) then
						catherine.intro.introDone = true
						catherine.intro.status = false
						
						if ( !catherine.intro.loading and catherine.intro.introDone and !IsValid( catherine.vgui.character ) ) then
							catherine.vgui.character = vgui.Create( "catherine.vgui.character" )
							// Call character panel
						end
					end
				end
			end
		end
		
		introBooA = Lerp( 0.02, introBooA, 0 )
	end

	if ( catherine.intro.loadingAlpha > 0 ) then
		// Loading circle
		catherine.intro.rotate = math.Approach( catherine.intro.rotate, catherine.intro.rotate - 5, 5 )
		
		draw.NoTexture( )
		surface.SetDrawColor( 90, 90, 90, catherine.intro.loadingAlpha )
		catherine.geometry.DrawCircle( 40, scrH - 40, 15, 5, catherine.intro.rotate, 250, 100 )
	end

	// Framework logo
	surface.SetDrawColor( 50, 50, 50, 255 )
	surface.SetMaterial( frameworkLogoMat )
	surface.DrawTexturedRect( catherine.intro.firstStageX, scrH / 2 - 256 / 2, 512, 256 )

	// Schema logo
	surface.SetDrawColor( 255, 255, 255, catherine.intro.secondStageAlpha )
	surface.SetMaterial( Material( catherine.configs.schemaLogo ) )
	surface.DrawTexturedRect( catherine.intro.secondStageX, scrH / 2 - 256 / 2, 512, 256 )

	// Catherine version
	draw.SimpleText( LANG( "Version_UI_YourVer_AV", catherine.version.Ver ), "catherine_normal15", scrW - 20, scrH - 25, Color( 50, 50, 50, catherine.intro.backAlpha ), TEXT_ALIGN_RIGHT, 1 )
	
	// Whitescreen
	draw.RoundedBox( 0, 0, 0, scrW, scrH, Color( 255, 255, 255, introBooA ) )
end

function GM:PostDrawTranslucentRenderables( depth, skybox )
	if ( depth or skybox ) then return end

	for k, v in pairs( ents.FindInSphere( LocalPlayer( ):GetPos( ), 256 ) ) do
		if ( !IsValid( v ) or !catherine.entity.IsDoor( v ) or catherine.door.IsDoorDisabled( v ) ) then continue end
		
		hook.Run( "DrawDoorText", v )
	end
end

function GM:PlayerBindPress( pl, code, pressed )
	if ( code.find( code, "messagemode" ) and pressed ) then
		catherine.chat.SetStatus( true )
		
		return true
	end
end

function GM:DrawDoorText( ent )
	if ( catherine.door.IsDoorDisabled( ent ) ) then return end
	local a = catherine.util.GetAlphaFromDistance( ent:GetPos( ), LocalPlayer( ):GetPos( ), 256 )

	if ( a <= 0 ) then
		return
	end
	
	local data = catherine.door.CalcDoorTextPos( ent )
	
	local title = ent.GetNetVar( ent, "title", LANG( "Door_UI_Default" ) )
	local desc = catherine.door.GetDetailString( ent )
	
	surface.SetFont( "catherine_normal50" )
	local titleW, titleH = surface.GetTextSize( title )
	local descW, descH = surface.GetTextSize( desc )
	local longW = descW > titleW and descW or titleW
	//local longH = titleH + descScale + 8 // We don't need this :)
	local scale = math.abs( ( data.w * 0.8 ) / longW )
	local titleScale = math.min( scale, 0.1 )
	local descScale = math.min( scale, 0.03 )
	local pos, posBack = data.pos, data.posBack
	local ang, angBack = data.ang, data.angBack
	
	cam.Start3D2D( pos, ang, titleScale )
		surface.SetDrawColor( 255, 255, 255, a )
		surface.SetMaterial( gradientCenterMat )
		surface.DrawTexturedRect( 0 - longW / 2, 0 - 40, longW, 1 )
		
		surface.SetDrawColor( 255, 255, 255, a )
		surface.SetMaterial( gradientCenterMat )
		surface.DrawTexturedRect( 0 - longW / 2, 80, longW, 1 )
		
		draw.SimpleText( title, "catherine_normal40", 0, 0, Color( 235, 235, 235, a ), 1, 1 )
	cam.End3D2D( )
	
	cam.Start3D2D( posBack, angBack, titleScale )
		surface.SetDrawColor( 255, 255, 255, a )
		surface.SetMaterial( gradientCenterMat )
		surface.DrawTexturedRect( 0 - longW / 2, 0 - 40, longW, 1 )
		
		surface.SetDrawColor( 255, 255, 255, a )
		surface.SetMaterial( gradientCenterMat )
		surface.DrawTexturedRect( 0 - longW / 2, 80, longW, 1 )
		
		draw.SimpleText( title, "catherine_normal40", 0, 0, Color( 235, 235, 235, a ), 1, 1 )
	cam.End3D2D( )
	
	cam.Start3D2D( pos, ang, descScale )
		draw.SimpleText( desc, "catherine_normal50", 0, 90, Color( 235, 235, 235, a ), 1, 1 )
	cam.End3D2D( )
	
	cam.Start3D2D( posBack, angBack, descScale )
		draw.SimpleText( desc, "catherine_normal50", 0, 90, Color( 235, 235, 235, a ), 1, 1 )
	cam.End3D2D( )
end

function GM:StartChat( )
	netstream.Start( "catherine.IsTyping", true )
end

function GM:FinishChat( )
	netstream.Start( "catherine.IsTyping", false )
end

function GM:DrawEntityTargetID( pl, ent, a )
	if ( ent:GetNetVar( "noDrawOriginal" ) == true or ( ent:IsPlayer( ) and catherine.player.IsRagdolled( ent ) ) ) then
		return
	end
	
	local entPlayer = ent
	
	if ( ent:GetClass( ) == "prop_ragdoll" ) then
		entPlayer = ent.GetNetVar( ent, "player" )
	end
	
	if ( !IsValid( entPlayer ) or !entPlayer:IsPlayer( ) ) then return end

	local index = ent:LookupBone( "ValveBiped.Bip01_Head1" )

	if ( index ) then
		local pos = toscreen( ent:GetBonePosition( index ) )
		local x, y = pos.x, pos.y - 100
		local name, desc = hook.Run( "GetPlayerInformation", pl, entPlayer, true )
		local col = team.GetColor( entPlayer:Team( ) )
		
		draw.SimpleText( name, "catherine_normal20", x, y, Color( col.r, col.g, col.b, a ), 1, 1 )
		y = y + 20
		
		draw.SimpleText( desc, "catherine_normal15", x, y, Color( 255, 255, 255, a ), 1, 1 )
		y = y + 20

		hook.Run( "PlayerInformationDraw", pl, entPlayer, x, y, a )
	end
end

function GM:PlayerInformationDraw( pl, target, x, y, a )
	if ( catherine.player.IsRagdolled( target ) ) then
		draw.SimpleText( LANG( "Player_Message_Ragdolled_HUD" ), "catherine_normal15", x, y, Color( 255, 255, 255, a ), 1, 1 )
		y = y + 20
	end
	
	if ( catherine.player.IsTied( target ) ) then
		draw.SimpleText( LANG( "Player_Message_UnTie" ), "catherine_normal15", x, y, Color( 255, 255, 255, a ), 1, 1 )
		y = y + 20
	end
	
	if ( !target:Alive( ) ) then
		draw.SimpleText( LANG( "Player_Message_Dead_HUD" ), "catherine_normal15", x, y, Color( 255, 255, 255, a ), 1, 1 )
		y = y + 20
	end
end

function GM:GetUnknownTargetName( pl, target )
	return LANG( "Recognize_UI_Unknown" )
end

function GM:EntityCacheWork( pl )
	if ( !pl:IsCharacterLoaded( ) ) then return end
	if ( nextEntityCacheWork <= CurTime( ) ) then
		local data = { }
		data.start = pl:GetShootPos( )
		data.endpos = data.start + pl:GetAimVector( ) * 160
		data.filter = pl
		local ent = util.TraceLine( data ).Entity

		entityCaches[ ent ] = IsValid( ent ) and true or nil
		nextEntityCacheWork = CurTime( ) + 0.5
	end
	
	for k, v in pairs( entityCaches ) do
		if ( !IsValid( k ) ) then
			entityCaches[ k ] = nil
			continue
		end
		
		local a = Lerp( 0.02, k.CAT_entityCacheAlpha or 0, catherine.util.GetAlphaFromDistance( k:GetPos( ), pl:GetPos( ), 256 ) )
		k.CAT_entityCacheAlpha = a

		if ( a <= 0 ) then
			entityCaches[ k ] = nil
			continue
		end
		
		if ( k.DrawEntityTargetID ) then
			k:DrawEntityTargetID( pl, k, a )
		else
			hook.Run( "DrawEntityTargetID", pl, k, a )
		end
	end
end

function GM:HUDPaint( )
	if ( IsValid( catherine.vgui.character ) ) then return end
	local pl = LocalPlayer( )
	
	hook.Run( "HUDBackgroundDraw" )
	catherine.hud.Draw( pl )
	catherine.bar.Draw( pl )
	catherine.hint.Draw( pl )
	hook.Run( "HUDDraw" )
	
	if ( pl:Alive( ) ) then
		hook.Run( "EntityCacheWork", pl )
	end
end

function GM:PostRenderVGUI( )
	if ( IsValid( catherine.vgui.character ) ) then return end
	
	catherine.notify.Draw( )
end

function GM:CalcViewModelView( wep, viewMdl, oldEyePos, oldEyeAngles, eyePos, eyeAng )
	if ( !IsValid( wep ) ) then return end
	local pl = LocalPlayer( )
	local val = pl:GetWeaponRaised( ) and 0 or 100
	local fraction = ( pl.wepRaisedFraction or 0 ) / 100
	local lowerAng = wep.LowerAngles or Angle( 30, -30, -25 )
	
	eyeAng:RotateAroundAxis( eyeAng:Up( ), lowerAng.p * fraction )
	eyeAng:RotateAroundAxis( eyeAng:Forward( ), lowerAng.y * fraction )
	eyeAng:RotateAroundAxis( eyeAng:Right( ), lowerAng.r * fraction )
	
	pl.wepRaisedFraction = Lerp( FrameTime( ) * 2, pl.wepRaisedFraction or 0, val )
	
	viewMdl:SetAngles( eyeAng )
	
	return oldEyePos, eyeAng
end

function GM:ScoreboardPlayerOption( )

end

function GM:GetSchemaInformation( )
	return {
		title = catherine.Name,
		desc = catherine.Desc,
		author = LANG( "Basic_Framework_Author", catherine.Author )
	}
end

function GM:ScoreboardShow( )
	if ( !LocalPlayer( ):IsCharacterLoaded( ) ) then return end
	
	if ( IsValid( catherine.vgui.menu ) ) then
		catherine.vgui.menu:Close( )
		gui.EnableScreenClicker( false )
	else
		catherine.vgui.menu = vgui.Create( "catherine.vgui.menu" )
		gui.EnableScreenClicker( true )
	end
end

function GM:RenderScreenspaceEffects( )
	local data = hook.Run( "PostRenderScreenColor", LocalPlayer( ) ) or { }
	
	local tab = { }
	tab[ "$pp_colour_addr" ] = data.addr or 0
	tab[ "$pp_colour_addg" ] = data.addg or 0
	tab[ "$pp_colour_addb" ] = data.addb or 0
	tab[ "$pp_colour_brightness" ] = data.brightness or 0
	tab[ "$pp_colour_contrast" ] = data.contrast or 1
	tab[ "$pp_colour_colour" ] = data.colour or 0.9
	tab[ "$pp_colour_mulr" ] = data.mulr or 0
	tab[ "$pp_colour_mulg" ] = data.mulg or 0
	tab[ "$pp_colour_mulb" ] = data.mulb or 0

	DrawColorModify( tab )
end

netstream.Hook( "catherine.ShowHelp", function( )
	if ( IsValid( catherine.vgui.information ) ) then
		catherine.vgui.information:Close( )
	else
		catherine.vgui.information = vgui.Create( "catherine.vgui.information" )
	end
end )

netstream.Hook( "catherine.IntroStart", function( )
	catherine.intro.loading = true
	catherine.intro.status = true
	catherine.intro.startTime = CurTime( )
end )

netstream.Hook( "catherine.IntroStop", function( )
	catherine.intro.status = false
end )

netstream.Hook( "catherine.loadingFinished", function( )
	catherine.intro.loading = false
end )