# Docker

## Good practices

* Always run `apt-get update` and `apt-get install` in the same `RUN` command,
* If you want to cleanup the image a little after executing a command, do it in the same `RUN` command or the image won't be any lighter (the first `RUN` will have created its own FS layer)
* If you write a single huge `RUN` command, each time you change anything in it, the whole thing will have to be re-executed,
* If you `ADD` a file that is likely to change often, do it at the end of the Dockerfile otherwise everything after this `ADD` will not be using the cache each time the file changes,
* If you use the `ARG` command, do it just before where it is needed for the same reason as the `ADD` command.
