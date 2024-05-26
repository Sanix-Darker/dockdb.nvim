if !has('nvim-0.5.0')
  echohl Error
  echom 'This plugin only works with Neovim >= v0.5.0'
  echohl clear
  finish
endif

" Those commands define custom commands to execute queries
command! -range DockDbExecMongo <line1>,<line2>lua require'dockdb'.RunMongoDBQuery()
command! -range DockDbExecMySQL <line1>,<line2>lua require'dockdb'.RunMySqlQuery()
command! -range DockDbExecMSSQL <line1>,<line2>lua require'dockdb'.RunMSSqlQuery()
command! -range DockDbExecOracle <line1>,<line2>lua require'dockdb'.RunOracleDBQuery()
command! -range DockDbExecMaria <line1>,<line2>lua require'dockdb'.RunMariaDBQuery()
command! -range DockDbExecPostgresSQL <line1>,<line2>lua require'dockdb'.RunPostgresSqlQuery()
