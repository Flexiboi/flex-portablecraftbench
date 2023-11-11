Config = {}

Config.inventory = 'qb' -- ox or qb
Config.inventorylink = 'qb-inventory/html/images/' --Path of your inventory images
Config.waitcardeletetime = 2 --Time before it gets deleted when a car is nearby
Config.undergroundZcheck = -30 -- Z value check for when player cant place anymore (like under the map)

Config.benches = {
    ['workbench1'] = {
        benchitem = 'workbench1', --itemname of the item in items.lua
        model = 'bkr_prop_weed_table_01b',--Model of the bench
        text3dYoffset = 0.5,--If the 3d text is inside the bench add some hight to display it nicer
        benchrepairtime = 10, -- Seconds to repair
        benchbreakchance = 100, -- Chance of the bench to break
        benchbreakpercent = 100, -- How much the bench health goes down
        repaircost = { -- Amount times benchlevel = repairkost (for example level7 bench times 1 iron)
            [1] = {
                item = "iron",--Itemname
                amount = 1,--Amount needed
            },
            [2] = {
                item = "steel",--Itemname
                amount = 1,--Amount needed
            },
        },
        crafting = {
            [1] = {
                label = 'Meterials',--label in craftbench
                itemname = 'workbench2',--name of what we craft
                itemtype = 'bench',--Can be item or bench
                materials = {
                    [1] = {
                        item = "lumberjack_wood",--Itemname
                        amount = 25,--Amount needed
                    },
                    [2] = {
                        item = "iron",--Itemname
                        amount = 35,--Amount needed
                    },
                },
                crafttime = 15, --Time to craft in seconds
                minbenchlevel = 0, --min benchlevel to craft this
                gainxp = 1, --level it gains per craft
            },
            [2] = {
                label = 'Electronic',--label in craftbench
                itemname = 'workbench3',--name of what we craft
                itemtype = 'bench',--Can be item or bench
                materials = {
                    [1] = {
                        item = "iron",--Itemname
                        amount = 35,--Amount needed
                    },
                    [2] = {
                        item = "steel",--Itemname
                        amount = 26,--Amount needed
                    },
                    [3] = {
                        item = "copper",--Itemname
                        amount = 18,--Amount needed
                    },
                },
                crafttime = 15, --Time to craft in seconds
                minbenchlevel = 0, --min benchlevel to craft this
                gainxp = 1, --level it gains per craft
            },
        }
    },
    ['workbench2'] = {
        benchitem = 'workbench2',
        model = 'prop_rub_table_02',
        text3dYoffset = 0.0,
        benchrepairtime = 10,
        benchbreakchance = 15,
        benchbreakpercent = math.random(0, 2),
        repaircost = {
            [1] = {
                item = "lumberjack_wood",
                amount = 25,
            },
            [2] = {
                item = "iron",--Itemname
                amount = 68,--Amount needed
            },
        },
        crafting = {
            [1] = {
                label = 'Leeg zakske',
                itemname = 'empty_weed_bag',
                itemtype = 'item',
                materials = {
                    [1] = {
                        item = "plastic",
                        amount = 10,
                    },
                },
                crafttime = 3,
                minbenchlevel = 0,
                gainxp = 1,
            },
            [2] = {
                label = 'Lockpick',
                itemname = 'lockpick',
                itemtype = 'item',
                materials = {
                    [1] = {
                        item = "iron",
                        amount = 3,
                    },
                    [2] = {
                        item = "metalscrap",
                        amount = 7,
                    },
                },
                crafttime = 5,
                minbenchlevel = 50,
                gainxp = 2,
            },
            [3] = {
                label = 'Schroevendraaiersetje',
                itemname = 'screwdriverset',
                itemtype = 'item',
                materials = {
                    [1] = {
                        item = "metalscrap",
                        amount = 7,
                    },
                    [2] = {
                        item = "plastic",
                        amount = 5,
                    },
                    [3] = {
                        item = "iron",
                        amount = 6,
                    },
                },
                crafttime = 5,
                minbenchlevel = 84,
                gainxp = 2,
            },
            [4] = {
                label = 'Schup',
                itemname = 'farm_pa',
                itemtype = 'item',
                materials = {
                    [1] = {
                        item = "metalscrap",
                        amount = 8,
                    },
                    [2] = {
                        item = "lumberjack_wood",
                        amount = 6,
                    },
                    [3] = {
                        item = "plastic",
                        amount = 5,
                    },
                },
                crafttime = 6,
                minbenchlevel = 120,
                gainxp = 3,
            },
            [5] = {
                label = 'Handboeien',
                itemname = 'handcuffs',
                itemtype = 'item',
                materials = {
                    [1] = {
                        item = "metalscrap",
                        amount = 7,
                    },
                    [2] = {
                        item = "steel",
                        amount = 5,
                    },
                    [3] = {
                        item = "aluminum",
                        amount = 6,
                    },
                },
                crafttime = 8,
                minbenchlevel = 145,
                gainxp = 4,
            },
            [6] = {
                label = 'Vest',
                itemname = 'armor',
                itemtype = 'item',
                materials = {
                    [1] = {
                        item = "metalscrap",
                        amount = 7,
                    },
                    [2] = {
                        item = "steel",
                        amount = 5,
                    },
                    [3] = {
                        item = "aluminum",
                        amount = 6,
                    },
                },
                crafttime = 8,
                minbenchlevel = 175,
                gainxp = 4,
            },
            [7] = {
                label = 'Handvat van een mes',
                itemname = 'knife_handle',
                itemtype = 'item',
                materials = {
                    [1] = {
                        item = "rubber",
                        amount = 125,
                    },
                },
                crafttime = 12,
                minbenchlevel = 225,
                gainxp = 4,
            },
        }
    },
    ['workbench3'] = {
        benchitem = 'workbench3', --itemname of the item in items.lua
        model = 'ex_prop_ex_toolchest_01',--Model of the bench
        text3dYoffset = 0.6,--If the 3d text is inside the bench add some hight to display it nicer
        benchrepairtime = 15, -- Seconds to repair
        benchbreakchance = 20, -- Chance of the bench to break
        benchbreakpercent = math.random(1,2), -- How much the bench health goes down
        repaircost = { -- Amount times benchlevel = repairkost (for example level7 bench times 1 iron)
            [1] = {
                item = "iron",--Itemname
                amount = 55,--Amount needed
            },
            [2] = {
                item = "steel",--Itemname
                amount = 68,--Amount needed
            },
            [3] = {
                item = "copper",--Itemname
                amount = 48,--Amount needed
            },
        },
        crafting = {
            [1] = {
                label = 'Gevaarlijke usb',--label in craftbench
                itemname = 'trojan_usb',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "copper",--Itemname
                        amount = 6,--Amount needed
                    },
                    [2] = {
                        item = "plastic",--Itemname
                        amount = 5,--Amount needed
                    },
                    [3] = {
                        item = "metalscrap",--Itemname
                        amount = 5,--Amount needed
                    },
                },
                crafttime = 4, --Time to craft in seconds
                minbenchlevel = 0, --min benchlevel to craft this
                gainxp = 1, --level it gains per craft
            },
            [2] = {
                label = 'Electronisch spul',--label in craftbench
                itemname = 'electronickit',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "copper",--Itemname
                        amount = 8,--Amount needed
                    },
                    [2] = {
                        item = "plastic",--Itemname
                        amount = 18,--Amount needed
                    },
                    [3] = {
                        item = "metalscrap",--Itemname
                        amount = 7,--Amount needed
                    },
                },
                crafttime = 5, --Time to craft in seconds
                minbenchlevel = 25, --min benchlevel to craft this
                gainxp = 2, --level it gains per craft
            },
            [3] = {
                label = 'Fitbit',--label in craftbench
                itemname = 'fitbit',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "copper",--Itemname
                        amount = 8,--Amount needed
                    },
                    [2] = {
                        item = "plastic",--Itemname
                        amount = 10,--Amount needed
                    },
                    [3] = {
                        item = "metalscrap",--Itemname
                        amount = 7,--Amount needed
                    },
                },
                crafttime = 6, --Time to craft in seconds
                minbenchlevel = 120, --min benchlevel to craft this
                gainxp = 2, --level it gains per craft
            },
            [4] = {
                label = 'Poortkraker',--label in craftbench
                itemname = 'gatecrack',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "copper",--Itemname
                        amount = 8,--Amount needed
                    },
                    [2] = {
                        item = "plastic",--Itemname
                        amount = 10,--Amount needed
                    },
                    [3] = {
                        item = "metalscrap",--Itemname
                        amount = 7,--Amount needed
                    },
                    [4] = {
                        item = "electronickit",--Itemname
                        amount = 1,--Amount needed
                    },
                },
                crafttime = 6, --Time to craft in seconds
                minbenchlevel = 110, --min benchlevel to craft this
                gainxp = 3, --level it gains per craft
            },
            [5] = {
                label = 'Walkie',--label in craftbench
                itemname = 'radio',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "copper",--Itemname
                        amount = 8,--Amount needed
                    },
                    [2] = {
                        item = "plastic",--Itemname
                        amount = 15,--Amount needed
                    },
                    [3] = {
                        item = "metalscrap",--Itemname
                        amount = 7,--Amount needed
                    },
                    [4] = {
                        item = "rubber",--Itemname
                        amount = 5,--Amount needed
                    },
                    [5] = {
                        item = "electronickit",--Itemname
                        amount = 1,--Amount needed
                    },
                },
                crafttime = 6, --Time to craft in seconds
                minbenchlevel = 145, --min benchlevel to craft this
                gainxp = 3, --level it gains per craft
            },
            [6] = {
                label = 'Camerahacker',--label in craftbench
                itemname = 'camerhacker',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "copper",--Itemname
                        amount = 5,--Amount needed
                    },
                    [2] = {
                        item = "plastic",--Itemname
                        amount = 8,--Amount needed
                    },
                    [3] = {
                        item = "metalscrap",--Itemname
                        amount = 6,--Amount needed
                    },
                    [4] = {
                        item = "electronickit",--Itemname
                        amount = 1,--Amount needed
                    },
                },
                crafttime = 6, --Time to craft in seconds
                minbenchlevel = 125, --min benchlevel to craft this
                gainxp = 1, --level it gains per craft
            },
            [7] = {
                label = 'Laptop',--label in craftbench
                itemname = 'laptop',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "copper",--Itemname
                        amount = 9,--Amount needed
                    },
                    [2] = {
                        item = "plastic",--Itemname
                        amount = 12,--Amount needed
                    },
                    [3] = {
                        item = "metalscrap",--Itemname
                        amount = 12,--Amount needed
                    },
                    [4] = {
                        item = "rubber",--Itemname
                        amount = 4,--Amount needed
                    },
                    [5] = {
                        item = "electronickit",--Itemname
                        amount = 3,--Amount needed
                    },
                },
                crafttime = 6, --Time to craft in seconds
                minbenchlevel = 155, --min benchlevel to craft this
                gainxp = 3, --level it gains per craft
            },
            [8] = {
                label = 'Boost Laptop',--label in craftbench
                itemname = 'boostinglaptop',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "laptop",--Itemname
                        amount = 1,--Amount needed
                    },
                    [2] = {
                        item = "trojan_usb",--Itemname
                        amount = 1,--Amount needed
                    },
                    [3] = {
                        item = "plastic",--Itemname
                        amount = 10,--Amount needed
                    },
                },
                crafttime = 8, --Time to craft in seconds
                minbenchlevel = 165, --min benchlevel to craft this
                gainxp = 3, --level it gains per craft
            },
            [9] = {
                label = 'Boost Hackapparaat',--label in craftbench
                itemname = 'boostingdisabler',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "trojan_usb",--Itemname
                        amount = 1,--Amount needed
                    },
                    [2] = {
                        item = "electronickit",--Itemname
                        amount = 1,--Amount needed
                    },
                    [3] = {
                        item = "aluminum",--Itemname
                        amount = 45,--Amount needed
                    },
                    [4] = {
                        item = "plastic",--Itemname
                        amount = 65,--Amount needed
                    },
                },
                crafttime = 8, --Time to craft in seconds
                minbenchlevel = 175, --min benchlevel to craft this
                gainxp = 3, --level it gains per craft
            },
        }
    },
    ['workbench4'] = {
        benchitem = 'workbench4', --itemname of the item in items.lua
        model = 'bkr_prop_weed_table_01b',--Model of the bench
        text3dYoffset = 0.5,--If the 3d text is inside the bench add some hight to display it nicer
        benchrepairtime = 15, -- Seconds to repair
        benchbreakchance = 65, -- Chance of the bench to break
        benchbreakpercent = math.random(1,3), -- How much the bench health goes down
        repaircost = { -- Amount times benchlevel = repairkost (for example level7 bench times 1 iron)
            [1] = {
                item = "iron",--Itemname
                amount = 55,--Amount needed
            },
            [2] = {
                item = "steel",--Itemname
                amount = 65,--Amount needed
            },
        },
        crafting = {
            -- [1] = {
            --     label = 'Zelfgemaakt Mesje',--label in craftbench
            --     itemname = 'weapon_knife_homemade',--name of what we craft
            --     itemtype = 'item',--Can be item or bench
            --     materials = {
            --         [1] = {
            --             item = "lumberjack_wood",--Itemname
            --             amount = 8,--Amount needed
            --         },
            --         [2] = {
            --             item = "metalscrap",--Itemname
            --             amount = 22,--Amount needed
            --         },
            --         [3] = {
            --             item = "steel",--Itemname
            --             amount = 5,--Amount needed
            --         },
            --         [4] = {
            --             item = "rope",--Itemname
            --             amount = 1,--Amount needed
            --         },
            --     },
            --     crafttime = 20, --Time to craft in seconds
            --     minbenchlevel = 0, --min benchlevel to craft this
            --     gainxp = 1, --level it gains per craft
            -- },
            [1] = {
                label = 'Mesje',--label in craftbench
                itemname = 'weapon_knife',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "knife_handle",--Itemname
                        amount = 1,--Amount needed
                    },
                    [2] = {
                        item = "knife_blade",--Itemname
                        amount = 1,--Amount needed
                    },
                    [3] = {
                        item = "steel",--Itemname
                        amount = 10,--Amount needed
                    },
                },
                crafttime = 20, --Time to craft in seconds
                minbenchlevel = 0, --min benchlevel to craft this
                gainxp = 2, --level it gains per craft
            },
            [2] = {
                label = 'Buskruit',--label in craftbench
                itemname = 'gunpowder',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "thermite",--Itemname
                        amount = 1,--Amount needed
                    },
                },
                crafttime = 20, --Time to craft in seconds
                minbenchlevel = 10, --min benchlevel to craft this
                gainxp = 2, --level it gains per craft
            },
            [3] = {
                label = 'Pistoolkogels',--label in craftbench
                itemname = 'pistol_ammo',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "gunpowder",--Itemname
                        amount = 1,--Amount needed
                    },
                    [2] = {
                        item = "copper",--Itemname
                        amount = 5,--Amount needed
                    },
                },
                crafttime = 20, --Time to craft in seconds
                minbenchlevel = 15, --min benchlevel to craft this
                gainxp = 2, --level it gains per craft
            },
            [4] = {
                label = 'SNS',--label in craftbench
                itemname = 'weapon_snspistol',--name of what we craft
                itemtype = 'item',--Can be item or bench
                materials = {
                    [1] = {
                        item = "weaponpart_sns_loop",--Itemname
                        amount = 1,--Amount needed
                    },
                    [2] = {
                        item = "weaponpart_sns_trigger",--Itemname
                        amount = 1,--Amount needed
                    },
                    [3] = {
                        item = "weaponpart_sns_body",--Itemname
                        amount = 1,--Amount needed
                    },
                },
                crafttime = 25, --Time to craft in seconds
                minbenchlevel = 22, --min benchlevel to craft this
                gainxp = 3, --level it gains per craft
            },
        }
    },
}