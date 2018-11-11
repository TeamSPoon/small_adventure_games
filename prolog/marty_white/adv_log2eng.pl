/*
% NomicMUD: A MUD server written in Prolog
% Maintainer: Douglas Miles
% Dec 13, 2035
%
% Bits and pieces:
%
% LogicMOO, Inform7, FROLOG, Guncho, PrologMUD and Marty's Prolog Adventure Prototype
%
% Copyright (C) 2004 Marty White under the GNU GPL
% Sept 20, 1999 - Douglas Miles
% July 10, 1996 - John Eikenberry
%
% Logicmoo Project changes:
%
% Main file.
%
*/

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE FILE SECTION
% :- ensure_loaded('adv_log2eng').
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xtreme_english :- flag_level(english,>(2)).
any_english :- \+ no_english.
no_english :- flag_level(english,=(0)).
:- ignore(flag(english,0,1)).

flag_level(Flag,Prop):-flag(Flag,Was,Was),Prop=..[F|Args],apply(F,[Was|Args]).



% A percept or event:
% - is a logical description of what happened
% - includes English or other translations
% - may be queued for zero, one, many, or all agents.
% - may have a timestamp
% queue_percpt(Agent, [Logical, English|_], S0, S9).
% where Logical is always first, and other versions are optional.
% Logical should be a term, like sees(Thing).
% English should be a list.

% Inform notation
% 'c'  character)
% "string" string
% "~"  quotation mark
% "^"  newline
% @   accent composition, variables 00 thru 31
% \   line continuation
% Engish messages need to be printable from various perspectives:
% person (1st/2nd/3rd), tense(past/present)
% "You go south." / "Floyd wanders south."
%  {'$agent $go $1', ExitName }
%  { person(Agent), tense(go, Time), ExitName, period }
%  {'$p $t $w', Agent, go, ExitName}
% "You take the lamp." / "Floyd greedily grabs the lamp."
%  Agent=floyd, {'%p quickly grab/T %n', Agent, grab, Thing }
%    else {'%p take/T %n', Agent, take, Thing }
% %p Substitute parameter as 1st/2nd/3rd person ("I"/"you"/"Floyd").
%   Implicit in who is viewing the message.
%   Pronouns: gender, reflexive, relative, nominative, demonstratve...?
% %n Substitute name/description of parameter ("the brass lamp").
% /T Modify previous word according to tense ("take"/"took").
%   Implicit in who is viewing the message? Context when printed?
% /N Modify previous word according to number ("coin"/"coins").
%   What number?
% %a Article - A or An (indefinite) or The (definite) ?
%
% I go/grab/eat/take
% you go/grab/eat/take
% she goes/grabs/eats/takes
% floyd goes/grabs/eats/takes
%
% eng(subject(Agent), 'quickly', verb(grab, grabs), the(Thing))
% [s(Agent), 'quickly', v(grab, grabs), the(Thing)]

english_directve(quoted(_)).
english_directve(cap(_)).
english_directve(subj(_)).
english_directve(person(_,_)).
english_directve(tense(_,_)).
english_directve(a(_)).
english_directve(the(_)).
english_directve(num(_,_,_)).
english_directve(aux(_)).
english_directve(silent(_)).
english_directve(P):- english_suffix(S), functor(P,S,1).

english_suffix(s).
english_suffix(ed).
english_suffix(ly).
english_suffix(ing).


capitalize([First|Rest], [Capped|Rest]) :- !,
 capitalize(First, Capped).
capitalize(Atom, Capitalized) :-
 atom(Atom), % [] is an atom
 downcase_atom(Atom, Lower),
 atom_chars(Lower, [First|Rest]),
 upcase_atom(First, Upper),
 atom_chars(Capitalized, [Upper|Rest]).

context_agent(Agent, Context):-
 declared(agent(Agent), Context), !.
context_agent(Agent, Context):-
 declared(inst(Agent), Context), !.
context_agent(Agent, Context):- \+ is_list(Context),
 action_doer(Context, Agent).


