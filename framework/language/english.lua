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

--[[
	Syntax fixed by Dremek.
	( http://steamcommunity.com/profiles/76561198052257272/ )
]]--
local credit_htmlValue = [[
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<style>
		@import url(http://fonts.googleapis.com/css?family=Open+Sans);
		body {
			font-family: "Open Sans", "나눔고딕", "NanumGothic", "맑은 고딕", "Malgun Gothic", "serif", "sans-serif"; 
			-webkit-font-smoothing: antialiased;
		}
	</style>
</head>
<body>
	<div class="container" style="margin-top:15px;">
	<div class="page-header">
		<h1>Credit&nbsp&nbsp<small>The listed of Developing the Catherine or Helpers ...</small></h1>
	</div>
	
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">L7D</h3>
		</div>
			<div class="panel-body">Framework Development and Design.</div>
	</div>
	
	<div class="panel panel-warning">
		<div class="panel-heading">
			<h3 class="panel-title">Chessnut</h3>
		</div>
			<div class="panel-body">Good helper :)</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">notcake (!cake)</h3>
		</div>
			<div class="panel-body">Author of UTF-8 module.</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">thelastpenguin™</h3>
		</div>
			<div class="panel-body">Author of pON module.</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Alexander Grist-Hucker (Alex Grist)</h3>
		</div>
			<div class="panel-body">Author of netstream 2 module.</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</body>
</html>
]]

local LANGUAGE = catherine.language.New( "english" )
LANGUAGE.name = "English"
LANGUAGE.gmodLangID = "en"
LANGUAGE.data = {
	// Class
	[ "Class_UI_Title" ] = "Class",
	[ "Class_UI_LimitStr" ] = "%s / %s",
	[ "Class_UI_SalaryStr" ] = "%s per hour",
	[ "Class_UI_Unlimited" ] = "Unlimited",
	[ "Class_UI_NoJoinable" ] = "You can not join this class!",
	[ "Class_UI_CantJoinable" ] = "You can not join this class!",
	[ "Class_UI_NotValid" ] = "This class is not valid!",
	[ "Class_UI_TeamError" ] = "You can not join this class!",
	[ "Class_UI_AlreadyJoined" ] = "You are already joined this class!",
	[ "Class_UI_HitLimit" ] = "This class hit a limit!",
	
	// GlobalBan
	[ "GlobalBan_UI_Title" ] = "Global Ban",
	[ "GlobalBan_UI_Blank" ] = "Doesn't have user in Global Ban.",
	[ "GlobalBan_UI_OpenProfile" ] = "Open the Steam Profile of this user.",
	[ "GlobalBan_UI_NotUsing" ] = "This server doesn't using Global Ban service.",
	[ "GlobalBan_UI_Users" ] = "%s's users are blocked.",
	
	// News
	[ "News_UI_Title" ] = "News",
	[ "News_UI_Back" ] = "Back",
	[ "News_UI_SelectPage" ] = "Please select a page.",
	
	// Cash
	[ "Cash_UI_HasStr" ] = "You have a %s.",
	[ "Cash_UI_TargetHasStr" ] = "This player has %s.",
	[ "Cash_Notify_Set" ] = "%s has set %s to %s",
	[ "Cash_Notify_Give" ] = "%s has given %s to %s",
	[ "Cash_Notify_Take" ] = "%s has taken %s from %s",
	[ "Cash_Notify_HasNot" ] = "You do not have a enough %s!",
	[ "Cash_Notify_NotValidAmount" ] = "Please enter a valid amount!",
	[ "Cash_Notify_Salary" ] = "You have received %s from your salary.",
	[ "Cash_Notify_Get" ] = "You are found %s.",
	[ "Cash_Notify_Drop" ] = "You have been drop %s.",
	
	// Character
	[ "Character_UI_Title" ] = "Character",
	[ "Character_UI_CreateCharStr" ] = "Create Character",
	[ "Character_UI_LoadCharStr" ] = "Load Character",
	[ "Character_UI_Close" ] = "Exit",
	[ "Character_UI_ChangeLogStr" ] = "Update Log",
	[ "Character_UI_ExitServerStr" ] = "Disconnect",
	[ "Character_UI_BackStr" ] = "< Back",
	[ "Character_UI_DontHaveAny" ] = "You do not have any characters.",
	[ "Character_UI_UseCharacter" ] = "Use this character.",
	[ "Character_UI_DeleteCharacter" ] = "Delete this character.",
	[ "Character_UI_CharInfo" ] = "Character Information",
	[ "Character_UI_CharName" ] = "Name ...",
	[ "Character_UI_CharDesc" ] = "Description ...",
	[ "Character_UI_CharModel" ] = "Model ...",
	[ "Character_UI_CharAtt" ] = "Character Attribute",
	[ "Character_UI_CharFin" ] = "Character Information Verify",
	[ "Character_UI_NextStage" ] = "Next >",
	[ "Character_UI_CREATE" ] = "Create a Character",
	[ "Character_UI_MusicError" ] = "Failed to play background music! ( ERROR : %s )",
	[ "Character_UI_Hint01" ] = "Catherine are supported multi-language system, Click the right top button for change the whatever language you can speak.",
	[ "Character_UI_Hint01_Short" ] = "Can Change language",
	[ "Character_UI_CharFaction" ] = "Character Faction",
	[ "Character_UI_FactionHaveAny" ] = "You do not have any factions.",
	[ "Character_UI_SelectFaction" ] = "> Select a faction.",
	[ "Character_UI_WaitAttribute" ] = "Choosing your Attribute ...",
	[ "Character_UI_ThisisAttribute" ] = "This is your Attribute.",
	[ "Character_UI_NoneAttribute" ] = "There is no selected Attribute.",
	[ "Character_Notify_DeleteQ" ] = "Are you sure you want to delete this character?",
	[ "Character_Notify_DeleteResult" ] = "You have been deleted this character.",
	[ "Character_Notify_CreateQ" ] = "Are you sure want to create character?",
	[ "Character_Notify_ExitQ" ] = "Are you sure you want to disconnect from the server?",
	[ "Character_Notify_CantDeleteUsing" ] = "You can not delete the character you are currently using!",
	[ "Character_Notify_CantSwitchRagdolled" ] = "You can not switch characters while you are unconscious!",
	[ "Character_Notify_IsNotValid" ] = "This character is not valid!",
	[ "Character_Notify_CantUseThisFaction" ] = "You can't use this faction!",
	[ "Character_Notify_IsNotValidFaction" ] = "This character's faction is not valid!",
	[ "Character_Notify_CharBanned" ] = "This character is banned!",
	[ "Character_Notify_CantSwitch" ] = "You can't switch character now!",
	[ "Character_Notify_CantSwitchUsing" ] = "You are already using this character!",
	[ "Character_Notify_CantSwitchDeath" ] = "You can not switch character while dead!",
	[ "Character_Notify_CantSwitchTied" ] = "You can not switch characters while tied!",
	[ "Character_Notify_MaxLimitHit" ] = "You can not create any more characters!",
	[ "Character_Notify_CharBan" ] = "%s has banned the character %s.",
	[ "Character_Notify_CharUnBan" ] = "%s has unbanned the character %s.",
	[ "Character_Notify_CharSetBan" ] = "%s has changed the banned status for character %s. [%s]",
	[ "Character_Notify_CantCharBan_UnBan" ] = "You can't ban / unban this character!",
	[ "Character_Notify_SetName" ] = "%s has set the name of %s to %s.",
	[ "Character_Notify_SetNameError" ] = "Can't type # in the character name!",
	[ "Character_Notify_SetNameError2" ] = "Character name is not a valid!",
	[ "Character_Notify_SetDesc" ] = "%s has set the description of %s to %s.",
	[ "Character_Notify_SetDescError" ] = "Can't type # in the character description!",
	[ "Character_Notify_SetDescError2" ] = "Character description is not a valid!",
	[ "Character_Notify_SetSkin" ] = "%s has set the skin of %s to %s.",
	[ "Character_Notify_SetSkinError" ] = "This number is not a valid number!",
	[ "Character_Notify_SetModel" ] = "%s are set %s model for %s.",
	[ "Character_Notify_SetDescLC" ] = "You have set your character description to %s.",
	[ "Character_Notify_SelectModel" ] = "Please select a character model!",
	[ "Character_Notify_NameLimitHit" ] = "The character name must be at least " .. catherine.configs.characterNameMinLen .." characters long with a maximum of " .. catherine.configs.characterNameMaxLen .. " characters!",
	[ "Character_Notify_DescLimitHit" ] = "The character description must be at least " .. catherine.configs.characterDescMinLen .." characters long with a maximum of " .. catherine.configs.characterDescMaxLen .. " characters!",
	[ "Character_Notify_IsSelectingAttribute" ] = "Setting a Attribute, Please wait.",
	[ "Character_Error_DBErrorBasic" ] = "Database error. [%s]",
	
	// Faction
	[ "Faction_UI_Title" ] = "Faction",
	[ "Faction_Notify_Give" ] = "%s has given %s to %s",
	[ "Faction_Notify_Take" ] = "%s has taken %s from %s",
	[ "Faction_Notify_NotValid" ] = "%s is not a valid faction!",
	[ "Faction_Notify_NotWhitelist" ] = "%s is not a valid whitelist!",
	[ "Faction_Notify_AlreadyHas" ] = "%s already has the %s whitelist!",
	[ "Faction_Notify_HasNot" ] = "%s does not have the %s whitelist!",
	[ "Faction_Notify_SelectPlease" ] = "Please select a faction!",
	
	// Accessory
	[ "Accessory_Wear_ModelError" ] = "Model error.",
	[ "Accessory_Wear_BoneExists" ] = "This bone already has accessory.",
	[ "Accessory_Wear_BoneNotExists" ] = "This bone not has accessory.",
	[ "Accessory_Wear_BoneIndexError" ] = "Bone data is not a valid.",
	
	// Flag
	[ "Flag_Notify_Give" ] = "%s has given %s to %s",
	[ "Flag_Notify_Take" ] = "%s has taken %s from %s",
	[ "Flag_Notify_AlreadyHas" ] = "%s already has the %s flag!",
	[ "Flag_Notify_HasNot" ] = "%s does not have the %s flag!",
	[ "Flag_Notify_NotValid" ] = "%s is not a valid flag!",
	[ "Flag_p_Desc" ] = "Access to the physics gun.",
	[ "Flag_t_Desc" ] = "Access to the toolgun.",
	[ "Flag_e_Desc" ] = "Access to the prop spawning.",
	[ "Flag_x_Desc" ] = "Access to the entity spawning.",
	[ "Flag_V_Desc" ] = "Access to the vehicle spawning.",
	[ "Flag_n_Desc" ] = "Access to the NPC spawning.",
	[ "Flag_R_Desc" ] = "Access to the ragdoll spawning.",
	[ "Flag_s_Desc" ] = "Access to the effect spawning.",
	[ "Flag_i_Desc" ] = "Access to the Spawn, Gives item.",
	
	[ "UnknownError" ] = "Unknown Error!",
	[ "Basic_Notify_UnknownPlayer" ] = "You have not given a valid character name!",
	[ "Basic_Notify_CantFindCharacter" ] = "Can't found character!",
	[ "Basic_Notify_NoArg" ] = "Please enter the %s argument!",
	[ "Basic_Notify_InputText" ] = "Please enter the text!",

	// System
	[ "System_UI_Title" ] = "System",
	[ "System_UI_Welcome" ] = "Welcome, %s",
	[ "System_UI_Close" ] = "Close",
	[ "System_UI_Update_Title" ] = "Update",
	[ "System_UI_Update_CoreVer" ] = "%s %s",
	[ "System_UI_Update_FoundNew" ] = "This server not using latest version!",
	[ "System_UI_Update_AlreadyNew" ] = "This server using latest version.",
	[ "System_UI_Update_CheckButton" ] = "Check Update",
	[ "System_UI_Update_OpenUpdateLog" ] = "Update History",
	[ "System_UI_Update_UpdateNow" ] = "< Update NOW >",
	[ "System_UI_Update_CheckingUpdate" ] = "Checking update ...",
	[ "System_UI_Update_InGameUpdate_Title" ] = "In-Game Update",
	[ "System_UI_Update_InGameUpdate_Desc" ] = "In-game update is available.",
	[ "System_UI_Update_InGameUpdate_Desc2" ] = "You are want to Update?",
	[ "System_UI_Update_InGameUpdate_NoFileIO" ] = "File IO module failed to load, so Can't update.",
	[ "System_UI_Update_UpdateNow_Q1" ] = "Are you sure update to the latest version of Catherine?, All your changes will be overwritten.",
	[ "System_UI_Update_UpdateNow_Q2" ] = "Are you sure you want to update to the latest version?",
	[ "System_Notify_NewVersionUpdateNeed" ] = "Released a new version for Catherine, recommend update.",
	[ "System_Notify_Update_NextTime" ] = "Too often unable to check the version, try again later!",
	[ "System_Notify_UpdateError" ] = "Failed to checking update. [%s]",
	[ "System_UI_Plugin_Title" ] = "Plugin",
	[ "System_UI_Plugin_ManagerButton" ] = "Plugin Management",
	[ "System_UI_Plugin_ManagerAllPluginCount" ] = "Total Plugins %s's.",
	[ "System_UI_Plugin_ManagerFrameworkPluginCount" ] = "Framework Plugins %s's.",
	[ "System_UI_Plugin_ManagerSchemaPluginCount" ] = "Schema Plugins %s's.",
	[ "System_UI_Plugin_ManagerDeactivePluginCount" ] = "Deactive Plugins %s's.",
	[ "System_UI_Plugin_ManagerTitle" ] = "Plugin Management",
	[ "System_UI_Plugin_ManagerIsSchemaPlugin" ] = "Schema Plugin",
	[ "System_UI_Plugin_ManagerIsFrameworkPlugin" ] = "Framework Plugin",
	[ "System_UI_Plugin_ManagerActive" ] = "Active",
	[ "System_UI_Plugin_ManagerDeactive" ] = "Deactive",
	[ "System_UI_Plugin_ManagerNeedRestart" ] = "To apply the changes, you must restart the server.",
	[ "System_UI_Plugin_DeactivePluginTitle" ] = "%s Plugin",
	[ "System_UI_Plugin_DeactivePluginDesc" ] = "This plugin has been deactivated.",
	[ "System_UI_Plugin_NameSearch" ] = "Search by Name",
	[ "System_UI_DB_Title" ] = "Database",
	[ "System_UI_DB_Status0" ] = "Idle",
	[ "System_UI_DB_Status1" ] = "Working ...",
	[ "System_UI_DB_Status2" ] = "Query Error",
	[ "System_UI_DB_Status3" ] = "Connection Error",
	[ "System_UI_DB_ManagerButton" ] = "Database Management",
	[ "System_UI_DB_ManagerTitle" ] = "Database Management",
	[ "System_UI_DB_Manager_DeleteTitle" ] = "Delete",
	[ "System_UI_DB_Manager_BackupTitle" ] = "Backup",
	[ "System_UI_DB_Manager_BackupFilesCount" ] = "%s's Backup files.",
	[ "System_UI_DB_Manager_AutoBackupStatus" ] = "Auto Backup Status : %s.",
	[ "System_UI_DB_Manager_BackupLoading" ] = "Backing up Database ...",
	[ "System_UI_DB_Manager_BackupButton" ] = "Backup Database",
	[ "System_UI_DB_Manager_BackingupButton" ] = "Backing up Database ...",
	[ "System_UI_DB_Manager_FileTitle" ] = "Backup file #%s",
	[ "System_Notify_BackupQ" ] = "Are you want to backup Database?, Do not attempt other works in to the Backing progress.",
	[ "System_Notify_BackupFinish" ] = "Complete the Database backups.",
	[ "System_Notify_BackupError" ] = "Failed to backup progress. [%s]",
	[ "System_Notify_BackupError2" ] = "Occurred a Serious Database error",
	[ "System_UI_DB_Manager_RestoreTitle" ] = "Restore",
	[ "System_UI_DB_Manager_RestoreButton" ] = "Restore Database as Selected Date",
	[ "System_UI_DB_Manager_RestoringButton" ] = "Restoring Database ...",
	[ "System_UI_DB_Manager_RestartServer" ] = "WARNING : Server is restart after a while :>",
	[ "System_Notify_RestoreFinish" ] = "Complete the Database restores.",
	[ "System_Notify_DeleteQ" ] = "Are you sure want to delete this Database backup file?",
	[ "System_Notify_DeleteFinish" ] = "Database backup file was deleted.",
	[ "System_Notify_DeleteError" ] = "Failed to Delete progress. [%s]",
	[ "System_Notify_RestoreQ" ] = "Are you want to restore Database as selected date?, All Database progress will be 'Restored', also automatic 'RESTART SERVER' after the restore.",
	[ "System_Notify_RestoreQ2" ] = "Warning, If you do this work, you can't restore this, ARE YOU SURE?",
	[ "System_Notify_RestoreError" ] = "Please select a Recovery Date.",
	[ "System_Notify_RestoreError2" ] = "Failed to backup progress. [%s]",
	[ "System_UI_DB_Manager_LogTitle" ] = "Log",
	[ "System_UI_DB_Manager_LogDeving" ] = "This feature has been developing ...",
	[ "System_UI_DB_Manager_InitializeButton" ] = "< DATABASE INITIALIZE >",
	[ "System_UI_DB_Manager_InitializeCount" ] = "Please click %s times more.",
	[ "System_Notify_InitializeQ" ] = "Are you want to initialize Database?, All Database progress will be 'Initialized', also automatic 'RESTART SERVER' after the initialize.",
	[ "System_Notify_PermissionError" ] = "Authentication Failure [00]",
	[ "System_Notify_SecurityError" ] = "Denied by security policy [01]",
	[ "System_UI_ExternalX_Title" ] = "Patch",
	[ "System_UI_ExternalX_UsingVer" ] = "Applied the patch of %s version.",
	[ "System_UI_ExternalX_CheckButton" ] = "Check New Patch",
	[ "System_UI_ExternalX_CheckingButton" ] = "Checking new patch ...",
	[ "System_UI_ExternalX_FoundNewPatch" ] = "New patch (%s) has available, please install.",
	[ "System_UI_ExternalX_AlreadyNewPatch" ] = "Doesn't have new patch.",
	[ "System_UI_ExternalX_InstallButton" ] = "Download / Install Patch",
	[ "System_UI_ExternalX_Installing" ] = "Download and Installing the patch ...",
	[ "System_UI_ExternalX_RestartServer" ] = "WARNING : Server is restart after a while :>",
	[ "System_Notify_ExternalXUpdateNeed" ] = "Released a new patch for Catherine, if you want install open the System menu.",
	[ "System_Notify_ExternalX_NextTime" ] = "Too often unable to check the patch, try again later!",
	[ "System_Notify_ExternalXError" ] = "Failed to checking patch. [%s]",
	[ "System_Notify_ExternalXError2" ] = "Failed to installing patch. [%s]",
	[ "System_Notify_InstallQ" ] = "Are you want to install this patch?, automatic 'RESTART SERVER' after the install!",
	[ "System_UI_Config_Title" ] = "Configs",
	[ "System_UI_Config_BooleanTrue" ] = "Enabled",
	[ "System_UI_Config_BooleanFalse" ] = "Disabled",
	[ "System_UI_Info_Title" ] = "Information",
	
	// Attribute
	[ "Attribute_UI_Title" ] = "Attribute",
	
	// Block
	[ "Block_UI_Title" ] = "User Block",
	[ "Block_UI_Add" ] = "User Add",
	[ "Block_UI_AddBySteamID" ] = "Add by SteamID",
	[ "Block_UI_AddByPlayer" ] = "User Add",
	[ "Block_UI_AddBySteamID_Q" ] = "Please type Steam ID.",
	[ "Block_Notify_IsBlocked" ] = "You have been blocked this player!",
	[ "Block_Notify_IsAlreadyBlocked" ] = "You are already blocked this player!",
	[ "Block_UI_AllChat" ] = "Chat Block",
	[ "Block_UI_PM" ] = "PM Message Block",
	[ "Block_UI_AllChatDis" ] = "Disable Chat Block",
	[ "Block_UI_PMDis" ] = "Disable Message PM Block",
	[ "Block_UI_ChangeType" ] = "Change Block List",
	[ "Block_UI_Dis" ] = "Remove Block",
	[ "Block_UI_Zero" ] = "Doesn't have blocked users.",
	
	// Business
	[ "Business_UI_Title" ] = "Business",
	[ "Business_UI_NoBuyable" ] = "You can not buy this!",
	[ "Business_UI_BuyButtonStr" ] = "Buy Item > %s",
	[ "Business_UI_ShoppingCartStr" ] = "Shopping Cart",
	[ "Business_UI_TotalStr" ] = "Total %s",
	[ "Business_UI_Take" ] = "Take",
	[ "Business_UI_Shipment_Title" ] = "Shipment",
	[ "Business_UI_Shipment_Desc" ] = "A Shipment",
	[ "Business_Notify_BuyQ" ] = "Are you sure you want to buy these item(s)?",
	[ "Business_Notify_CantOpenShipment" ] = "You can not open this shipment!",
	[ "Business_Notify_NeedCartAdd" ] = "Add an item onto your cart first!",
	[ "Business_OpenStr" ] = "Open",
	
	// Inventory
	[ "Inventory_UI_Title" ] = "Inventory",
	[ "Inventory_Notify_HasNotSpace" ] = "You do not have enough inventory space!",
	[ "Inventory_Notify_HasNotSpaceTarget" ] = "Target does not have enough inventory space!",
	[ "Inventory_Notify_CantDrop01" ] = "You are looking too far away to drop this item!",
	[ "Inventory_Notify_DontHave" ] = "You do not have this item!",
	[ "Inventory_Notify_isPersistent" ] = "This item is persistent!",
	
	// Scoreboard
	[ "Scoreboard_UI_Title" ] = "Player List",
	[ "Scoreboard_UI_Author" ] = "Gamemode Author",
	[ "Scoreboard_UI_UnknownDesc" ] = "You do not recognize this person.",
	[ "Scoreboard_UI_PlayerDetailStr" ] = "Steam Name : %s\nSteam ID : %s\nPing : %s",
	[ "Scoreboard_UI_CanNotLook_Str" ] = "You can not look at this.",
	[ "Scoreboard_PlayerOption01_Str" ] = "Open Steam Profile",
	[ "Scoreboard_PlayerOption02_Str" ] = "Change Character Name",
	[ "Scoreboard_PlayerOption02_Q" ] = "What would you like to be the character's name?",
	[ "Scoreboard_PlayerOption03_Str" ] = "Give Whitelist",
	[ "Scoreboard_PlayerOption04_Str" ] = "Character Ban / Unban",
	[ "Scoreboard_PlayerOption04_Q" ] = "Are you sure you would like to ban / unban this character?",
	[ "Scoreboard_PlayerOption05_Str" ] = "Give Flags",
	[ "Scoreboard_PlayerOption05_Q" ] = "What are you want to give flags?",
	[ "Scoreboard_PlayerOption06_Str" ] = "Take Flags",
	[ "Scoreboard_PlayerOption06_Q" ] = "What are you want to take flags?",
	[ "Scoreboard_PlayerOption07_Str" ] = "Give Item",
	[ "Scoreboard_PlayerOption07_Q1" ] = "What are you want to give item?",
	[ "Scoreboard_PlayerOption07_Q2" ] = "What are you want to giving item count?",
	[ "Scoreboard_PlayerOption08_Str" ] = "Send PM to Player",
	[ "Scoreboard_PlayerOption08_Q" ] = "Type a message.",
	[ "Scoreboard_PlayerOption09_Str" ] = "BAN",
	[ "Scoreboard_PlayerOption09_Q" ] = "What are you want to banned time?",
	[ "Scoreboard_PlayerOption09_Q2" ] = "What are you want to ban reason?",
	
	// Help
	[ "Help_UI_Title" ] = "Help",
	[ "Help_UI_DefPageTitle" ] = "Welcome.",
	[ "Help_UI_DefPageDesc" ] = "Press and look at page if you want.",
	[ "Help_Category_Flag" ] = "Flag",
	[ "Help_Desc_Flag" ] = "The listed of Flags ...",
	[ "Help_Category_Credit" ] = "Credit",
	[ "Help_HTMLValue_Credit" ] = credit_htmlValue,
	[ "Help_Category_Changelog" ] = "Change log",
	[ "Help_Category_Command" ] = "Command",
	[ "Help_Desc_Command" ] = "The listed of Commands ...",
	[ "Help_Category_Plugin" ] = "Plugin",
	[ "Help_Desc_Plugin" ] = "The listed of Plugins ...",
	
	// Plugin
	[ "Plugin_Value_Author" ] = "Development and design by '%s'",
	
	// Resource
	[ "Resource_UI_Title" ] = "Notification for Content File",
	[ "Resource_UI_Subscribe" ] = "Subscribe",
	[ "Resource_UI_SubscribeNotify" ] = "If you are subscribe, will be game need to restart.",
	[ "Resource_UI_Value" ] = "You are not subscribed Official Catherine Content Workshop file, this is will be error of game, Subscribe now!",
	
	// Storage
	[ "Storage_UI_YourInv" ] = "Your Inventory",
	[ "Storage_UI_StorageCash" ] = "This storage have a %s.",
	[ "Storage_UI_PlayerCash" ] = "You have a %s.",
	[ "Storage_UI_StorageNoHaveItem" ] = "This storage is empty.",
	[ "Storage_UI_PlayerNoHaveItem" ] = "You do not have any items.",
	[ "Storage_Notify_HasNotSpace" ] = "This storage does not have enough inventory space!",
	[ "Storage_Notify_NoStorage" ] = "This entity is not a valid storage!",
	[ "Storage_CMD_SetPWD" ] = "You are setting a password %s for this storage.",
	[ "Storage_PWDQ" ] = "What is the password for this storage?",
	[ "Storage_Notify_PWDError" ] = "The password is not a valid!",
	[ "Storage_OpenStr" ] = "Open",
	
	// Item SYSTEM
	[ "Item_GiveCommand_Fin" ] = "You are gives %s's %s item to the %s.",
	[ "Item_Notify_NoItemData" ] = "This is not an available item!",
	
	// Item Base
	[ "Item_Category_Other" ] = "Other",
	[ "Item_Category_Weapon" ] = "Weapon",
	[ "Item_Category_Storage" ] = "Storage",
	[ "Item_Category_Clothing" ] = "Clothing",
	[ "Item_Category_BodygroupClothing" ] = "Clothing",
	[ "Item_FuncStr01_BodygroupClothing" ] = "Wear",
	[ "Item_Func01Notify01_BodygroupClothing" ] = "You can't wear this clothing!",
	[ "Item_Func01Notify02_BodygroupClothing" ] = "You are already wearing this clothing on this bone!",
	[ "Item_Func02Notify01_BodygroupClothing" ] = "You can't take off this clothing!",
	[ "Item_Func02Notify02_BodygroupClothing" ] = "You are not wearing this clothing on this bone!",
	[ "Item_FuncStr02_BodygroupClothing" ] = "Take off",
	[ "Item_FuncStr01_Clothing" ] = "Wear",
	[ "Item_FuncStr02_Clothing" ] = "Take off",
	[ "Item_Category_Accessory" ] = "Accessory",
	[ "Item_FuncStr01_Accessory" ] = "Wear",
	[ "Item_FuncStr02_Accessory" ] = "Take off",
	[ "Item_Category_Alcohol" ] = "Alcohol",
	[ "Item_FuncStr01_Alcohol" ] = "Drink",
	[ "Item_Category_Ammo" ] = "Ammunition",
	[ "Item_FuncStr01_Ammo" ] = "Use",
	
	[ "Item_Category_Wallet" ] = "Wallet",
	[ "Item_Name_Wallet" ] = "Wallet",
	[ "Item_Desc_Wallet" ] = "Cash is stored.",
	[ "Item_Desc_World_Wallet" ] = "%s in a small stack.",
	[ "Item_FuncStr01_Wallet" ] = "Take %s",
	[ "Item_FuncStr02_Wallet" ] = "Drop %s",
	[ "Item_StoreQ_Wallet" ] = "How much %s world you like to store?",
	[ "Item_GetQ_Wallet" ] = "How much %s world you like to get?",
	[ "Item_DropQ_Wallet" ] = "How much %s would you like to drop?",
	
	[ "Item_Notify01_ZT" ] = "This player is already tied!",
	[ "Item_Notify02_ZT" ] = "You do not have Zip Tie!",
	[ "Item_Notify03_ZT" ] = "You are tied!",
	[ "Item_Notify04_ZT" ] = "This player is not tied!",
	[ "Item_Message01_ZT" ] = "Tieing ...",
	[ "Item_Message02_ZT" ] = "Untieing ...",
	[ "Item_Message03_ZT" ] = "You are tied.",
	
	[ "Item_FuncStr01_Weapon" ] = "Equip",
	[ "Item_FuncStr02_Weapon" ] = "Unequip",
	[ "Item_Notify01_Weapon" ] = "You can not equip this weapon!",
	[ "Item_FuncStr01_Basic" ] = "Take",
	[ "Item_FuncStr02_Basic" ] = "Drop",
	
	[ "Item_Free" ] = "Free",
	
	// Entity
	[ "Entity_Notify_NotValid" ] = "This isn't a valid entity!",
	[ "Entity_Notify_NotPlayer" ] = "This isn't a valid player!",
	[ "Entity_Notify_NotDoor" ] = "This isn't a valid door!",
	[ "Entity_Notify_TooFar" ] = "You are too far by entity!",
	
	// Command
	[ "Command_Notify_NotFound" ] = "Command not found!",
	[ "Command_DefDesc" ] = "A Command.",
	[ "Command_OOC_Error" ] = "You must wait %s more second(s) before being able to use OOC.",
	[ "Command_LOOC_Error" ] = "You must wait %s more second(s) before being able to use LOOC.",
	
	// Player
	[ "Player_Message_Dead_HUD" ] = "The person is dead.",
	[ "Player_Message_Ragdolled_HUD" ] = "The person is unconscious.",
	[ "Player_Message_Ragdolled_01" ] = "You are unconscious.",
	[ "Player_Message_Dead_01" ] = "You are dead ...",
	[ "Player_Message_GettingUp" ] = "You are regaining consciousness ...",
	[ "Player_Message_AlreayGettingUp" ] = "You are already getting up!",
	[ "Player_Message_AlreadyFallovered" ] = "You are already fallen over!",
	[ "Player_Message_BlockFallover" ] = "You can be fallover %s(sec) after!",
	[ "Player_Message_NotFallovered" ] = "You are not fallen over!",
	[ "Player_Message_HasNotPermission" ] = "You do not have permission!",
	[ "Player_Message_UnTie" ] = "Press 'Use' to untie.",
	[ "Player_Message_TiedBlock" ] = "You can not do this when tied.",
	[ "Player_Message_IsNotSteamID" ] = "This is not a Steam ID!",
	
	// Recognize
	[ "Recognize_UI_Option_LookingPlayer" ] = "Recognize for looking player.",
	[ "Recognize_UI_Option_TalkRange" ] = "All characters within talking range.",
	[ "Recognize_UI_Option_YellRange" ] = "All characters within yelling range.",
	[ "Recognize_UI_Option_WhisperRange" ] = "All characters within whispering range.",
	[ "Recognize_UI_Unknown" ] = "Unknown",
	
	// Door
	[ "Door_Notify_CMD_Locked" ] = "You have locked this door.",
	[ "Door_Notify_CMD_UnLocked" ] = "You have unlocked this door.",
	[ "Door_Notify_BuyQ" ] = "Are you sure you want to buy this door at %s?",
	[ "Door_Notify_SellQ" ] = "Are you sure you want to sell this door?",
	[ "Door_Message_Locking" ] = "Locking ...",
	[ "Door_Message_UnLocking" ] = "Unlocking ...",
	[ "Door_Message_Buyable" ] = "This door can be purchased.",
	[ "Door_Message_CantBuy" ] = "This door can not be purchased.",
	[ "Door_Message_AlreadySold" ] = "This door has already been purchased!",
	[ "Door_Notify_AlreadySold" ] = "This door has already been purchased!",
	[ "Door_Notify_NoOwner" ] = "You are not the owner of this door!",
	[ "Door_Notify_CantBuyable" ] = "You can not buy this door!",
	[ "Door_Notify_Buy" ] = "You have bought this door.",
	[ "Door_Notify_Sell" ] = "You have sold this door.",
	[ "Door_Notify_SetTitle" ] = "You have set a title for this door.",
	[ "Door_Notify_SetDesc" ] = "You have set a description for this door.",
	[ "Door_Notify_SetDescHitLimit" ] = "You are over the description limit!",
	[ "Door_Notify_SetStatus_True" ] = "You have set this door to unownable.",
	[ "Door_Notify_SetStatus_False" ] = "You have set this to ownable.",
	[ "Door_Notify_Disabled_True" ] = "You have enabled this door.",
	[ "Door_Notify_Disabled_False" ] = "You have disabled this door.",
	[ "Door_Notify_DoorSpam" ] = "Do not door-spam!",
	
	[ "Door_Notify_ChangePer" ] = "You have changed permissions for this door.",
	[ "Door_Notify_RemPer" ] = "You have been removed from the permissions for this door.",
	[ "Door_Notify_AlreadyHasPer" ] = "This door already has permissions!",
	[ "Door_Notify_CantChangeOwner" ] = "You can not change the door owner!",
	
	[ "Door_UI_Default" ] = "Door",
	[ "Door_UI_DoorDescStr" ] = "Door Description",
	[ "Door_UI_DoorSellStr" ] = "Sell Door",
	[ "Door_UI_AllPerStr" ] = "All Permission",
	[ "Door_UI_BasicPerStr" ] = "Basic Permission",
	[ "Door_UI_RemPerStr" ] = "Permission Remove",
	[ "Door_UI_OwnerStr" ] = "Owner",
	[ "Door_UI_AllStr" ] = "All",
	[ "Door_UI_BasicStr" ] = "Basic",
	
	// Hint
	[ "Hint_Message_01" ] = "Type // before your message to talk out-of-character.",
	[ "Hint_Message_02" ] = "Type .// or [[ before your message to talk out-of-character locally.",
	[ "Hint_Message_03" ] = "Press 'F1 key' to view your character and roleplay information.",
	[ "Hint_Message_04" ] = "Press 'Tab key' to view the main menu.",
	[ "Hint_Message_05" ] = "Press 'F2 key' to Recognize to other person.",
	
	// Option
	[ "Option_UI_Title" ] = "Option",
	[ "Option_Category_01" ] = "Framework",
	[ "Option_Category_02" ] = "Development",
	[ "Option_Category_03" ] = "Administrator",

	[ "Option_Str_BAR_Name" ] = "Show Bar",
	[ "Option_Str_BAR_Desc" ] = "Displays the Bar.",
	
	[ "Option_Str_CHAT_TIMESTAMP_Name" ] = "Show Chat Timestamp",
	[ "Option_Str_CHAT_TIMESTAMP_Desc" ] = "Displays chat timestamp in the chat message.",
	
	[ "Option_Str_ADMIN_ESP_Name" ] = "Show Admin ESP",
	[ "Option_Str_ADMIN_ESP_Desc" ] = "Only show the administrative ESP if in noclipping.",
	
	[ "Option_Str_Always_ADMIN_ESP_Name" ] = "Always Show Admin ESP",
	[ "Option_Str_Always_ADMIN_ESP_Desc" ] = "Always show the administrative ESP, even when not in noclip.",
	
	[ "Option_Str_MAINHUD_Name" ] = "Show Main HUD",
	[ "Option_Str_MAINHUD_Desc" ] = "Displays Main HUD.",
	
	[ "Option_Str_MAINLANG_Name" ] = "Main Language",
	[ "Option_Str_MAINLANG_Desc" ] = "Change the Main Language.",
	
	[ "Option_Str_HINT_Name" ] = "Show Hint",
	[ "Option_Str_HINT_Desc" ] = "Displays the hint.",
	
	[ "Option_Str_ITEM_ESP_Name" ] = "Show Item ESP",
	[ "Option_Str_ITEM_ESP_Desc" ] = "Only show the administrative Item ESP if in noclipping.",
	
	// Chat
	[ "Chat_Str_IC" ] = "%s says %s",
	[ "Chat_Str_Yell" ] = "%s yells %s",
	[ "Chat_Str_Whisper" ] = "%s whispers %s",
	[ "Chat_Str_Console" ] = "Console",
	[ "Chat_Str_Roll" ] = "%s roll %s",
	[ "Chat_Str_Connect" ] = "%s has joined to server.",
	[ "Chat_Str_Disconnect" ] = "%s has disconnected to server.",
	
	// Question
	[ "Question_UIStr" ] = "Question",
	[ "Question_KickMessage" ] = "Answer has a wrong!",
	
	[ "Question_UI_Continue" ] = "Continue",
	[ "Question_UI_Disconnect" ] = "Disconnect",
	[ "Question_Notify_DisconnectQ" ] = "Are you sure you want to disconnect from the server?",
	[ "Question_Notify_ContinueQ" ] = "Are you sure you want to check this answers?, if your answers wrong you are kicked from this server!",
	
	// Basic
	[ "Basic_UI_ReqToServer" ] = "Requesting to Server ...",
	[ "Basic_UI_ReqToServerFail" ] = "Not response from the server, please try again later.",
	[ "Basic_UI_StringRequest" ] = "Request",
	[ "Basic_UI_Question" ] = "Question",
	[ "Basic_UI_Notify" ] = "Notify",
	[ "Basic_UI_Continue" ] = "Continue",
	[ "Basic_UI_OK" ] = "OK",
	[ "Basic_UI_YES" ] = "YES",
	[ "Basic_UI_NO" ] = "NO",
	[ "Basic_UI_Count" ] = "%s's",
	[ "Basic_IDK" ] = "...?",
	[ "Basic_LangKeyError" ] = "Key Error",
	[ "Basic_Sorry" ] = "SORRY ...",
	[ "Basic_UI_EntityMenuOptionTitle" ] = "Choose interact with this Entity",
	[ "Basic_UI_ItemMenuOptionTitle" ] = "Choose interact with this Item",
	[ "Basic_UI_RecogniseMenuOptionTitle" ] = "Would you like any recognition options?",
	[ "Basic_Error_NoSchema" ] = "Can't find Schema table. (CAT_ERR 0x1)",
	[ "Basic_Error_NoDatabase" ] = "Catherine has not connected to Database. (CAT_ERR 0x2) : %s",
	[ "Basic_Error_LibraryLoad" ] = "Failed to load Library. (CAT_ERR 0x3) ( Function : %s )",
	[ "Basic_Error_LoadTimeoutWait" ] = "Failed to initialize the Catherine, ReInitializing the Catherine ... (CAT_ERR 0x4) ( %s attempts. )",
	[ "Basic_Error_LoadCantRetry" ] = "Failed to initialize the Catherine, Rejoin to this server ...",
	[ "Basic_Info_Loading" ] = "Initializing the Catherine ...",
	[ "Basic_Framework_Author" ] = "Catherine framework development and design by '%s'",
	[ "Basic_Notify_BunnyHop" ] = "Do not Bunny-hop!",
	[ "Basic_Notify_RestoreDatabaseKick" ] = "SORRY, You have been kicked from this server, because server are working Database restore.",
	[ "Basic_ItemESP_Name" ] = "ITEM",
	[ "Basic_PopNotify_Title" ] = "Important Notifications",
	[ "Basic_DermaUtil_MessageTitle" ] = "Notify",
	[ "Basic_DermaUtil_QueryTitle" ] = "Confirm",
	
	// Command
	[ "Command_ChangeLevel_Fin" ] = "%s(sec) after change map to %s.",
	[ "Command_ChangeLevel_Error01" ] = "Map is not a valid!",
	[ "Command_RestartLevel_Fin" ] = "%s(sec) after restart a server.",
	[ "Command_ClearDecals_Fin" ] = "You have cleared all decals on the map.",
	[ "Command_SetTimeHour_Fin" ] = "You have set the roleplay time to %s(hour).",
	[ "Command_PrintBodyGroup_Fin" ] = "Printed target player Body groups on the Console.",
	[ "Command_PM_Error01" ] = "You can't send PM chat to yourself!",
	[ "Command_Reply_Error01" ] = "You don't have last PM chat history!",
	[ "Command_PrintItems_Fin" ] = "Printed all item Datas on the Console.",
	
	// AntiHaX
	[ "AntiHaX_KickMessageNotifyAdmin" ] = "%s/%s user are using the Cheat programes, So kicked the player.",
	[ "AntiHaX_KickMessage" ] = "Sorry, you have been kicked for using cheats.",
	[ "AntiHaX_KickMessage_TimeOut" ] = "Sorry, you have been kicked because the anti-cheat timed out.",
	
	// Weapon
	[ "Weapon_MapEntity_Desc" ] = "Press 'Use' to equip.",
	[ "Weapon_Instructions_Title" ] = "- Instructions -",
	[ "Weapon_Purpose_Title" ] = "- Purpose -",
	[ "Weapon_Author_Title" ] = "- Author -",
	
	[ "Weapon_Fists_Name" ] = "Fists",
	[ "Weapon_Fists_Instructions" ] = "Primary Fire : Punch.\nSecondary Fire : Knock.",
	[ "Weapon_Fists_Purpose" ] = "Punching characters and knocking on doors.",
	
	[ "Weapon_Key_Name" ] = "Keys",
	[ "Weapon_Key_Instructions" ] = "Primary Fire : Lock.\nSecondary Fire : Unlock.",
	[ "Weapon_Key_Purpose" ] = "Locking and unlocking entities that you have access to."
}

catherine.language.Register( LANGUAGE )