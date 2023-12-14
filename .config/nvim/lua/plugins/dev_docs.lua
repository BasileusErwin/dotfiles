return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    float_win = {
      relative = "editor",
      height = 25,
      width = 100,
      border = "rounded",
    },
    ensure_installed = {
      -- Web
      "typescript",
      "javascript",
      "node",
      "express",
      "react",
      "sequelize-6",
      "date_fns",

      -- Low-level
      "zig",
      "rust",
      "c",
      "cpp",
      "nim",

      -- Other
      "lua-5.4",
      "ocaml",
      "docker",
      "scala-3.2",
      "markdown",
      "python-3.12",
      "bash",

      -- Database
      "redis",
      "postgresql-14",
      "sqlite"
    }
  }
}
