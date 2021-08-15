function! asyncomplete#sources#systemverilog_keywords#get_source_options(opts)
    let l:defaults={'name': 'systemverilog_keywords',
                \ 'completor': function('asyncomplete#sources#systemverilog_keywords#completor'),
                \ 'allowlist': ['*']}
    return extend(l:defaults, a:opts)
endfunction

function! asyncomplete#sources#systemverilog_keywords#completor(opt, ctx)
    let l:col = a:ctx['col']
    let l:typed = a:ctx['typed']

    let l:kw = matchstr(l:typed, '\v\S+$')
    let l:kwlen = len(l:kw)

    let l:startcol = l:col - l:kwlen
    let l:svwords = [
	\ "do", "if", "in", "for", "let", "new", "program", "endprogram", "case", "else", "enum", "casex", "null", "this", "true",
        \ "void", "with", "item", "break", "catch", "class", "const", "false", "super", "throw", "while", "yield",
        \ "delete", "export", "import", "public", "return", "static", "switch", "typedef", "default", "extends",
        \ "finally", "package", "private", "continue", "debugger", "function", "arguments", "interface", "protected",
        \ "bit", "int", "unsigned", "signed", "byte", "real", "logic", "input", "output", "inout", "ref",
	\ "constraint", "rand", "randc", "covergroup", "coverpoint", "assert", "cover", "property", "task", "endtask", "write", "`ifdef",
	\ "`ifndef", "`elsif", "`endif", "find_index_with", "find_first_with", "struct", "automatic",
        \ ]

    let l:matches = map(l:svwords,'{"word":v:val,"dup":1,"icase":1,"menu": "[systemverilog]"}')
    call asyncomplete#complete(a:opt['name'], a:ctx, l:startcol, l:matches)
endfunction