% compile_eng(Context, Atom/Term/List, TextAtom).
% Compile Eng terms to ensure subject/verb agreement:
% If subject is agent, convert to 2nd person, else use 3rd person.
% Context specifies agent, and (if found) subject of sentence.

compile_eng(_Context, _Done, Text) :- assertion(var(Text)),fail.
compile_eng(_Context, Done, '') :- Done == [], !.

compile_eng(Context, [cap(subj(Agent)), aux(be)|More], Person) :- !,
 compile_eng(Context, [cap(subj(Agent)), person(are, is)|More], Person) . 

compile_eng(Context, [AN, Apple|More], Text) :- 
 (AN==a;AN==an),!,
 compile_eng_txt(Context, [Apple|More], TxtApple),
 name(TxtApple,[A|_]),
 char_type(A,to_lower(Vowel)), 
 (vowel(Vowel) -> atom_concat('an ', TxtApple,Text);atom_concat('a ', TxtApple,Text)).
% mu:compile_eng([agent('player~1'),person('player~1')],a('floyd~1'),_64404)
compile_eng(Context, [First|Rest], [First2|Rest2]) :-
 compile_eng(Context, First, First2),
 compile_eng(Context, Rest, Rest2).

compile_eng(_Context, aux(be), 'is') :- !.
compile_eng(Context, aux(Can), Text) :- !,compile_eng_txt(Context, Can, Text).

compile_eng(Context, subj(Agent), Person) :-
 context_agent(Agent, Context),
 declared(person(Person), Context).
compile_eng(Context, subj(Other), Compiled) :-
 compile_eng(Context, Other, Compiled).
compile_eng(Context, Agent, Person) :-
 context_agent(Agent, Context),
 declared(person(Person), Context).
compile_eng(Context, person(Second, _Third), Compiled) :-
 declared(subj(Agent), Context),
 context_agent(Agent, Context),
 compile_eng(Context, Second, Compiled).
compile_eng(Context, person(_Second, Third), Compiled) :-
 compile_eng(Context, Third, Compiled).
compile_eng(Context, tense(Verb, Tense), Compiled) :-
 verb_tensed(Context, Verb, Tense, Compiled).
compile_eng(Context, cap(Eng), Compiled) :-
 compile_eng(Context, Eng, Lowercase),
 capitalize(Lowercase, Compiled).
compile_eng(_Context, silent(_Eng), '').

compile_eng(Context, Inst, TheThing):- atom(Inst), inst_of(Inst, Type, N), N\==0, !,
 (nth0(N, [(unknown), '', the, thee, old, some, a], Det) -> true; atom_concat('#',N,Det)),
 compile_eng(Context, [Det, Type], TheThing).

compile_eng(Context, Atom, Text):- fail, atom(Atom), dmust(atomic_list_concat(ABC,' ',Atom)),
 ABC=[A,B|C],!,
 compile_eng_txt(Context, [A,B|C], Text).

/*compile_eng(Context, String, Text):- string(String),
 name(Atom, String), compile_eng(Context, Atom, Text).
*/
compile_eng(_Context, Inst, Text):- \+ compound(Inst),!, format(atom(Text),'~w',[Inst]).

compile_eng(_Context, ly(spatial), '').
compile_eng(Context, s(Word), Spatially) :- % TODO make actually plural
 compile_eng_txt(Context, Word, Spatial),
 atom(Spatial),
 atom_concat(Spatial, "s", Spatially).
compile_eng(Context, Wordly, Spatially) :- functor(Wordly,S,1),english_suffix(S),
 Wordly =..[S, Word],
 compile_eng_txt(Context, Word, Spatial),
 atom(Spatial), atom_concat(Spatial, S, Spatially).

compile_eng(Context, DetWord, AThing) :-
 compound(DetWord), DetWord=..[Det, Word],
 member(Det, [the, some, a, an, '']),
 compile_eng(Context, [Det, Word], AThing).

/*compile_eng(Context, Prop, Text):- \+ atomic(Prop),
 log2eng(you,Prop,TextMid),!,
 compile_eng(Context,['\n'|TextMid],Text), !.
*/
compile_eng(_Context, Prop, Prop).

