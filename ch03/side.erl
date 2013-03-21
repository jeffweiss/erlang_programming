-module (side).
-export ([print/1,evens/1]).

print(0) -> ok;
print(N) ->
	print(N-1),
	io:format("Number:~p~n", [N]).
	
evens(0) -> ok;
evens(N) when N rem 2 == 0 ->
	evens(N-1),
	io:format("Number:~p~n", [N]);
evens(N) ->
	evens(N-1).	