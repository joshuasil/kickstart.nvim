return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("minuet").setup({
      -- minuet has no "ollama" backend; ollama speaks the OpenAI API on /v1
      provider = "openai_fim_compatible",

      -- a 14b model on local hardware needs more than the 3s default,
      -- and each completion is its own request, so ask for one.
      n_completions = 1,
      context_window = 8192,
      request_timeout = 8,

      provider_options = {
        openai_fim_compatible = {
          name = "Ollama",
          model = "qwen2.5-coder:14b",
          end_point = "http://127.0.0.1:11434/v1/completions",
          -- ollama ignores the auth header; TERM is just a var that exists
          api_key = "TERM",
          stream = true,
          optional = {
            max_tokens = 256,
            temperature = 0.2,
            top_p = 0.9,
            stop = { "\n\n" },
          },
        },
      },

      -- Keymaps to accept, dismiss, or cycle options
      virtualtext = {
        auto_trigger_ft = { "*" }, -- Enable for all filetypes
        keymap = {
          accept = "<A-A>",       -- Alt + Shift + A to accept full suggestion
          accept_line = "<A-a>",  -- Alt + a to accept just one line
          dismiss = "<A-e>",      -- Alt + e to dismiss
          prev = "<A-[>",
          next = "<A-]>",
        },
      },
    })
  end,
}
