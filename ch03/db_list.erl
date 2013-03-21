-module (db_list).
-export ([new/0,destroy/1,write/3,delete/2,read/2,match/2]).

new() -> [].

destroy(_Db) -> ok.

write(Key, Value, Db) ->
	lists:keystore(Key, 1, Db, {Key, Value}).
	
delete(Key, Db) ->
	lists:keydelete(Key, 1, Db).

read(Key, Db) ->
	Result = lists:keyfind(Key, 1, Db),
	case Result of
		false -> {error, instance};
		{Key, Value} -> {ok, Value}
	end.

match(_Value, []) ->
	[];
match(Value, [{Key, Value}|Tail]) ->
	[Key|match(Value,Tail)];
match(Value, [_|Tail]) ->
	match(Value,Tail).