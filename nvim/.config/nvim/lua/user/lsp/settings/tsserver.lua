return {
  init_options = {
    preferences = {
      -- Turns of code action suggestions so that I don't see the "convert to import" action all over the place
      disableSuggestions = true,
    },
  },
}

-- The above comes from: https://stackoverflow.com/questions/49582984/how-do-i-disable-js-file-is-a-commonjs-module-it-may-be-converted-to-an-es6
-- There is a suggestion to use nvim-lsp-ts-utils to be more specific about which code actions to filter out:
-- 
-- Try in the future:
-- require('lspconfig').tsserver.setup({
--     on_attach = function(client, bufnr)
--         require('nvim-lsp-ts-utils').setup({
--             filter_out_diagnostics_by_code = { 80001 },
--         })
--         require('nvim-lsp-ts-utils').setup_client(client)
--     end,
-- })
