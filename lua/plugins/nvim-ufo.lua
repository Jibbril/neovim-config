require('ufo').setup({
    -- Time in millisecond between the range to be highlgihted and to be cleared
    -- while opening the folded line, `0` value will disable the highlight,
    open_fold_hl_timeout = 150,
    provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
    end
})
