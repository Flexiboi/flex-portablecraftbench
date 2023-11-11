local Translations = {
    error = {
       cartoclose = 'You are standing on the streets or there is a vehicle nearby..',
       notenoughtmats = 'Not enough materials..',
       stoppedcrafting = 'Stopped crafting..',
       stoppedrepairbench = 'Stopped repairing..',
       notenoughtorepair = 'Not enough materials to repair..',
       benchbroke = 'Your workbench has broken..',
       notvalidplace = 'You cant palce it here'
    },
    success = {
        placedbench = 'Workbench placed!',
        grabbench = 'You picked your workbench back up.',
        repairedbench = 'Bench has been repaired',
        alreadymaxhealth = 'Your workbench is already full health',
        crafted = 'Crafted %{value}'
    },
    info = {
        repairingworkbench = 'Repairing workbench..',
        youdonthave = 'You are missing: ',
        crafting = '%{value} crafting'
    },
    command = {
        testcommamd = 'Test workbench',
        name = 'Itemname of the benchitem',
        level = 'Level of the bench',
        health = 'Health of the bench'
    },
    text = {
        benchlevel = 'Level',
        benchhealth = 'Health',
        craft = 'to craft',
        takebench = 'to pickup',
        repair = 'to repair'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})