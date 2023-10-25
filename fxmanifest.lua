fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game 'gta5'

name 'tam_changelog'
author 'Hakko'
description 'Three Amigos Changelog'
version '5.2.6'

client_debug_mode 'false'
server_debug_mode 'false'
experimental_features_enabled '0'

dependencies {
	'ox_lib',
    'spawnmanager'
}

files {'changelog.md'}

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
    'src/client/main.lua',
}

server_scripts {
    'src/server/main.lua',
}