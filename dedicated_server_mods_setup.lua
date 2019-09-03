--There are two functions that will install mods, ServerModSetup and ServerModCollectionSetup. Put the calls to the functions in this file and they will be executed on boot.

--ServerModSetup takes a string of a specific mod's Workshop id. It will download and install the mod to your mod directory on boot.
	--The Workshop id can be found at the end of the url to the mod's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=350811795
	--ServerModSetup("350811795")

--ServerModCollectionSetup takes a string of a specific mod's Workshop id. It will download all the mods in the collection and install them to the mod directory on boot.
	--The Workshop id can be found at the end of the url to the collection's Workshop page.
	--Example: http://steamcommunity.com/sharedfiles/filedetails/?id=379114180
	--ServerModCollectionSetup("379114180")

ServerModSetup("1378549454")
ServerModSetup("356398534")
ServerModSetup("362175979")
ServerModSetup("374550642")
ServerModSetup("375850593")
ServerModSetup("378160973")
ServerModSetup("382177939")
ServerModSetup("458940297")
ServerModSetup("466732225")
ServerModSetup("666155465")
ServerModSetup("672208231")
ServerModSetup("721491336")
ServerModSetup("758532836")
ServerModSetup("770901818")
ServerModSetup("818739975")
ServerModSetup("972139614")
