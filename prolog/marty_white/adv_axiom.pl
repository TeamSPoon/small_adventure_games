
:- discontiguous aXiom//2.

aXiom(doing, wait(Agent)) -->
 queue_agent_percept(Agent, [time_passes(Agent)]).

aXiom(doing, Action, _State, _S_):- notrace(( \+ trival_act(Action),bugout(aXiom(doing, Action)))),fail.

aXiom(doing, talk(Agent, Object, Message)) -->  % directed message
  can_sense(Agent, audio, Object),
  from_loc(Agent, Here),
  queue_local_event([talk(Agent, Here, Object, Message)], [Here]).

aXiom(doing, say(Agent, Message)) -->          % undirected message
  from_loc(Agent, Here),                              
  queue_local_event([say(Agent, Here, Message)], [Here]).

/*
aXiom(doing, emote(Agent, EmoteType, Object, Message)) --> !, % directed message
 dmust((
 action_sensory(EmoteType, Sense),
 can_sense(Agent, Sense, Object),
 % get_open_traverse(EmoteType, Sense), h(Sense, Agent, Here), 
 queue_local_event([emoted(Agent, EmoteType, Object, Message)], [Here,Object]))).

*/

aXiom(doing, print_(Agent, Msg)) -->
  h(descended, Agent, Here),
  queue_local_event(msg_from(Agent, Msg), [Here]).


% ==============
%  WALK WEST
% ==============
aXiom(_, status_msg(_Begin,_End)) --> [].

aXiom(doing, goto_dir(Agent, Walk, ExitName)) -->         % go n/s/e/w/u/d/in/out  
  must_act(status_msg(vBegin,goto_dir(Agent, Walk, ExitName))),
  dmust(from_loc(Agent, Here)),
  dmust(h(exit(ExitName), Here, _There)),
  %unless(h(exit(ExitName), Here, There), failure_msg(['Can\'t go ',ExitName,' way from', Here])),
  aXiom(doing, leaving(Agent, Here, Walk, ExitName)),
  must_act(status_msg(vDone,goto_dir(Agent, Walk, ExitName))).

aXiom(_, leaving(Agent, Here, Walk, ExitName)) -->
  %member(At, [*, to, at, through, thru]),
  h(exit(ExitName), Here, There),
  aXiom(_, terminates(h(_, Agent, Here))),
  queue_local_event( leaving(Agent, Here, Walk, ExitName), [Here]),
   % queue_local_event( msg([cap(subj(Agent)), leaves, Here, ing(Walk), to, the, ExitName]), [Here]).
  dmust(aXiom(doing, arriving(Agent, There, Walk, reverse(ExitName)))).

aXiom(_, terminates(h(Prep, Object, Here))) -->
 %ignore(sg(declared(h(Prep, Object, Here)))),
 undeclare(h(Prep, Object, Here)).

aXiom(_, arriving(Agent, Here, Walk, ReverseDir)) -->
  queue_local_event( arriving(Agent, Here, Walk, ReverseDir), [Here]),
  %sg(default_rel(PrepIn, Here)), {atom(PrepIn)},
  {PrepIn = in},
  % [cap(subj(Agent)), arrives, PrepIn, Here, ing(Walk), from, the, ReverseDir] 
  dmust(aXiom(_, initiates(h(PrepIn, Agent, Here)))),
  dmust(add_look(Agent)).

aXiom(_, initiates(h(Prep, Object, Dest))) -->
 declare(h(Prep, Object, Dest)).




% ==============
%  WALK TABLE
% ==============
aXiom(doing, goto_obj(Agent, Walk, Object)) --> 
  has_rel(At, Object), 
  aXiom(doing, goto_prep_obj(Agent, Walk, At, Object)).


% ==============
%  WALK ON TABLE
% ==============
aXiom(doing, goto_prep_obj(Agent, Walk, At, Object)) --> 
  touchable(Agent, Object),
  has_rel(At, Object),               
  from_loc(Agent, Here), 
  open_traverse(Object, Here),
  \+ is_status(Object, open, f), 
  aXiom(doing, entering(Agent, Here, Walk, At, Object)).

aXiom(doing, entering(Agent, Walk, Here, At, Object)) -->
  moveto(Agent, At, Object, [Here],
    [subj(Agent), person(Walk, es(Walk)), At, the, Object, .]),
  add_look(Agent).

