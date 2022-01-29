local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
	return
end

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
	return args[1]
end

ls.snippets = {
	cpp = {
		s("main", {
			t("int main() {"),
            t({ "", "\tcin.tie(nullptr);", "\tcin.sync_with_stdio(false);", ""}),
			t({ "", "\t" }),
			i(0),
			t({ "", "\treturn 0;" }),
			t({ "", "}" }),
		}),
		s("std", {
			t({ "#include<bits/stdc++.h>", "", "using namespace std;", "", "typedef long long ll;", "", "" }),
			i(0),
		}),
        s("nl", {
            t("<< '\\n'"),
            i(0)
        }),
        s("vi", {
            t({ "vector<int> " }),
            i(0),
            t(";")
        }),
        s("fora", {
            t("for(auto "),
            i(1),
            t(": "),
            i(2),
            t({ ") {", "\t" }),
            i(3),
            t({ "", "}" })
        })
	},
}
