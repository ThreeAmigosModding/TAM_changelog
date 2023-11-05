fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game 'gta5'

name 'tam_changelog'
author 'Hakko'
description 'Three Amigos Changelog'
version '1.2.0'

client_debug_mode 'false'
server_debug_mode 'false'
experimental_features_enabled '0'

dependencies {
	'ox_lib',
    'spawnmanager'
}

files {'changelog.md', 'src/server/cache.md'}

shared_scripts {
	'@ox_lib/init.lua'
}

client_scripts {
    'config.lua',
    'src/client/main.lua'
}

server_scripts {
    'config.lua',
    'src/server/main.lua'
}

escrow_ignore {
    'src/server/main.lua',
    'src/client/main.lua',
    'config.lua'
}