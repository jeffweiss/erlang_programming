-module (sort).
-export ([quick/1, merge/1]).

quick([]) ->
	[];
quick([Pivot|[]]) ->
	[Pivot];
quick([Pivot|Tail]) ->
	{Below, Above} = lists:partition(fun(A) -> A < Pivot end, Tail),
	lists:append(quick(Below),[Pivot|quick(Above)]).
	
merge([]) -> [];
merge([H|[]]) -> [H];
merge(List) ->
	Len = length(List),
	Half = Len div 2,
	Left = lists:sublist(List,Half),
	Right = lists:sublist(List,Half+1, Len), % it's fine that Half + 1 + Len is greater than total length
	merge(merge(Left),merge(Right)).
merge([], Right) ->
	merge(Right);
merge(Left, []) ->
	merge(Left);
merge([LHead|LTail],[RHead|RTail]) when LHead < RHead ->
	[LHead | merge(LTail, [RHead|RTail])];
merge([LHead|LTail],[RHead|RTail]) ->
	[RHead | merge([LHead|LTail], RTail)].
