local schemas = {
  ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
}
local opts = {
  settings = {
    yaml = {
      schemas = schemas,
    },
  },
}

return opts
