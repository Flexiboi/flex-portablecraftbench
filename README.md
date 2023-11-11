# Portable crafting bench

This was ment to be a 'paid' release at one point but here it is for free!
</br>
# What is it?
It is a crafting bench that you can place and use anywhere in the city.
</br>
Each bench has its own level and stuff you can craft with it.
</br>
All levels get saved on the item itself.
</br>
Each bench type can be created in the config and has to be in the items.lua
</br>
# Install
You will need:
</br>
- QB CORE
- QB-MENU
</br>
To test add these in items.lua:
</br>

```
	-- WERKBENCH
	['workbench1'] 		 			= {['name'] = 'workbench1', 		 			['label'] = 'Standaard werkbank', 	    ['weight'] = 3000, 		['type'] = 'item', 		['image'] = 'bench1.png', 				['unique'] = true, 		['useable'] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ['description'] = ''},
	['workbench2'] 		 			= {['name'] = 'workbench2', 		 			['label'] = 'Gereedschap werkbank', 	['weight'] = 3000, 		['type'] = 'item', 		['image'] = 'bench2.png', 				['unique'] = true, 		['useable'] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ['description'] = ''},
	['workbench3'] 		 			= {['name'] = 'workbench3', 		 			['label'] = 'Electronica werkbank', 	['weight'] = 3000, 		['type'] = 'item', 		['image'] = 'bench3.png', 				['unique'] = true, 		['useable'] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ['description'] = ''},
	['workbench4'] 		 			= {['name'] = 'workbench4', 		 			['label'] = 'Wapen werkbank', 			['weight'] = 3000, 		['type'] = 'item', 		['image'] = 'bench4.png', 				['unique'] = true, 		['useable'] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ['description'] = ''},
```
</br>
You will need to edit the config to your liking since most likly there are a lot of random stuff you will not have.
