## TODO

- [ ] Handle all DBMS with the current flaky `docker exec`.
- [ ] Handle socat communication from the host to the daemon.
- [ ] Manage an history of previous runed queries.
        that can be inside a `/tmp/dockdb.nvim/query_1223`, so that it can be revisit.
- [ ] Replay previous queries.
- [ ] Update the config to take multiple port (so port should be taken as a list not strings)
- [ ] Fix and optimize all escapes mode ("'/\)
- [ ] Add nvim options to bump/run/pull those images directly too (with a much more config mode available).
- [ ] List all running docker container related to database DBMS.
