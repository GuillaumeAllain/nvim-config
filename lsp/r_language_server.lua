return {
    "r_language_server",
    cmd = {
        "pixi",
        "exec",
        "--spec",
        "r-base",
        "--spec",
        "r-languageserver",
        "R",
        "--slave",
        "-e",
        "languageserver::run()",
    },
}
