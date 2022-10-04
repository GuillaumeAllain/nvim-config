local comment = require("Comment")
local ft = require("Comment.ft")

comment.setup({ ignore = "^$" })
ft.codevlisp = ";;%s"
ft.tikz = ft.get("tex")
ft.pandoc = ft.get("html")
