if !has('nvim-0.5.0')
  echohl Error
  echom 'This plugin only works with Neovim >= v0.5.0'
  echohl clear
  finish
endif

" Those commands define custom commands to execute queries
command! -range DockDbExecMongo <line1>,<line2>lua require'dockdb'.RunMongoQuery()
command! -range DockDbExecMySQL <line1>,<line2>lua require'dockdb'.RunMySqlQuery()
command! -range DockDbExecMSSQL <line1>,<line2>lua require'dockdb'.RunMSSqlQuery()
command! -range DockDbExecOracle <line1>,<line2>lua require'dockdb'.RunOracleQuery()
command! -range DockDbExecRedis <line1>,<line2>lua require'dockdb'.RunRedisQuery()
command! -range DockDbExecMemcached <line1>,<line2>lua require'dockdb'.RunMemcachedQuery()
command! -range DockDbExecMaria <line1>,<line2>lua require'dockdb'.RunMariaQuery()
command! -range DockDbExecPostgresSQL <line1>,<line2>lua require'dockdb'.RunPostgresSqlQuery()
