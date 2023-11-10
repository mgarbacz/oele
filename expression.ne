Main  -> _ EXP _ {% function(d) { return { type:'main', d:d, v:d[1].v } } %}

AND   -> "AND"
OR    -> "OR"
ISEQ  -> "=="
NOTEQ -> "!="

EXP -> "(" _ EXP _ ")" {% function(d) { return { type:'P', d:d, v:d[2].v} } %}
  | X_NOTEQ_Y
  | X_ISEQ_Y
  | X_OR_Y
  | X_AND_Y
  | ATOM
  
X_AND_Y   -> EXP _ AND   _ EXP {% function(d) { return { type:'AND',   d:d, v:d[0].v && d[4].v } } %}
X_OR_Y    -> EXP _ OR    _ EXP {% function(d) { return { type:'OR',    d:d, v:d[0].v || d[4].v } } %}
X_ISEQ_Y  -> EXP _ ISEQ  _ EXP {% function(d) { return { type:'ISEQ',  d:d, v:d[0].v == d[4].v } } %}
X_NOTEQ_Y -> EXP _ NOTEQ _ EXP {% function(d) { return { type:'NOTEQ', d:d, v:d[0].v != d[4].v } } %}

ATOM -> TEXT      {% function(d) { return { v:d[0] } } %}
TEXT -> WORD      {% id %}
  | WORD _ WORD   {% function(d) { return { v:d[0].v + ' ' + d[2].v } } %}
WORD -> [a-zA-Z]  {% id %}
  | WORD [a-zA-Z] {% function(d) { return { v:d[0].v + d[1].v } } %}


# Whitespace. The important thing here is that the postprocessor
# is a null-returning function. This is a memory efficiency trick.
_ -> [\s]:*      {% function(d) { return null } %}