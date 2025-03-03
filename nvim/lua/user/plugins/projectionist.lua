vim.g.projectionist_heuristics = {
    artisan = {
        ['*'] = {
            start = 'php artisan serve',
            console = 'php artisan tinker'
        },
        ['app/Models/*.php'] = {
            type = 'model'
        },
        ['app/Http/Controllers/*.php'] = {
            type = 'controller'
        },
        ['routes/*.php'] = {
            type = 'route'
        },
        ['database/migrations/*.php'] = {
            type = 'migration'
        }
    }
}

