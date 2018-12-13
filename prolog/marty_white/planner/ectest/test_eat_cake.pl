
:- include(abdemo_test).

/*
   Test queries:

*/

end_of_file.

do_test(num_cakes(0)).
do_test(num_cakes(1)).

do_test(G) :- G= neg(num_cakes(0)), solve_goal(G,R).
do_test(G) :- G= neg(num_cakes(1)), solve_goal(G,R).

do_test(G) :- G= eat_cakes(0), solve_goal(G,R).
do_test(G) :- G= eat_cakes(1), solve_goal(G,R).

%do_test(G) :- G= [happens(eat_cakes(1),now),holds_at(eat_cakes(0),now)], fail_solve_goal(G,R).
%do_test(G) :- G= [happens(eat_cakes(1),now),holds_at(eat_cakes(1),now)], solve_goal(G,R).

do_test(G) :- G= {eat_cakes(1),num_cakes(0)}, solve_goal(G,R).

do_test(G) :- G= {happens(eat_cakes(1),now),holds_at(num_cakes(1),start)}, solve_goal(G,R).

do_test(G) :- G= {happens(eat_cakes(1),now),holds_at(num_cakes(1),now-1)}, solve_goal(G,R).

do_test(G) :- G= {happens(eat_cakes(1),now),holds_at(num_cakes(1),aft)}, solve_goal(G,R).



axiom(initially(num_cakes(1))).

axiom(initiates(eat_cakes(1),num_cakes(0),T), [holds_at(num_cakes(1),T)]).
axiom(terminates(eat_cakes(1),num_cakes(1),T), [holds_at(num_cakes(1),T)]).
%axiom(initiates(eat_cakes(0),num_cakes(0),T), [holds_at(num_cakes(0),T)]).
%axiom(initiates(eat_cakes(0),num_cakes(1),T), [holds_at(num_cakes(1),T)]).

axiom(initiates(imagine_initiates(Holds),Holds,T), [holds_at(neg(Holds),T),holds_at(hypothesizing(Holds),T)]):- fail.
axiom(terminates(imagine_terminates(Holds),Holds,T), [holds_at(Holds,T),holds_at(hypothesizing(Holds),T)]):- fail.


/*
*/
%axiom(initiates(immagine_initiates(Holds),Holds,T), [holds_at(neg(Holds),T)]).
%axiom(terminates(immagine_terminates(Holds),Holds,T), [holds_at(Holds,T)]).
%axiom(releases(immagine_releases(Holds),Holds,T), [holds_at(Holds,T)]).

axiom(holds_at(num_cakes(0),T),
     [holds_at(neg(num_cakes(1)),T)]).

axiom(holds_at(neg(num_cakes(0)),T),
     [holds_at(num_cakes(1),T)]).

axiom(holds_at(num_cakes(1),T),
     [holds_at(neg(num_cakes(0)),T)]).

% Why causes loops?
axiom(holds_at(neg(num_cakes(1)),T),
     [holds_at(num_cakes(0),T)]):- fail.

/* Abduction policy */

abducible(dummy).

%executable(imagine_terminates(_)).
%executable(imagine_initiates(_)).
%executable(make_cake(_)).
executable(eat_cakes(_)).
%executable(ignore_cakes(_)).

