Definitions.

D = [0-9]

Rules.

 {D}+ : {token,{integer,TokenLine,list_to_integer(TokenChars)}}.