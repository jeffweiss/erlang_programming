-module (sort).
-export ([quick/1, merge/1]).

quick([]) ->
	[];
quick([Pivot|[]]) ->
	[Pivot];
quick([Pivot|Tail]) ->
	{Below, Above} = lists:partition(fun(A) -> A < Pivot end, Tail),
	lists:append(quick(Below),[Pivot|quick(Above)]).
	
merge(List) ->
	List.