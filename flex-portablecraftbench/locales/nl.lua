local Translations = {
    error = {
       cartoclose = 'Je staat op straat of te dicht bij nen otto..',
       notenoughtmats = 'Je hebt niet genoeg materialen..',
       stoppedcrafting = 'Gestopt met maken..',
       stoppedrepairbench = 'Gestopt met repareren..',
       notenoughtorepair = 'Niet genoeg materialen om je bank te herstellen..',
       benchbroke = 'Je werkbank is kapot gegaan..',
       notvalidplace = 'Hmm, das ni veilig hier..',
       alreadyplaced = 'Je hebt al een tafel klaar staan..'
    },
    success = {
        placedbench = 'Werkbank geplaatst!',
        grabbench = 'Werkbank opgepakt.',
        repairedbench = 'Werkbank hersteld.',
        alreadymaxhealth = 'Je werkbank is al volledig hersteld.',
        crafted = 'Je hebt %{value} gemaakt!'
    },
    info = {
        repairingworkbench = 'Werkbank aan het herstellen..',
        youdonthave = 'Je mist: ',
        crafting = '%{value} aan het maken..'
    },
    command = {
        testcommamd = 'Test workbench',
        name = 'Itemname of the benchitem',
        level = 'Level of the bench',
        health = 'Health of the bench'
    },
    text = {
        benchlevel = 'Level',
        benchhealth = 'Leven',
        craft = 'om te maken',
        takebench = 'om op te pakken',
        repair = 'om te herstellen'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})