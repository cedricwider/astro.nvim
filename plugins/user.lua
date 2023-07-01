return {
  { "tpope/vim-repeat" },
  { "sindrets/diffview.nvim" },
  { "elkowar/yuck.vim" },
  {
    "imNel/monorepo.nvim",
    config = function()
      require("monorepo").setup {
        -- Your config here!
      }
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "imNel/monorepo.nvim",
    config = function()
      require("monorepo").setup {
        -- Your config here!
      }
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "renerocksai/telekasten.nvim",
    event = "CmdlineEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "renerocksai/calendar-vim",
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      require("telekasten").setup {
        home = vim.fn.expand "~/work/notes/",
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "User AstroFile",
    config = function() require("nvim-surround").setup() end,
  },
  {
    "phaazon/hop.nvim",
    event = "User AstroFile",
    config = function() require("hop").setup() end,
  },
  {
    "imNel/monorepo.nvim",
    event = "User AstroFile",
    config = function() require("monorepo").setup() end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    event = "User AstroFile",
    config = function()
      require("neogit").setup {
        disable_commit_confirmation = true,
        integrations = {
          diffview = true,
        },
        commit_popup = {
          kind = "floating",
        },
      }
    end,
  },
  {
    "mattn/emmet-vim",
    event = "User AstroFile",
  },
  {
    "microsoft/vscode-js-debug",
    event = "User AstroFile",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    event = "User AstroFile",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup {
        debugger_path = os.getenv "HOME" .. "/.local/share/nvim/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup() end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      char = {
        enabled = true,
        -- when to hide flash
        autohide = function(motion)
          -- autohide flash when the operator is `y`
          return vim.fn.mode(true):find "no" and vim.v.operator == "y"
        end,
        -- when to show jump labels
        jump_labels = function(motion)
          -- never show jump labels by default
          -- return false
          -- Always show jump labels for ftFT
          return vim.v.count == 0 and motion:find "[ftFT]"
          -- Show jump labels for ftFT in operator-pending mode
          -- return vim.v.count == 0 and motion:find("[ftFT]") and vim.fn.mode(true):find("o")
        end,
        -- When using jump labels, don't use these keys
        -- This allows using those keys directly after the motion
        label = { exclude = "hjkliardc" },
        -- by default all keymaps are enabled, but you can disable some of them,
        -- by removing them from the list.
        keys = { "f", "F", "t", "T", "," },
        search = { wrap = false },
        highlight = { backdrop = true },
        jump = { register = false },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
