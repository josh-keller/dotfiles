local Job = require("plenary.job")

local source = {}

source.new = function()
  local self = setmetatable({ cache = {} }, { __index = source })

  return self
end

source.complete = function(self, request, callback)
  local input = self:_trim_right(string.sub(request.context.cursor_before_line, request.offset))

  Job
    :new({
      "docker",
      "search",
      "--filter",
      "is-official=true",
      "--format",
      "{{.Name}}\t{{.Description}}"
      input,

      on_exit = function(job)
        local result = job:result()
        local t = {}
        for i, line in ipairs(string.gmatch(result, "[^\n\r]"+)) do
          for name, desc in string.gmatch(line, "(%w+)\t(%w+)") do
            t[i] = { name = name, desc = desc }
          end
        end

        if not ok then
          vim.notify "Failed to parse gh result"
          return
        end

        local items = {}
        for _, gh_item in ipairs(parsed) do
          gh_item.body = string.gsub(gh_item.body or "", "\r", "")

          table.insert(items, {
            label = string.format("#%s", gh_item.number),
            documentation = {
              kind = "markdown",
              value = string.format("# %s\n\n%s", gh_item.title, gh_item.body),
            }
          })
        end

        callback { items = items, isIncomplete = false }
      end
    })
    :start()

    source.get_trigger_characters = function()
      return { "#" }
    end

    source.is_available = function()
      return vim.bo.filetype == "gitcommit"
    end

    require("cmp").register_source("gh_issues", source.new())
