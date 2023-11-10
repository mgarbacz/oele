@{%
	const moo = require("moo");
	const lexer = moo.compile({
		ws: /[ \t]+/,
		comparison: /!=|==|>|<|>=|<=/,
		expression: /AND|OR/,
		value: /'[^']*'|\d+/,
		variable: /[\w(?:\.\w)*]+/
	});
%}

@lexer lexer

main -> 
    condition _ exp _ condition {% function(d) { return { ...d } } %}
  | condition {% id %}

condition -> %variable %ws %comparison %ws %value {% function(d) { return { d } } %}

exp -> 
	AND {% function(d) { return { d:d[0] } } %}
  | OR  {% function(d) { return { d:d[0] } } %}

AND -> "AND"
OR  -> "OR"

# Whitespace. The important thing here is that the postprocessor
# is a null-returning function. This is a memory efficiency trick.
_ -> [\s]:* {% function(d) { return null } %}