
-module(r3t).
-export([o/0]).

-compile([export_all]).

o() ->
    io:format("erl_opts: ~p~n", [opts()]).

opts() ->
    opts(proplists:get_value(options, module_info(compile)), []).

opts([Opt | Opts], Result) when is_atom(Opt) ->
    opts(Opts, [Opt | Result]);
opts([{d, _} = Opt | Opts], Result) ->
    opts(Opts, [Opt | Result]);
opts([{d, _, _} = Opt | Opts], Result) ->
    opts(Opts, [Opt | Result]);
opts([_ | Opts], Result) ->
    opts(Opts, Result);
opts([], Result) ->
    lists:reverse(Result).

