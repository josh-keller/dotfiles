-- local schemas = {
--   ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
-- }
local opts = {
  settings = {
    yaml = {
      keyOrdering = false,
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
      customTags = {
        "!Cidr",
        "!Cidr sequence",
        "!And",
        "!And sequence",
        "!If",
        "!If sequence",
        "!Not",
        "!Not sequence",
        "!Equals",
        "!Equals sequence",
        "!Or",
        "!Or sequence",
        "!FindInMap",
        "!FindInMap sequence",
        "!Base64",
        "!Join",
        "!Join sequence",
        "!Ref",
        "!Sub",
        "!Sub sequence",
        "!GetAtt",
        "!GetAZs",
        "!ImportValue",
        "!ImportValue sequence",
        "!Select",
        "!Select sequence",
        "!Split",
        "!Split sequence",      -- schemas = schemas,
      },
    },
  }
}

print("Returning Yamlls")
return opts
