AddCSLuaFile( )

SWEP.Base = "nexus_base"
SWEP.HoldType = "normal"
SWEP.PrintName = "Key"
SWEP.ViewModel = "models/weapons/v_hands.mdl"
SWEP.WorldModel = ""

function SWEP:Deploy( )
	local pl = self.Owner
	if ( CLIENT ) or !IsValid( pl ) then return true end
	
	pl:DrawWorldModel( false )
	return true
end

function SWEP:Initialize( )
	self:SetWeaponHoldType( self.HoldType )
end

function SWEP:PrimaryAttack( )
	if ( !IsFirstTimePredicted( ) ) then return end
	if ( CLIENT ) then return end
	
	local pl = self.Owner
	local ent = pl:GetEyeTrace( 70 ).Entity
	
	if ( !ent:IsDoor( ) or ent.Locked ) then return end
	if ( ent:GetOwner( ) == pl:GetCharacterID( ) or pl:GetPos( ):Distance( ent:GetPos( ) ) > 100 ) then return end
	
	ent.Locked = true
	ent:Fire( "lock" )
	
	ent:EmitSoundEx( "doors/door_latch1.wav", 1 )
	
	self:SetNextPrimaryFire( CurTime( ) + 1 )
	self:SetNextSecondaryFire( CurTime( ) + 1 )
end

function SWEP:SecondaryAttack( )
	if ( !IsFirstTimePredicted( ) ) then return end
	if ( CLIENT ) then return end
	
	local pl = self.Owner
	local ent = pl:GetEyeTrace( 70 ).Entity
	
	if ( !ent:IsDoor( ) or !ent.Locked ) then return end
	if ( ent:GetOwner( ) == pl:GetCharacterID( ) or pl:GetPos( ):Distance( ent:GetPos( ) ) > 100 ) then return end

	ent.Locked = false
	ent:Fire( "unlock" )
	
	ent:EmitSoundEx( "doors/door_latch1.wav", 1 )
	
	self:SetNextPrimaryFire( CurTime( ) + 1 )
	self:SetNextSecondaryFire( CurTime( ) + 1 )
end