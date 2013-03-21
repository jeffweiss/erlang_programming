-module (manip).
-export ([filter/2, reverse/1, concatenate/1, flatten/1]).

filter([], _Max) ->
	[];
filter([X|Tail], Max) when X =< Max ->
	[X|filter(Tail, Max)];
filter([_|Tail], Max) ->
	filter(Tail, Max).
	
reverse(List) ->
	reverse(List, []).
reverse([H|T], Acc) ->
	reverse(T, [H|Acc]);
reverse([], Acc) ->
	Acc.
	
concatenate(List) ->
	concatenate([], List).
concatenate(Result, []) ->
	Result;
concatenate(Result, [H|T]) ->
	concatenate(lists:append(Result, H), T).

flatten(List) ->
	flatten([], List).
flatten(Result, []) ->
	Result;
flatten(Result, [H|T]) when is_list(H) ->
	flatten(concatenate([Result, flatten(H)]), T);
flatten(Result, [H|T]) ->
	flatten(concatenate([Result, [H]]), T).
	