vowel(a). vowel(e). vowel(i). vowel(o). vowel(u).

verb_tensed(Context, Verb, past, Compiled):- 
 compile_eng_txt(Context, Verb, Word),
 pasitfy_word(Word, Compiled).
verb_tensed(Context, Verb, _Tense, Compiled):- 
 compile_eng_txt(Context, Verb, Compiled).


pasitfy_word(take,took).
pasitfy_word(make,made).
pasitfy_word(move,moved).
pasitfy_word(eat,ate).
pasitfy_word(Verb,Compiled):- \+ atom(Verb),!,Compiled=Verb.
pasitfy_word(Verb,Compiled):- atomic_concat(Verb,'ed', Compiled).


nospace(_, ',').
nospace(_, ';').
nospace(_, ':').              
nospace(_, '.').
nospace(_, '?').
nospace(_, '!').
nospace(_, '\'').
nospace('\'', _).
nospace(_, '"').
nospace('"', _).
nospace(_, Letter) :- char_type(Letter, space).
nospace(Letter, _) :- char_type(Letter, space).

no_space_words('', _).
no_space_words(_, '').
no_space_words(W1, W2) :-
 atomic(W1),
 atomic(W2),
 atom_chars(W1, List),
 last(List, C1),
 atom_chars(W2, [C2|_]),
 nospace(C1, C2).

insert_spaces([W], [W]).
insert_spaces([W1, W2|Tail1], [W1, W2|Tail2]) :-
 no_space_words(W1, W2),
 !,
 insert_spaces([W2|Tail1], [W2|Tail2]).
insert_spaces([W1, W2|Tail1], [W1, ' ', W3|Tail2]) :-
 insert_spaces([W2|Tail1], [W3|Tail2]).
insert_spaces([], []).
     
make_atomic(Atom, Atom) :-
 atomic(Atom), !.
make_atomic(Term, Atom) :-
 term_to_atom(Term, Atom).

eng2txt(Agent, Person, Eng, Text) :- assertion(nonvar(Eng)),
 % Find subject, if any.
 quietly((findall(subj(Subject), findterm(subj(Subject), Eng), Context),
 compile_eng_txt([agent(Agent), person(Person)|Context], Eng, Text))).
eng2txt(_Agent, _Person, Text, Text).

compile_eng_txt(_Context, Done, '') :- Done == [], !.
compile_eng_txt(Context, [First], Text):- compile_eng_txt(Context, First, Text),!.
compile_eng_txt(Context, Eng, Text):- 
 flatten([Eng],FEng),
 compile_eng_txt_pt2(Context, FEng, FText), 
 format(atom(Text),'~w',FText).

% Compile recognized structures.
compile_eng_txt_pt2(Context, EngIn, Text) :- 
 assertion(nonvar(EngIn)),
 flatten([EngIn], Eng),
 maplist(compile_eng(Context), Eng, Compiled),
 % Flatten any sub-lists.
 flatten([Compiled], FlatList),
 % Convert terms to atom-strings.
 findall(Atom, (member(Term, FlatList), make_atomic(Term, Atom)), AtomList),
 findall(Atom2, (member(Atom2, AtomList), Atom2\=''), AtomList1),
 grammar_check(Context,AtomList1,AtomList2),
 % Add spaces.
 bugout('insert_spaces(~w)~n', [AtomList2], printer),
 insert_spaces(AtomList2, SpacedList),
 % Return concatenated atoms.
 concat_atom(SpacedList, Text).


grammar_check(_Context, [], []).
grammar_check(Context, [AN, Apple|More], Text) :- fail,
 (AN==a;AN==an),!,
 compile_eng_txt(Context, [Apple|More], TxtApple),
 name(TxtApple,[A|_]),
 char_type(A,to_lower(Vowel)), 
 (vowel(Vowel) -> atom_concat('an ', TxtApple,Text);atom_concat('a ', TxtApple,Text)).

grammar_check(Context, [Word|More], [Word|MoreN]) :- 
 grammar_check(Context, More, MoreN).

grammar_check(_Context, A, A).

