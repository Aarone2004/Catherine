local META = FindMetaTable( "Player" )

if ( SERVER ) then
	function META:SetWeaponRaised( bool, weapon )
		if ( !IsValid( self ) or !self:IsCharacterLoaded( ) ) then return end
		weapon = weapon or self:GetActiveWeapon( )
		self:SetNetworkValue( "weaponRaised", bool )
		if ( IsValid( weapon ) ) then
			local time = 9999999999
			if ( bool ) then time = 0.9 end
			weapon:SetNextPrimaryFire( CurTime( ) + time )
			weapon:SetNextSecondaryFire( CurTime( ) + time )
		end
	end
	
	function META:ToggleWeaponRaised( )
		if ( self:GetWeaponRaised( ) ) then
			self:SetWeaponRaised( false )
		else
			self:SetWeaponRaised( true )
		end
	end
	
	hook.Add("PlayerSwitchWeapon", "player_PlayerSwitchWeapon", function( pl, old, new )
		pl:SetWeaponRaised( true, new )
	end )
	
	local velo = FindMetaTable("Entity").GetVelocity
	local v = FindMetaTable("Vector").Length2D
	function META:IsRunning( )
		return v( velo( self ) ) >= ( self:GetRunSpeed( ) - 5 )
	end
	
	function META:IsRagdolled( )
		return IsValid( self.ragdoll )
	end
	
	function META:ForceRagdoll( )
		self.ragdoll = ents.Create( "prop_ragdoll" )
		self.ragdoll:SetAngles( self:GetAngles( ) )
		self.ragdoll:SetModel( self:GetModel( ) )
		self.ragdoll:SetPos( self:GetPos( ) )
		self.ragdoll:Spawn( )
		self.ragdoll:Activate( )
		self.ragdoll:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		self.ragdoll.player = self
		self.ragdoll:SetNetworkValue( "player", self )
		self.ragdoll:CallOnRemove( "RecoverPlayer", function( )
			if ( IsValid( self ) ) then
				self:Ragdoll( false )
			end
		end )

		local weap = { }
		for k, v in pairs( self:GetWeapons( ) ) do
			weap[#weap + 1] = v:GetClass( )
		end

		self:SetNetworkValue( "weap", weap )
		self:StripWeapons( )
		self:Freeze( true )
		self:SetNoDraw( true )
		self:SetNetworkValue( "ragdollID", self.ragdoll:EntIndex( ) )
		self:SetNotSolid( true )
	end
		
	function META:Ragdoll( bool )
		if ( bool ) then
			self:ForceRagdoll( )
		else
			if ( !self:IsRagdolled( ) ) then return end
			self:SetPos( self.ragdoll:GetPos( ) )
			self:SetMoveType( MOVETYPE_WALK )
			self:SetCollisionGroup( COLLISION_GROUP_PLAYER )
			self:Freeze( false )
			self:SetNoDraw( false )
			self:SetNetworkValue( "ragdollID", 0 )
			self:DropToFloor( )
			self:SetNotSolid( false )
			
			for k, v in pairs( self:GetNetworkValue( "weap", { } ) ) do
				self:Give( v )
			end

			self:SetNetworkValue( "weap", nil )

			if ( IsValid( self.ragdoll ) ) then
				self.ragdoll:Remove( )
			end
		end
	end
else

end

function META:GetWeaponRaised( )
	return self:GetNetworkValue( "weaponRaised", false )
end

function META:GetGender( )
	local model = self:GetModel( ):lower( )
	if ( model:find( "female" ) ) then
		return "female"
	else
		return "male"
	end
end