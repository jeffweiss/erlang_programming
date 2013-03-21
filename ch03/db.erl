-module (db).
-export ([new/0,destroy/1,write/3,delete/2,read/2,match/2]).

new() -> [].

destroy(_Db) -> ok.

write(Key, Value, []) ->
	[{Key, Value}];
write(Key, Value, [{Key,_}|Tail]) ->
	[{Key, Value}|Tail];
write(Key, Value, [Tuple|Tail]) ->
	[Tuple|write(Key, Value, Tail)].
	
delete(_Key, []) -> [];
delete(Key, [{Key,_}|Tail]) ->
	Tail;
delete(Key, [Tuple|Tail]) ->
	[Tuple|delete(Key,Tail)].

read(_Key, []) ->
	{error, instance};
read(Key, [{Key,Value}|_]) ->
	{ok, Value};
read(Key, [_|Tail]) ->
	read(Key, Tail).

match(_Value, []) ->
	[];
match(Value, [{Key, Value}|Tail]) ->
	[Key|match(Value,Tail)];
match(Value, [_|Tail]) ->
	match(Value,Tail).