:- dynamic user:portray/1.
:- multifile user:portray/1.
:- module_transparent user:portray/1.
%user:portray(ItemToPrint) :- print_item_list(ItemToPrint). % called by print.

user:portray(Logic) :- 
 compound(Logic), \+ is_list(Logic),
 flag_level(english,>(1)),
 in_ourpp(1),
 %current_player(Agent),
 Agent = self,
 with_output_to(codes(String),print_english(Agent, Logic)),!,
 simply_pprinted(String,Codes),
 format('{|i7|| ~s |}',[Codes]).

simply_pprinted(String,Codes):- append(LString,[N],String),(N==13;N==10),!,simply_pprinted(LString,Codes).
simply_pprinted(String,_Codes):- last(String,N),member(N,`.,]`),!,fail.
simply_pprinted(String,Codes):-
 freeze(C, member(C,`\n\r[{?`)),
 \+ member(C,String),
 String = Codes.

in_ourpp(Level) :- flag(our_pretty_printer,Was,Was),Was=Level.
 
list2eng(Obj, Some, English):-
 list2eng([], Obj, Some, English).

punct_or(Punct,Else,Value):- member(Else=Value,Punct)-> true ; Else=Value.

list2eng(Punct,_Obj, [], [Nothing]):- punct_or(Punct,'<nothing>',Nothing).
list2eng(Punct, Obj, Some, English) :- \+ is_list(Some), !, 
 punct_or(Punct,log2eng,Log2Eng),
 call(Log2Eng, Obj, Some, English),!.

:- nb_setval(list2eng, []).
list2eng(_Punct, Obj, Some, [' ['| English]) :- nb_current(list2eng,D), number(D),!, list2eng_e(['.'=']','and'=','], Obj, Some, English), !.
list2eng(Punct, Obj, Some, English) :- nb_current(list2eng,D), b_setval(list2eng,1), list2eng_e(Punct, Obj, Some, English), !,
 b_setval(list2eng,D).


list2eng_e(Punct, Obj, [Single], English) :- !,
 punct_or(Punct,log2eng,Log2Eng),
 call(Log2Eng, Obj, Single, Named),
 punct_or(Punct,'.',PERIOD),
 flatten([Named, PERIOD], English).

list2eng_e(Punct, Obj, [Last2, Last1], English) :- 
 punct_or(Punct,log2eng,Log2Eng),
 call(Log2Eng, Obj, Last2, Named2),
 list2eng(Obj, Last1, Named1),
 punct_or(Punct,'and',AND),
 punct_or(Punct,'.',PERIOD),
 flatten([Named2, AND, Named1, PERIOD], English).

list2eng_e(Punct, Obj, [Some| More], English) :- 
 punct_or(Punct,log2eng,Log2Eng),
 call(Log2Eng, Obj, Some, Named),
 punct_or(Punct,',',COMMA),
 list2eng_e(Punct, Obj, More, MoreNamed),
 flatten([Named, COMMA, MoreNamed], English).

list2eng_e(Punct, Obj, Some, English) :- 
 punct_or(Punct,log2eng,Log2Eng),
 call(Log2Eng, Obj, Some, English),!.
 

log2eng( Obj, Some, English):- 
 log2eng_( Obj, Some, E),flatten([E],English).

log2eng_( Obj, Prop, English):- 
 \+ ground(Prop), copy_term(Prop,Prop2),!,
 numbervars(Prop2,55,_),
 log2eng( Obj, Prop2, English).
log2eng_(Obj, Some, English):- logic2eng(Obj, Some, English),!.
log2eng_( Obj, Prop, English):- Prop =..[N, Obj1, A| VRange],Obj1==Obj,Prop2 =..[N, A| VRange], log2eng( Obj, Prop2, English).
log2eng_(Context, Inst, TheThing):- atom(Inst), inst_of(Inst, Type, N), !,
 (nth0(N, [(unknown), '', thee, old, some, a], Det) -> true; atom_concat('#',N,Det)),
 compile_eng_txt(Context, [Det, Type], TheThing).
