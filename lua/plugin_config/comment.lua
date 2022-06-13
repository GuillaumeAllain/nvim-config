local comment = require("Comment")
local ft = require("Comment.ft")

comment.setup({ ignore = "^$" })
ft.codevlisp = ";;%s"
ft.tikz = ft.lang("tex")
ft.pandoc = ft.lang("html")
