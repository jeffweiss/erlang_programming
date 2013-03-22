Nonterminals E.
Terminals '+' '*' '(' ')' number.
Rootsymbol E.
Left 100 '+'.
Left 200 '*'.
E -> E '+' E: {plus, '$1', '$3'}.
E -> E '*' E: {times, '$1', '$3'}.
E -> '(' E ')': '$2'.
E -> number : '$1'.
