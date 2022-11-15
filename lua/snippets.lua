local luasnip = require("luasnip")

local M = {}

M.setup = function ()
  local snippet = luasnip.snippet
  local text = luasnip.text_node
  local insert = luasnip.insert_node

  local snippets = {
    --[[
    if ($1) {
      $2
    }
    --]]
    snippet("if", {
      text("if ("),
      insert(1),
      text({") {", "\t"}),
      insert(2),
      text({"", "}"}),
    }),
    --[[
    function $1($2)$3 {
      $4
    }
    ]]--
    snippet("fn", {
      text("function "),
      insert(1),
      text("("),
      insert(2),
      text(")"),
      insert(3),
      text({" {", "\t"}),
      insert(4),
      text({"", "}"})
    }),
    --[[
    const $1 = ($2)$3 => {
      $4
    }
    ]]--
    snippet("afn", {
      text("const "),
      insert(1),
      text(" = ("),
      insert(2),
      text(")"),
      insert(3),
      text({" => {", "\t"}),
      insert(4),
      text({"", "}"})
    })
  }

  luasnip.add_snippets("typescript", snippets)
  luasnip.add_snippets("typescriptreact", snippets)
end

return M

