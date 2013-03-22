-module (expr).
-compile(export_all).

%%%
% Grammar
% 
% BinaryOp : +
%          | -
%          | *
%
% UnaryOp : ~
%
% Expression : Number
%            | "(" Expression BinaryOp Expression ")"
%            | UnaryOp Expression
%
%%%

lex(Expression) ->
	Expression.
	
lex_binary(Op, Expr1, Expr2) ->
	Tag = case Op of
		"+" -> plus;
		"-" -> minus;
		"*" -> mult
	end,
	{Tag, lex(Expr1), lex(Expr2)}.

	