log2eng_(_Obj, desc(Out), [' "',Out,'"']):- !.
log2eng_(_, V,[String]):- (string(V);(atom(V),atom_needs_quotes(V))),!, format(atom(String), ' "~w" ', [V]), !.
log2eng_( Obj, Prop, [cap(N),of,O, aux(be), Value]):- Prop =..[N,O, V], list2eng(Obj, V, Value).
log2eng_( Obj, Prop, [cap(N), aux(be), Value]):- Prop =..[N, V], list2eng(Obj, V, Value).
%logic2eng(_Obj, Prop, [String]):- compound(Prop), !, String=''. % format(atom(String), ' \n {{ ~q. }}\n ', [Prop]), !.
log2eng_(_Obj, Prop, [String]):- compound(Prop), \+ xtreme_english, !, format(atom(String), ' {{ ~q }} ', [Prop]), !.
log2eng_( Obj, Prop, [cap(N), Value, aux(be), English]):- Prop =..[N, V| Range],
 log2eng(Obj, V, Value),
 maplist(logic2eng(Obj), Range, English).
log2eng_(_Obj, Prop, [String]):- format(atom(String), '~w', [Prop]), !.


timestamped_pred(holds_at).

pretty.


%logic2eng(Obj, Var, [Text]):- var(Var),!, format(atom(Text),'{{~q}}',[log2eng(Obj, Var)]).
logic2eng( Obj, Prop, English):- 
 \+ ground(Prop), copy_term(Prop,Prop2),
 numbervars(Prop2,55,_),!,
 log2eng( Obj, Prop2, English).
logic2eng(_Obj, '$VAR'(Prop), English):- format(atom(English), ' ?VAR-~w', [Prop]), !.
logic2eng(_Obj, English, English):- english_directve(English),!.
logic2eng(_Obj, [English|Rest], [English|Rest]):- english_directve(English),!.
logic2eng(_Obj, [], []).

logic2eng(Obj, [Prop|Tail], Text) :- !,
 dmust((log2eng(Obj, Tail, UText2) ->
 flatten([UText2], Text2),
 dmust(log2eng(Obj, Prop, UText1)) -> 
 flatten([UText1], Text1),
 append_if_new(Text1, Text2, Text))), !.


logic2eng(Obj, HWestFromTo_At, [ Ago | Info]):- 
  HWestFromTo_At =.. [H,West,From|To_At],
  timestamped_pred(H),
  append(To,[At],To_At), number(At),!,
  log2eng(Obj, ago(At), Ago),
  HWestFromTo =.. [H,West,From|To],
  logic2eng(Obj, HWestFromTo, Info).

logic2eng(_Obj, Prop, [String]):- compound(Prop), no_english, !, format(atom(String), '~q', [Prop]), !.
logic2eng( Obj, ~(Type), ['(','logically','not','(',Out, '))']):- dmust(log2eng(Obj, Type, Out)), !.


%logic2eng(_Agent, time_passes, []).
logic2eng(_Context, time_passes(Agent), ['Time passes for',Agent,'.']).

%logic2eng(_Agent, you_are(Self, Prep, Here), [cap(subj(Self)), person(are, is), Prep, 'the', Here, '\n']).

logic2eng(Context, exits_are(_Agent, Here, Exits), ['exits of',Here,' are', ExitText, '\n']):- list2eng(Context, Exits, ExitText).

logic2eng(Context, notice_children(Agent, see, Here, Prep, Nearby), [cap(Prep),Here, ':', SeeText]):-
 exclude(=@=(Agent), Nearby, OtherNearby), list2eng(Context, OtherNearby, SeeText).

logic2eng(Context, notice_children(Agent, Sense, Here, Prep, Nearby), [cap(subj(Agent)), person(Sense, s(Sense)),Prep,Here, ':', SeeText]):-
 exclude(=@=(Agent), Nearby, OtherNearby), list2eng(Context, OtherNearby, SeeText).

logic2eng(Context, carrying(Agent, Items),
   [cap(subj(Agent)), 'carrying:'|Text]) :-
 list2eng(Context, Items, Text).
                               

