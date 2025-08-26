return {
  "lervag/vimtex",
  init = function()
    -- Viewer settings
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_view_method = 'general'
    -- vim.g.vimtex_view_method = 'zathura'            -- Sioyek PDF viewer for academic documents
    -- Note: Not setting vimtex_view_sioyek_options allows VimTeX to handle window management
    -- It will open new windows when needed but reuse for the same document
    vim.g.vimtex_context_pdf_viewer = 'skim'     -- External PDF viewer for the Vimtex menu

    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      build_dir = '',           -- can be left empty or specify "build"
      callback = 1,
      continuous = 1,           -- <--- enables live compilation
      executable = 'latexmk',
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }

    -- Formatting settings
    -- vim.g.vimtex_format_enabled = true             -- Enable formatting with latexindent
    -- vim.g.vimtex_format_program = 'latexindent'

    -- Indentation settings
    vim.g.vimtex_indent_enabled = false            -- Disable auto-indent from Vimtex
    vim.g.tex_indent_items = false                 -- Disable indent for enumerate
    vim.g.tex_indent_brace = false                 -- Disable brace indent

    -- Suppression settings
    vim.g.vimtex_quickfix_mode = 0                 -- Suppress quickfix on save/build
    vim.g.vimtex_log_ignore = {                    -- Suppress specific log messages
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    }

    -- Other settings
    vim.g.vimtex_mappings_enabled = false          -- Disable default mappings
    vim.g.tex_flavor = 'latex'                     -- Set file type for TeX files

    -- Conceal settings 
    vim.opt.conceallevel = 2
    vim.g.tex_conceal = "abdmg"
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "nc"        -- conceal in normal + command mode
      end,
    })

  end,
}

