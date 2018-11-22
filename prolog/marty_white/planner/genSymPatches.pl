?-use_module(library(lists)).
?-prolog_flag(single_var_warnings,_,off).



/* Emulates the gensym(2) function */

gensym(A,B) :- get_num(A,Num),
	name(A,Name1),
	name(Num, Name2),
	append(Name1,Name2,Name),
	name(B,Name).

/* Emulates the init_gensym(1) function */

init_gensym(A) :- asserta(current_num(A,0)).

/* get_num(2) */

get_num(A,Num) :- 
	retract(current_num(A,Num1)), !,
	writeln(Num1),
	Num is Num1+1,
	asserta(current_num(A,Num)).

get_num(A,1) :- asserta(current_num(A,1)).

/* Emulates the writenl(1) function */


 
writeNoln(A) :- trace(on,1),!, write(A).
writeNoln(A) :- trace(off,1),!.


writeln(A) :- trace(on,1),!,write(A),nl.
writeln(A) :- trace(off,1),!.
	
forall(P,Q) :- \+ (P, \+Q).
