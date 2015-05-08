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

if ( !catherine.character ) then
	catherine.util.Include( "sh_character.lua" )
end
catherine.attribute = catherine.attribute or { }
catherine.attribute.lists = { }

function catherine.attribute.Register( attributeTable )
	if ( !attributeTable or !attributeTable.index ) then
		catherine.util.ErrorPrint( "Attribute register error, can't found attribute table!" )
		return
	end
	
	attributeTable.default = attributeTable.default or 0
	attributeTable.max = attributeTable.max or 100
	
	catherine.attribute.lists[ attributeTable.index ] = attributeTable

	return attributeTable.index
end

function catherine.attribute.New( uniqueID )
	return { uniqueID = uniqueID, index = #catherine.attribute.lists + 1 }
end

function catherine.attribute.GetAll( )
	return catherine.attribute.lists
end

function catherine.attribute.FindByID( id )
	for k, v in pairs( catherine.attribute.GetAll( ) ) do
		if ( v.uniqueID == id ) then
			return v
		end
	end
end

function catherine.attribute.FindByIndex( index )
	return catherine.attribute.lists[ index ]
end

function catherine.attribute.Include( dir )
	for k, v in pairs( file.Find( dir .. "/attribute/*.lua", "LUA" ) ) do
		catherine.util.Include( dir .. "/attribute/" .. v, "SHARED" )
	end
end

if ( SERVER ) then
	function catherine.attribute.SetProgress( pl, index, progress )
		local attribute = catherine.character.GetVar( pl, "_att", { } )
		local attributeTable = catherine.attribute.FindByIndex( index )
		if ( !attributeTable ) then return end
		
		attribute[ index ] = attribute[ index ] or {
			per = 0,
			progress = attributeTable.default
		}
		attribute[ index ].progress = math.Clamp( progress, 0, attributeTable.max )
		
		catherine.character.SetVar( pl, "_att", attribute )
	end
	
	function catherine.attribute.AddProgress( pl, index, progress )
		local attribute = catherine.character.GetVar( pl, "_att", { } )
		local attributeTable = catherine.attribute.FindByIndex( index )
		if ( !attributeTable ) then return end
		
		attribute[ index ] = attribute[ index ] or {
			per = 0,
			progress = attributeTable.default
		}
		attribute[ index ].progress = math.Clamp( attribute[ index ].progress + progress, 0, attributeTable.max )
		
		catherine.character.SetVar( pl, "_att", attribute )
	end
	
	function catherine.attribute.RemoveProgress( pl, index, progress )
		local attribute = catherine.character.GetVar( pl, "_att", { } )
		local attributeTable = catherine.attribute.FindByIndex( index )
		if ( !attributeTable ) then return end
		
		attribute[ index ] = attribute[ index ] or {
			per = 0,
			progress = attributeTable.default
		}
		attribute[ index ].progress = math.Clamp( attribute[ index ].progress - progress, 0, attributeTable.max )
		
		catherine.character.SetVar( pl, "_att", attribute )
	end

	function catherine.attribute.GetProgress( pl, index )
		local attribute = catherine.character.GetVar( pl, "_att", { } )

		return attribute[ index ] and attribute[ index ].progress or 0
	end

	function catherine.attribute.CreateNetworkRegistry( pl, charVars )
		if ( !charVars._att ) then return end
		local attribute = charVars._att
		local changed = false
		local count = table.Count( attribute )
		local attributeAll = catherine.attribute.GetAll( )
		
		for k, v in pairs( attribute ) do
			if ( catherine.attribute.FindByIndex( k ) ) then continue end
			
			attribute[ k ] = nil
			changed = true
		end

		if ( count != #attributeAll ) then
			for k, v in pairs( attributeAll ) do
				if ( attribute[ k ] ) then continue end
				
				attribute[ k ] = {
					per = 0,
					progress = v.default
				}
				changed = true
			end
		end
		
		if ( changed ) then
			catherine.character.SetVar( pl, "_att", attribute )
		end
	end

	hook.Add( "CreateNetworkRegistry", "catherine.attribute.CreateNetworkRegistry", catherine.attribute.CreateNetworkRegistry )
else
	function catherine.attribute.GetProgress( index )
		local attribute = catherine.character.GetVar( LocalPlayer( ), "_att", { } )

		return attribute[ index ] and attribute[ index ].progress or 0
	end
end