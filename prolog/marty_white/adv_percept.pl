/*
%  NomicMUD: A MUD server written in Prolog
%  Maintainer: Douglas Miles
%  Dec 13, 2035
%
%  Bits and pieces:
%
%    LogicMOO, Inform7, FROLOG, Guncho, PrologMUD and Marty's Prolog Adventure Prototype
% 
%  Copyright (C) 2004 Marty White under the GNU GPL 
%  Sept 20,1999 - Douglas Miles
%  July 10,1996 - John Eikenberry 
%
%  Logicmoo Project changes:
%
% Main file.
%
*/

%:- nop(ensure_loaded('adv_chat80')).
%:- ensure_loaded(adv_main).

stores_props(perceptq(Agent, PropList), Agent, PropList).
stores_props(memories(Agent, PropList), Agent, PropList).
stores_props(props(Object, PropList), Object, PropList).


is_prop_public(_):-!.
is_prop_public(P) :-
  member(P, [has_rel(_Spatial, _), emitting(_Light), can_be(Spatial, eat, _), name(_), desc(_), fragile(_),
             can_be(Spatial, move, _), can_be(Spatial, open, _), state(Spatial, open, _), can_be(Spatial, lock, t), state(Spatial, locked, _),
             inherit(shiny)]).

has_sensory(Spatial, Sense, Agent, State) :-
  sensory_model_problem_solution(Sense, Spatial, TooDark, EmittingLight),
  get_open_traverse(_Open, Sense, _Traverse, Spatial, OpenTraverse),
  related(Spatial, OpenTraverse, Agent, Here, State),
  getprop(Here, TooDark, State) , 
  \+ related_with_prop(Spatial, OpenTraverse, _Obj, Here, EmittingLight, State), !, fail.
has_sensory(_Spatial, _Sense, _Agent, _State) .


can_sense(_Spatial, _See, Star, _Agent, _State) :- Star == '*', !.
can_sense(Spatial, Sense, Thing, Agent, State) :-
  get_open_traverse(_Open, Sense, _Traverse, Spatial, OpenTraverse),
  has_sensory(Spatial, Sense, Agent, State),
  related(Spatial, OpenTraverse, Agent, Here, State),
  (Thing=Here; related(Spatial, OpenTraverse, Thing, Here, State)).
can_sense(Spatial, Sense, Thing, Agent, _State):- dbug(pretending_can_sense(Spatial, Sense, Thing, Agent)).


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  CODE FILE SECTION
:- nop(ensure_loaded('adv_events')).
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Manipulate one agents percepts
queue_percept(Agent, Event, S0, S2) :-
  dmust((select(perceptq(Agent, Queue), S0, S1),
  append(Queue, [Event], NewQueue),
  append([perceptq(Agent, NewQueue)], S1, S2))).

queue_event(Event, S0, S2) :-
  each_sensing_agent(_All, queue_percept(Event), S0, S2).


% Room-level simulation percepts
queue_local_percept(Spatial, Agent, Event, Places, S0, S1) :-
  member(Where, Places),
  current_spatial(Spatial),
  get_open_traverse(look, Spatial, OpenTraverse),
  related(Spatial, OpenTraverse, Agent, Where, S0),
  queue_percept(Agent, Event, S0, S1).
queue_local_percept(_Spatial, _Agent, _Event, _Places, S0, S0).

/*
queue_local_event(Spatial, Event, Places, S0, S2) :-
  current_player(Player),
  queue_local_percept(Spatial, Player, Event, Places, S0, S1),
  queue_local_percept(Spatial, floyd , Event, Places, S1, S2).
*/

queue_local_event(Spatial, Event, Places, S0, S2) :-   
  each_sensing_agent(_All, queue_local_percept(Spatial, Event, Places), S0, S2).



/*

sensory_model(olfactory, spatial).
sensory_model(taste, spatial).
sensory_model(tactile, spatial).

sensory_model(sixth, _).
*/


current_spatial(spatial).


is_sense(X):- sensory_model(X, _).

sensory_model(see, spatial).
sensory_model(hear, spatial).
sensory_model(taste, spatial).
sensory_model(smell, spatial).
sensory_model(feel, spatial).

action_model(_, spatial).

sensory_verb(see, look).
sensory_verb(hear, listen).
sensory_verb(taste, taste).
sensory_verb(smell, smell).
sensory_verb(feel, touch).


action_sensory(Action, Sense):-
  compound(Action),
  Action=..[_Verb, Sensory|_],
  is_sense(Sensory), !,
  Sense=Sensory.
action_sensory(Action, Sense):-
  compound(Action),
  Action=..[Verb|_],
  verb_sensory(Verb, Sense).
action_sensory(Action, Sense):- verb_sensory(Action, Sense) *-> true; Sense=see.


  % sensory_model(Spatial1, Spatial2):- Spatial1 == Spatial2, !.

% listen->hear
verb_sensory(goto, Sense):- is_sense(Sense).
verb_sensory(examine, Sense):- is_sense(Sense).
verb_sensory(wait, Sense):- is_sense(Sense).
verb_sensory(print_, Sense):- is_sense(Sense).
verb_sensory(Verb, Sense):- sensory_verb(Sense, Verb).
verb_sensory(look, see).
verb_sensory(say, hear).
verb_sensory(eat, taste).
verb_sensory(feel, touch).
verb_sensory(goto, see).
verb_sensory(Verb, Sense):- nonvar(Verb), is_sense(Verb), Sense=Verb.
verb_sensory(Verb, Sense):- subsetof(Verb, Verb2), Verb\=Verb2,
  verb_sensory(Verb2, Sense), \+ is_sense(Verb).