logic2eng(_Agent, moved( What, From, Prep, To),
   [cap(subj(What)), 'moves', ' from', From, Prep, 'to', To]).


logic2eng(_Agent, transformed(Before, After), [Before, 'turns into', After, .]).

logic2eng(_Agent, destroyed(Thing), [Thing, aux(be), 'destroyed.']).


logic2eng(Context, sense_props(Agent, Sense, Object, PropList), 
   [ %cap(subj(Agent)),
    subj(Agent),
    person(Sense, s(Sense))| English] ) :-
 log2eng(Context, props(Object, PropList),English).

logic2eng(_Agent, props(Object, PropList), [the(Object), ': ('|English] ) :- list2eng(['.'=')'],Object, PropList, English).

logic2eng(_Agent, memories(Object, PropList), ['\n\n', the(Object), ' remembers:\n'|English] ) :- 
 reverse(PropList,PropListR),
 list2eng([','=',\n',log2eng=percept2eng],Object, PropListR, English).
logic2eng(_Agent, perceptq(Object, PropList), ['\n\n', the(Object), ' notices:\n'|English] ) :- 
 list2eng([','=',\n'],Object, PropList, English).


logic2eng(Context, did(Action), ['did happen: '|English] ) :- !, logic2eng(Context, Action, English ).
logic2eng(Context, emoted(Speaker, EmoteType, Audience, Eng), ['happened: '|Rest]) :- !,
 logic2eng(Context, emote(Speaker, EmoteType, Audience, Eng), Rest).
logic2eng(_, emote(Speaker, act, '*'(Place), Eng), [the(Speaker),at,Place,Text]) :- !,
 eng2txt(Speaker, Speaker, Eng, Text).
logic2eng(_, emote(Speaker, act, Audience, Eng), [Audience, notices, the(Speaker), Text]) :-
 eng2txt(Speaker, Speaker, Eng, Text).
logic2eng(_, emote(Speaker, EmoteType, Audience, Eng), [cap(subj(Speaker)), s(EmoteType), 'to', Audience, ', "', Text, '"']) :-
 eng2txt(Speaker, 'I', Eng, Text).

logic2eng(_Agent, failure(Action), ['Action failed:', Action]).

logic2eng(Context, sense_each(Agent, See, Sensing), [cap(subj(Agent)), person(See, s(See)), ': '|SensedText]) :- 
 log2eng(Context, Sensing, SensedText).

%logic2eng( Obj, effect(_, _), Out):- log2eng(Obj, adjs(special), Out), !.

logic2eng(Obj, timestamp(Ord,Time), [timestamp,is,Ord,'(',Ago,')']):- log2eng(Obj, ago(Time), Ago).

logic2eng(_Obj, ago(Time), [MinutesSecs,ago]):- 
 clock_time(Now),
 Dif is round((Now - Time)*10)/10,
 Minutes is round(Dif) // 60,
 USecs is round((Dif - (Minutes*60))*10)/10,
 Secs is round(USecs),
 (Minutes>0 -> 
 (Secs<10 
  -> format(atom(MinutesSecs),'~w:0~ws',[Minutes,Secs])
  ; format(atom(MinutesSecs),'~w:~ws',[Minutes,Secs]))
  ; format(atom(MinutesSecs),'~ws',[USecs])).


logic2eng(_Obj, h(exit(West), From , To), [To, 'is', West, 'of', From]):- !.
logic2eng(_Obj, h(ExitDown, Object, Speaker), [the(Object), 'has', Exit, Down, 'to', Speaker]):- 
 compound(ExitDown), 
 ExitDown=..[Exit, Down].
logic2eng(_Obj, h(Held_by , Object, Speaker), [the(Object), aux(be), Held_by, Speaker]).


logic2eng(_Obj, EmittingLight, [aux(be), 'glowing']):- EmittingLight == emmiting(light), !.
logic2eng(_Obj, fragile(_), ['looks fragile']).
logic2eng(_Obj, shiny, [aux(be), 'shiny!']).



