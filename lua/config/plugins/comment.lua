return {
    "numToStr/Comment.nvim",
    lazy=false,
    config=function()

        require("Comment").setup({ ignore = "^$" })
        require("Comment.ft").codevlisp = ";;%s"
        require("Comment.ft").tikz =  require("Comment.ft").get("tex")
        require("Comment.ft").pandoc =require("Comment.ft").get("html")

    end
}
