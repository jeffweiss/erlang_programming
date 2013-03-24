-module (echo).
-export ([start/0, print/1, stop/0, server/0]).

start() ->
	register(echo, spawn(echo, server, [])).
	
print(Term) ->
	echo ! {self(), {message, Term}},
	receive
		{response, Msg} ->
			io:format("~w~n", [Msg]);
		_Other ->
			{error, unknown_message}
	end.
	
stop() ->
	echo ! {self(), stop}.
	
server() ->
	receive
		{Pid, {message, Msg}} ->
			Pid ! {response, Msg},
			server();
		{Pid, stop} ->
			Pid ! ok
	end.