logic2eng( Obj, initial(Desc), ['initially described as'| Out]):- log2eng( Obj, Desc, Out).
logic2eng(_Obj, co(_), ['/**/ ']):- pretty,!.
logic2eng( Obj, co(Desc), ['(Created as: ', Out, ')']):- list2eng( Obj, Desc, Out).


%logic2eng(_Obj, adjs(Type), ['adjs:',Type]).
%logic2eng(_Obj, nouns(Type), ['nouns:',Type]).

logic2eng(_Aobj, cant( sense(_Agent, Sense, It, Why)), [ 'can''t sense', It, ' ', ly(Sense), ' here', cuz(Why)]).
logic2eng(_Aobj, cant( reach(_Agent, Spatial, It)), [ 'can''t reach ', It, ' ', ly(Spatial)]).
logic2eng(_Aobj, cant( manipulate(Spatial, self)), [ 'can''t manipulate yourself like that', ly(Spatial)]).
logic2eng(_Aobj, alreadyhave(It), ['already have', the(It)]).
logic2eng(_Aobj, mustgetout(It), ['must get out/off ',It,' first.']).
logic2eng(_Aobj, self_relation(_Spatial, It), ['can\'t put ',It,' inside itself!']).
logic2eng(_Aobj, moibeus_relation( _, _), ['Topological error!']).
logic2eng(_Aobj, state(Dark, t),  ['It''s too ', Dark, ' to ', ly(Sense), '!']):- problem_solution(Dark, Sense, _Light).
logic2eng(_Aobj, mustdrop(It), [ 'will have to drop', It, ' first.']).
logic2eng(_Aobj, cant( move(_Agent, Spatial, It)), [It,aux(be),'immobile', ly(Spatial)]).
logic2eng(_Aobj, cantdothat(EatCmd), [ 'can\'t do: ', EatCmd]).

