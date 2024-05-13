if !has('nvim-0.5.0')
  echohl Error
  echom 'This plugin only works with Neovim >= v0.5.0'
  echohl clear
  finish
endif

" Define a custom command to execute the MySQL query
command! -range DockDbExecuteMongo <line1>,<line2>lua require'dockdb'.RunMongoDbQuery()
command! -range DockDbExecuteMySQL <line1>,<line2>lua require'dockdb'.RunMySqlQuery()
command! -range DockDbExecutePostgresSQL <line1>,<line2>lua require'dockdb'.RunPostgresSqlQuery()
