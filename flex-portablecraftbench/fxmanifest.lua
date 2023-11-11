fx_version "bodacious"
game "gta5"
lua54 "yes"

author "flexiboi"
description "Flex-portableworkbench"
version "1.0.0"

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
}

server_scripts {
    'server/main.lua',
}

client_scripts {
    'client/place.lua',
	'client/main.lua',
}

escrow_ignore {
	'locales/*.lua',
	'config.lua',
}

dependencies {
	'qb-core'
}