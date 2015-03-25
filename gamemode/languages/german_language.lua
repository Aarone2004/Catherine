local LANGUAGE = catherine.language.New( "german" )
LANGUAGE.name = "German"
LANGUAGE.data = {
	// Cash ^-^;
	[ "Cash_GiveMessage01" ] = "Du hast %s an %s überwiesen.",
	
	// Faction ^-^;
	[ "Faction_AddMessage01" ] = "Setze die Fraktion",
	[ "Faction_RemoveMessage01" ] = "Entferne die Fraktion",
	
	// Flag ^-^;
	[ "Flag_GiveMessage01" ] = "Füge flag hinzu",
	[ "Flag_TakeMessage01" ] = "Entferne flag",
	
	[ "UnknownError" ] = "Unbekannter Fehler.",
	[ "UnknownPlayerError" ] = "Der eingegebende Name ist ungültig!",
	[ "ArgError" ] = "%s Bitte füge ein zweites Argument hinzu!"
}

catherine.language.Register( LANGUAGE )