%log2eng(_Obj, oper(OProp, [cap(N), aux(be), V]):- Prop =..[N, V].
logic2eng(Obj, has_rel(Spatial,Prep,TF) , Eng):- Spatial == spatial,!, logic2eng(Obj, has_rel(Prep,TF) , Eng).

logic2eng(_Obj, has_rel(Quantity,Ammount,TF) , [TF,that,'has a,',Quantity,Ammount]).
logic2eng( Obj, Prop, English):- Prop =..[N, V, T| VRange],T==t,Prop2 =..[N, V| VRange], log2eng( Obj, Prop2, English).
logic2eng(_Obj, has_rel(on), ['has a surface']).
logic2eng(_Obj, has_rel(in), ['has an interior']).
logic2eng(_Obj, has_rel(exit(_)), ['has exits']).
logic2eng(_Obj, can_be(eat), ['looks tasty ', '!']).
logic2eng(_Obj, can_be(Eat), ['Can be', tense(Eat, past)]).
logic2eng(_Obj, can_be(Eat, f), ['Can\'t be', tense(Eat, past)]).
logic2eng(_Obj, can_do(Eat), ['Able to', Eat ]).
logic2eng(_Obj, can_do(Eat, f), ['Unable to', Eat ]).
logic2eng(_Obj, state(Open), [aux(be), Open ]).
logic2eng(_Obj, state(Open, f), [aux(be), 'not', Open ]).
logic2eng( Obj, inherit(Type), ['is',Out]):- log2eng(Obj, [Type], Out), !.
logic2eng( Obj, inherit(Type, f), ['isnt '|Out]):- log2eng(Obj, [Type], Out), !.
logic2eng( Obj, inherited(Type), ['inherits',Out]):- log2eng(Obj, [Type], Out), !.
logic2eng( _Obj, msg(Msg), Msg):- !.

logic2eng(_Obj, class_desc(_), []).

logic2eng( Obj, oper(Act,Precond,PostCond), OUT) :- 
 (xtreme_english->OUT = ['{{',if,'action: ',ActE,' test:', PrecondE,'resulting: ',PostCondE,'}}'];
 OUT = []),
 maplist(log2eng(Obj), [Act,Precond,PostCond], [ActE,PrecondE,PostCondE]).


logic2eng( Obj, Prop, English):- Prop =..[N, Spatial| VRange],Spatial==spatial,Prop2 =..[N| VRange], log2eng( Obj, Prop2, English).
logic2eng( Obj, Prop, English):- Prop =..[N, Obj1, A| VRange],Obj1==Obj,Prop2 =..[N, A| VRange], log2eng( Obj, Prop2, English).
logic2eng( Obj, Prop, English):- Prop =..[N, V, T| VRange],T==t,Prop2 =..[N, V| VRange], log2eng( Obj, Prop2, English).

logic2eng(Context, Inst, TheThing):- atom(Inst), inst_of(Inst, Type, N), !,
 (nth0(N, [(unknown), '', thee, old, some, a], Det) -> true; atom_concat('#',N,Det)),
 compile_eng(Context, [Det, Type], TheThing).

logic2eng(_Obj, desc(Out), [' "',Out,'"']):- !.
logic2eng(_, V,[String]):- (string(V);(atom(V),atom_needs_quotes(V))),!, format(atom(String), ' "~w" ', [V]), !.

logic2eng( Obj, Prop, [cap(N),of,O, aux(be), Value]):- Prop =..[N,O, V], list2eng(Obj, V, Value).
logic2eng( Obj, Prop, ['(',cap(N), ':', Value,')']):- Prop =..[N, V], list2eng(Obj, V, Value).
%logic2eng(_Obj, Prop, [String]):- compound(Prop), !, String=''. % format(atom(String), ' \n {{ ~q. }}\n ', [Prop]), !.
logic2eng(_Obj, Prop, [String]):- compound(Prop), \+ xtreme_english, !, format(atom(String), ' {{ ~q }} ', [Prop]), !.
logic2eng( Obj, Prop, [cap(N), Value, aux(be), English]):- Prop =..[N, V| Range],
 log2eng(Obj, V, Value),
 maplist(logic2eng(Obj), Range, English).

logic2eng(_Obj, Prop, [String]):- format(atom(String), '~w', [Prop]), !.

atom_needs_quotes(V):-format(atom(VV),'~q',[V]),V\==VV.

append_if_new1(Text1, Text2, Text):- flatten([Text1], TextF1), flatten([Text2], TextF2), append([_|TextF1], _, TextF2), !, Text=Text2.

append_if_new(Text1, Text2, Text):- append_if_new1(Text1, Text2, Text), !.
append_if_new(Text2, Text1, Text):- append_if_new1(Text1, Text2, Text), !.
append_if_new(Text1, Text2, Text):- append(Text1, Text2, Text), !.

percept2eng(_Agent, [_Logical, English], English) :- !.
percept2eng(_Agent, [_Logical, English|More], [English|More]) :- !.
percept2eng(Context, [Logical|_], Eng) :- log2eng(Context, Logical, Eng),!.
percept2eng(Context, LogicalEnglish, Eng) :- log2eng(Context, LogicalEnglish, Eng).

percept2txt(Agent, LogicalEnglish, Text) :-
 percept2eng(Agent, LogicalEnglish, English),
 eng2txt(Agent, Agent, English, Text).

the(State, Object, Text) :-
 getprop(Object, name(D), State),
 compile_eng_txt(State, D, AD),
 atom_concat('the ', AD, Text).

an(State, Object, Text) :-
 getprop(Object, name(D), State),
 compile_eng_txt(State, D, AD),
 atom_concat('a ', AD, Text).

num(_Singular, Plural, [], Plural).
num(Singular, _Plural, [_One], Singular).
num(_Singular, Plural, [_One, _Two|_Or_More], Plural).

expand_english(State, the(Object), Text) :-
 the(State, Object, Text).
expand_english(State, an(Object), Text) :-
 an(State, Object, Text).
expand_english(_State, num(Sing, Plur, List), Text) :-
 num(Sing, Plur, List, Text).
expand_english(_State, [], '').
expand_english(State, [Term|Tail], [NewTerm|NewTail]) :-
 expand_english(State, Term, NewTerm),
 expand_english(State, Tail, NewTail).
expand_english(_State, Term, Term).



