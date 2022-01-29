local set = vim.opt

function Texopts()
  vim.g.vimtex_view_general_viewer = 'okular'
  vim.g.vimtex_compiler_latexmk_engines = {
    _ = '-xelatex'
  }
  vim.g.tex_comment_nospell = 1
  vim.g.vimtex_compiler_progname = 'nvr'
  vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
  vim.g.vimtex_view_general_options_latexmk = '--unique'
end
set.wildignore = {
  "*.aux",
  "*.lof",
  "*.lot",
  "*.fls",
  "*.out",
  "*.toc",
  "*.fmt",
  "*.fot",
  "*.cb",
  "*.cb2",
  ".*.lb",
  "__latex*",
  "*.fdb_latexmk",
  "*.synctex",
  "*.synctex(busy)",
  "*.synctex.gz",
  "*.synctex.gz(busy)",
  "*.pdfsync",
  "*.bbl",
  "*.bcf",
  "*.blg",
  "*.run.xml",
  "indent.log",
  "*.pdf",
}
