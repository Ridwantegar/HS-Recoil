fx_version 'cerulean'
game 'gta5'

name            'hs_ricoil'
author          'husen'
version         '1.0.0'
description     'Weapon Core'
lua54           'yes'

shared_script   '@ox_lib/init.lua'

server_scripts {
    'config.lua',
    'versioncheck.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua',
    'client/demeg.lua',
    'client/recoil.lua',
    'client/onback.lua',
    'client/stress.lua',
}

escrow_ignore {
    'config.lua',
    'client/main.lua',
    'client/demeg.lua',
    'client/recoil.lua',
    'client/onback.lua'
}

dependencies {
    'ox_lib'
}
dependency '/assetpacks'