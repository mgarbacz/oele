@{%
	const moo = require("moo");
	const lexer = moo.compile({
		ws: /[ \t]+/,
		variable: /[\w(?:\.\w)*]+/,
		comparison: /!=|==|>|<|>=|<=/,
		value: /'[^']*'|\d+/
	});
%}

@lexer lexer

main -> condition {% id %}

condition -> %variable %ws %comparison %ws %value {% function(d) { return { d } } %}

exp -> 
	AND {% function(d) { return { v:d[0][0] } } %}
  | OR  {% function(d) { return { v:d[0][0] } } %}

AND -> "AND"
OR  -> "OR"

# Whitespace. The important thing here is that the postprocessor
# is a null-returning function. This is a memory efficiency trick.
_ -> [\s]:* {% function(d) { return null } %}
