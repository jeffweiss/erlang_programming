-module (sum).
-export ([sum/1, sum/2]).

sum(0) -> 0;
sum(N) ->
	sum(1, N).

sum(N, M) when N > M ->
	exit("sum/2 arguments not in numerical order");
sum(N, N) ->
	N;
sum(N, M) ->
	N + sum(N+1, M).