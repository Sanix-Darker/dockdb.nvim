if !has('nvim-0.5.0')
  echohl Error
  echom 'This plugin only works with Neovim >= v0.5.0'
  echohl clear
  finish
endif

" Those commands define custom commands to execute queries
command! -range DockDbExecuteMongo <line1>,<line2>lua require'dockdb'.RunMongoDBQuery()
command! -range DockDbExecuteMySQL <line1>,<line2>lua require'dockdb'.RunMySqlQuery()
command! -range DockDbExecuteMSSQL <line1>,<line2>lua require'dockdb'.RunMSSqlQuery()
command! -range DockDbExecuteOracle <line1>,<line2>lua require'dockdb'.RunOracleDBQuery()
command! -range DockDbExecuteMaria <line1>,<line2>lua require'dockdb'.RunMariaDBQuery()
command! -range DockDbExecutePostgresSQL <line1>,<line2>lua require'dockdb'.RunPostgresSqlQuery()
