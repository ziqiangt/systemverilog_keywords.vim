# systemverilog_keywords.vim

Systemverilog keywords completion source for [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)

## Install

```vim
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'ziqiangt/systemverilog_keywords.vim'
```

## Register systemverilog_keywords.vim

```vim
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#systemverilog_keywords#get_source_options({
    \ 'name': 'systemverilog_keywords',
    \ 'allowlist': ['verilog_systemverilog'],
    \ 'completor': function('asyncomplete#sources#systemverilog_keywords#completor'),
    \ }))
```