% ==============
%  GOTO PANTRY
% ==============
aXiom(doing, goto_loc(Agent, _Walk, There)) -->           % go some room
  has_rel(exit(_), There),
  aXiom(doing, make_true(Agent, h(in, Agent, There))).

aXiom(doing, make_true(Doer, h(in, Agent, There))) -->           % go in (adjacent) room
  {Doer==Agent},
  has_rel(exit(_), There),
  from_loc(Agent, Here),
  getprop(Agent, memories(Memory)), 
  agent_thought_model(Agent, ModelData, Memory),
  find_path(Here, There, Route, ModelData), !,
  aXiom(doing, follow_plan(Agent, goto_loc(Agent, walk, There), Route)).

aXiom(doing, follow_plan(Agent, Name, [Step|Route])) -->
  aXiom(doing, follow_step(Agent, Name, Step)),
  aXiom(doing, follow_plan(Agent, Name, Route)).

aXiom(doing, follow_step(Agent, Name, Step)) -->
  dbug(follow_step(Agent, Name, Step)),
  must_act(Step).


%  sim(verb(args...), preconds, effects)
%    Agent is substituted for Agent.
%    preconds are in the implied context of a State.
%  In Inform, the following are implied context:
%    actor, action, noun, second
%  Need:
%    actor/agent, verb/action, direct-object/obj1, indirect-object/obj2,
%      preposition-introducing-obj2
%sim(put(Obj1, Obj2),
%    (  h(descended, Thing, Agent),
%      can_sense(Agent, Sense, Agent, Where),
%      has_rel(Relation, Where),
%      h(descended, Agent, Here)),
%    moveto(Thing, Relation, Where, [Here],
%      [cap(subj(Agent)), person('put the', 'puts a'),
%        Thing, Relation, the, Where, '.'])).
aXiom(doing, does_put(Agent, Put, Thing1, At, Thing2)) --> 
  from_loc(Agent, Here),
  % moveto(Thing1, held_by, Recipient, [Here], [cap(subj(Agent)), person([give, Recipient, the], 'gives you a'), Thing, '.'],
  moveto(Thing1, At, Thing2, [Here], 
    [cap(subj(Agent)), person(Put, es(Put)), Thing1, At, Thing2, '.']).
  
aXiom(doing, take(Agent, Thing)) -->
  % [silent(subj(Agent)), person('Taken.', [cap(Doer), 'grabs the', Thing, '.'])]
  required(touchable(Agent, Thing)),
  aXiom(doing, does_put(Agent, take, Thing, held_by, Agent)).

aXiom(doing, drop(Agent, Thing)) -->
  touchable(Agent, Thing), 
  h(At, Agent, Here),
  % has_rel(At, Here),
  aXiom(doing, does_put(Agent, drop, Thing, At, Here)).

aXiom(doing, put(Agent, Thing1, Relation, Thing2)) -->
  has_rel(Relation, Thing2),
  (Relation \= in ; \+ is_closed(Thing2)),
  touchable(Agent, Thing2), % what if "under" an "untouchable" thing?
  % OK, put it
  must_act( does_put(Agent, put, Thing1, Relation, Thing2)).

aXiom(doing, give(Agent, Thing, Recipient)) -->
  has_rel(held_by, Recipient),
  touchable(Agent, Thing),
  touchable(Recipient, Agent),
  % OK, give it
  must_act( does_put(Agent, give, Thing, held_by, Recipient)).

% throw ball up
aXiom(doing, throw_dir(Agent, Thing, ExitName)) --> 
  h(AtHere, Agent, Here),
  (h(exit(ExitName), Here, There) -> has_rel(AtThere, There) ; (AtHere = AtThere, Here = There)),
  aXiom(doing, throwing(Agent, Thing, AtThere, There)).

% throw ball at catcher
aXiom(doing, throw_at(Agent, Thing, Target)) -->
  % h(At, Agent, Here),
  has_rel(AtTarget, Target),
  aXiom(doing, throwing(Agent, Thing, AtTarget, Target)).

% throw ball over homeplate
aXiom(doing, throw_prep_obj(Agent, Thing, ONTO, Target)) -->
  has_rel(ONTO, Target),
  %h(At, Agent, Here),
  aXiom(doing, throwing(Agent, Thing, ONTO, Target)).

% is throwing the ball...
aXiom(doing, throwing(Agent, Thing, At, Target)) -->
  touchable(Agent, Thing),
  can_sense(Agent, see, Target),
  aXiom(doing, thrown(Agent, Thing, At, Target)).

% has thrown the ball...
aXiom(doing, thrown(_Agent, Thing, AtTarget, Target)) -->
  ignore((getprop(Thing, breaks_into(Broken)),
  bugout('object ~p is breaks_into~n', [Thing], general),
  aXiom(doing, thing_transforms(Thing,Broken)))),
  aXiom(doing, disgorge(Target, AtTarget, Target, [Target], 'Something falls out.')).

aXiom(doing, thing_transforms(Thing,Broken))  --> 
  undeclare(h(At, Thing, Here)),
  declare(h(At, Broken, Here)),
  queue_local_event([transformed(Thing, Broken)], Here).
  

aXiom(doing, hit(Agent, Thing)) -->
  h(_At, Agent, Here),
  hit(Thing, Agent, [Here]),
  queue_agent_percept(Agent, [true, 'OK.']).

hit(Target, _Thing, Vicinity) -->
 ignore(( % Only brittle items use this
  getprop(Target, breaks_into(Broken)),
  bugout('target ~p is breaks_into~n', [Target], general),
  undeclare(h(Prep, Target, Here)),
  queue_local_event([transformed(Target, Broken)], Vicinity),
  declare(h(Prep, Broken, Here)),
  disgorge(Target, Prep, Here, Vicinity, 'Something falls out.'))).


aXiom(doing, dig(Agent, Hole, Where, Tool)) -->
  {memberchk(Hole, [hole, trench, pit, ditch]),
  memberchk(Where, [garden]),
  memberchk(Tool, [shovel, spade])},
  open_traverse(Tool, Agent),
  h(in, Agent, Where),
  \+  h(_At, Hole, Where),
  % OK, dig the hole.
  declare(h(in, Hole, Where)),
  setprop(Hole, default_rel(in)),
  setprop(Hole, can_be(move, f)),
  declare(h(in, dirt, Where)),
  queue_event(
    [ created(Hole, Where),
      [cap(subj(Agent)), person(dig, digs), 'a', Hole, 'in the', Where, '.']]).

aXiom(doing, eat(Agent, Thing)) -->
  (getprop(Thing, can_be(eat,t)) -> 
  (undeclare(h(_, Thing, _)),queue_agent_percept(Agent, [destroyed(Thing), 'Mmmm, good!'])) ;
  queue_agent_percept(Agent, [failure(eat(Thing)), 'It''s inedible!'])).


aXiom(doing, switch(Agent, OnOff, Thing)) -->
  touchable(Agent, Thing),
  getprop(Thing, can_be(switched(OnOff), t)),
  getprop(Thing, effect(switch(OnOff), Term0)),
  {subst(equivalent, ($(self)), Thing, Term0, Term)},
  call(Term),
  queue_agent_percept(Agent, [true, 'OK']).

aXiom(doing, open(Agent, Thing)) -->
  touchable(Agent, Thing),
  %getprop(Thing, openable),
  %\+ getprop(Thing, open),
  delprop(Thing, closed(true)),
  %setprop(Thing, open),
  setprop(Thing, closed(fail)),
  open_traverse(Agent, Here),
  queue_local_event([setprop(Thing, closed(fail)), 'Opened.'], [Here]).
aXiom(doing, close(Agent, Thing)) -->
  touchable(Agent, Thing),
  %getprop(Thing, openable),
  %getprop(Thing, open),
  delprop(Thing, closed(fail)),
  %delprop(Thing, open),
  setprop(Thing, closed(true)),
  open_traverse(Agent, Here),
  queue_local_event([setprop(Thing, closed(true)), 'Closed.'], [Here]).


aXiom(doing, inventory(Agent)) -->
  can_sense(Agent, see, Agent),
  must_act( does_inventory(Agent)).

aXiom(doing, does_inventory(Agent)) -->
  findall(What, h(child, What, Agent), Inventory),
  queue_agent_percept(Agent, [rel_to(held_by, Inventory)]).




% Agent looks
aXiom(doing, look(Agent)) --> 
  % Agent is At Here
  h(At, Agent, Here),
  % Agent looks At Here
  aXiom(doing, trys_examine(Agent, see, At, Here, depth(3))).

aXiom(doing, examine(Agent, Sense)) --> {is_sense(Sense)}, !, 
   dmust(from_loc(Agent, Place)),
   aXiom(doing, trys_examine(Agent, see, in, Place, depth(3))).

aXiom(doing, examine(Agent, Object)) --> aXiom(doing, trys_examine(Agent, see, at, Object, depth(3))). 
aXiom(doing, examine(Agent, Sense, Object)) --> aXiom(doing, trys_examine(Agent, Sense, at, Object, depth(3))), !.
aXiom(doing, examine(Agent, Sense, Prep, Object)) --> aXiom(doing, trys_examine(Agent, Sense, Prep, Object, depth(3))), !.

% listen, smell ...
aXiom(doing, Action) -->
 {Action=..[Verb,Agent|Args], 
 sensory_verb(Sense, Verb)}, !,
 {NewAction=..[examine,Agent,Sense|Args]},
 aXiom(doing, NewAction).

% Here does not allow Sense?
aXiom(doing, trys_examine(Agent, Sense, Prep, Object, Depth)) -->
  \+ sg(can_sense_here(Agent, Sense)), !,
  must_act( failed(examine(Agent, Sense, Prep, Object, Depth), \+ can_sense_here(Agent, Sense))).
aXiom(doing, trys_examine(Agent, Sense, Prep, Object, Depth)) -->
  \+ can_sense(Agent, Sense, Object), !,
  must_act( failed(examine(Agent, Sense, Prep, Object, Depth), \+ can_sense(Agent, Sense, Object))).
aXiom(doing, trys_examine(Agent, Sense, Prep, Object, Depth)) --> aXiom(doing, does_examine(Agent, Sense, Prep, Object, Depth)).


aXiom(doing, does_examine(Agent, Sense, Prep, Object, Depth)) -->  dmust(act_examine(Agent, Sense, Prep, Object, Depth)),!.
aXiom(doing, does_examine(Agent, Sense, Object)) --> {trace},
  %declared(props(Object, PropList)),
  findall(P, (getprop(Object, P), is_prop_public(Sense, P)), PropList),
  queue_agent_percept(Agent, [sense_props(Agent, Sense, Object, depth(2), PropList)]),
  (has_rel(At, Object); At='<unrelatable>'),
  % Remember that Agent might be on the inside or outside of Object.
  findall(What,
          (  h(child, What, Object), once(can_sense(Agent, Sense, What))),
          Children),
  queue_agent_percept(Agent, [sense_childs(Agent, Sense, Object, At, Children)]).







aXiom(doing, OpenThing, S0, S9) :- fail, 
 act_to_cmd_thing(Agent, OpenThing, Open, Thing), 
 act_change_state(Open, Opened, TF),
 dshow_fail(aXiom(doing, change_state(Agent, Open, Thing, Opened, TF), S0, S9)),!.

aXiom(doing, change_state(Agent, OpenThing, Open, Thing, Opened, TF)) --> 
  change_state(Agent, OpenThing, Open, Thing, Opened, TF).

% used mainly to debug if things are touchable
aXiom(doing, touch(Agent, Thing)) -->
 unless_reason(Agent, touchable(Agent, Thing),
   cant( reach(Agent, Thing))),
 queue_agent_percept(Agent, [success(touch(Agent, Thing),'Ok.')]).


aXiom(doing, true) --> [].



/*


% Agent looks
aXiom(doing, look(Agent)) -->   
  % Agent is At Here
  h(At, Agent, Here),
  % Here allows sight
  sg(sense_here(see, Here)), !,
  % The agent does look At Here
  must_act( does_look(Agent, At, Here)).

% The agent does look At Here
aXiom(doing, does_look(Agent, At, Here)) --> !, 
  % The agent notices objects At Here
  aXiom(_, notices_objects_at(Agent, see, At, Here)),
    % The agent notices exits At Here
  aXiom(_, notices_exits_at(Agent, At, Here)).


aXiom(doing, notices_exits_at(Agent, AtHere, Here), S0, S9) :- !,
   findall(Direction, h(exit(Direction), Here, _, S0), Exits),
   queue_agent_percept(Agent, exits_are(Agent, AtHere, Here, Exits), S0, S9).
aXiom(doing, notices_exits_at(Agent, AtHere, Here)) -->
   findall(Direction, h(exit(Direction), Here, _), Exits),
   queue_agent_percept(Agent, exits_are(Agent, AtHere, Here, Exits)).

aXiom(doing, notices_objects_at(Agent, Sense, AtHere, Here), S0, S9) :- 
  findall(What,
          % all children of Here
          (h(child, What, Here, S0),
           % What can be seen
           can_sense(Agent, Sense, What, S0)),           
          
          % ( h(descended, What, Here), \+ (h(inside, What, Container), h(descended, Container, Here))),
          Nearby),
  
  queue_agent_percept(Agent, notice_children(Agent, Sense, Here, AtHere, depth(3), Nearby), S0, S9).


aXiom(doing, switch(Open, Thing)) -->
 act_prevented_by(Open, TF),
 touchable(Agent, Thing),
 %getprop(Thing, can_be(open),
 %\+ getprop(Thing, state(open, t)),
 Open = open, traverses(Sense, Open)
 %delprop(Thing, state(Open, f)),
 %setprop(Thing, state(open, t)),
 setprop(Thing, state(Open, TF)),
 h(Sense, Agent, Here),
 queue_local_event([setprop(Thing, state(Open, TF)),[Open,is,TF]], [Here, Thing]).

aXiom(doing, switch(OnOff, Thing)) -->
 touchable(Agent, Thing, Agent),
 getprop(Thing, can_be(switch, t)),
 getprop(Thing, effect(switch(OnOff), Term0)),
 subst(equivalent, $self, Thing, Term0, Term),
 call(Term),
 queue_agent_percept(Agent, [true, 'OK']).
*/
% todo

/*
disgorge(Container, At, Here, Vicinity, Msg) :-
  findall(Inner, h(child, Inner, Container), Contents),
  bugout('~p contained ~p~n', [Container, Contents], general),
  moveallto(Contents, At, Here, Vicinity, Msg).
disgorge(_Container, _At, _Here, _Vicinity, _Msg).
*/
disgorge(Container, Prep, Here, Vicinity, Msg) -->
  (findall(Inner, h(child, Inner, Container), Contents),
   bugout('~p contained ~p~n', [Container, Contents], general),
   map_each_state(moveto(), Contents, Prep, Here, Vicinity, Msg)).




/*moveallto([], _R, _D, _V, _M, S, S).
moveallto([Object|Tail], Relation, Destination, Vicinity, Msg) :-
 moveto(Object, Relation, Destination, Vicinity, Msg),
 moveallto(Tail, Relation, Destination, Vicinity, Msg).
*/
moveallto([], _R, _D, _V, _M, S, S).
moveallto(List, Relation, Destination, Vicinity, Msg) :-
 apply_map_state(moveto(),List,rest(Relation, Destination, Vicinity, Msg)).

:- defn_state_setter(moveto(inst,domrel,dest,list_of(places),msg)).
moveto(Object, At, Dest, Vicinity, Msg) :-
  undeclare(related(_, Object, Here)),
  declare(related(At, Object, Dest)),
  queue_local_event([moved(Object, Here, At, Dest), Msg], Vicinity).


event_props(thrown(_Agent,  Thing, _Target, Prep, Here, Vicinity),
 [getprop(Thing, breaks_into(Broken)),
 bugout('object ~p is breaks_into~n', [Thing], general),
 undeclare(h(_, Thing, _)),
 declare(h(Prep, Broken, Here)),
 queue_local_event([transformed(Thing, Broken)], Vicinity),
 disgorge(Thing, Prep, Here, Vicinity, 'Something falls out.')]).

                                      
setloc_silent(Prep, Object, Dest) --> 
 undeclare(h(_, Object, _)),
 declare(h(Prep, Object, Dest)).


change_state(Agent, Open, Thing, Opened, TF, S0, S):- 
 maybe_when(psubsetof(Open, touch),
   required_reason(Agent, touchable(Thing, Agent, S0))),

 %getprop(Thing, can_be(open, S0),
 %\+ getprop(Thing, state(open, t), S0),

 required_reason(Agent, \+ getprop(Thing, can_be(Open, f), S0)),

 ignore(dshow_fail(getprop(Thing, can_be(Open, t), S0))),

 forall(act_prevented_by(Open,Locked,Prevented),
   required_reason(Agent, \+ getprop(Thing, state(Locked, Prevented), S0))),

 %delprop(Thing, state(Open, f), S0, S1),
 %setprop(Thing, state(Open, t), S0, S1),

  open_traverse(Agent, Here, S0),

 apply_forall(
  (getprop(Thing, effect(Open, Term0), S0),
  subst(equivalent,$self, Thing, Term0, Term1),
  subst(equivalent,$agent, Agent, Term1, Term2),
  subst(equivalent,$here, Here, Term2, Term)),
  call(Term),S0,S1),

 setprop(Thing, state(Opened, TF), S1, S2),

 queue_local_event([setprop(Thing, state(Opened, TF)),msg([Thing,is,TF,Opened])], [Here, Thing], S2, S),!.

