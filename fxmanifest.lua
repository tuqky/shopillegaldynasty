fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'RageUI'
description 'RageUI'
version '1.0.0'

client_scripts {
    "dependencies/RageUI/RMenu.lua",
    "dependencies/RageUI/menu/RageUI.lua",
    "dependencies/RageUI/menu/Menu.lua",
    "dependencies/RageUI/menu/MenuController.lua",
    "dependencies/RageUI/components/*.lua",
    "dependencies/RageUI/menu/elements/*.lua",
    "dependencies/RageUI/menu/items/*.lua",
    "dependencies/RageUI/menu/panels/*.lua",
    "dependencies/RageUI/menu/windows/*.lua",
    "client/mClient.lua",
    "config.lua",
}


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/mServer.lua',
}