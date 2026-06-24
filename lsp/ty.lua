return {
    cmd = { "pixi", "exec", "--spec", "ty", "--", "ty", "server" },
    filetypes = { "python" },
    init_options = {
        environment = {
            python = ".pixi/envs/default/bin/python",
        },
    },
}