verb_sensory(Verb, Sense):- verb_alias(Verb, Verb2), Verb\=Verb2,
  verb_sensory(Verb2, Sense), \+ is_sense(Verb).



% sensory_model(Visual, Spatial, TooDark, EmittingLight))
sensory_model_problem_solution(Sense, Spatial, state(Spatial, Dark, t), emitting(Light)):-
   problem_solution(Dark, Sense, Light), sensory_model(Sense, Spatial).

problem_solution(dark, see, light).
problem_solution(stinky, smell, pure).
problem_solution(noisy, hear, quiet).



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  CODE FILE SECTION
:- nop(ensure_loaded('adv_agent_percepts')).
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Autonomous logical percept processing.
process_percept_auto(Agent, [Same|_], _Stamp, Mem0, Mem0) :- was_own_self(Agent, Same).
process_percept_auto(Agent, emote(_Spatial, _Say, Speaker, Agent, Words), _Stamp, Mem0, Mem1) :-
  consider_text(Speaker, Agent, Words, Mem0, Mem1).
process_percept_auto(Agent, emote(_Spatial, _Say, Speaker, (*), WordsIn), _Stamp, Mem0, Mem1) :-
  addressing_whom(WordsIn, Whom, Words),
  Whom == Agent,
  consider_text(Speaker, Agent, Words, Mem0, Mem1).
process_percept_auto(Agent, Percept, _Stamp, Mem0, Mem0) :-
  Percept =.. [Functor|_],
  member(Functor, [talk, say]),
  bugout('~w: Ignoring ~p~n', [Agent, Percept], autonomous).
process_percept_auto(Agent, see_props(Object, PropList), _Stamp, Mem0, Mem2) :-
  bugout('~w: ~p~n', [Agent, see_props(Object, PropList)], autonomous),
  member(shiny, PropList),
  member(model(Spatial, ModelData), Mem0),
  \+ related(Spatial, descended, Object, Agent, ModelData), % Not holding it?
  add_todo_all([take(Spatial, Object), print_('My shiny precious!')], Mem0, Mem2).

process_percept_auto(_Agent,
    sense(Sense, [you_are(Spatial, _How, _Here), exits_are(_Exits), here_are(Objects)]),
    _Stamp, Mem0, Mem2) :-
  member(model(Spatial, ModelData), Mem0),
  findall(examine(Sense, Obj),
          ( member(Obj, Objects),
            \+ member(props(Obj, _, _), ModelData)),
          ExamineNewObjects),
  add_todo_all(ExamineNewObjects, Mem0, Mem2).
process_percept_auto(_Agent, _Percept, _Stamp, Mem0, Mem0).


%was_own_self(Agent, say(Agent, _)).
was_own_self(Agent, emote(_Spatial, _, Agent, _, _)).

% Ignore own speech.
% process_percept_player(Agent, [Same|_], _Stamp, Mem0, Mem0) :- was_own_self(Agent, Same).
process_percept_player(Agent, Percept, _Stamp, Mem0, Mem0) :-
  percept2txt(Agent, Percept, Text),
  player_format('~N~w~n', [Text]),!,
  redraw_prompt(Agent).
process_percept_player(Agent, Percept, _Stamp, Mem0, Mem0) :-
  player_format('~N~w~n', [Agent:Percept]),
  redraw_prompt(Agent).


process_percept(Agent, Percept, Stamp, Mem0, Mem1) :-
 once(( (thought(inherit(console), Mem0);thought(inherit(player), Mem0);thought(inherit(telnet), Mem0)),
  process_percept_player(Agent, Percept, Stamp, Mem0, Mem1))),
  \+ thought(inherit(autonomous), Mem1),!.
  
process_percept(Agent, [LogicalPercept|IgnoredList], Stamp, Mem0, Mem1) :-
  thought(inherit(autonomous), Mem0),
  ignore(((IgnoredList\==[], dmsg(ignored_process_percept_auto(Agent,IgnoredList))))),
  process_percept_auto(Agent, LogicalPercept, Stamp, Mem0, Mem1).

process_percept(Agent, Percept, Stamp, Mem0, Mem0):- 
  bugout('~q FAILED!~n', [process_percept(Agent, Percept, Stamp)], general), !.

process_percept_main(Agent, Percept, Stamp, Mem0, Mem3) :-
  forget(model(Spatial, Model0), Mem0, Mem1),
  Percept = [LogicalPercept|IgnoredList],
  nop(ignore(((IgnoredList\==[], dmsg(ignored_model_update(Agent,IgnoredList)))))),
  update_model(Spatial, Agent, LogicalPercept, Stamp, Mem1, Model0, Model1),
  memorize(model(Spatial, Model1), Mem1, Mem2),
  process_percept(Agent, Percept, Stamp, Mem2, Mem3).
process_percept_main(_Agent, Percept, _Stamp, Mem0, Mem0) :-
  bugout('process_percept_main(~w) FAILED!~n', [Percept], general), !.



process_percept_list(_Agent, [], _Stamp, Mem0, Mem0).
% caller memorizes PerceptList
process_percept_list(_Agent, _, _Stamp, Mem, Mem) :-
  thought(inherit(no_perceptq), Mem),
  !.
process_percept_list(Agent, [Percept|Tail], Stamp, Mem0, Mem4) :-
  %bugout('process_percept_list([~w|_])~n', [Percept], autonomous),
  %!,
  process_percept_main(Agent, Percept, Stamp, Mem0, Mem1),
  process_percept_list(Agent, Tail, Stamp, Mem1, Mem4).
process_percept_list(Agent, List, Stamp, Mem0, Mem0) :-
  bugout('process_percept_list FAILED!~n'(Agent, List, Stamp), general).



