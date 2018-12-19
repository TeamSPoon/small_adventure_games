
:-include(library('ec_planner/ec_test_incl')).
% loading('ectest/ec_reader_test_ecnet.e')
% ectest/ec_reader_test_ecnet.e:1
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: foundations/Root.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:7
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
% ectest/ec_reader_test_ecnet.e:18
% sort boolean
 /*
sort(boolean).
*/
sort(boolean).

% sort integer
 /*
sort(integer).
*/
sort(integer).

% reified sort predicate
 /*
reified_sort(predicate).
*/
reified_sort(predicate).

% reified sort function
 /*
reified_sort(function).
*/
reified_sort(function).

% 
%; End of file.
% ectest/ec_reader_test_ecnet.e:24
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: foundations/EC.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:30
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; Event Calculus (EC)
%;
%; @incollection{MillerShanahan:2002,
%;   author = "Rob Miller and Murray Shanahan",
%;   year = "2002",
%;   title = "Some alternative formulations of the event calculus",
%;   editor = "Antonis C. Kakas and Fariba Sadri",
%;   booktitle = "Computational Logic: Logic Programming and Beyond: Essays in Honour of \uppercase{R}obert \uppercase{A}. \uppercase{K}owalski, Part \uppercase{II}",
%;   series = "Lecture Notes in Computer Science",
%;   volume = "2408",
%;   pages = "452--490",
%;   address = "Berlin",
%;   publisher = "Springer",
%; }
%;
% ectest/ec_reader_test_ecnet.e:56
% 
% sort time: integer
 /*
subsort(time,integer).
*/
subsort(time,integer).
sort(time).
sort(integer).

% sort offset: integer
 /*
subsort(offset,integer).
*/
subsort(offset,integer).
sort(offset).
sort(integer).

% 
% reified sort fluent
 /*
reified_sort(fluent).
*/
reified_sort(fluent).

% reified sort event
 /*
reified_sort(event).
*/
reified_sort(event).

% ectest/ec_reader_test_ecnet.e:62
% 
% predicate Happens(event,time)
 /*
predicate(happens(event,time)).
*/
predicate(happens(event,time)).

% predicate HoldsAt(fluent,time)
 /*
predicate(holds_at(fluent,time)).
*/
predicate(holds_at(fluent,time)).

% predicate ReleasedAt(fluent,time)
 /*
predicate(releasedAt(fluent,time)).
*/
predicate(releasedAt(fluent,time)).

% predicate Initiates(event,fluent,time)
 /*
predicate(initiates(event,fluent,time)).
*/
predicate(initiates(event,fluent,time)).

% predicate Terminates(event,fluent,time)
 /*
predicate(terminates(event,fluent,time)).
*/
predicate(terminates(event,fluent,time)).

% ectest/ec_reader_test_ecnet.e:68
% predicate Releases(event,fluent,time)
 /*
predicate(releases(event,fluent,time)).
*/
predicate(releases(event,fluent,time)).

% predicate Trajectory(fluent,time,fluent,offset)
 /*
predicate(trajectory(fluent,time,fluent,offset)).
*/
predicate(trajectory(fluent,time,fluent,offset)).

% 
%; End of file.
% 
% 
% ectest/ec_reader_test_ecnet.e:74
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: foundations/DEC.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; Discrete Event Calculus (DEC)
%;
%; @article{Mueller:2004a,
%;   author = "Erik T. Mueller",
%;   year = "2004",
%;   title = "Event calculus reasoning through satisfiability",
%;   journal = "Journal of Logic and Computation",
%;   volume = "14",
%;   number = "5",
%;   pages = "703--730",
%; }
%;
% ectest/ec_reader_test_ecnet.e:101
% 
% sort time: integer
 /*
subsort(time,integer).
*/
subsort(time,integer).
sort(time).
sort(integer).

% sort offset: integer
 /*
subsort(offset,integer).
*/
subsort(offset,integer).
sort(offset).
sort(integer).

% 
% reified sort fluent
 /*
reified_sort(fluent).
*/
reified_sort(fluent).

% reified sort event
 /*
reified_sort(event).
*/
reified_sort(event).

% ectest/ec_reader_test_ecnet.e:107
% 
% predicate Happens(event,time)
 /*
predicate(happens(event,time)).
*/
predicate(happens(event,time)).

% predicate HoldsAt(fluent,time)
 /*
predicate(holds_at(fluent,time)).
*/
predicate(holds_at(fluent,time)).

% predicate ReleasedAt(fluent,time)
 /*
predicate(releasedAt(fluent,time)).
*/
predicate(releasedAt(fluent,time)).

% 
% predicate Initiates(event,fluent,time)
 /*
predicate(initiates(event,fluent,time)).
*/
predicate(initiates(event,fluent,time)).

% ectest/ec_reader_test_ecnet.e:113
% predicate Terminates(event,fluent,time)
 /*
predicate(terminates(event,fluent,time)).
*/
predicate(terminates(event,fluent,time)).

% predicate Releases(event,fluent,time)
 /*
predicate(releases(event,fluent,time)).
*/
predicate(releases(event,fluent,time)).

% 
% ectest/ec_reader_test_ecnet.e:116
% [fluent,time]% 
% (HoldsAt(fluent,time) &
%  !ReleasedAt(fluent,time+1) &
%  !({event} Happens(event,time) & Terminates(event,fluent,time))) ->
% HoldsAt(fluent,time+1).
 /*
holds_at(Fluent, Time), not(releasedAt(Fluent, Time+1)), not(exists([Event],  (happens(Event, Time), terminates(Event, Fluent, Time)))) ->
    holds_at(Fluent, Time+1).
*/
axiom(holds_at(Fluent,Time+1),
      [ holds_at(Fluent,Time),
	neg(releasedAt(Fluent,Time+1)),
	neg(exists([Event],
		   happens(Event,Time) ',' terminates(Event,Fluent,Time)))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:122
% [fluent,time]% 
% (!HoldsAt(fluent,time) &
%  !ReleasedAt(fluent,time+1) &
%  !({event} Happens(event,time) & Initiates(event,fluent,time))) ->
% !HoldsAt(fluent,time+1).
 /*
not(holds_at(Fluent, Time)), not(releasedAt(Fluent, Time+1)), not(exists([Event],  (happens(Event, Time), initiates(Event, Fluent, Time)))) ->
    not(holds_at(Fluent, Time+1)).
*/
axiom(holds_at(neg(Fluent),Time+1),
      [ holds_at(neg(Fluent),Time),
	neg(releasedAt(Fluent,Time+1)),
	neg(exists([Event],
		   happens(Event,Time) ',' initiates(Event,Fluent,Time)))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:128
% [fluent,time]% 
% (!ReleasedAt(fluent,time) &
%  !({event} Happens(event,time) & Releases(event,fluent,time))) ->
% !ReleasedAt(fluent,time+1).
 /*
not(releasedAt(Fluent, Time)), not(exists([Event],  (happens(Event, Time), releases(Event, Fluent, Time)))) ->
    not(releasedAt(Fluent, Time+1)).
*/
axiom(neg(releasedAt(Fluent,Time+1)),
      [ neg(releasedAt(Fluent,Time)),
	neg(exists([Event],
		   happens(Event,Time) ',' releases(Event,Fluent,Time)))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:133
% [fluent,time]% 
% (ReleasedAt(fluent,time) &
%  !({event} Happens(event,time) &
%    (Initiates(event,fluent,time) |
%     Terminates(event,fluent,time)))) ->
% ReleasedAt(fluent,time+1).
 /*
releasedAt(Fluent, Time), not(exists([Event],  (happens(Event, Time), (initiates(Event, Fluent, Time);terminates(Event, Fluent, Time))))) ->
    releasedAt(Fluent, Time+1).
*/
axiom(releasedAt(Fluent,Time+1),
      [ releasedAt(Fluent,Time),
	neg(exists([Event],
		   happens(Event,Time) ',' (initiates(Event,Fluent,Time) ; terminates(Event,Fluent,Time))))
      ]).

% 
% ectest/ec_reader_test_ecnet.e:139
% 
% ectest/ec_reader_test_ecnet.e:140
% [event,fluent,time]% 
% (Happens(event,time) & Initiates(event,fluent,time)) ->
% (HoldsAt(fluent,time+1) & !ReleasedAt(fluent,time+1)).
 /*
happens(Event, Time), initiates(Event, Fluent, Time) ->
    holds_at(Fluent, Time+1),
    not(releasedAt(Fluent, Time+1)).
*/
axiom(holds_at(Fluent,Time+1) ',' not(releasedAt(Fluent,Time+1)),
      [ happens(Event,Time),
	initiates(Event,Fluent,Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:144
% [event,fluent,time]% 
% (Happens(event,time) & Terminates(event,fluent,time)) ->
% (!HoldsAt(fluent,time+1) & !ReleasedAt(fluent,time+1)).
 /*
happens(Event, Time), terminates(Event, Fluent, Time) ->
    not(holds_at(Fluent, Time+1)),
    not(releasedAt(Fluent, Time+1)).
*/
axiom(not(holds_at(Fluent,Time+1)) ',' not(releasedAt(Fluent,Time+1)),
      [ happens(Event,Time),
	terminates(Event,Fluent,Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:148
% [event,fluent,time]% 
% (Happens(event,time) & Releases(event,fluent,time)) ->
% ReleasedAt(fluent,time+1).
 /*
happens(Event, Time), releases(Event, Fluent, Time) ->
    releasedAt(Fluent, Time+1).
*/
axiom(releasedAt(Fluent,Time+1),
      [ happens(Event,Time),
	releases(Event,Fluent,Time)
      ]).

% 
% 
%; End of file.
% 
% ectest/ec_reader_test_ecnet.e:154
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: foundations/ECCausal.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; Causal Constraints
%;
%; @inproceedings{Shanahan:1999a,
%;   author = "Murray Shanahan",
%;   year = "1999",
%;   title = "The ramification problem in the event calculus",
%;   booktitle = "\uppercase{P}roceedings of the \uppercase{S}ixteenth \uppercase{I}nternational \uppercase{J}oint \uppercase{C}onference on \uppercase{A}rtificial \uppercase{I}ntelligence",
%;   pages = "140--146",
%;   address = "San Mateo, CA",
%;   publisher = "Morgan Kaufmann",
%; }
%;
% ectest/ec_reader_test_ecnet.e:182
% 
% predicate Started(fluent,time)
 /*
predicate(started(fluent,time)).
*/
predicate(started(fluent,time)).

% predicate Stopped(fluent,time)
 /*
predicate(stopped(fluent,time)).
*/
predicate(stopped(fluent,time)).

% 
% ectest/ec_reader_test_ecnet.e:186
% [fluent,time]% 
% Started(fluent,time) <->
% (HoldsAt(fluent,time) |
%  ({event} Happens(event,time) & Initiates(event,fluent,time))).
 /*
started(Fluent, Time) <->
    (   holds_at(Fluent, Time)
    ;   exists([Event],
                (happens(Event, Time), initiates(Event, Fluent, Time)))
    ).
*/
axiom(holds_at(Fluent,Time) ; exists([Event],
	     happens(Event,Time) ',' initiates(Event,Fluent,Time)),
      [started(Fluent,Time)]).
axiom(started(Fluent,Time),
      [ holds_at(Fluent,Time) ; exists([Event],
	       happens(Event,Time) ',' initiates(Event,Fluent,Time))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:191
% [fluent,time]% 
% Stopped(fluent,time) <->
% (!HoldsAt(fluent,time) |
%  ({event} Happens(event,time) & Terminates(event,fluent,time))).
 /*
stopped(Fluent, Time) <->
    (   not(holds_at(Fluent, Time))
    ;   exists([Event],
                (happens(Event, Time), terminates(Event, Fluent, Time)))
    ).
*/
axiom(not(holds_at(Fluent,Time)) ; exists([Event],
	     happens(Event,Time) ',' terminates(Event,Fluent,Time)),
      [stopped(Fluent,Time)]).
axiom(stopped(Fluent,Time),
      [ not(holds_at(Fluent,Time)) ; exists([Event],
	       happens(Event,Time) ',' terminates(Event,Fluent,Time))
      ]).

% 
% 
% predicate Initiated(fluent,time)
 /*
predicate(initiated(fluent,time)).
*/
predicate(initiated(fluent,time)).

% ectest/ec_reader_test_ecnet.e:197
% predicate Terminated(fluent,time)
 /*
predicate(terminated(fluent,time)).
*/
predicate(terminated(fluent,time)).

% 
% ectest/ec_reader_test_ecnet.e:199
% [fluent,time]% 
% Initiated(fluent,time) <->
% (Started(fluent,time) &
%  !({event} Happens(event,time) & Terminates(event,fluent,time))).
 /*
initiated(Fluent, Time) <->
    started(Fluent, Time),
    not(exists([Event],
                (happens(Event, Time), terminates(Event, Fluent, Time)))).
*/
axiom(started(Fluent,Time) ',' not(exists([Event],
		 happens(Event,Time) ',' terminates(Event,Fluent,Time))),
      [initiated(Fluent,Time)]).
axiom(initiated(Fluent,Time),
      [ started(Fluent,Time),
	neg(exists([Event],
		   happens(Event,Time) ',' terminates(Event,Fluent,Time)))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:204
% [fluent,time]% 
% Terminated(fluent,time) <->
% (Stopped(fluent,time) &
%  !({event} Happens(event,time) & Initiates(event,fluent,time))).
 /*
terminated(Fluent, Time) <->
    stopped(Fluent, Time),
    not(exists([Event],
                (happens(Event, Time), initiates(Event, Fluent, Time)))).
*/
axiom(stopped(Fluent,Time) ',' not(exists([Event],
		 happens(Event,Time) ',' initiates(Event,Fluent,Time))),
      [terminated(Fluent,Time)]).
axiom(terminated(Fluent,Time),
      [ stopped(Fluent,Time),
	neg(exists([Event],
		   happens(Event,Time) ',' initiates(Event,Fluent,Time)))
      ]).

% 
% 
%; End of file.
% ectest/ec_reader_test_ecnet.e:210
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: foundations/ECTraj.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:216
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; @incollection{MillerShanahan:2002,
%;   author = "Rob Miller and Murray Shanahan",
%;   year = "2002",
%;   title = "Some alternative formulations of the event calculus",
%;   editor = "Antonis C. Kakas and Fariba Sadri",
%;   booktitle = "Computational Logic: Logic Programming and Beyond: Essays in Honour of \uppercase{R}obert \uppercase{A}. \uppercase{K}owalski, Part \uppercase{II}",
%;   series = "Lecture Notes in Computer Science",
%;   volume = "2408",
%;   pages = "452--490",
%;   address = "Berlin",
%;   publisher = "Springer",
%; }
%;
% ectest/ec_reader_test_ecnet.e:240
% 
% predicate Clipped(time,fluent,time)
 /*
predicate(clipped(time,fluent,time)).
*/
predicate(clipped(time,fluent,time)).

% predicate Declipped(time,fluent,time)
 /*
predicate(declipped(time,fluent,time)).
*/
predicate(declipped(time,fluent,time)).

% 
% predicate Trajectory(fluent,time,fluent,offset)
 /*
predicate(trajectory(fluent,time,fluent,offset)).
*/
predicate(trajectory(fluent,time,fluent,offset)).

% predicate AntiTrajectory(fluent,time,fluent,offset)
 /*
predicate(antiTrajectory(fluent,time,fluent,offset)).
*/
predicate(antiTrajectory(fluent,time,fluent,offset)).

% ectest/ec_reader_test_ecnet.e:246
% 
% ectest/ec_reader_test_ecnet.e:247
% [event,fluent,fluent2,offset,time]% 
% Happens(event,time) &
% Initiates(event,fluent,time) &
% 0 < offset &
% Trajectory(fluent,time,fluent2,offset) &
% !Clipped(time,fluent,time+offset) ->
% HoldsAt(fluent2,time+offset).
 /*
happens(Event, Time), initiates(Event, Fluent, Time), 0<Offset, trajectory(Fluent, Time, Fluent2, Offset), not(clipped(Time, Fluent, Time+Offset)) ->
    holds_at(Fluent2, Time+Offset).
*/
axiom(holds_at(Fluent2,Time+Offset),
      [ happens(Event,Time),
	initiates(Event,Fluent,Time),
	0 < Offset,
	trajectory(Fluent,Time,Fluent2,Offset),
	neg(clipped(Time,Fluent,Time+Offset))
      ]).

% ectest/ec_reader_test_ecnet.e:253
% 
% 
% ectest/ec_reader_test_ecnet.e:255
% [event,fluent,fluent2,offset,time]% 
% Happens(event,time) &
% Terminates(event,fluent,time) &
% 0 < offset &
% AntiTrajectory(fluent,time,fluent2,offset) &
% !Declipped(time,fluent,time+offset) ->
% HoldsAt(fluent2,time+offset).
 /*
happens(Event, Time), terminates(Event, Fluent, Time), 0<Offset, antiTrajectory(Fluent, Time, Fluent2, Offset), not(declipped(Time, Fluent, Time+Offset)) ->
    holds_at(Fluent2, Time+Offset).
*/
axiom(holds_at(Fluent2,Time+Offset),
      [ happens(Event,Time),
	terminates(Event,Fluent,Time),
	0 < Offset,
	antiTrajectory(Fluent,
		       Time,
		       Fluent2,
		       Offset),
	neg(declipped(Time,Fluent,Time+Offset))
      ]).

% ectest/ec_reader_test_ecnet.e:261
% 
% 
%; End of file.
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Ontology.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:270
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; integer
%;
% ectest/ec_reader_test_ecnet.e:283
% 
% sort diameter: integer
 /*
subsort(diameter,integer).
*/
subsort(diameter,integer).
sort(diameter).
sort(integer).

% 
%; object
% 
% sort object
 /*
sort(object).
*/
sort(object).

% ectest/ec_reader_test_ecnet.e:289
% 
% sort agent: object
 /*
subsort(agent,object).
*/
subsort(agent,object).
sort(agent).
sort(object).

% 
% sort physobj: object
 /*
subsort(physobj,object).
*/
subsort(physobj,object).
sort(physobj).
sort(object).

% sort bed: physobj
 /*
subsort(bed,physobj).
*/
subsort(bed,physobj).
sort(bed).
sort(physobj).

% sort snowflake: physobj
 /*
subsort(snowflake,physobj).
*/
subsort(snowflake,physobj).
sort(snowflake).
sort(physobj).

% ectest/ec_reader_test_ecnet.e:295
% sort sky: physobj
 /*
subsort(sky,physobj).
*/
subsort(sky,physobj).
sort(sky).
sort(physobj).

% 
% sort stuff: physobj
 /*
subsort(stuff,physobj).
*/
subsort(stuff,physobj).
sort(stuff).
sort(physobj).

% 
% sort surface: physobj
 /*
subsort(surface,physobj).
*/
subsort(surface,physobj).
sort(surface).
sort(physobj).

% sort ground: surface
 /*
subsort(ground,surface).
*/
subsort(ground,surface).
sort(ground).
sort(surface).

% ectest/ec_reader_test_ecnet.e:301
% 
% sort snow: stuff
 /*
subsort(snow,stuff).
*/
subsort(snow,stuff).
sort(snow).
sort(stuff).

% sort ball
 /*
sort(ball).
*/
sort(ball).

% 
% sort food: physobj
 /*
subsort(food,physobj).
*/
subsort(food,physobj).
sort(food).
sort(physobj).

% sort fruit: food
 /*
subsort(fruit,food).
*/
subsort(fruit,food).
sort(fruit).
sort(food).

% ectest/ec_reader_test_ecnet.e:307
% sort orange: fruit
 /*
subsort(orange,fruit).
*/
subsort(orange,fruit).
sort(orange).
sort(fruit).

% sort salad: food
 /*
subsort(salad,food).
*/
subsort(salad,food).
sort(salad).
sort(food).

% 
% sort clothing: physobj
 /*
subsort(clothing,physobj).
*/
subsort(clothing,physobj).
sort(clothing).
sort(physobj).

% sort scarf: clothing
 /*
subsort(scarf,clothing).
*/
subsort(scarf,clothing).
sort(scarf).
sort(clothing).

% sort hat: clothing
 /*
subsort(hat,clothing).
*/
subsort(hat,clothing).
sort(hat).
sort(clothing).

% ectest/ec_reader_test_ecnet.e:313
% 
% sort vegetablematter: physobj
 /*
subsort(vegetablematter,physobj).
*/
subsort(vegetablematter,physobj).
sort(vegetablematter).
sort(physobj).

% sort coal: vegetablematter
 /*
subsort(coal,vegetablematter).
*/
subsort(coal,vegetablematter).
sort(coal).
sort(vegetablematter).

% 
% sort bodypart: physobj
 /*
subsort(bodypart,physobj).
*/
subsort(bodypart,physobj).
sort(bodypart).
sort(physobj).

% sort hand: bodypart
 /*
subsort(hand,bodypart).
*/
subsort(hand,bodypart).
sort(hand).
sort(bodypart).

% ectest/ec_reader_test_ecnet.e:319
% 
% sort papertowels: physobj
 /*
subsort(papertowels,physobj).
*/
subsort(papertowels,physobj).
sort(papertowels).
sort(physobj).

% sort device: physobj
 /*
subsort(device,physobj).
*/
subsort(device,physobj).
sort(device).
sort(physobj).

% sort electronicdevice: device
 /*
subsort(electronicdevice,device).
*/
subsort(electronicdevice,device).
sort(electronicdevice).
sort(device).

% sort lamp: electronicdevice
 /*
subsort(lamp,electronicdevice).
*/
subsort(lamp,electronicdevice).
sort(lamp).
sort(electronicdevice).

% 
% ectest/ec_reader_test_ecnet.e:325
% sort cat: physobj
 /*
subsort(cat,physobj).
*/
subsort(cat,physobj).
sort(cat).
sort(physobj).

% sort horse: physobj
 /*
subsort(horse,physobj).
*/
subsort(horse,physobj).
sort(horse).
sort(physobj).

% 
% sort weapon: physobj
 /*
subsort(weapon,physobj).
*/
subsort(weapon,physobj).
sort(weapon).
sort(physobj).

% sort gun: weapon
 /*
subsort(gun,weapon).
*/
subsort(gun,weapon).
sort(gun).
sort(weapon).

% sort bomb: weapon
 /*
subsort(bomb,weapon).
*/
subsort(bomb,weapon).
sort(bomb).
sort(weapon).

% ectest/ec_reader_test_ecnet.e:331
% sort bullet: weapon
 /*
subsort(bullet,weapon).
*/
subsort(bullet,weapon).
sort(bullet).
sort(weapon).

% 
%; location
% 
% sort location
 /*
sort(location).
*/
sort(location).

% sort room: location, outside: location
 /*
subsort(room,location).
*/
subsort(room,location).
sort(room).
sort(location).

 /*
subsort(outside,location).
*/
subsort(outside,location).
sort(outside).
sort(location).

% ectest/ec_reader_test_ecnet.e:337
% 
%; portal
% 
% sort portal
 /*
sort(portal).
*/
sort(portal).

% sort door: portal, staircase: portal
 /*
subsort(door,portal).
*/
subsort(door,portal).
sort(door).
sort(portal).

 /*
subsort(staircase,portal).
*/
subsort(staircase,portal).
sort(staircase).
sort(portal).

% sort street: portal
 /*
subsort(street,portal).
*/
subsort(street,portal).
sort(street).
sort(portal).

% ectest/ec_reader_test_ecnet.e:343
% sort track: portal
 /*
subsort(track,portal).
*/
subsort(track,portal).
sort(track).
sort(portal).

% 
% sort building
 /*
sort(building).
*/
sort(building).

% 
% sort fire: object
 /*
subsort(fire,object).
*/
subsort(fire,object).
sort(fire).
sort(object).

% sort smoke: physobj
 /*
subsort(smoke,physobj).
*/
subsort(smoke,physobj).
sort(smoke).
sort(physobj).

% ectest/ec_reader_test_ecnet.e:349
% 
% sort furniture: physobj
 /*
subsort(furniture,physobj).
*/
subsort(furniture,physobj).
sort(furniture).
sort(physobj).

% sort chair: furniture
 /*
subsort(chair,furniture).
*/
subsort(chair,furniture).
sort(chair).
sort(furniture).

% sort table: furniture
 /*
subsort(table,furniture).
*/
subsort(table,furniture).
sort(table).
sort(furniture).

% 
% sort bill: physobj
 /*
subsort(bill,physobj).
*/
subsort(bill,physobj).
sort(bill).
sort(physobj).

% ectest/ec_reader_test_ecnet.e:355
% sort ticket: physobj
 /*
subsort(ticket,physobj).
*/
subsort(ticket,physobj).
sort(ticket).
sort(physobj).

% sort envelope: physobj
 /*
subsort(envelope,physobj).
*/
subsort(envelope,physobj).
sort(envelope).
sort(physobj).

% 
% sort text: physobj
 /*
subsort(text,physobj).
*/
subsort(text,physobj).
sort(text).
sort(physobj).

% sort book: text
 /*
subsort(book,text).
*/
subsort(book,text).
sort(book).
sort(text).

% sort letter: text
 /*
subsort(letter,text).
*/
subsort(letter,text).
sort(letter).
sort(text).

% ectest/ec_reader_test_ecnet.e:361
% sort menu: text
 /*
subsort(menu,text).
*/
subsort(menu,text).
sort(menu).
sort(text).

% 
% sort paper: physobj
 /*
subsort(paper,physobj).
*/
subsort(paper,physobj).
sort(paper).
sort(physobj).

% 
% sort content
 /*
sort(content).
*/
sort(content).

% sort script
 /*
sort(script).
*/
sort(script).

% ectest/ec_reader_test_ecnet.e:367
% 
% sort container: physobj
 /*
subsort(container,physobj).
*/
subsort(container,physobj).
sort(container).
sort(physobj).

% sort cigarette: physobj
 /*
subsort(cigarette,physobj).
*/
subsort(cigarette,physobj).
sort(cigarette).
sort(physobj).

% sort ashtray: physobj
 /*
subsort(ashtray,physobj).
*/
subsort(ashtray,physobj).
sort(ashtray).
sort(physobj).

% sort umbrella: physobj
 /*
subsort(umbrella,physobj).
*/
subsort(umbrella,physobj).
sort(umbrella).
sort(physobj).

% 
% ectest/ec_reader_test_ecnet.e:373
% sort pen: physobj
 /*
subsort(pen,physobj).
*/
subsort(pen,physobj).
sort(pen).
sort(physobj).

% 
%; End of file.
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/RTSpace.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:382
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; RTSpace: room-scale topological space
%;
%; We use topological and metric representations of space,
%; at two levels of granularity---room-scale and object-scale.
%; The RTSpace representation deals with topological space at
%; the scale of rooms and outdoor locations.
%; This representation of space consists of locations, which
%; are connected by portals. There are two types of locations:
%; rooms and outside areas (outsides).
%;
% ectest/ec_reader_test_ecnet.e:403
% 
%; object is at location.
% fluent At(object,location)
 /*
fluent(at(object,location)).
*/
fluent(at(object,location)).

% manualrelease At
 /*
manualrelease(at).
*/
manualrelease(at).

% 
% ectest/ec_reader_test_ecnet.e:408
% [object1,location,time]% 
% (
% ectest/ec_reader_test_ecnet.e:409
% {object2} PartOf(object1,object2)) ->
% ReleasedAt(At(object1,location),time).
 /*
exists([Object2],  (partOf(Object1, Object2)->releasedAt(at(Object1, Location), Time))).
*/
axiom(releasedAt(at(Object1,Location),Time) ',' some([Object2]),
      [partOf(Object1,Object2)]).

% 
% 
%; A state constraint says that an object
%; is at one location at a time:
% ectest/ec_reader_test_ecnet.e:414
% [object,location1,location2,time]% 
% HoldsAt(At(object,location1),time) &
% HoldsAt(At(object,location2),time) ->
% location1=location2.
 /*
holds_at(at(Object, Location1), Time), holds_at(at(Object, Location2), Time) ->
    Location1=Location2.
*/
axiom(equals(Location1,Location2),
      [ holds_at(at(Object,Location1),Time),
	holds_at(at(Object,Location2),Time)
      ]).

% 
% 
%; connectivity
% ectest/ec_reader_test_ecnet.e:420
% 
%; Side one of portal is location.
% function Side1(portal): location
 /*
function(side1(portal),location).
*/
function(side1(portal),location).

%; Side two of portal is location.
% function Side2(portal): location
 /*
function(side2(portal),location).
*/
function(side2(portal),location).

% 
%; The building of room is building.
% ectest/ec_reader_test_ecnet.e:427
% function BuildingOf(room): building
 /*
function(buildingOf(room),building).
*/
function(buildingOf(room),building).

% 
%; object is at a location that has portal.
% fluent NearPortal(object,portal)
 /*
fluent(nearPortal(object,portal)).
*/
fluent(nearPortal(object,portal)).

% noninertial NearPortal
 /*
noninertial(nearPortal).
*/
noninertial(nearPortal).

% 
%; A state constraint says that an object is near
%; a portal if and only if there is a location such that
%; the object is at the location and one of the sides
%; of the portal is the location:
% ectest/ec_reader_test_ecnet.e:437
% [object,portal,time]% 
% HoldsAt(NearPortal(object,portal),time) <->
% ectest/ec_reader_test_ecnet.e:439
% {location}% 
%  (Side1(portal)=location|
%   Side2(portal)=location) &
%  HoldsAt(At(object,location),time).
 /*
exists([Location],  (holds_at(nearPortal(Object, Portal), Time)<->(side1(Portal)=Location;side2(Portal)=Location), holds_at(at(Object, Location), Time))).
*/
axiom((side1(Portal) = Location ; side2(Portal) = Location) ',' holds_at(at(Object,Location),Time),
      [holds_at(nearPortal(Object,Portal),Time)]).
axiom(holds_at(nearPortal(Object,Portal),Time),
      [ side1(Portal) = Location ; side2(Portal) = Location,
	holds_at(at(Object,Location),Time)
      ]).

% 
% 
%; locking and unlocking doors
% ectest/ec_reader_test_ecnet.e:445
% 
%; agent unlocks door.
% event DoorUnlock(agent,door)
 /*
event(doorUnlock(agent,door)).
*/
event(doorUnlock(agent,door)).

%; agent locks door.
% event DoorLock(agent,door)
 /*
event(doorLock(agent,door)).
*/
event(doorLock(agent,door)).

%; door is unlocked.
% ectest/ec_reader_test_ecnet.e:451
% fluent DoorUnlocked(door)
 /*
fluent(doorUnlocked(door)).
*/
fluent(doorUnlocked(door)).

% 
%; A precondition axiom states that
%; for an agent to unlock a door,
%; the agent must be awake,
%; the door must not already be unlocked, and
%; the agent must be near the door:
% ectest/ec_reader_test_ecnet.e:458
% [agent,door,time]% 
% Happens(DoorUnlock(agent,door),time) ->
% HoldsAt(Awake(agent),time) &
% !HoldsAt(DoorUnlocked(door),time) &
% HoldsAt(NearPortal(agent,door),time).
 /*
happens(doorUnlock(Agent, Door), Time) ->
    holds_at(awake(Agent), Time),
    not(holds_at(doorUnlocked(Door), Time)),
    holds_at(nearPortal(Agent, Door), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' not(holds_at(doorUnlocked(Door),Time)) ',' holds_at(nearPortal(Agent,Door),Time),
      [happens(doorUnlock(Agent,Door),Time)]).

% 
% 
%; An effect axiom states that
%; if an agent unlocks a door,
%; the door will be unlocked:
% ectest/ec_reader_test_ecnet.e:467
% [agent,door,time]% 
% Initiates(DoorUnlock(agent,door),DoorUnlocked(door),time).
 /*
initiates(doorUnlock(Agent,Door),
	  doorUnlocked(Door),
	  Time).
*/
axiom(initiates(doorUnlock(Agent,Door),
		doorUnlocked(Door),
		Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to lock a door,
%; the agent must be awake,
%; the door must be unlocked, and
%; the agent must be near the door:
% ectest/ec_reader_test_ecnet.e:475
% [agent,door,time]% 
% Happens(DoorLock(agent,door),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(DoorUnlocked(door),time) &
% HoldsAt(NearPortal(agent,door),time).
 /*
happens(doorLock(Agent, Door), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(doorUnlocked(Door), Time),
    holds_at(nearPortal(Agent, Door), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(doorUnlocked(Door),Time) ',' holds_at(nearPortal(Agent,Door),Time),
      [happens(doorLock(Agent,Door),Time)]).

% 
% 
%; An effect axiom states that
%; if an agent locks a door,
%; the door will no longer be unlocked.
% ectest/ec_reader_test_ecnet.e:484
% [agent,door,time]% 
% Terminates(DoorLock(agent,door),DoorUnlocked(door),time).
 /*
terminates(doorLock(Agent,Door),
	   doorUnlocked(Door),
	   Time).
*/
axiom(terminates(doorLock(Agent,Door),
		 doorUnlocked(Door),
		 Time),
      []).

% 
% 
%; A state constraint says that if a door is open,
%; it is unlocked:
% ectest/ec_reader_test_ecnet.e:489
% [door,time]% 
% HoldsAt(DoorIsOpen(door),time) -> HoldsAt(DoorUnlocked(door),time).
 /*
holds_at(doorIsOpen(Door), Time) ->
    holds_at(doorUnlocked(Door), Time).
*/
axiom(holds_at(doorUnlocked(Door),Time),
      [holds_at(doorIsOpen(Door),Time)]).

% 
% 
%; opening and closing doors
% 
%; agent opens door.
% ectest/ec_reader_test_ecnet.e:495
% event DoorOpen(agent,door)
 /*
event(doorOpen(agent,door)).
*/
event(doorOpen(agent,door)).

%; agent closes door.
% event DoorClose(agent,door)
 /*
event(doorClose(agent,door)).
*/
event(doorClose(agent,door)).

%; door is open.
% fluent DoorIsOpen(door)
 /*
fluent(doorIsOpen(door)).
*/
fluent(doorIsOpen(door)).

% 
%; A precondition axiom states that
%; for an agent to open a door,
%; the agent must be awake,
%; the door must not already be open,
%; the door must be unlocked, and
%; the agent must be near the door:
% ectest/ec_reader_test_ecnet.e:507
% [agent,door,time]% 
% Happens(DoorOpen(agent,door),time) ->
% HoldsAt(Awake(agent),time) &
% !HoldsAt(DoorIsOpen(door),time) &
% HoldsAt(DoorUnlocked(door),time) &
% HoldsAt(NearPortal(agent,door),time).
 /*
happens(doorOpen(Agent, Door), Time) ->
    holds_at(awake(Agent), Time),
    not(holds_at(doorIsOpen(Door), Time)),
    holds_at(doorUnlocked(Door), Time),
    holds_at(nearPortal(Agent, Door), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' not(holds_at(doorIsOpen(Door),Time)) ',' holds_at(doorUnlocked(Door),Time) ',' holds_at(nearPortal(Agent,Door),Time),
      [happens(doorOpen(Agent,Door),Time)]).

% 
% ectest/ec_reader_test_ecnet.e:513
% 
%; An effect axiom states that
%; if an agent opens a door,
%; the door will be open:
% ectest/ec_reader_test_ecnet.e:517
% [agent,door,time]% 
% Initiates(DoorOpen(agent,door),DoorIsOpen(door),time).
 /*
initiates(doorOpen(Agent,Door),
	  doorIsOpen(Door),
	  Time).
*/
axiom(initiates(doorOpen(Agent,Door),
		doorIsOpen(Door),
		Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to close a door,
%; the agent must be awake,
%; the door must be open,
%; the door must be unlocked, and
%; the agent must be near the door:
% ectest/ec_reader_test_ecnet.e:526
% [agent,door,time]% 
% Happens(DoorClose(agent,door),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(DoorIsOpen(door),time) &
% HoldsAt(DoorUnlocked(door),time) &
% HoldsAt(NearPortal(agent,door),time).
 /*
happens(doorClose(Agent, Door), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(doorIsOpen(Door), Time),
    holds_at(doorUnlocked(Door), Time),
    holds_at(nearPortal(Agent, Door), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(doorIsOpen(Door),Time) ',' holds_at(doorUnlocked(Door),Time) ',' holds_at(nearPortal(Agent,Door),Time),
      [happens(doorClose(Agent,Door),Time)]).

% 
% ectest/ec_reader_test_ecnet.e:532
% 
%; An effect axiom states that
%; if an agent closes a door,
%; the door will no longer be open:
% ectest/ec_reader_test_ecnet.e:536
% [agent,door,time]% 
% Terminates(DoorClose(agent,door),DoorIsOpen(door),time).
 /*
terminates(doorClose(Agent,Door),
	   doorIsOpen(Door),
	   Time).
*/
axiom(terminates(doorClose(Agent,Door),
		 doorIsOpen(Door),
		 Time),
      []).

% 
% 
%; passing through doors
% 
%; agent walks through side one of door.
% ectest/ec_reader_test_ecnet.e:542
% event WalkThroughDoor12(agent,door)
 /*
event(walkThroughDoor12(agent,door)).
*/
event(walkThroughDoor12(agent,door)).

%; agent walks through side two of door.
% event WalkThroughDoor21(agent,door)
 /*
event(walkThroughDoor21(agent,door)).
*/
event(walkThroughDoor21(agent,door)).

% 
%; Precondition axioms state that
%; for an agent to walk through a side of a door,
%; the agent must be awake and standing,
%; the door must be open, and
%; the agent must be at the side of the door that
%; the agent walks through:
% ectest/ec_reader_test_ecnet.e:552
% [agent,door,time]% 
% Happens(WalkThroughDoor12(agent,door),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(Standing(agent),time) &
% HoldsAt(DoorIsOpen(door),time) &
% HoldsAt(At(agent,Side1(door)),time).
 /*
happens(walkThroughDoor12(Agent, Door), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(standing(Agent), Time),
    holds_at(doorIsOpen(Door), Time),
    holds_at(at(Agent, side1(Door)), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(standing(Agent),Time) ',' holds_at(doorIsOpen(Door),Time) ',' holds_at(at(Agent,side1(Door)),Time),
      [happens(walkThroughDoor12(Agent,Door),Time)]).

% 
% ectest/ec_reader_test_ecnet.e:558
% 
% ectest/ec_reader_test_ecnet.e:559
% [agent,door,time]% 
% Happens(WalkThroughDoor21(agent,door),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(Standing(agent),time) &
% HoldsAt(DoorIsOpen(door),time) &
% HoldsAt(At(agent,Side2(door)),time).
 /*
happens(walkThroughDoor21(Agent, Door), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(standing(Agent), Time),
    holds_at(doorIsOpen(Door), Time),
    holds_at(at(Agent, side2(Door)), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(standing(Agent),Time) ',' holds_at(doorIsOpen(Door),Time) ',' holds_at(at(Agent,side2(Door)),Time),
      [happens(walkThroughDoor21(Agent,Door),Time)]).

% 
% ectest/ec_reader_test_ecnet.e:565
% 
%; Effect axioms state that
%; if an agent walks through one side of a door,
%; the agent will be at the other side of the door:
% ectest/ec_reader_test_ecnet.e:569
% [agent,door,location,time]% 
% Side2(door)=location ->
% Initiates(WalkThroughDoor12(agent,door),At(agent,location),time).
 /*
side2(Door)=Location ->
    initiates(walkThroughDoor12(Agent, Door),
              at(Agent, Location),
              Time).
*/
axiom(initiates(walkThroughDoor12(Agent,Door),
		at(Agent,Location),
		Time),
      [equals(side2(Door),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:573
% [agent,door,location,time]% 
% Side1(door)=location ->
% Initiates(WalkThroughDoor21(agent,door),At(agent,location),time).
 /*
side1(Door)=Location ->
    initiates(walkThroughDoor21(Agent, Door),
              at(Agent, Location),
              Time).
*/
axiom(initiates(walkThroughDoor21(Agent,Door),
		at(Agent,Location),
		Time),
      [equals(side1(Door),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:577
% [agent,door,location,time]% 
% Side1(door)=location ->
% Terminates(WalkThroughDoor12(agent,door),At(agent,location),time).
 /*
side1(Door)=Location ->
    terminates(walkThroughDoor12(Agent, Door),
               at(Agent, Location),
               Time).
*/
axiom(terminates(walkThroughDoor12(Agent,Door),
		 at(Agent,Location),
		 Time),
      [equals(side1(Door),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:581
% [agent,door,location,time]% 
% Side2(door)=location ->
% Terminates(WalkThroughDoor21(agent,door),At(agent,location),time).
 /*
side2(Door)=Location ->
    terminates(walkThroughDoor21(Agent, Door),
               at(Agent, Location),
               Time).
*/
axiom(terminates(walkThroughDoor21(Agent,Door),
		 at(Agent,Location),
		 Time),
      [equals(side2(Door),Location)]).

% 
% 
%; walking from one end of a street to another
% 
%; agent walks from the first end of street to the second end.
% ectest/ec_reader_test_ecnet.e:588
% event WalkStreet12(agent,street)
 /*
event(walkStreet12(agent,street)).
*/
event(walkStreet12(agent,street)).

%; agent walks from the second end of street to the first end.
% event WalkStreet21(agent,street)
 /*
event(walkStreet21(agent,street)).
*/
event(walkStreet21(agent,street)).

% 
%; Precondition axioms state that
%; for an agent to walk from one end of a street to another,
%; the agent must be awake,
%; the agent must be standing, and
%; the agent must be at the first end of the street:
% ectest/ec_reader_test_ecnet.e:597
% [agent,street,time]% 
% Happens(WalkStreet12(agent,street),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(Standing(agent),time) &
% HoldsAt(At(agent,Side1(street)),time).
 /*
happens(walkStreet12(Agent, Street), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(standing(Agent), Time),
    holds_at(at(Agent, side1(Street)), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(standing(Agent),Time) ',' holds_at(at(Agent,side1(Street)),Time),
      [happens(walkStreet12(Agent,Street),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:603
% [agent,street,time]% 
% Happens(WalkStreet21(agent,street),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(Standing(agent),time) &
% HoldsAt(At(agent,Side2(street)),time).
 /*
happens(walkStreet21(Agent, Street), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(standing(Agent), Time),
    holds_at(at(Agent, side2(Street)), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(standing(Agent),Time) ',' holds_at(at(Agent,side2(Street)),Time),
      [happens(walkStreet21(Agent,Street),Time)]).

% 
% 
%; Effect axioms state that
%; if an agent walks from one end of a street to another,
%; the agent will be at the other end of the street:
% ectest/ec_reader_test_ecnet.e:612
% [agent,street,location,time]% 
% Side2(street)=location ->
% Initiates(WalkStreet12(agent,street),At(agent,location),time).
 /*
side2(Street)=Location ->
    initiates(walkStreet12(Agent, Street),
              at(Agent, Location),
              Time).
*/
axiom(initiates(walkStreet12(Agent,Street),
		at(Agent,Location),
		Time),
      [equals(side2(Street),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:616
% [agent,street,location,time]% 
% Side1(street)=location ->
% Initiates(WalkStreet21(agent,street),At(agent,location),time).
 /*
side1(Street)=Location ->
    initiates(walkStreet21(Agent, Street),
              at(Agent, Location),
              Time).
*/
axiom(initiates(walkStreet21(Agent,Street),
		at(Agent,Location),
		Time),
      [equals(side1(Street),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:620
% [agent,street,location,time]% 
% Side1(street)=location ->
% Terminates(WalkStreet12(agent,street),At(agent,location),time).
 /*
side1(Street)=Location ->
    terminates(walkStreet12(Agent, Street),
               at(Agent, Location),
               Time).
*/
axiom(terminates(walkStreet12(Agent,Street),
		 at(Agent,Location),
		 Time),
      [equals(side1(Street),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:624
% [agent,street,location,time]% 
% Side2(street)=location ->
% Terminates(WalkStreet21(agent,street),At(agent,location),time).
 /*
side2(Street)=Location ->
    terminates(walkStreet21(Agent, Street),
               at(Agent, Location),
               Time).
*/
axiom(terminates(walkStreet21(Agent,Street),
		 at(Agent,Location),
		 Time),
      [equals(side2(Street),Location)]).

% 
% 
%; floors
% 
%; The floor of room is integer.
% ectest/ec_reader_test_ecnet.e:631
% function Floor(room): integer
 /*
function(floor(room),integer).
*/
function(floor(room),integer).

% 
%; walking up and down staircases
% 
%; agent walks down staircase.
% event WalkDownStaircase(agent,staircase)
 /*
event(walkDownStaircase(agent,staircase)).
*/
event(walkDownStaircase(agent,staircase)).

% ectest/ec_reader_test_ecnet.e:637
%; agent walks up staircase.
% event WalkUpStaircase(agent,staircase)
 /*
event(walkUpStaircase(agent,staircase)).
*/
event(walkUpStaircase(agent,staircase)).

% 
%; Precondition axioms state that
%; for an agent to walk down (up) a staircase,
%; the agent must be awake, standing, and
%; at the top (bottom) of the staircase:
% ectest/ec_reader_test_ecnet.e:644
% [agent,staircase,time]% 
% Happens(WalkDownStaircase(agent,staircase),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(Standing(agent),time) &
% HoldsAt(At(agent,Side2(staircase)),time).
 /*
happens(walkDownStaircase(Agent, Staircase), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(standing(Agent), Time),
    holds_at(at(Agent, side2(Staircase)), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(standing(Agent),Time) ',' holds_at(at(Agent,side2(Staircase)),Time),
      [ happens(walkDownStaircase(Agent,Staircase),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:650
% [agent,staircase,time]% 
% Happens(WalkUpStaircase(agent,staircase),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(Standing(agent),time) &
% HoldsAt(At(agent,Side1(staircase)),time).
 /*
happens(walkUpStaircase(Agent, Staircase), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(standing(Agent), Time),
    holds_at(at(Agent, side1(Staircase)), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(standing(Agent),Time) ',' holds_at(at(Agent,side1(Staircase)),Time),
      [ happens(walkUpStaircase(Agent,Staircase),
		Time)
      ]).

% 
% 
%; Effect axioms state that
%; if an agent walks down (up) a staircase,
%; the agent will be at the bottom (top) of the staircase:
% ectest/ec_reader_test_ecnet.e:659
% [agent,staircase,room,time]% 
% Side1(staircase)=room ->
% Initiates(WalkDownStaircase(agent,staircase),At(agent,room),time).
 /*
side1(Staircase)=Room ->
    initiates(walkDownStaircase(Agent, Staircase),
              at(Agent, Room),
              Time).
*/
axiom(initiates(walkDownStaircase(Agent,Staircase),
		at(Agent,Room),
		Time),
      [equals(side1(Staircase),Room)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:663
% [agent,staircase,room,time]% 
% Side2(staircase)=room ->
% Terminates(WalkDownStaircase(agent,staircase),At(agent,room),time).
 /*
side2(Staircase)=Room ->
    terminates(walkDownStaircase(Agent, Staircase),
               at(Agent, Room),
               Time).
*/
axiom(terminates(walkDownStaircase(Agent,Staircase),
		 at(Agent,Room),
		 Time),
      [equals(side2(Staircase),Room)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:667
% [agent,staircase,room,time]% 
% Side2(staircase)=room ->
% Initiates(WalkUpStaircase(agent,staircase),At(agent,room),time).
 /*
side2(Staircase)=Room ->
    initiates(walkUpStaircase(Agent, Staircase),
              at(Agent, Room),
              Time).
*/
axiom(initiates(walkUpStaircase(Agent,Staircase),
		at(Agent,Room),
		Time),
      [equals(side2(Staircase),Room)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:671
% [agent,staircase,room,time]% 
% Side1(staircase)=room ->
% Terminates(WalkUpStaircase(agent,staircase),At(agent,room),time).
 /*
side1(Staircase)=Room ->
    terminates(walkUpStaircase(Agent, Staircase),
               at(Agent, Room),
               Time).
*/
axiom(terminates(walkUpStaircase(Agent,Staircase),
		 at(Agent,Room),
		 Time),
      [equals(side1(Staircase),Room)]).

% 
% 
%; A state constraint says that if an agent is outside,
%; the agent is dressed.
% ectest/ec_reader_test_ecnet.e:677
% [agent,outside,time]% 
% HoldsAt(At(agent,outside),time) ->
% HoldsAt(Dressed(agent),time).
 /*
holds_at(at(Agent, Outside), Time) ->
    holds_at(dressed(Agent), Time).
*/
axiom(holds_at(dressed(Agent),Time),
      [holds_at(at(Agent,Outside),Time)]).

% 
% 
%; room looks out onto outside.
% function LookOutOnto(room): outside
 /*
function(lookOutOnto(room),outside).
*/
function(lookOutOnto(room),outside).

% ectest/ec_reader_test_ecnet.e:683
% 
%; location1 is adjacent to location2.
% predicate Adjacent(location,location)
 /*
predicate(adjacent(location,location)).
*/
predicate(adjacent(location,location)).

% 
%; A state constraint says that
%; two locations are adjacent if and only if
%; they have a portal in common:
% ectest/ec_reader_test_ecnet.e:690
% [location1,location2] % Adjacent(location1,location2) <->
% ectest/ec_reader_test_ecnet.e:691
% {portal}% 
% (Side1(portal)=location1 &
%  Side2(portal)=location2) |
% (Side2(portal)=location1 &
%  Side1(portal)=location2).
 /*
exists([Portal],  (adjacent(Location1, Location2)<->side1(Portal)=Location1, side2(Portal)=Location2;side2(Portal)=Location1, side1(Portal)=Location2)).
*/
axiom(side1(Portal) = Location1 ',' side2(Portal) = Location2 ; side2(Portal) = Location1 ',' side1(Portal) = Location2,
      [adjacent(Location1,Location2)]).
axiom(adjacent(Location1,Location2),
      [ side1(Portal) = Location1 ',' side2(Portal) = Location2 ; side2(Portal) = Location1 ',' side1(Portal) = Location2
      ]).

% 
% 
%; The ground of outside is ground.
% ectest/ec_reader_test_ecnet.e:698
% function GroundOf(outside): ground
 /*
function(groundOf(outside),ground).
*/
function(groundOf(outside),ground).

%; The sky of outside is sky.
% function SkyOf(outside): sky
 /*
function(skyOf(outside),sky).
*/
function(skyOf(outside),sky).

% 
%; State constraints fix the location of ground and sky:
% ectest/ec_reader_test_ecnet.e:703
% [outside,ground,time]% 
% GroundOf(outside) = ground ->
% HoldsAt(At(ground,outside),time).
 /*
groundOf(Outside)=Ground ->
    holds_at(at(Ground, Outside), Time).
*/
axiom(holds_at(at(Ground,Outside),Time),
      [equals(groundOf(Outside),Ground)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:707
% [outside,sky,time]% 
% SkyOf(outside) = sky ->
% HoldsAt(At(sky,outside),time).
 /*
skyOf(Outside)=Sky ->
    holds_at(at(Sky, Outside), Time).
*/
axiom(holds_at(at(Sky,Outside),Time),
      [equals(skyOf(Outside),Sky)]).

% 
% 
%; End of file.
% 
% ectest/ec_reader_test_ecnet.e:713
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/OTSpace.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; OTSpace: object-scale topological space
%;
%; The OTSpace representation deals with topological space at
%; the scale of objects such as agents (humans and animals)
%; and physical objects.
%;
% ectest/ec_reader_test_ecnet.e:735
% 
%; PartOf
% 
%; physobj is a part of object.
% predicate PartOf(physobj,object)
 /*
predicate(partOf(physobj,object)).
*/
predicate(partOf(physobj,object)).

% 
%; A state constraint says that if a physical object
%; is part of an object, the location of the
%; physical object is the same as the location of the object:
% ectest/ec_reader_test_ecnet.e:744
% [physobj,object,location,time]% 
% PartOf(physobj,object) &
% HoldsAt(At(object,location),time) ->
% HoldsAt(At(physobj,location),time).
 /*
partOf(Physobj, Object), holds_at(at(Object, Location), Time) ->
    holds_at(at(Physobj, Location), Time).
*/
axiom(holds_at(at(Physobj,Location),Time),
      [ partOf(Physobj,Object),
	holds_at(at(Object,Location),Time)
      ]).

% 
% 
%; rolling a snowball bigger
% ectest/ec_reader_test_ecnet.e:750
% 
%; agent rolls stuff1 along stuff2.
% event RollAlong(agent,stuff,stuff)
 /*
event(rollAlong(agent,stuff,stuff)).
*/
event(rollAlong(agent,stuff,stuff)).

%; The diameter of ball is diameter.
% fluent Diameter(ball,diameter)
 /*
fluent(diameter(ball,diameter)).
*/
fluent(diameter(ball,diameter)).

% 
%; A state constraint says that a ball has a unique diameter:
% ectest/ec_reader_test_ecnet.e:757
% [ball,diameter1,diameter2,time]% 
% HoldsAt(Diameter(ball,diameter1),time) &
% HoldsAt(Diameter(ball,diameter2),time) ->
% diameter1=diameter2.
 /*
holds_at(diameter(Ball, Diameter1), Time), holds_at(diameter(Ball, Diameter2), Time) ->
    Diameter1=Diameter2.
*/
axiom(equals(Diameter1,Diameter2),
      [ holds_at(diameter(Ball,Diameter1),Time),
	holds_at(diameter(Ball,Diameter2),Time)
      ]).

% 
% 
%; Effect axiom state that if an agent rolls some snow along
%; some other snow, the diameter of the first snow will increase:
% ectest/ec_reader_test_ecnet.e:764
% [agent,snow1,snow2,diameter1,diameter2,time]% 
% HoldsAt(Diameter(snow1,diameter1),time) &
% diameter2 = diameter1+1 ->
% Initiates(RollAlong(agent,snow1,snow2),
%           Diameter(snow1,diameter2),
%           time).
 /*
holds_at(diameter(Snow1, Diameter1), Time), Diameter2=Diameter1+1 ->
    initiates(rollAlong(Agent, Snow1, Snow2),
              diameter(Snow1, Diameter2),
              Time).
*/
axiom(initiates(rollAlong(Agent,Snow1,Snow2),
		diameter(Snow1,Diameter2),
		Time),
      [ holds_at(diameter(Snow1,Diameter1),Time),
	equals(Diameter2,Diameter1+1)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:770
% 
% ectest/ec_reader_test_ecnet.e:771
% [agent,snow1,snow2,diameter1,time]% 
% HoldsAt(Diameter(snow1,diameter1),time) ->
% Terminates(RollAlong(agent,snow1,snow2),
%            Diameter(snow1,diameter1),
%            time).
 /*
holds_at(diameter(Snow1, Diameter1), Time) ->
    terminates(rollAlong(Agent, Snow1, Snow2),
               diameter(Snow1, Diameter1),
               Time).
*/
axiom(terminates(rollAlong(Agent,Snow1,Snow2),
		 diameter(Snow1,Diameter1),
		 Time),
      [holds_at(diameter(Snow1,Diameter1),Time)]).

% 
% 
%; A precondition axiom states that
%; for an agent to roll some snow along some other snow,
%; there must be a location such that
%; the agent is at the location,
%; the first snow is at the location, and
%; the second snow is at the location:
%;[agent,snow1,snow2,time]
%;Happens(RollAlong(agent,snow1,snow2),time) ->
%;{location}
%;HoldsAt(At(agent,location),time) &
%;HoldsAt(At(snow1,location),time) &
%;HoldsAt(At(snow2,location),time).
% ectest/ec_reader_test_ecnet.e:789
% 
%; motion
% 
%; object moves (in place).
% event Move(object)
 /*
event(move(object)).
*/
event(move(object)).

% 
%; Holding
% ectest/ec_reader_test_ecnet.e:796
% 
%; agent is holding physobj.
% fluent Holding(agent,physobj)
 /*
fluent(holding(agent,physobj)).
*/
fluent(holding(agent,physobj)).

%; agent holds or picks up physobj.
% event Hold(agent,physobj)
 /*
event(hold(agent,physobj)).
*/
event(hold(agent,physobj)).

%; agent picks up some stuff1 from stuff2.
% ectest/ec_reader_test_ecnet.e:802
% event HoldSome(agent,stuff,stuff)
 /*
event(holdSome(agent,stuff,stuff)).
*/
event(holdSome(agent,stuff,stuff)).

%; agent releases or lets go of physobj.
% event LetGoOf(agent,physobj)
 /*
event(letGoOf(agent,physobj)).
*/
event(letGoOf(agent,physobj)).

% 
%; An effect axiom states that if an agent holds
%; a physical object, the agent will be holding the
%; physical object:
% ectest/ec_reader_test_ecnet.e:809
% [agent,physobj,time]% 
% Initiates(Hold(agent,physobj),Holding(agent,physobj),time).
 /*
initiates(hold(Agent,Physobj),
	  holding(Agent,Physobj),
	  Time).
*/
axiom(initiates(hold(Agent,Physobj),
		holding(Agent,Physobj),
		Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to hold a physical object,
%; there must be a location such that
%; the agent is at the location and
%; the physical object is at the location:
%;[agent,physobj,time]
%;Happens(Hold(agent,physobj),time) ->
%;{location}
%;  HoldsAt(At(agent,location),time) &
%;  HoldsAt(At(physobj,location),time).
% ectest/ec_reader_test_ecnet.e:822
% 
%; An effect axiom states that if an agent
%; lets go of a physical object, the agent is no longer holding
%; the physical object:
% ectest/ec_reader_test_ecnet.e:826
% [agent,physobj,time]% 
% Terminates(LetGoOf(agent,physobj),Holding(agent,physobj),time).
 /*
terminates(letGoOf(Agent,Physobj),
	   holding(Agent,Physobj),
	   Time).
*/
axiom(terminates(letGoOf(Agent,Physobj),
		 holding(Agent,Physobj),
		 Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to let go of a physical object,
%; the agent must be holding the physical object:
% ectest/ec_reader_test_ecnet.e:832
% [agent,physobj,time]% 
% Happens(LetGoOf(agent,physobj),time) ->
% HoldsAt(Holding(agent,physobj),time).
 /*
happens(letGoOf(Agent, Physobj), Time) ->
    holds_at(holding(Agent, Physobj), Time).
*/
axiom(holds_at(holding(Agent,Physobj),Time),
      [happens(letGoOf(Agent,Physobj),Time)]).

% 
% 
%; A releases axiom states that if an agent holds
%; a physical object,
%; the physical object's location will be released
%; from inertia:
% ectest/ec_reader_test_ecnet.e:840
% [agent,physobj,location,time]% 
% Releases(Hold(agent,physobj),At(physobj,location),time).
 /*
releases(hold(Agent,Physobj),
	 at(Physobj,Location),
	 Time).
*/
axiom(releases(hold(Agent,Physobj),
	       at(Physobj,Location),
	       Time),
      []).

% 
% 
%; A state constraint says that if an agent is holding
%; a physical object and the agent is at a location,
%; the physical object is also at the location:
% ectest/ec_reader_test_ecnet.e:846
% [agent,physobj,location,time]% 
% HoldsAt(Holding(agent,physobj),time) &
% HoldsAt(At(agent,location),time) ->
% HoldsAt(At(physobj,location),time).
 /*
holds_at(holding(Agent, Physobj), Time), holds_at(at(Agent, Location), Time) ->
    holds_at(at(Physobj, Location), Time).
*/
axiom(holds_at(at(Physobj,Location),Time),
      [ holds_at(holding(Agent,Physobj),Time),
	holds_at(at(Agent,Location),Time)
      ]).

% 
% 
%; A releases axiom states that if an agent holds
%; a physical object,
%; the locations of the parts of the physical object
%; will be released from inertia:
% ectest/ec_reader_test_ecnet.e:855
% [agent,physobj1,physobj2,location,time]% 
% PartOf(physobj1,physobj2) ->
% Releases(Hold(agent,physobj2),At(physobj1,location),time).
 /*
partOf(Physobj1, Physobj2) ->
    releases(hold(Agent, Physobj2),
             at(Physobj1, Location),
             Time).
*/
axiom(releases(hold(Agent,Physobj2),
	       at(Physobj1,Location),
	       Time),
      [partOf(Physobj1,Physobj2)]).

% 
% 
%; Further, if an agent holds a physical object,
%; the locations of the physical objects of which
%; the physical object is a part
%; will be released from inertia:
% ectest/ec_reader_test_ecnet.e:863
% [agent,physobj1,physobj2,location,time]% 
% PartOf(physobj1,physobj2) ->
% Releases(Hold(agent,physobj1),At(physobj2,location),time).
 /*
partOf(Physobj1, Physobj2) ->
    releases(hold(Agent, Physobj1),
             at(Physobj2, Location),
             Time).
*/
axiom(releases(hold(Agent,Physobj1),
	       at(Physobj2,Location),
	       Time),
      [partOf(Physobj1,Physobj2)]).

% 
% 
%;[agent,physobj,location1,location2,time]
%;(!{object} PartOf(physobj,object)) &
%;HoldsAt(At(agent,location1),time) &
%;location1 != location2 ->
%;Terminates(LetGoOf(agent,physobj),At(physobj,location2),time).
% ectest/ec_reader_test_ecnet.e:872
% 
% ectest/ec_reader_test_ecnet.e:873
% [agent,physobj,location,time]% 
% (!{object} PartOf(physobj,object)) &
% HoldsAt(At(agent,location),time) ->
% Initiates(LetGoOf(agent,physobj),At(physobj,location),time).
 /*
not(exists([Object], partOf(Physobj, Object))), holds_at(at(Agent, Location), Time) ->
    initiates(letGoOf(Agent, Physobj),
              at(Physobj, Location),
              Time).
*/
axiom(initiates(letGoOf(Agent,Physobj),
		at(Physobj,Location),
		Time),
      [ neg(exists([Object],partOf(Physobj,Object))),
	holds_at(at(Agent,Location),Time)
      ]).

% 
% 
%;[agent,physobj1,physobj2,location1,location2,time]
%;PartOf(physobj1,physobj2) &
%;(!{object} PartOf(physobj2,object)) &
%;HoldsAt(At(agent,location1),time) &
%;location1 != location2 ->
%;Terminates(LetGoOf(agent,physobj1),At(physobj2,location2),time).
% ectest/ec_reader_test_ecnet.e:884
% 
% ectest/ec_reader_test_ecnet.e:885
% [agent,physobj1,physobj2,location,time]% 
% PartOf(physobj1,physobj2) &
% (!{object} PartOf(physobj2,object)) &
% HoldsAt(At(agent,location),time) ->
% Initiates(LetGoOf(agent,physobj1),At(physobj2,location),time).
 /*
partOf(Physobj1, Physobj2), not(exists([Object], partOf(Physobj2, Object))), holds_at(at(Agent, Location), Time) ->
    initiates(letGoOf(Agent, Physobj1),
              at(Physobj2, Location),
              Time).
*/
axiom(initiates(letGoOf(Agent,Physobj1),
		at(Physobj2,Location),
		Time),
      [ partOf(Physobj1,Physobj2),
	neg(exists([Object],partOf(Physobj2,Object))),
	holds_at(at(Agent,Location),Time)
      ]).

% 
% 
%; An effect axiom states that if an agent is at a location
%; and lets go of a physical object, the physical object
%; will be at the location:
% ectest/ec_reader_test_ecnet.e:894
% [agent,physobj,location,time]% 
% HoldsAt(At(agent,location),time) ->
% Initiates(LetGoOf(agent,physobj),At(physobj,location),time).
 /*
holds_at(at(Agent, Location), Time) ->
    initiates(letGoOf(Agent, Physobj),
              at(Physobj, Location),
              Time).
*/
axiom(initiates(letGoOf(Agent,Physobj),
		at(Physobj,Location),
		Time),
      [holds_at(at(Agent,Location),Time)]).

% 
% 
%; An effect axiom states that if an agent picks up
%; some stuff out of some other stuff, the agent will
%; be holding the first stuff:
% ectest/ec_reader_test_ecnet.e:901
% [agent,stuff1,stuff2,time]% 
% Initiates(HoldSome(agent,stuff1,stuff2),
%           Holding(agent,stuff1),
%           time).
 /*
initiates(holdSome(Agent,Stuff1,Stuff2),
	  holding(Agent,Stuff1),
	  Time).
*/
axiom(initiates(holdSome(Agent,Stuff1,Stuff2),
		holding(Agent,Stuff1),
		Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to pick up some stuff out of some other stuff,
%; the first stuff must be a part of the second stuff and
%; there must be a location such that the agent is at the location,
%; the first stuff is at the location, and the second stuff is
%; at the location:
% ectest/ec_reader_test_ecnet.e:912
% [agent,stuff1,stuff2,time]% 
% Happens(HoldSome(agent,stuff1,stuff2),time) ->
% PartOf(stuff1,stuff2) &
% ectest/ec_reader_test_ecnet.e:915
% {location}% 
%   HoldsAt(At(agent,location),time) &
%   HoldsAt(At(stuff1,location),time) &
%   HoldsAt(At(stuff2,location),time).
 /*
exists([Location],  (happens(holdSome(Agent, Stuff1, Stuff2), Time)->partOf(Stuff1, Stuff2), holds_at(at(Agent, Location), Time), holds_at(at(Stuff1, Location), Time), holds_at(at(Stuff2, Location), Time))).
*/
axiom(partOf(Stuff1,Stuff2) ',' holds_at(at(Agent,Location),Time) ',' holds_at(at(Stuff1,Location),Time) ',' holds_at(at(Stuff2,Location),Time) ',' some([Location]),
      [ happens(holdSome(Agent,Stuff1,Stuff2),
		Time)
      ]).

% 
% 
%; A releases axiom states that if an agent picks up some
%; stuff out of some other stuff,
%; the first stuff's location will be released
%; from inertia:
% ectest/ec_reader_test_ecnet.e:924
% [agent,stuff1,stuff2,location,time]% 
% Releases(HoldSome(agent,stuff1,stuff2),At(stuff1,location),time).
 /*
releases(holdSome(Agent,Stuff1,Stuff2),
	 at(Stuff1,Location),
	 Time).
*/
axiom(releases(holdSome(Agent,Stuff1,Stuff2),
	       at(Stuff1,Location),
	       Time),
      []).

% 
% 
%; Inside
% 
%; physobj1 is inside physobj2.
% ectest/ec_reader_test_ecnet.e:930
% fluent Inside(physobj,physobj)
 /*
fluent(inside(physobj,physobj)).
*/
fluent(inside(physobj,physobj)).

%; agent puts physobj1 inside physobj2.
% event PutInside(agent,physobj,physobj)
 /*
event(putInside(agent,physobj,physobj)).
*/
event(putInside(agent,physobj,physobj)).

%; agent takes physobj1 out of physobj2.
% event TakeOutOf(agent,physobj,physobj)
 /*
event(takeOutOf(agent,physobj,physobj)).
*/
event(takeOutOf(agent,physobj,physobj)).

% 
%; A state constraint says that a physical object cannot
%; be inside itself:
% ectest/ec_reader_test_ecnet.e:938
% [physobj1,physobj2,time]% 
% HoldsAt(Inside(physobj1,physobj2),time) ->
% physobj1!=physobj2.
 /*
holds_at(inside(Physobj1, Physobj2), Time) ->
    Physobj1\=Physobj2.
*/
axiom(diff(Physobj1,Physobj2),
      [holds_at(inside(Physobj1,Physobj2),Time)]).

% 
% 
%; A state constraint says that if a physical object is
%; inside another physical object, the second physical object
%; is not inside the first physical object:
% ectest/ec_reader_test_ecnet.e:945
% [physobj1,physobj2,time]% 
% HoldsAt(Inside(physobj1,physobj2),time) ->
% !HoldsAt(Inside(physobj2,physobj1),time).
 /*
holds_at(inside(Physobj1, Physobj2), Time) ->
    not(holds_at(inside(Physobj2, Physobj1), Time)).
*/
axiom(holds_at(neg(inside(Physobj2,Physobj1)),Time),
      [holds_at(inside(Physobj1,Physobj2),Time)]).

% 
% 
%; An effect axiom states that if an agent puts a physical
%; object inside another physical object, the first
%; physical object will be inside the second physical object:
% ectest/ec_reader_test_ecnet.e:952
% [agent,physobj1,physobj2,time]% 
% Initiates(PutInside(agent,physobj1,physobj2),
%           Inside(physobj1,physobj2),time).
 /*
initiates(putInside(Agent,Physobj1,Physobj2),
	  inside(Physobj1,Physobj2),
	  Time).
*/
axiom(initiates(putInside(Agent,Physobj1,Physobj2),
		inside(Physobj1,Physobj2),
		Time),
      []).

% 
% 
%; An effect axiom states that if an agent puts a physical
%; object inside another physical object, the agent will
%; no longer be holding the first physical object:
% ectest/ec_reader_test_ecnet.e:959
% [agent,physobj1,physobj2,time]% 
% Terminates(PutInside(agent,physobj1,physobj2),
%            Holding(agent,physobj1),time).
 /*
terminates(putInside(Agent,Physobj1,Physobj2),
	   holding(Agent,Physobj1),
	   Time).
*/
axiom(terminates(putInside(Agent,Physobj1,Physobj2),
		 holding(Agent,Physobj1),
		 Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to put a physical object inside another
%; physical object,
%; the agent must be holding the first physical object
%; and there must be a location such that
%; the agent is at the location and
%; the second physical object is at the location:
%;[agent,physobj1,physobj2,time]
%;Happens(PutInside(agent,physobj1,physobj2),time) ->
%;HoldsAt(Holding(agent,physobj1),time) &
%;{location}
%; HoldsAt(At(agent,location),time) &
%; HoldsAt(At(physobj2,location),time).
% ectest/ec_reader_test_ecnet.e:976
% 
%; An effect axiom states that
%; if an agent takes a physical object out of another
%; physical object, the first physical object
%; will no longer be inside the second physical object:
% ectest/ec_reader_test_ecnet.e:981
% [agent,physobj1,physobj2,time]% 
% Terminates(TakeOutOf(agent,physobj1,physobj2),
%            Inside(physobj1,physobj2),time).
 /*
terminates(takeOutOf(Agent,Physobj1,Physobj2),
	   inside(Physobj1,Physobj2),
	   Time).
*/
axiom(terminates(takeOutOf(Agent,Physobj1,Physobj2),
		 inside(Physobj1,Physobj2),
		 Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to take a physical object out of another
%; physical object,
%; the first physical object must be inside the second physical object
%; and there must be a location such that
%; the agent is at the location,
%; the first physical object is at the location, and
%; the second physical object is at the location:
% ectest/ec_reader_test_ecnet.e:993
% [agent,physobj1,physobj2,time]% 
% Happens(TakeOutOf(agent,physobj1,physobj2),time) ->
% HoldsAt(Inside(physobj1,physobj2),time) &
% ectest/ec_reader_test_ecnet.e:996
% {location}% 
%  HoldsAt(At(agent,location),time) &
%  HoldsAt(At(physobj1,location),time) &
%  HoldsAt(At(physobj2,location),time).
 /*
exists([Location],  (happens(takeOutOf(Agent, Physobj1, Physobj2), Time)->holds_at(inside(Physobj1, Physobj2), Time), holds_at(at(Agent, Location), Time), holds_at(at(Physobj1, Location), Time), holds_at(at(Physobj2, Location), Time))).
*/
axiom(holds_at(inside(Physobj1,Physobj2),Time) ',' holds_at(at(Agent,Location),Time) ',' holds_at(at(Physobj1,Location),Time) ',' holds_at(at(Physobj2,Location),Time) ',' some([Location]),
      [ happens(takeOutOf(Agent,Physobj1,Physobj2),
		Time)
      ]).

% 
% 
%; A releases axiom states that if an agent puts a physical
%; object inside another physical object,
%; the first physical object's location will be released
%; from inertia:
% ectest/ec_reader_test_ecnet.e:1005
% [agent,physobj1,physobj2,location,time]% 
% Releases(PutInside(agent,physobj1,physobj2),
%          At(physobj1,location),time).
 /*
releases(putInside(Agent,Physobj1,Physobj2),
	 at(Physobj1,Location),
	 Time).
*/
axiom(releases(putInside(Agent,Physobj1,Physobj2),
	       at(Physobj1,Location),
	       Time),
      []).

% 
% 
%; A state constraint says that if a physical object is inside
%; another physical object and the second physical object is
%; at a location, the first physical object is also at the location:
% ectest/ec_reader_test_ecnet.e:1012
% [physobj1,physobj2,location,time]% 
% HoldsAt(Inside(physobj1,physobj2),time) &
% HoldsAt(At(physobj2,location),time) ->
% HoldsAt(At(physobj1,location),time).
 /*
holds_at(inside(Physobj1, Physobj2), Time), holds_at(at(Physobj2, Location), Time) ->
    holds_at(at(Physobj1, Location), Time).
*/
axiom(holds_at(at(Physobj1,Location),Time),
      [ holds_at(inside(Physobj1,Physobj2),Time),
	holds_at(at(Physobj2,Location),Time)
      ]).

% 
% 
%; An effect axiom states that if an agent takes a physical
%; object out of another physical object,
%; the agent will be holding the first physical object:
% ectest/ec_reader_test_ecnet.e:1020
% [agent,physobj1,physobj2,time]% 
% Initiates(TakeOutOf(agent,physobj1,physobj2),
%           Holding(agent,physobj1),
%           time).
 /*
initiates(takeOutOf(Agent,Physobj1,Physobj2),
	  holding(Agent,Physobj1),
	  Time).
*/
axiom(initiates(takeOutOf(Agent,Physobj1,Physobj2),
		holding(Agent,Physobj1),
		Time),
      []).

% 
% 
%; On
% ectest/ec_reader_test_ecnet.e:1026
% 
%; physobj1 is on physobj2.
% fluent On(physobj,physobj)
 /*
fluent(on(physobj,physobj)).
*/
fluent(on(physobj,physobj)).

% 
%; agent places physobj1 on physobj2.
% event PlaceOn(agent,physobj,physobj)
 /*
event(placeOn(agent,physobj,physobj)).
*/
event(placeOn(agent,physobj,physobj)).

% ectest/ec_reader_test_ecnet.e:1032
%; agent takes physobj1 off of physobj2.
% event TakeOffOf(agent,physobj,physobj)
 /*
event(takeOffOf(agent,physobj,physobj)).
*/
event(takeOffOf(agent,physobj,physobj)).

% 
%; A state constraint says that a physical object cannot
%; be on itself:
% ectest/ec_reader_test_ecnet.e:1037
% [physobj1,physobj2,time]% 
% HoldsAt(On(physobj1,physobj2),time) ->
% physobj1!=physobj2.
 /*
holds_at(on(Physobj1, Physobj2), Time) ->
    Physobj1\=Physobj2.
*/
axiom(diff(Physobj1,Physobj2),
      [holds_at(on(Physobj1,Physobj2),Time)]).

% 
% 
%; A state constraint says that if a physical object is
%; on another physical object, the second physical object
%; is not on the first physical object:
% ectest/ec_reader_test_ecnet.e:1044
% [physobj1,physobj2,time]% 
% HoldsAt(On(physobj1,physobj2),time) ->
% !HoldsAt(On(physobj2,physobj1),time).
 /*
holds_at(on(Physobj1, Physobj2), Time) ->
    not(holds_at(on(Physobj2, Physobj1), Time)).
*/
axiom(holds_at(neg(on(Physobj2,Physobj1)),Time),
      [holds_at(on(Physobj1,Physobj2),Time)]).

% 
% 
%; An effect axiom states that if an agent places a physical
%; object on another physical object, the first
%; physical object will be on the second physical object:
% ectest/ec_reader_test_ecnet.e:1051
% [agent,physobj1,physobj2,time]% 
% Initiates(PlaceOn(agent,physobj1,physobj2),
%           On(physobj1,physobj2),time).
 /*
initiates(placeOn(Agent,Physobj1,Physobj2),
	  on(Physobj1,Physobj2),
	  Time).
*/
axiom(initiates(placeOn(Agent,Physobj1,Physobj2),
		on(Physobj1,Physobj2),
		Time),
      []).

% 
% 
%; An effect axiom states that if an agent places a physical
%; object on another physical object, the agent will
%; no longer be holding the first physical object:
% ectest/ec_reader_test_ecnet.e:1058
% [agent,physobj1,physobj2,time]% 
% Terminates(PlaceOn(agent,physobj1,physobj2),
%            Holding(agent,physobj1),time).
 /*
terminates(placeOn(Agent,Physobj1,Physobj2),
	   holding(Agent,Physobj1),
	   Time).
*/
axiom(terminates(placeOn(Agent,Physobj1,Physobj2),
		 holding(Agent,Physobj1),
		 Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to place a physical object on another
%; physical object,
%; the agent must be holding the first physical object
%; and there must be a location such that
%; the agent is at the location and
%; the second physical object is at the location:
%;[agent,physobj1,physobj2,time]
%;Happens(PlaceOn(agent,physobj1,physobj2),time) ->
%;HoldsAt(Holding(agent,physobj1),time) &
%;{location}
%; HoldsAt(At(agent,location),time) &
%; HoldsAt(At(physobj2,location),time).
% ectest/ec_reader_test_ecnet.e:1075
% 
%; An effect axiom states that
%; if an agent takes a physical object off of another
%; physical object, the first physical object
%; will no longer be on the second physical object:
% ectest/ec_reader_test_ecnet.e:1080
% [agent,physobj1,physobj2,time]% 
% Terminates(TakeOffOf(agent,physobj1,physobj2),
%            On(physobj1,physobj2),time).
 /*
terminates(takeOffOf(Agent,Physobj1,Physobj2),
	   on(Physobj1,Physobj2),
	   Time).
*/
axiom(terminates(takeOffOf(Agent,Physobj1,Physobj2),
		 on(Physobj1,Physobj2),
		 Time),
      []).

% 
% 
%; An effect axiom states that if an agent takes a physical
%; object off of another physical object,
%; the agent will be holding the first physical object:
% ectest/ec_reader_test_ecnet.e:1087
% [agent,physobj1,physobj2,time]% 
% Initiates(TakeOffOf(agent,physobj1,physobj2),
%           Holding(agent,physobj1),time).
 /*
initiates(takeOffOf(Agent,Physobj1,Physobj2),
	  holding(Agent,Physobj1),
	  Time).
*/
axiom(initiates(takeOffOf(Agent,Physobj1,Physobj2),
		holding(Agent,Physobj1),
		Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to take a physical object off of another
%; physical object,
%; the first physical object must be on the second physical object
%; and there must be a location such that
%; the agent is at the location and
%; the first physical object is at the location:
%; the second physical object is at the location:
% ectest/ec_reader_test_ecnet.e:1099
% [agent,physobj1,physobj2,time]% 
% Happens(TakeOffOf(agent,physobj1,physobj2),time) ->
% HoldsAt(On(physobj1,physobj2),time) &
% ectest/ec_reader_test_ecnet.e:1102
% {location}% 
%  HoldsAt(At(agent,location),time) &
%  HoldsAt(At(physobj1,location),time) &
%  HoldsAt(At(physobj2,location),time).
 /*
exists([Location],  (happens(takeOffOf(Agent, Physobj1, Physobj2), Time)->holds_at(on(Physobj1, Physobj2), Time), holds_at(at(Agent, Location), Time), holds_at(at(Physobj1, Location), Time), holds_at(at(Physobj2, Location), Time))).
*/
axiom(holds_at(on(Physobj1,Physobj2),Time) ',' holds_at(at(Agent,Location),Time) ',' holds_at(at(Physobj1,Location),Time) ',' holds_at(at(Physobj2,Location),Time) ',' some([Location]),
      [ happens(takeOffOf(Agent,Physobj1,Physobj2),
		Time)
      ]).

% 
% 
%; A releases axiom states that if an agent places a physical
%; object on another physical object,
%; the first physical object's location will be released
%; from inertia:
% ectest/ec_reader_test_ecnet.e:1111
% [agent,physobj1,physobj2,location,time]% 
% Releases(PlaceOn(agent,physobj1,physobj2),
%          At(physobj1,location),
%          time).
 /*
releases(placeOn(Agent,Physobj1,Physobj2),
	 at(Physobj1,Location),
	 Time).
*/
axiom(releases(placeOn(Agent,Physobj1,Physobj2),
	       at(Physobj1,Location),
	       Time),
      []).

% 
% 
%; A state constraint says that if a physical object is on
%; another physical object and the second physical object is
%; at a location, the first physical object is also at the location:
% ectest/ec_reader_test_ecnet.e:1119
% [physobj1,physobj2,location,time]% 
% HoldsAt(On(physobj1,physobj2),time) &
% HoldsAt(At(physobj2,location),time) ->
% HoldsAt(At(physobj1,location),time).
 /*
holds_at(on(Physobj1, Physobj2), Time), holds_at(at(Physobj2, Location), Time) ->
    holds_at(at(Physobj1, Location), Time).
*/
axiom(holds_at(at(Physobj1,Location),Time),
      [ holds_at(on(Physobj1,Physobj2),Time),
	holds_at(at(Physobj2,Location),Time)
      ]).

% 
% 
% fluent Near(agent,object)
 /*
fluent(near(agent,object)).
*/
fluent(near(agent,object)).

% ectest/ec_reader_test_ecnet.e:1125
% event WalkFromTo(agent,object,object)
 /*
event(walkFromTo(agent,object,object)).
*/
event(walkFromTo(agent,object,object)).

% event WalkFrom(agent,object)
 /*
event(walkFrom(agent,object)).
*/
event(walkFrom(agent,object)).

% event RunFromTo(agent,object,object)
 /*
event(runFromTo(agent,object,object)).
*/
event(runFromTo(agent,object,object)).

% 
% ectest/ec_reader_test_ecnet.e:1129
% [agent,object1,object2,time]% 
% Initiates(WalkFromTo(agent,object1,object2),
%           Near(agent,object2),
%           time).
 /*
initiates(walkFromTo(Agent,Object1,Object2),
	  near(Agent,Object2),
	  Time).
*/
axiom(initiates(walkFromTo(Agent,Object1,Object2),
		near(Agent,Object2),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:1134
% [agent,object1,object2,time]% 
% Terminates(WalkFromTo(agent,object1,object2),
%            Near(agent,object1),
%            time).
 /*
terminates(walkFromTo(Agent,Object1,Object2),
	   near(Agent,Object1),
	   Time).
*/
axiom(terminates(walkFromTo(Agent,Object1,Object2),
		 near(Agent,Object1),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:1139
% [agent,object1,object2,time]% 
% Happens(WalkFromTo(agent,object1,object2),time) ->
% ectest/ec_reader_test_ecnet.e:1141
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(object1,location),time) &
% HoldsAt(At(object2,location),time).
 /*
exists([Location],  (happens(walkFromTo(Agent, Object1, Object2), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Object1, Location), Time), holds_at(at(Object2, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Object1,Location),Time) ',' holds_at(at(Object2,Location),Time) ',' some([Location]),
      [ happens(walkFromTo(Agent,Object1,Object2),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:1146
% [agent,object1,object2,time]% 
% Initiates(RunFromTo(agent,object1,object2),
%           Near(agent,object2),
%           time).
 /*
initiates(runFromTo(Agent,Object1,Object2),
	  near(Agent,Object2),
	  Time).
*/
axiom(initiates(runFromTo(Agent,Object1,Object2),
		near(Agent,Object2),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:1151
% [agent,object1,object2,time]% 
% Terminates(RunFromTo(agent,object1,object2),
%            Near(agent,object1),
%            time).
 /*
terminates(runFromTo(Agent,Object1,Object2),
	   near(Agent,Object1),
	   Time).
*/
axiom(terminates(runFromTo(Agent,Object1,Object2),
		 near(Agent,Object1),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:1156
% [agent,object1,object2,time]% 
% Happens(RunFromTo(agent,object1,object2),time) ->
% ectest/ec_reader_test_ecnet.e:1158
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(object1,location),time) &
% HoldsAt(At(object2,location),time).
 /*
exists([Location],  (happens(runFromTo(Agent, Object1, Object2), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Object1, Location), Time), holds_at(at(Object2, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Object1,Location),Time) ',' holds_at(at(Object2,Location),Time) ',' some([Location]),
      [ happens(runFromTo(Agent,Object1,Object2),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:1163
% [agent,object,time]% 
% Terminates(WalkFrom(agent,object),
%            Near(agent,object),
%            time).
 /*
terminates(walkFrom(Agent,Object),
	   near(Agent,Object),
	   Time).
*/
axiom(terminates(walkFrom(Agent,Object),
		 near(Agent,Object),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:1168
% [agent,object,location,door,time]% 
% HoldsAt(Near(agent,object),time) &
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(object,location),time) &
% Side1(door)=location &
% Happens(WalkThroughDoor12(agent,door),time) ->
% Happens(WalkFrom(agent,object),time).
 /*
holds_at(near(Agent, Object), Time), holds_at(at(Agent, Location), Time), holds_at(at(Object, Location), Time), side1(Door)=Location, happens(walkThroughDoor12(Agent, Door), Time) ->
    happens(walkFrom(Agent, Object), Time).
*/
axiom(happens(walkFrom(Agent,Object),Time),
      [ holds_at(near(Agent,Object),Time),
	holds_at(at(Agent,Location),Time),
	holds_at(at(Object,Location),Time),
	equals(side1(Door),Location),
	happens(walkThroughDoor12(Agent,Door),Time)
      ]).

% ectest/ec_reader_test_ecnet.e:1174
% 
% 
% ectest/ec_reader_test_ecnet.e:1176
% [agent,object,location,door,time]% 
% HoldsAt(Near(agent,object),time) &
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(object,location),time) &
% Side2(door)=location &
% Happens(WalkThroughDoor21(agent,door),time) ->
% Happens(WalkFrom(agent,object),time).
 /*
holds_at(near(Agent, Object), Time), holds_at(at(Agent, Location), Time), holds_at(at(Object, Location), Time), side2(Door)=Location, happens(walkThroughDoor21(Agent, Door), Time) ->
    happens(walkFrom(Agent, Object), Time).
*/
axiom(happens(walkFrom(Agent,Object),Time),
      [ holds_at(near(Agent,Object),Time),
	holds_at(at(Agent,Location),Time),
	holds_at(at(Object,Location),Time),
	equals(side2(Door),Location),
	happens(walkThroughDoor21(Agent,Door),Time)
      ]).

% ectest/ec_reader_test_ecnet.e:1182
% 
% 
% ectest/ec_reader_test_ecnet.e:1184
% [agent,object,room,staircase,time]% 
% HoldsAt(Near(agent,object),time) &
% HoldsAt(At(agent,room),time) &
% HoldsAt(At(object,room),time) &
% Side1(staircase)=room &
% Happens(WalkUpStaircase(agent,staircase),time) ->
% Happens(WalkFrom(agent,object),time).
 /*
holds_at(near(Agent, Object), Time), holds_at(at(Agent, Room), Time), holds_at(at(Object, Room), Time), side1(Staircase)=Room, happens(walkUpStaircase(Agent, Staircase), Time) ->
    happens(walkFrom(Agent, Object), Time).
*/
axiom(happens(walkFrom(Agent,Object),Time),
      [ holds_at(near(Agent,Object),Time),
	holds_at(at(Agent,Room),Time),
	holds_at(at(Object,Room),Time),
	equals(side1(Staircase),Room),
	happens(walkUpStaircase(Agent,Staircase),
		Time)
      ]).

% ectest/ec_reader_test_ecnet.e:1190
% 
% 
% ectest/ec_reader_test_ecnet.e:1192
% [agent,object,room,staircase,time]% 
% HoldsAt(Near(agent,object),time) &
% HoldsAt(At(agent,room),time) &
% HoldsAt(At(object,room),time) &
% Side2(staircase)=room &
% Happens(WalkDownStaircase(agent,staircase),time) ->
% Happens(WalkFrom(agent,object),time).
 /*
holds_at(near(Agent, Object), Time), holds_at(at(Agent, Room), Time), holds_at(at(Object, Room), Time), side2(Staircase)=Room, happens(walkDownStaircase(Agent, Staircase), Time) ->
    happens(walkFrom(Agent, Object), Time).
*/
axiom(happens(walkFrom(Agent,Object),Time),
      [ holds_at(near(Agent,Object),Time),
	holds_at(at(Agent,Room),Time),
	holds_at(at(Object,Room),Time),
	equals(side2(Staircase),Room),
	happens(walkDownStaircase(Agent,Staircase),
		Time)
      ]).

% ectest/ec_reader_test_ecnet.e:1198
% 
% 
%; End of file.
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/OMSpace.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:1207
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; OMSpace: object-scale metric space
%;
%; The OMSpace representation deals with metric space at
%; the scale of objects.
%;
%; @article{Morgenstern:2001,
%;   author = "Morgenstern, Leora",
%;   year = "2001",
%;   title = "Mid-sized axiomatizations of commonsense problems: A case study in egg cracking",
%;   journal = "Studia Logica",
%;   volume = "67",
%;   pages = "333--384",
%; }
%;
%; @article{Shanahan:2003,
%;   author = "Shanahan, Murray",
%;   year = "2004",
%;   title = "An attempt to formalise a non-trivial benchmark problem in common sense reasoning",
%;   journal = "Artificial Intelligence",
%;   volume = "153",
%;   pages = "141--165",
%; }
%;
% ectest/ec_reader_test_ecnet.e:1241
% 
% sort height: integer
 /*
subsort(height,integer).
*/
subsort(height,integer).
sort(height).
sort(integer).

% sort distance: integer
 /*
subsort(distance,integer).
*/
subsort(distance,integer).
sort(distance).
sort(integer).

% 
%; Height
% 
%; The height of object is height.
% ectest/ec_reader_test_ecnet.e:1248
% fluent Height(object,height)
 /*
fluent(height(object,height)).
*/
fluent(height(object,height)).

% 
%; State constraint represent the fact that each
%; object has a unique height:
% ectest/ec_reader_test_ecnet.e:1252
% [object,height1,height2,time]% 
% HoldsAt(Height(object,height1),time) &
% HoldsAt(Height(object,height2),time) ->
% height1=height2.
 /*
holds_at(height(Object, Height1), Time), holds_at(height(Object, Height2), Time) ->
    Height1=Height2.
*/
axiom(equals(Height1,Height2),
      [ holds_at(height(Object,Height1),Time),
	holds_at(height(Object,Height2),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:1257
% [object,time]% 
% ectest/ec_reader_test_ecnet.e:1258
% {height}% 
% HoldsAt(Height(object,height),time).
 /*
exists([Height],
       holds_at(height(Object,Height),Time)).
*/
axiom(holds_at(height(Object,Height),Time),[]).

% 
% 
%; falling
% 
%; physobj1 is falling from physobj2 to physobj3.
% ectest/ec_reader_test_ecnet.e:1264
% fluent FallingFromTo(physobj,physobj,physobj)
 /*
fluent(fallingFromTo(physobj,physobj,physobj)).
*/
fluent(fallingFromTo(physobj,physobj,physobj)).

%; physobj1 starts falling from physobj2 to physobj3.
% event StartFallingFromTo(physobj,physobj,physobj)
 /*
event(startFallingFromTo(physobj,physobj,physobj)).
*/
event(startFallingFromTo(physobj,physobj,physobj)).

%; physobj1 collides with physobj2.
% event CollideWith(physobj,physobj)
 /*
event(collideWith(physobj,physobj)).
*/
event(collideWith(physobj,physobj)).

% 
%; An effect axiom states that if a first physical object starts
%; falling from a second physical object to a third physical
%; object, the first physical object will be falling from the
%; second physical object to the third physical object:
% ectest/ec_reader_test_ecnet.e:1274
% [physobj1,physobj2,physobj3,time]% 
% Initiates(StartFallingFromTo(physobj1,physobj2,physobj3),
%           FallingFromTo(physobj1,physobj2,physobj3),
%           time).
 /*
initiates(startFallingFromTo(Physobj1,
			     Physobj2,
			     Physobj3),
	  fallingFromTo(Physobj1,Physobj2,Physobj3),
	  Time).
*/
axiom(initiates(startFallingFromTo(Physobj1,
				   Physobj2,
				   Physobj3),
		fallingFromTo(Physobj1,
			      Physobj2,
			      Physobj3),
		Time),
      []).

% 
% 
%; A precondition axiom states that for
%; a first physical object to start
%; falling from a second physical object to a third physical
%; object,
%; the height of the first physical object and the
%; second physical object must be the same.
% ectest/ec_reader_test_ecnet.e:1285
% [physobj1,physobj2,physobj3,height1,height2,time]% 
% Happens(StartFallingFromTo(physobj1,physobj2,physobj3),time) &
% HoldsAt(Height(physobj1,height1),time) &
% HoldsAt(Height(physobj2,height2),time) ->
% height1=height2.
 /*
happens(startFallingFromTo(Physobj1, Physobj2, Physobj3), Time), holds_at(height(Physobj1, Height1), Time), holds_at(height(Physobj2, Height2), Time) ->
    Height1=Height2.
*/
axiom(equals(Height1,Height2),
      [ happens(startFallingFromTo(Physobj1,
				   Physobj2,
				   Physobj3),
		Time),
	holds_at(height(Physobj1,Height1),Time),
	holds_at(height(Physobj2,Height2),Time)
      ]).

% 
% 
%; A state constraint says that a physical object
%; cannot fall from itself, cannot fall to itself,
%; and cannot fall from and to the same physical object:
% ectest/ec_reader_test_ecnet.e:1294
% [physobj1,physobj2,physobj3,time]% 
% HoldsAt(FallingFromTo(physobj1,physobj2,physobj3),time) ->
% physobj1!=physobj2 &
% physobj1!=physobj3 &
% physobj2!=physobj3.
 /*
holds_at(fallingFromTo(Physobj1, Physobj2, Physobj3), Time) ->
    Physobj1\=Physobj2,
    Physobj1\=Physobj3,
    Physobj2\=Physobj3.
*/
axiom(Physobj1 \= Physobj2 ',' Physobj1 \= Physobj3 ',' Physobj2 \= Physobj3,
      [ holds_at(fallingFromTo(Physobj1,
			       Physobj2,
			       Physobj3),
		 Time)
      ]).

% 
% 
%; A state constraint says that the sky cannot fall:
% ectest/ec_reader_test_ecnet.e:1301
% [sky,physobj1,physobj2,time]% 
% !HoldsAt(FallingFromTo(sky,physobj1,physobj2),time).
 /*
not(holds_at(fallingFromTo(Sky,Physobj1,Physobj2),
	     Time)).
*/
axiom(holds_at(neg(fallingFromTo(Sky,
				 Physobj1,
				 Physobj2)),
	       Time),
      []).

% 
% 
%; A releases axiom states that if
%; if a first physical object starts
%; falling from a second physical object to a third physical
%; object, the height of the first physical object
%; will be released from inertia:
% ectest/ec_reader_test_ecnet.e:1309
% [physobj1,physobj2,physobj3,height,time]% 
% Releases(StartFallingFromTo(physobj1,physobj2,physobj3),
%          Height(physobj1,height),
%          time).
 /*
releases(startFallingFromTo(Physobj1,
			    Physobj2,
			    Physobj3),
	 height(Physobj1,Height),
	 Time).
*/
axiom(releases(startFallingFromTo(Physobj1,
				  Physobj2,
				  Physobj3),
	       height(Physobj1,Height),
	       Time),
      []).

% 
% 
%; A trajectory axiom states that
%; if a first physical object starts falling
%; from a second physical object
%; to a third physical object
%; at a time and
%; the first physical object has a height at the time,
%; then the first physical object will have a height
%; equal to the height minus an offset
%; at a time equal to the time plus the offset:
% ectest/ec_reader_test_ecnet.e:1323
% [physobj1,physobj2,physobj3,height1,height2,offset,time]% 
% HoldsAt(Height(physobj1,height1),time) &
% height2=height1-offset ->
% Trajectory(FallingFromTo(physobj1,physobj2,physobj3),time,
%            Height(physobj1,height2),offset).
 /*
holds_at(height(Physobj1, Height1), Time), Height2=Height1-Offset ->
    trajectory(fallingFromTo(Physobj1, Physobj2, Physobj3),
               Time,
               height(Physobj1, Height2),
               Offset).
*/
axiom(trajectory(fallingFromTo(Physobj1,
			       Physobj2,
			       Physobj3),
		 Time,
		 height(Physobj1,Height2),
		 Offset),
      [ holds_at(height(Physobj1,Height1),Time),
	equals(Height2,Height1-Offset)
      ]).

% 
% 
%; A trigger axiom states that
%; if a first physical object is falling
%; from a second physical object
%; to a third physical object and
%; the height of the first physical object
%; is the same as the height of the third physical object,
%; the first physical object collides with the
%; third physical object:
% ectest/ec_reader_test_ecnet.e:1337
% [physobj1,physobj2,physobj3,height,time]% 
% HoldsAt(FallingFromTo(physobj1,physobj2,physobj3),time) &
% HoldsAt(Height(physobj1,height),time) &
% HoldsAt(Height(physobj3,height),time) ->
% Happens(CollideWith(physobj1,physobj3),time).
 /*
holds_at(fallingFromTo(Physobj1, Physobj2, Physobj3), Time), holds_at(height(Physobj1, Height), Time), holds_at(height(Physobj3, Height), Time) ->
    happens(collideWith(Physobj1, Physobj3), Time).
*/
axiom(happens(collideWith(Physobj1,Physobj3),Time),
      [ holds_at(fallingFromTo(Physobj1,
			       Physobj2,
			       Physobj3),
		 Time),
	holds_at(height(Physobj1,Height),Time),
	holds_at(height(Physobj3,Height),Time)
      ]).

% 
% 
%; An effect axiom states that
%; if a first physical object is falling
%; from a second physical object
%; to a third physical object and
%; the first physical object collides with
%; the third physical object,
%; the first physical object will be on the third physical object:
% ectest/ec_reader_test_ecnet.e:1350
% [physobj1,physobj2,physobj3,time]% 
% HoldsAt(FallingFromTo(physobj1,physobj2,physobj3),time) ->
% Initiates(CollideWith(physobj1,physobj3),
%           On(physobj1,physobj3),
%           time).
 /*
holds_at(fallingFromTo(Physobj1, Physobj2, Physobj3), Time) ->
    initiates(collideWith(Physobj1, Physobj3),
              on(Physobj1, Physobj3),
              Time).
*/
axiom(initiates(collideWith(Physobj1,Physobj3),
		on(Physobj1,Physobj3),
		Time),
      [ holds_at(fallingFromTo(Physobj1,
			       Physobj2,
			       Physobj3),
		 Time)
      ]).

% 
% 
%; An effect axiom states that
%; if a physical object collides with another
%; physical object,
%; the height of the first physical object will
%; be the height of the second physical object:
% ectest/ec_reader_test_ecnet.e:1361
% [physobj1,physobj2,height,time]% 
% HoldsAt(Height(physobj2,height),time) ->
% Initiates(CollideWith(physobj1,physobj2),
%           Height(physobj1,height),
%           time).
 /*
holds_at(height(Physobj2, Height), Time) ->
    initiates(collideWith(Physobj1, Physobj2),
              height(Physobj1, Height),
              Time).
*/
axiom(initiates(collideWith(Physobj1,Physobj2),
		height(Physobj1,Height),
		Time),
      [holds_at(height(Physobj2,Height),Time)]).

% 
% 
%;[physobj1,physobj2,height1,height2,time]
%;HoldsAt(Height(physobj2,height1),time) &
%;height1 != height2 ->
%;Terminates(CollideWith(physobj1,physobj2),
%;           Height(physobj1,height2),
%;           time).
% ectest/ec_reader_test_ecnet.e:1373
% 
%; An effect axiom states that
%; if a first physical object is falling
%; from a second physical object
%; to a third physical object and
%; the first physical object collides with
%; the third physical object,
%; the first physical object will no longer be
%; falling from the second physical object to the
%; third physical object:
% ectest/ec_reader_test_ecnet.e:1383
% [physobj1,physobj2,physobj3,time]% 
% HoldsAt(FallingFromTo(physobj1,physobj2,physobj3),time) ->
% Terminates(CollideWith(physobj1,physobj3),
%            FallingFromTo(physobj1,physobj2,physobj3),
%            time).
 /*
holds_at(fallingFromTo(Physobj1, Physobj2, Physobj3), Time) ->
    terminates(collideWith(Physobj1, Physobj3),
               fallingFromTo(Physobj1, Physobj2, Physobj3),
               Time).
*/
axiom(terminates(collideWith(Physobj1,Physobj3),
		 fallingFromTo(Physobj1,
			       Physobj2,
			       Physobj3),
		 Time),
      [ holds_at(fallingFromTo(Physobj1,
			       Physobj2,
			       Physobj3),
		 Time)
      ]).

% 
% 
%; flying
% ectest/ec_reader_test_ecnet.e:1390
% 
%; agent is flying from physobj1 to physobj2.
% fluent FlyingFromTo(agent,physobj,physobj)
 /*
fluent(flyingFromTo(agent,physobj,physobj)).
*/
fluent(flyingFromTo(agent,physobj,physobj)).

%; agent starts flying from physobj1 to physobj2.
% event StartFlyingFromTo(agent,physobj,physobj)
 /*
event(startFlyingFromTo(agent,physobj,physobj)).
*/
event(startFlyingFromTo(agent,physobj,physobj)).

%; agent reaches physobj.
% ectest/ec_reader_test_ecnet.e:1396
% event Reach(agent,physobj)
 /*
event(reach(agent,physobj)).
*/
event(reach(agent,physobj)).

% 
%; An effect axiom states that if an agent starts
%; flying from a physical object to another physical object,
%; the agent will be flying from the first physical object
%; to the second physical object:
% ectest/ec_reader_test_ecnet.e:1402
% [agent,physobj1,physobj2,time]% 
% Initiates(StartFlyingFromTo(agent,physobj1,physobj2),
%           FlyingFromTo(agent,physobj1,physobj2),
%           time).
 /*
initiates(startFlyingFromTo(Agent,Physobj1,Physobj2),
	  flyingFromTo(Agent,Physobj1,Physobj2),
	  Time).
*/
axiom(initiates(startFlyingFromTo(Agent,
				  Physobj1,
				  Physobj2),
		flyingFromTo(Agent,Physobj1,Physobj2),
		Time),
      []).

% 
% 
%; A precondition axiom states that for
%; an agent to start flying from a physical object to
%; another physical object,
%; the height of the agent and
%; the first physical object must be the same:
% ectest/ec_reader_test_ecnet.e:1412
% [agent,physobj1,physobj2,height1,height2,time]% 
% Happens(StartFlyingFromTo(agent,physobj1,physobj2),time) &
% HoldsAt(Height(agent,height1),time) &
% HoldsAt(Height(physobj1,height2),time) ->
% height1=height2.
 /*
happens(startFlyingFromTo(Agent, Physobj1, Physobj2), Time), holds_at(height(Agent, Height1), Time), holds_at(height(Physobj1, Height2), Time) ->
    Height1=Height2.
*/
axiom(equals(Height1,Height2),
      [ happens(startFlyingFromTo(Agent,
				  Physobj1,
				  Physobj2),
		Time),
	holds_at(height(Agent,Height1),Time),
	holds_at(height(Physobj1,Height2),Time)
      ]).

% 
% 
%; A state constraint says that an agent
%; cannot fly from and to the same physical object:
% ectest/ec_reader_test_ecnet.e:1420
% [agent,physobj1,physobj2,time]% 
% HoldsAt(FlyingFromTo(agent,physobj1,physobj2),time) ->
% physobj1!=physobj2.
 /*
holds_at(flyingFromTo(Agent, Physobj1, Physobj2), Time) ->
    Physobj1\=Physobj2.
*/
axiom(diff(Physobj1,Physobj2),
      [ holds_at(flyingFromTo(Agent,
			      Physobj1,
			      Physobj2),
		 Time)
      ]).

% 
% 
%; A releases axiom states that if an agent
%; starts flying from a physical object to another
%; physical object, the height of the agent will
%; be released from inertia:
% ectest/ec_reader_test_ecnet.e:1428
% [agent,physobj1,physobj2,height,time]% 
% Releases(StartFlyingFromTo(agent,physobj1,physobj2),
%          Height(agent,height),
%          time).
 /*
releases(startFlyingFromTo(Agent,Physobj1,Physobj2),
	 height(Agent,Height),
	 Time).
*/
axiom(releases(startFlyingFromTo(Agent,
				 Physobj1,
				 Physobj2),
	       height(Agent,Height),
	       Time),
      []).

% 
% 
%; A trajectory axiom states that
%; if an agent starts flying from
%; from a physical object
%; to another physical object
%; at a time and
%; the agent has a height at the time,
%; then the agent will have a height
%; equal to the height plus an offset
%; at a time equal to the time plus the offset:
% ectest/ec_reader_test_ecnet.e:1442
% [agent,physobj1,physobj2,height1,height2,offset,time]% 
% HoldsAt(Height(agent,height1),time) &
% height2=height1+offset ->
% Trajectory(FlyingFromTo(agent,physobj1,physobj2),time,
%            Height(agent,height2),offset).
 /*
holds_at(height(Agent, Height1), Time), Height2=Height1+Offset ->
    trajectory(flyingFromTo(Agent, Physobj1, Physobj2),
               Time,
               height(Agent, Height2),
               Offset).
*/
axiom(trajectory(flyingFromTo(Agent,
			      Physobj1,
			      Physobj2),
		 Time,
		 height(Agent,Height2),
		 Offset),
      [ holds_at(height(Agent,Height1),Time),
	equals(Height2,Height1+Offset)
      ]).

% 
% 
%; A trigger axiom states that
%; if an agent is flying
%; from a physical object
%; to another physical object and
%; the height of the agent
%; is the same as the height of the second physical object,
%; the agent reaches the second physical object:
% ectest/ec_reader_test_ecnet.e:1455
% [agent,physobj1,physobj2,height,time]% 
% HoldsAt(FlyingFromTo(agent,physobj1,physobj2),time) &
% HoldsAt(Height(agent,height),time) &
% HoldsAt(Height(physobj2,height),time) ->
% Happens(Reach(agent,physobj2),time).
 /*
holds_at(flyingFromTo(Agent, Physobj1, Physobj2), Time), holds_at(height(Agent, Height), Time), holds_at(height(Physobj2, Height), Time) ->
    happens(reach(Agent, Physobj2), Time).
*/
axiom(happens(reach(Agent,Physobj2),Time),
      [ holds_at(flyingFromTo(Agent,
			      Physobj1,
			      Physobj2),
		 Time),
	holds_at(height(Agent,Height),Time),
	holds_at(height(Physobj2,Height),Time)
      ]).

% 
% 
%; An effect axiom states that
%; if an agent reaches a physical object,
%; the height of the agent will be the
%; height of the physical object:
% ectest/ec_reader_test_ecnet.e:1465
% [agent,physobj,height,time]% 
% HoldsAt(Height(physobj,height),time) ->
% Initiates(Reach(agent,physobj),Height(agent,height),time).
 /*
holds_at(height(Physobj, Height), Time) ->
    initiates(reach(Agent, Physobj),
              height(Agent, Height),
              Time).
*/
axiom(initiates(reach(Agent,Physobj),
		height(Agent,Height),
		Time),
      [holds_at(height(Physobj,Height),Time)]).

% 
% 
%;[agent,physobj,height1,height2,time]
%;HoldsAt(Height(physobj,height1),time) &
%;height1!=height2 ->
%;Terminates(Reach(agent,physobj),Height(agent,height2),time).
% ectest/ec_reader_test_ecnet.e:1473
% 
%; An effect axiom states that
%; if an agent is flying
%; from a physical object
%; to another physical object and
%; the agent reaches the second physical object,
%; the agent will no longer be
%; flying from the first physical object
%; to the second physical object:
% ectest/ec_reader_test_ecnet.e:1482
% [agent,physobj1,physobj2,time]% 
% HoldsAt(FlyingFromTo(agent,physobj1,physobj2),time) ->
% Terminates(Reach(agent,physobj2),
%            FlyingFromTo(agent,physobj1,physobj2),
%            time).
 /*
holds_at(flyingFromTo(Agent, Physobj1, Physobj2), Time) ->
    terminates(reach(Agent, Physobj2),
               flyingFromTo(Agent, Physobj1, Physobj2),
               Time).
*/
axiom(terminates(reach(Agent,Physobj2),
		 flyingFromTo(Agent,
			      Physobj1,
			      Physobj2),
		 Time),
      [ holds_at(flyingFromTo(Agent,
			      Physobj1,
			      Physobj2),
		 Time)
      ]).

% 
% 
%; A releases axiom states that
%; if an agent holds a physical object,
%; the height of the physical object is released from inertia:
% ectest/ec_reader_test_ecnet.e:1491
% [agent,physobj,height,time]% 
% Releases(Hold(agent,physobj),Height(physobj,height),time).
 /*
releases(hold(Agent,Physobj),
	 height(Physobj,Height),
	 Time).
*/
axiom(releases(hold(Agent,Physobj),
	       height(Physobj,Height),
	       Time),
      []).

% 
% 
%;[agent,physobj,height1,height2,time]
%;(!{object} PartOf(physobj,object)) &
%;HoldsAt(Height(physobj,height1),time) &
%;height1 != height2 ->
%;Terminates(LetGoOf(agent,physobj),Height(physobj,height2),time).
% ectest/ec_reader_test_ecnet.e:1499
% 
% ectest/ec_reader_test_ecnet.e:1500
% [agent,physobj,height,time]% 
% (!{object} PartOf(physobj,object)) &
% HoldsAt(Height(physobj,height),time) ->
% Initiates(LetGoOf(agent,physobj),Height(physobj,height),time).
 /*
not(exists([Object], partOf(Physobj, Object))), holds_at(height(Physobj, Height), Time) ->
    initiates(letGoOf(Agent, Physobj),
              height(Physobj, Height),
              Time).
*/
axiom(initiates(letGoOf(Agent,Physobj),
		height(Physobj,Height),
		Time),
      [ neg(exists([Object],partOf(Physobj,Object))),
	holds_at(height(Physobj,Height),Time)
      ]).

% 
% 
%; A state constraint says that
%; if an agent is holding a physical object and
%; the height of the agent is height,
%; the height of the physical object is height:
% ectest/ec_reader_test_ecnet.e:1509
% [agent,physobj,height,time]% 
% HoldsAt(Holding(agent,physobj),time) &
% HoldsAt(Height(agent,height),time) ->
% HoldsAt(Height(physobj,height),time).
 /*
holds_at(holding(Agent, Physobj), Time), holds_at(height(Agent, Height), Time) ->
    holds_at(height(Physobj, Height), Time).
*/
axiom(holds_at(height(Physobj,Height),Time),
      [ holds_at(holding(Agent,Physobj),Time),
	holds_at(height(Agent,Height),Time)
      ]).

% 
% 
%; A state constraint says that if a physical object
%; is part of an object,
%; the height of the physical object
%; is the same as the height of the object:
% ectest/ec_reader_test_ecnet.e:1518
% [physobj,object,height,time]% 
% PartOf(physobj,object) &
% HoldsAt(Height(object,height),time) ->
% HoldsAt(Height(physobj,height),time).
 /*
partOf(Physobj, Object), holds_at(height(Object, Height), Time) ->
    holds_at(height(Physobj, Height), Time).
*/
axiom(holds_at(height(Physobj,Height),Time),
      [ partOf(Physobj,Object),
	holds_at(height(Object,Height),Time)
      ]).

% 
% 
%;event Catch(agent,physobj)
%;event HitFromTo(agent,physobj,object,object)
%;fluent Distance(physobj,physobj,distance)
%;fluent FlyingAcrossFromTo(physobj,object,object)
% ectest/ec_reader_test_ecnet.e:1527
% 
%;[agent,physobj1,physobj2,physobj3,time]
%;Initiates(HitFromTo(agent,physobj1,physobj2,physobj3),
%;          FlyingAcrossFromTo(physobj1,physobj2,physobj3),
%;          time).
% 
%;[agent,physobj1,physobj2,physobj3,distance,time]
%;Releases(HitFromTo(agent,physobj1,physobj2,physobj3),
%;         Distance(physobj1,physobj2,distance),
%;         time).
% ectest/ec_reader_test_ecnet.e:1537
% 
%;[agent,physobj1,physobj2,physobj3,distance,time]
%;Releases(HitFromTo(agent,physobj1,physobj2,physobj3),
%;         Distance(physobj1,physobj3,distance),
%;         time).
% 
%;[physobj1,physobj2,physobj3,offset,time]
%;Trajectory(FlyingAcrossFromTo(physobj1,physobj2,physobj3),time,
%;           Distance(physobj1,physobj2,offset),offset).
% ectest/ec_reader_test_ecnet.e:1546
% 
%;[physobj1,physobj2,physobj3,distance1,distance2,offset,time]
%;HoldsAt(Distance(physobj2,physobj3,distance1),time) &
%;distance2 = distance1 - time ->
%;Trajectory(FlyingAcrossFromTo(physobj1,physobj2,physobj3),time,
%;           Distance(physobj1,physobj3,distance2),offset).
% ectest/ec_reader_test_ecnet.e:1552
% 
%;[agent,physobj1,physobj2,physobj3,time]
%;HoldsAt(FlyingAcrossFromTo(physobj1,physobj2,physobj3),time) ->
%;Initiates(Catch(agent,physobj1),
%;          Holding(agent,physobj1),
%;          time).
% ectest/ec_reader_test_ecnet.e:1558
% 
%;[agent,physobj1,physobj2,physobj3,time]
%;HoldsAt(FlyingAcrossFromTo(physobj1,physobj2,physobj3),time) ->
%;Terminates(Catch(agent,physobj1),
%;           FlyingAcrossFromTo(physobj1,physobj2,physobj3),
%;           time).
% ectest/ec_reader_test_ecnet.e:1564
% 
%; End of file.
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/GSpace.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:1572
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; GSpace: grid space
%;
%; @book{Mueller:1998,
%;   author = "Erik T. Mueller",
%;   year = "1998",
%;   title = "Natural Language Processing with \uppercase{T}hought\uppercase{T}reasure",
%;   address = "New York",
%;   publisher = "Signiform",
%; }
%;
% ectest/ec_reader_test_ecnet.e:1593
% 
% sort coord: integer
 /*
subsort(coord,integer).
*/
subsort(coord,integer).
sort(coord).
sort(integer).

% sort grid
 /*
sort(grid).
*/
sort(grid).

% 
%; object is at (coord1, coord2) in grid.
% fluent GridAt(grid,object,coord,coord)
 /*
fluent(gridAt(grid,object,coord,coord)).
*/
fluent(gridAt(grid,object,coord,coord)).

% ectest/ec_reader_test_ecnet.e:1599
% 
%; agent walks from (coord1, coord2)
%; to (coord3, coord4) in grid.
% event GridWalk(grid,agent,coord,coord,coord,coord)
 /*
event(gridWalk(grid,agent,coord,coord,coord,coord)).
*/
event(gridWalk(grid,agent,coord,coord,coord,coord)).

% 
%; A state constraint says that for a given grid an
%; object is at one cell in that grid at a time:
% ectest/ec_reader_test_ecnet.e:1606
% [grid,object,coord1,coord2,coord3,coord4,time]% 
% HoldsAt(GridAt(grid,object,coord1,coord2),time) &
% HoldsAt(GridAt(grid,object,coord3,coord4),time) ->
% coord1=coord3 & coord2=coord4.
 /*
holds_at(gridAt(Grid, Object, Coord1, Coord2), Time), holds_at(gridAt(Grid, Object, Coord3, Coord4), Time) ->
    Coord1=Coord3,
    Coord2=Coord4.
*/
axiom(Coord1 = Coord3 ',' Coord2 = Coord4,
      [ holds_at(gridAt(Grid,
			Object,
			Coord1,
			Coord2),
		 Time),
	holds_at(gridAt(Grid,
			Object,
			Coord3,
			Coord4),
		 Time)
      ]).

% 
% 
%; An effect axiom states that
%; if an agent walks from one cell in a grid to another cell,
%; the agent will be at second cell:
% ectest/ec_reader_test_ecnet.e:1614
% [grid,agent,coord1,coord2,coord3,coord4,time]% 
% Initiates(GridWalk(grid,agent,coord1,coord2,coord3,coord4),
%           GridAt(grid,agent,coord3,coord4),
%           time).
 /*
initiates(gridWalk(Grid,
		   Agent,
		   Coord1,
		   Coord2,
		   Coord3,
		   Coord4),
	  gridAt(Grid,Agent,Coord3,Coord4),
	  Time).
*/
axiom(initiates(gridWalk(Grid,
			 Agent,
			 Coord1,
			 Coord2,
			 Coord3,
			 Coord4),
		gridAt(Grid,
		       Agent,
		       Coord3,
		       Coord4),
		Time),
      []).

% 
% 
%; An effect axiom states that
%; if an agent walks from one cell in a grid to another cell,
%; the agent will no longer be at the first cell:
% ectest/ec_reader_test_ecnet.e:1622
% [grid,agent,coord1,coord2,coord3,coord4,time]% 
% Terminates(GridWalk(grid,agent,coord1,coord2,coord3,coord4),
%            GridAt(grid,agent,coord1,coord2),
%            time).
 /*
terminates(gridWalk(Grid,
		    Agent,
		    Coord1,
		    Coord2,
		    Coord3,
		    Coord4),
	   gridAt(Grid,Agent,Coord1,Coord2),
	   Time).
*/
axiom(terminates(gridWalk(Grid,
			  Agent,
			  Coord1,
			  Coord2,
			  Coord3,
			  Coord4),
		 gridAt(Grid,
			Agent,
			Coord1,
			Coord2),
		 Time),
      []).

% 
% 
%; A precondition axiom states that for an agent to walk
%; from one cell in a grid to another cell, the agent
%; must be at the first cell, the second cell must not
%; be occupied, and the first cell must be adjacent to
%; the second cell:
% ectest/ec_reader_test_ecnet.e:1632
% [grid,agent,coord1,coord2,coord3,coord4,time]% 
% Happens(GridWalk(grid,agent,coord1,coord2,coord3,coord4),time) ->
% HoldsAt(GridAt(grid,agent,coord1,coord2),time) &
% (!{object} HoldsAt(GridAt(grid,object,coord3,coord4),time)) &
% (coord1=coord3 |
%  coord1=coord3+1 |
%  coord1=coord3-1) &
% (coord2=coord4 |
%  coord2=coord4+1 |
%  coord2=coord4-1).
 /*
happens(gridWalk(Grid, Agent, Coord1, Coord2, Coord3, Coord4), Time) ->
    holds_at(gridAt(Grid, Agent, Coord1, Coord2),
             Time),
    not(exists([Object],
               holds_at(gridAt(Grid,
                               Object,
                               Coord3,
                               Coord4),
                        Time))),
    (   Coord1=Coord3
    ;   Coord1=Coord3+1
    ;   Coord1=Coord3-1
    ),
    (   Coord2=Coord4
    ;   Coord2=Coord4+1
    ;   Coord2=Coord4-1
    ).
*/
axiom(holds_at(gridAt(Grid,Agent,Coord1,Coord2),
	       Time) ',' not(exists([Object],
		 holds_at(gridAt(Grid,
				 Object,
				 Coord3,
				 Coord4),
			  Time))) ',' (Coord1 = Coord3 ; Coord1 = Coord3 + 1 ; Coord1 = Coord3 - 1) ',' (Coord2 = Coord4 ; Coord2 = Coord4 + 1 ; Coord2 = Coord4 - 1),
      [ happens(gridWalk(Grid,
			 Agent,
			 Coord1,
			 Coord2,
			 Coord3,
			 Coord4),
		Time)
      ]).

% ectest/ec_reader_test_ecnet.e:1641
% 
% 
%; End of file.
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/PolySpace.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:1650
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; @phdthesis{Cassimatis:2002,
%;   author = "Nicholas L. Cassimatis",
%;   year = "2002",
%;   title = "Polyscheme: A Cognitive Architecture for Integrating Multiple Representation and Inference Schemes",
%;   address = "Cambridge, MA",
%;   school = "Program in Media Arts and Sciences, School of Architecture and Planning, Massachusetts Institute of Technology",
%; }
%;
% ectest/ec_reader_test_ecnet.e:1669
% 
%; sorts
% sort object
 /*
sort(object).
*/
sort(object).

% sort xcoord: integer
 /*
subsort(xcoord,integer).
*/
subsort(xcoord,integer).
sort(xcoord).
sort(integer).

% sort ycoord: integer
 /*
subsort(ycoord,integer).
*/
subsort(ycoord,integer).
sort(ycoord).
sort(integer).

% sort grid
 /*
sort(grid).
*/
sort(grid).

% ectest/ec_reader_test_ecnet.e:1675
% sort shape
 /*
sort(shape).
*/
sort(shape).

% sort color
 /*
sort(color).
*/
sort(color).

% 
%; constants
% shape Round,Square
 /*
t(shape,round).
*/
sort(shape).
t(shape,round).

 /*
t(shape,square).
*/
sort(shape).
t(shape,square).

% color Red,Green
 /*
t(color,red).
*/
sort(color).
t(color,red).

 /*
t(color,green).
*/
sort(color).
t(color,green).

% ectest/ec_reader_test_ecnet.e:1681
% 
%; predicates, fluents, and events
% predicate Equal(object,object)
 /*
predicate(equal(object,object)).
*/
predicate(equal(object,object)).

% predicate Shape(object,shape)
 /*
predicate(shape(object,shape)).
*/
predicate(shape(object,shape)).

% predicate Color(object,color)
 /*
predicate(color(object,color)).
*/
predicate(color(object,color)).

% fluent Location(grid,object,xcoord,ycoord)
 /*
fluent(location(grid,object,xcoord,ycoord)).
*/
fluent(location(grid,object,xcoord,ycoord)).

% ectest/ec_reader_test_ecnet.e:1687
% event Move(grid,object,xcoord,ycoord,xcoord,ycoord)
 /*
event(move(grid,object,xcoord,ycoord,xcoord,ycoord)).
*/
event(move(grid,object,xcoord,ycoord,xcoord,ycoord)).

% 
%; axioms
% 
% ectest/ec_reader_test_ecnet.e:1691
% [object1,object2] % Equal(object1,object2) -> Equal(object2,object1).
 /*
equal(Object1, Object2) ->
    equal(Object2, Object1).
*/
axiom(equal(Object2,Object1),
      [equal(Object1,Object2)]).

% 
% 
%; objects have unique shape
% ectest/ec_reader_test_ecnet.e:1694
% [object,shape1,shape2]% 
% Shape(object,shape1) & Shape(object,shape2) ->
% shape1=shape2.
 /*
shape(Object, Shape1), shape(Object, Shape2) ->
    Shape1=Shape2.
*/
axiom(equals(Shape1,Shape2),
      [ shape(Object,Shape1),
	shape(Object,Shape2)
      ]).

% 
% 
%; objects have unique color
% ectest/ec_reader_test_ecnet.e:1699
% [object,color1,color2]% 
% Color(object,color1) & Color(object,color2) ->
% color1=color2.
 /*
color(Object, Color1), color(Object, Color2) ->
    Color1=Color2.
*/
axiom(equals(Color1,Color2),
      [ color(Object,Color1),
	color(Object,Color2)
      ]).

% 
% 
%; if objects are the same, they have the same shape
% ectest/ec_reader_test_ecnet.e:1704
% [object1,object2]% 
% Equal(object1,object2) ->
% ({shape} Shape(object1,shape) & Shape(object2,shape)).
 /*
equal(Object1, Object2) ->
    exists([Shape],
            (shape(Object1, Shape), shape(Object2, Shape))).
*/
axiom(shape(Object1,Shape) ',' shape(Object2,Shape) ',' some([Shape]),
      [equal(Object1,Object2)]).

% 
% 
%; if objects are the same, they have the same color
% ectest/ec_reader_test_ecnet.e:1709
% [object1,object2]% 
% Equal(object1,object2) ->
% ({color} Color(object1,color) & Color(object2,color)).
 /*
equal(Object1, Object2) ->
    exists([Color],
            (color(Object1, Color), color(Object2, Color))).
*/
axiom(color(Object1,Color) ',' color(Object2,Color) ',' some([Color]),
      [equal(Object1,Object2)]).

% 
% 
%; if objects are the same, they have the same location
% ectest/ec_reader_test_ecnet.e:1714
% [grid,object1,object2,xcoord1,ycoord1,xcoord2,ycoord2,time]% 
% Equal(object1,object2) ->
% (HoldsAt(Location(grid,object1,xcoord1,ycoord1),time) &
%  HoldsAt(Location(grid,object2,xcoord2,ycoord2),time) ->
%  xcoord1=xcoord2 & ycoord1=ycoord2).
 /*
equal(Object1, Object2) ->
    ( holds_at(location(Grid, Object1, Xcoord1, Ycoord1), Time), holds_at(location(Grid, Object2, Xcoord2, Ycoord2), Time)->Xcoord1=Xcoord2, Ycoord1=Ycoord2
    ).
*/
axiom(axiom(Xcoord1 = Xcoord2 ',' Ycoord1 = Ycoord2,
	    [ holds_at(location(Grid,
				Object1,
				Xcoord1,
				Ycoord1),
		       Time),
	      holds_at(location(Grid,
				Object2,
				Xcoord2,
				Ycoord2),
		       Time)
	    ]),
      [equal(Object1,Object2)]).

% 
% 
%; object in one location at a time
% ectest/ec_reader_test_ecnet.e:1721
% [grid,object,xcoord1,ycoord1,xcoord2,ycoord2,time]% 
% HoldsAt(Location(grid,object,xcoord1,ycoord1),time) &
% HoldsAt(Location(grid,object,xcoord2,ycoord2),time) ->
% xcoord1=xcoord2 & ycoord1=ycoord2.
 /*
holds_at(location(Grid, Object, Xcoord1, Ycoord1), Time), holds_at(location(Grid, Object, Xcoord2, Ycoord2), Time) ->
    Xcoord1=Xcoord2,
    Ycoord1=Ycoord2.
*/
axiom(Xcoord1 = Xcoord2 ',' Ycoord1 = Ycoord2,
      [ holds_at(location(Grid,
			  Object,
			  Xcoord1,
			  Ycoord1),
		 Time),
	holds_at(location(Grid,
			  Object,
			  Xcoord2,
			  Ycoord2),
		 Time)
      ]).

% 
% 
%; objects have locations
% ectest/ec_reader_test_ecnet.e:1727
% [grid,object,time]% 
% (
% ectest/ec_reader_test_ecnet.e:1728
% {xcoord,ycoord} HoldsAt(Location(grid,object,xcoord,ycoord),time)).
 /*
exists([Xcoord,Ycoord],
       holds_at(location(Grid,
			 Object,
			 Xcoord,
			 Ycoord),
		Time)).
*/
axiom(holds_at(location(Grid,
			Object,
			Xcoord,
			Ycoord),
	       Time),
      []).

% 
% 
%; different objects are not at same location
% ectest/ec_reader_test_ecnet.e:1731
% [grid,object1,object2,xcoord1,ycoord1,time]% 
% HoldsAt(Location(grid,object1,xcoord1,ycoord1),time) &
% HoldsAt(Location(grid,object2,xcoord1,ycoord1),time) ->
% Equal(object1,object2).
 /*
holds_at(location(Grid, Object1, Xcoord1, Ycoord1), Time), holds_at(location(Grid, Object2, Xcoord1, Ycoord1), Time) ->
    equal(Object1, Object2).
*/
axiom(equal(Object1,Object2),
      [ holds_at(location(Grid,
			  Object1,
			  Xcoord1,
			  Ycoord1),
		 Time),
	holds_at(location(Grid,
			  Object2,
			  Xcoord1,
			  Ycoord1),
		 Time)
      ]).

% 
% 
%; moving to a location causes an object to be at that location
% ectest/ec_reader_test_ecnet.e:1737
% [grid,object,xcoord1,ycoord1,xcoord2,ycoord2,time]% 
% Initiates(Move(grid,object,xcoord1,ycoord1,xcoord2,ycoord2),
%           Location(grid,object,xcoord2,ycoord2),
%           time).
 /*
initiates(move(Grid,
	       Object,
	       Xcoord1,
	       Ycoord1,
	       Xcoord2,
	       Ycoord2),
	  location(Grid,Object,Xcoord2,Ycoord2),
	  Time).
*/
axiom(initiates(move(Grid,
		     Object,
		     Xcoord1,
		     Ycoord1,
		     Xcoord2,
		     Ycoord2),
		location(Grid,
			 Object,
			 Xcoord2,
			 Ycoord2),
		Time),
      []).

% 
% 
%; moving to a location causes the object no longer to be at its previous
%; location
% ectest/ec_reader_test_ecnet.e:1744
% [grid,object,xcoord1,ycoord1,xcoord2,ycoord2,time]% 
% Terminates(Move(grid,object,xcoord1,ycoord1,xcoord2,ycoord2),
%            Location(grid,object,xcoord1,ycoord1),
%            time).
 /*
terminates(move(Grid,
		Object,
		Xcoord1,
		Ycoord1,
		Xcoord2,
		Ycoord2),
	   location(Grid,
		    Object,
		    Xcoord1,
		    Ycoord1),
	   Time).
*/
axiom(terminates(move(Grid,
		      Object,
		      Xcoord1,
		      Ycoord1,
		      Xcoord2,
		      Ycoord2),
		 location(Grid,
			  Object,
			  Xcoord1,
			  Ycoord1),
		 Time),
      []).

% 
% 
%;; allow diagonal movements
%;[grid,object,xcoord1,ycoord1,xcoord2,ycoord2,time]
%;Happens(Move(grid,object,xcoord1,ycoord1,xcoord2,ycoord2),time) ->
%;HoldsAt(Location(grid,object,xcoord1,ycoord1),time) &
%;(xcoord1=xcoord2 |
%; xcoord1=xcoord2+1 |
%; xcoord1=xcoord2-1) &
%;(ycoord1=ycoord2 |
%; ycoord1=ycoord2+1 |
%; ycoord1=ycoord2-1).
% ectest/ec_reader_test_ecnet.e:1759
% 
%; only allow right angle movements
% ectest/ec_reader_test_ecnet.e:1761
% [grid,object,xcoord1,ycoord1,xcoord2,ycoord2,time]% 
% Happens(Move(grid,object,xcoord1,ycoord1,xcoord2,ycoord2),time) ->
% HoldsAt(Location(grid,object,xcoord1,ycoord1),time) &
% ((xcoord1=xcoord2 & (ycoord1=ycoord2+1 | ycoord1=ycoord2-1)) |
%  (ycoord1=ycoord2 & (xcoord1=xcoord2+1 | xcoord1=xcoord2-1))).
 /*
happens(move(Grid, Object, Xcoord1, Ycoord1, Xcoord2, Ycoord2), Time) ->
    holds_at(location(Grid, Object, Xcoord1, Ycoord1),
             Time),
    (   Xcoord1=Xcoord2,
        (   Ycoord1=Ycoord2+1
        ;   Ycoord1=Ycoord2-1
        )
    ;   Ycoord1=Ycoord2,
        (   Xcoord1=Xcoord2+1
        ;   Xcoord1=Xcoord2-1
        )
    ).
*/
axiom(holds_at(location(Grid,
			Object,
			Xcoord1,
			Ycoord1),
	       Time) ',' (Xcoord1 = Xcoord2 ',' (Ycoord1 = Ycoord2 + 1 ; Ycoord1 = Ycoord2 - 1) ; Ycoord1 = Ycoord2 ',' (Xcoord1 = Xcoord2 + 1 ; Xcoord1 = Xcoord2 - 1)),
      [ happens(move(Grid,
		     Object,
		     Xcoord1,
		     Ycoord1,
		     Xcoord2,
		     Ycoord2),
		Time)
      ]).

% 
% 
%; End of file.
% ectest/ec_reader_test_ecnet.e:1768
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/HandTo.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:1774
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
% ectest/ec_reader_test_ecnet.e:1785
% 
% event HandTo(agent,agent,physobj)
 /*
event(handTo(agent,agent,physobj)).
*/
event(handTo(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:1788
% [agent1,agent2,physobj,time]% 
% Initiates(HandTo(agent1,agent2,physobj),
%           Holding(agent2,physobj),
%           time).
 /*
initiates(handTo(Agent1,Agent2,Physobj),
	  holding(Agent2,Physobj),
	  Time).
*/
axiom(initiates(handTo(Agent1,Agent2,Physobj),
		holding(Agent2,Physobj),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:1793
% [agent1,agent2,physobj,time]% 
% Terminates(HandTo(agent1,agent2,physobj),
%            Holding(agent1,physobj),
%            time).
 /*
terminates(handTo(Agent1,Agent2,Physobj),
	   holding(Agent1,Physobj),
	   Time).
*/
axiom(terminates(handTo(Agent1,Agent2,Physobj),
		 holding(Agent1,Physobj),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:1798
% [agent1,agent2,physobj,time]% 
% Happens(HandTo(agent1,agent2,physobj),time) ->
% HoldsAt(Holding(agent1,physobj),time).
 /*
happens(handTo(Agent1, Agent2, Physobj), Time) ->
    holds_at(holding(Agent1, Physobj), Time).
*/
axiom(holds_at(holding(Agent1,Physobj),Time),
      [ happens(handTo(Agent1,Agent2,Physobj),
		Time)
      ]).

% 
% 
% event ShakeHands(agent,agent)
 /*
event(shakeHands(agent,agent)).
*/
event(shakeHands(agent,agent)).

% 
% ectest/ec_reader_test_ecnet.e:1804
% event WriteOn(agent,paper,pen)
 /*
event(writeOn(agent,paper,pen)).
*/
event(writeOn(agent,paper,pen)).

% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Container.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:1811
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%;
%; Container: container
%;
% ectest/ec_reader_test_ecnet.e:1825
% 
%; linkage to OTSpace(M):
% ectest/ec_reader_test_ecnet.e:1827
% [agent,container1,container2,time]% 
% Happens(TakeOutOf(agent,container1,container2),time) ->
% HoldsAt(ContainerIsOpen(container2),time).
 /*
happens(takeOutOf(Agent, Container1, Container2), Time) ->
    holds_at(containerIsOpen(Container2), Time).
*/
axiom(holds_at(containerIsOpen(Container2),Time),
      [ happens(takeOutOf(Agent,
			  Container1,
			  Container2),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:1831
% [agent,container1,container2,time]% 
% Happens(PutInside(agent,container1,container2),time) ->
% HoldsAt(ContainerIsOpen(container2),time).
 /*
happens(putInside(Agent, Container1, Container2), Time) ->
    holds_at(containerIsOpen(Container2), Time).
*/
axiom(holds_at(containerIsOpen(Container2),Time),
      [ happens(putInside(Agent,
			  Container1,
			  Container2),
		Time)
      ]).

% 
% 
%; agent opens container.
% event ContainerOpen(agent,container)
 /*
event(containerOpen(agent,container)).
*/
event(containerOpen(agent,container)).

% ectest/ec_reader_test_ecnet.e:1837
% 
%; agent closes container.
% event ContainerClose(agent,container)
 /*
event(containerClose(agent,container)).
*/
event(containerClose(agent,container)).

% 
%; container is open.
% fluent ContainerIsOpen(container)
 /*
fluent(containerIsOpen(container)).
*/
fluent(containerIsOpen(container)).

% ectest/ec_reader_test_ecnet.e:1843
% 
% fluent ContainerClosed(container)
 /*
fluent(containerClosed(container)).
*/
fluent(containerClosed(container)).

% noninertial ContainerClosed
 /*
noninertial(containerClosed).
*/
noninertial(containerClosed).

% 
% ectest/ec_reader_test_ecnet.e:1847
% [container,time]% 
% HoldsAt(ContainerClosed(container),time) <->
% !HoldsAt(ContainerIsOpen(container),time).
 /*
holds_at(containerClosed(Container), Time) <->
    not(holds_at(containerIsOpen(Container), Time)).
*/
axiom(holds_at(neg(containerIsOpen(Container)),Time),
      [holds_at(containerClosed(Container),Time)]).
axiom(holds_at(containerClosed(Container),Time),
      [holds_at(neg(containerIsOpen(Container)),Time)]).

% 
% 
%; A precondition axiom states that
%; for an agent to open a container,
%; the agent must be awake,
%; the container must not already be open, and
%; the agent must be holding the container.
% ectest/ec_reader_test_ecnet.e:1856
% [agent,container,time]% 
% Happens(ContainerOpen(agent,container),time) ->
% HoldsAt(Awake(agent),time) &
% !HoldsAt(ContainerIsOpen(container),time) &
% HoldsAt(Holding(agent,container),time).
 /*
happens(containerOpen(Agent, Container), Time) ->
    holds_at(awake(Agent), Time),
    not(holds_at(containerIsOpen(Container), Time)),
    holds_at(holding(Agent, Container), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' not(holds_at(containerIsOpen(Container),Time)) ',' holds_at(holding(Agent,Container),Time),
      [happens(containerOpen(Agent,Container),Time)]).

% 
% 
%; An effect axiom states that
%; if an agent opens a container,
%; the container will be open:
% ectest/ec_reader_test_ecnet.e:1865
% [agent,container,time]% 
% Initiates(ContainerOpen(agent,container),ContainerIsOpen(container),time).
 /*
initiates(containerOpen(Agent,Container),
	  containerIsOpen(Container),
	  Time).
*/
axiom(initiates(containerOpen(Agent,Container),
		containerIsOpen(Container),
		Time),
      []).

% 
% 
%; A precondition axiom states that
%; for an agent to close a container,
%; the agent must be awake,
%; the container must be open, and
%; the agent must be holding the container.
% ectest/ec_reader_test_ecnet.e:1873
% [agent,container,time]% 
% Happens(ContainerClose(agent,container),time) ->
% HoldsAt(Awake(agent),time) &
% HoldsAt(ContainerIsOpen(container),time) &
% HoldsAt(Holding(agent,container),time).
 /*
happens(containerClose(Agent, Container), Time) ->
    holds_at(awake(Agent), Time),
    holds_at(containerIsOpen(Container), Time),
    holds_at(holding(Agent, Container), Time).
*/
axiom(holds_at(awake(Agent),Time) ',' holds_at(containerIsOpen(Container),Time) ',' holds_at(holding(Agent,Container),Time),
      [happens(containerClose(Agent,Container),Time)]).

% 
% 
%; An effect axiom states that
%; if an agent closes a container,
%; the container will no longer be open:
% ectest/ec_reader_test_ecnet.e:1882
% [agent,container,time]% 
% Terminates(ContainerClose(agent,container),ContainerIsOpen(container),time).
 /*
terminates(containerClose(Agent,Container),
	   containerIsOpen(Container),
	   Time).
*/
axiom(terminates(containerClose(Agent,Container),
		 containerIsOpen(Container),
		 Time),
      []).

% 
% 
%; End of file.
% 
% 
% ectest/ec_reader_test_ecnet.e:1888
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/SpeechAct.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; The SpeechAct representation deals with a few speech acts
%; \fullcite{Searle:1969}.
%;
%; @book{Searle:1969,
%;   author = "John R. Searle",
%;   year = "1969",
%;   title = "Speech Acts: An Essay in the Philosophy of Language",
%;   address = "Cambridge",
%;   publisher = "Cambridge University Press",
%; }
%;
%; We handle
%; the illocutionary acts of
%; inviting someone into one's house (a form of request) and
%; greeting someone,
%; and the expressive speech act of crying for joy.
%;
% ectest/ec_reader_test_ecnet.e:1920
% 
%; inviting in
% 
%; agent1 invites agent2 into room.
% event InviteIn(agent,agent,room)
 /*
event(inviteIn(agent,agent,room)).
*/
event(inviteIn(agent,agent,room)).

%; agent1 is invited into room by agent2.
% ectest/ec_reader_test_ecnet.e:1926
% fluent InvitedIn(agent,room,agent)
 /*
fluent(invitedIn(agent,room,agent)).
*/
fluent(invitedIn(agent,room,agent)).

% 
%; A precondition axiom states that for
%; an agent to invite another agent into a room,
%; the first agent must be in the room and
%; there must be an outside area such that
%; the second agent is at the outside area and
%; the outside area is adjacent to the room:
% ectest/ec_reader_test_ecnet.e:1934
% [agent1,agent2,room,time]% 
% Happens(InviteIn(agent1,agent2,room),time) ->
% HoldsAt(At(agent1,room),time) &
% ectest/ec_reader_test_ecnet.e:1937
% {outside}% 
% HoldsAt(At(agent2,outside),time) &
% Adjacent(room,outside).
 /*
exists([Outside],  (happens(inviteIn(Agent1, Agent2, Room), Time)->holds_at(at(Agent1, Room), Time), holds_at(at(Agent2, Outside), Time), adjacent(Room, Outside))).
*/
axiom(holds_at(at(Agent1,Room),Time) ',' holds_at(at(Agent2,Outside),Time) ',' adjacent(Room,Outside) ',' some([Outside]),
      [ happens(inviteIn(Agent1,Agent2,Room),
		Time)
      ]).

% 
% 
%; An effect axiom states that if
%; an agent invites another agent into a room,
%; the second agent will be invited into the room by the first agent:
% ectest/ec_reader_test_ecnet.e:1944
% [agent1,agent2,room,time]% 
% Initiates(InviteIn(agent1,agent2,room),
%           InvitedIn(agent2,room,agent1),
%           time).
 /*
initiates(inviteIn(Agent1,Agent2,Room),
	  invitedIn(Agent2,Room,Agent1),
	  Time).
*/
axiom(initiates(inviteIn(Agent1,Agent2,Room),
		invitedIn(Agent2,Room,Agent1),
		Time),
      []).

% 
% 
%; agent intends to walk into room.
% ectest/ec_reader_test_ecnet.e:1950
% event IntendToWalkIn(agent,room)
 /*
event(intendToWalkIn(agent,room)).
*/
event(intendToWalkIn(agent,room)).

%; agent has the intention to walk into room.
% fluent IntentionToWalkIn(agent,room)
 /*
fluent(intentionToWalkIn(agent,room)).
*/
fluent(intentionToWalkIn(agent,room)).

%; agent acts on the intention to walk into room.
% fluent ActOnIntentionToWalkIn(agent,room)
 /*
fluent(actOnIntentionToWalkIn(agent,room)).
*/
fluent(actOnIntentionToWalkIn(agent,room)).

% noninertial ActOnIntentionToWalkIn
 /*
noninertial(actOnIntentionToWalkIn).
*/
noninertial(actOnIntentionToWalkIn).

% ectest/ec_reader_test_ecnet.e:1956
% 
%; A trigger axiom states that
%; if an agent is invited into a room by another agent,
%; the first agent likes the second agent, and
%; the first agent does not already have the intention to
%; walk into the room,
%; the first agent intends to walk into the room:
% ectest/ec_reader_test_ecnet.e:1963
% [agent1,agent2,room,time]% 
% HoldsAt(InvitedIn(agent1,room,agent2),time) &
% HoldsAt(Like(agent1,agent2),time) &
% !HoldsAt(IntentionToWalkIn(agent1,room),time) ->
% Happens(IntendToWalkIn(agent1,room),time).
 /*
holds_at(invitedIn(Agent1, Room, Agent2), Time), holds_at(like(Agent1, Agent2), Time), not(holds_at(intentionToWalkIn(Agent1, Room), Time)) ->
    happens(intendToWalkIn(Agent1, Room), Time).
*/
axiom(happens(intendToWalkIn(Agent1,Room),Time),
      [ holds_at(invitedIn(Agent1,Room,Agent2),
		 Time),
	holds_at(like(Agent1,Agent2),Time),
	holds_at(neg(intentionToWalkIn(Agent1,Room)),
		 Time)
      ]).

% 
% 
%; An effect axiom states that
%; if an agent intends to walk into a room,
%; the agent will have the intention to walk into the room:
% ectest/ec_reader_test_ecnet.e:1972
% [agent,room,time]% 
% Initiates(IntendToWalkIn(agent,room),
%           IntentionToWalkIn(agent,room),
%           time).
 /*
initiates(intendToWalkIn(Agent,Room),
	  intentionToWalkIn(Agent,Room),
	  Time).
*/
axiom(initiates(intendToWalkIn(Agent,Room),
		intentionToWalkIn(Agent,Room),
		Time),
      []).

% 
% 
%; Two trigger axioms state that
%; if an agent has the intention to walk into a room,
%; the agent acts on the intention to walk into the room,
%; the agent is at a location,
%; side one (two) of a door is the room,
%; side two (one) of the door is the location,
%; agent will walk through side two (one) of the door:
% ectest/ec_reader_test_ecnet.e:1984
% [agent,room,location,door,time]% 
% HoldsAt(IntentionToWalkIn(agent,room),time) &
% HoldsAt(ActOnIntentionToWalkIn(agent,room),time) &
% HoldsAt(At(agent,location),time) &
% Side1(door)=room &
% Side2(door)=location ->
% Happens(WalkThroughDoor21(agent,door),time).
 /*
holds_at(intentionToWalkIn(Agent, Room), Time), holds_at(actOnIntentionToWalkIn(Agent, Room), Time), holds_at(at(Agent, Location), Time), side1(Door)=Room, side2(Door)=Location ->
    happens(walkThroughDoor21(Agent, Door), Time).
*/
axiom(happens(walkThroughDoor21(Agent,Door),Time),
      [ holds_at(intentionToWalkIn(Agent,Room),Time),
	holds_at(actOnIntentionToWalkIn(Agent,Room),
		 Time),
	holds_at(at(Agent,Location),Time),
	equals(side1(Door),Room),
	equals(side2(Door),Location)
      ]).

% ectest/ec_reader_test_ecnet.e:1990
% 
% 
% ectest/ec_reader_test_ecnet.e:1992
% [agent,room,location,door,time]% 
% HoldsAt(IntentionToWalkIn(agent,room),time) &
% HoldsAt(ActOnIntentionToWalkIn(agent,room),time) &
% HoldsAt(At(agent,location),time) &
% Side2(door)=room &
% Side1(door)=location ->
% Happens(WalkThroughDoor12(agent,door),time).
 /*
holds_at(intentionToWalkIn(Agent, Room), Time), holds_at(actOnIntentionToWalkIn(Agent, Room), Time), holds_at(at(Agent, Location), Time), side2(Door)=Room, side1(Door)=Location ->
    happens(walkThroughDoor12(Agent, Door), Time).
*/
axiom(happens(walkThroughDoor12(Agent,Door),Time),
      [ holds_at(intentionToWalkIn(Agent,Room),Time),
	holds_at(actOnIntentionToWalkIn(Agent,Room),
		 Time),
	holds_at(at(Agent,Location),Time),
	equals(side2(Door),Room),
	equals(side1(Door),Location)
      ]).

% ectest/ec_reader_test_ecnet.e:1998
% 
% 
%; Two effect axioms state that
%; if side one (two) of a door is a room and
%; an agent walks through side two (one) of the door,
%; the agent will no longer have the intention to
%; walk into the room:
% ectest/ec_reader_test_ecnet.e:2005
% [agent,room,door,time]% 
% Side1(door)=room ->
% Terminates(WalkThroughDoor21(agent,door),
%            IntentionToWalkIn(agent,room),
%            time).
 /*
side1(Door)=Room ->
    terminates(walkThroughDoor21(Agent, Door),
               intentionToWalkIn(Agent, Room),
               Time).
*/
axiom(terminates(walkThroughDoor21(Agent,Door),
		 intentionToWalkIn(Agent,Room),
		 Time),
      [equals(side1(Door),Room)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2011
% [agent,room,door,time]% 
% Side2(door)=room ->
% Terminates(WalkThroughDoor12(agent,door),
%            IntentionToWalkIn(agent,room),
%            time).
 /*
side2(Door)=Room ->
    terminates(walkThroughDoor12(Agent, Door),
               intentionToWalkIn(Agent, Room),
               Time).
*/
axiom(terminates(walkThroughDoor12(Agent,Door),
		 intentionToWalkIn(Agent,Room),
		 Time),
      [equals(side2(Door),Room)]).

% 
% 
%; agent greets object.
% ectest/ec_reader_test_ecnet.e:2018
% event Greet(agent,object)
 /*
event(greet(agent,object)).
*/
event(greet(agent,object)).

% 
% event SayPleasedToMeet(agent,agent)
 /*
event(sayPleasedToMeet(agent,agent)).
*/
event(sayPleasedToMeet(agent,agent)).

% 
%; agent says goodbye to object.
% event SayGoodbye(agent,object)
 /*
event(sayGoodbye(agent,object)).
*/
event(sayGoodbye(agent,object)).

% ectest/ec_reader_test_ecnet.e:2024
% 
% event TalkAbout(agent,content)
 /*
event(talkAbout(agent,content)).
*/
event(talkAbout(agent,content)).

% 
% event Converse(agent,agent)
 /*
event(converse(agent,agent)).
*/
event(converse(agent,agent)).

% 
% ectest/ec_reader_test_ecnet.e:2029
% [agent1,agent2,time]% 
% Happens(Converse(agent1,agent2),time) ->
% ectest/ec_reader_test_ecnet.e:2031
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(converse(Agent1, Agent2), Time)->holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [happens(converse(Agent1,Agent2),Time)]).

% 
% 
%; A precondition axiom states that for
%; an agent to greet an object,
%; there must be a location such that
%; the agent is at the location and
%; the object is at the location:
% ectest/ec_reader_test_ecnet.e:2040
% [agent,object,time]% 
% Happens(Greet(agent,object),time) ->
% ectest/ec_reader_test_ecnet.e:2042
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(object,location),time).
 /*
exists([Location],  (happens(greet(Agent, Object), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Object, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Object,Location),Time) ',' some([Location]),
      [happens(greet(Agent,Object),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2046
% [agent,object,time]% 
% Happens(SayGoodbye(agent,object),time) ->
% ectest/ec_reader_test_ecnet.e:2048
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(object,location),time).
 /*
exists([Location],  (happens(sayGoodbye(Agent, Object), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Object, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Object,Location),Time) ',' some([Location]),
      [happens(sayGoodbye(Agent,Object),Time)]).

% 
% 
%; speech: expression of emotions
% 
%; agent cries for joy.
% ectest/ec_reader_test_ecnet.e:2055
% event CryForJoy(agent)
 /*
event(cryForJoy(agent)).
*/
event(cryForJoy(agent)).

% 
%; A precondition axiom states that for
%; an agent to cry for joy,
%; the agent must be happy:
% ectest/ec_reader_test_ecnet.e:2060
% [agent,time]% 
% Happens(CryForJoy(agent),time) ->
% HoldsAt(Happy(agent),time).
 /*
happens(cryForJoy(Agent), Time) ->
    holds_at(happy(Agent), Time).
*/
axiom(holds_at(happy(Agent),Time),
      [happens(cryForJoy(Agent),Time)]).

% 
% 
% event Threaten(agent,agent,weapon)
 /*
event(threaten(agent,agent,weapon)).
*/
event(threaten(agent,agent,weapon)).

% 
% ectest/ec_reader_test_ecnet.e:2066
% event ReleaseFromThreat(agent,agent)
 /*
event(releaseFromThreat(agent,agent)).
*/
event(releaseFromThreat(agent,agent)).

% 
% fluent ThreatenedBy(agent,agent)
 /*
fluent(threatenedBy(agent,agent)).
*/
fluent(threatenedBy(agent,agent)).

% 
% ectest/ec_reader_test_ecnet.e:2070
% [agent1,agent2,weapon,time]% 
% Happens(Threaten(agent1,agent2,weapon), time) ->
% HoldsAt(Holding(agent1,weapon),time) &
% ectest/ec_reader_test_ecnet.e:2073
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(threaten(Agent1, Agent2, Weapon), Time)->holds_at(holding(Agent1, Weapon), Time), holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(holding(Agent1,Weapon),Time) ',' holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [ happens(threaten(Agent1,Agent2,Weapon),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2077
% [agent1,agent2,weapon,time]% 
% Happens(Threaten(agent1,agent2,weapon), time) ->
% Happens(BecomeAngryAt(agent2,agent1),time).
 /*
happens(threaten(Agent1, Agent2, Weapon), Time) ->
    happens(becomeAngryAt(Agent2, Agent1), Time).
*/
axiom(happens(becomeAngryAt(Agent2,Agent1),Time),
      [ happens(threaten(Agent1,Agent2,Weapon),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2081
% [agent1,agent2,weapon,time]% 
% Initiates(Threaten(agent1,agent2,weapon),
%           ThreatenedBy(agent2,agent1),
%           time).
 /*
initiates(threaten(Agent1,Agent2,Weapon),
	  threatenedBy(Agent2,Agent1),
	  Time).
*/
axiom(initiates(threaten(Agent1,Agent2,Weapon),
		threatenedBy(Agent2,Agent1),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2086
% [agent1,agent2,time]% 
% Terminates(ReleaseFromThreat(agent1,agent2),
%            ThreatenedBy(agent2,agent1),
%            time).
 /*
terminates(releaseFromThreat(Agent1,Agent2),
	   threatenedBy(Agent2,Agent1),
	   Time).
*/
axiom(terminates(releaseFromThreat(Agent1,Agent2),
		 threatenedBy(Agent2,Agent1),
		 Time),
      []).

% 
% 
% event Order(agent,agent,physobj)
 /*
event(order(agent,agent,physobj)).
*/
event(order(agent,agent,physobj)).

% ectest/ec_reader_test_ecnet.e:2092
% 
% fluent KnowOrder(agent,agent,physobj)
 /*
fluent(knowOrder(agent,agent,physobj)).
*/
fluent(knowOrder(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:2095
% [agent1,agent2,physobj,time]% 
% Initiates(Order(agent1,agent2,physobj),
%           KnowOrder(agent2,agent1,physobj),
%           time).
 /*
initiates(order(Agent1,Agent2,Physobj),
	  knowOrder(Agent2,Agent1,Physobj),
	  Time).
*/
axiom(initiates(order(Agent1,Agent2,Physobj),
		knowOrder(Agent2,Agent1,Physobj),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2100
% [agent1,agent2,physobj,time]% 
% Happens(Order(agent1,agent2,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:2102
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(order(Agent1, Agent2, Physobj), Time)->holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [ happens(order(Agent1,Agent2,Physobj),
		Time)
      ]).

% 
% 
% event Request(agent,agent,physobj)
 /*
event(request(agent,agent,physobj)).
*/
event(request(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:2108
% fluent KnowRequest(agent,agent,physobj)
 /*
fluent(knowRequest(agent,agent,physobj)).
*/
fluent(knowRequest(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:2110
% [agent1,agent2,physobj,time]% 
% Initiates(Request(agent1,agent2,physobj),
%           KnowRequest(agent2,agent1,physobj),
%           time).
 /*
initiates(request(Agent1,Agent2,Physobj),
	  knowRequest(Agent2,Agent1,Physobj),
	  Time).
*/
axiom(initiates(request(Agent1,Agent2,Physobj),
		knowRequest(Agent2,Agent1,Physobj),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2115
% [agent1,agent2,physobj,time]% 
% Happens(Request(agent1,agent2,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:2117
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(request(Agent1, Agent2, Physobj), Time)->holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [ happens(request(Agent1,Agent2,Physobj),
		Time)
      ]).

% 
% 
%; End of file.
% 
% ectest/ec_reader_test_ecnet.e:2123
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Sleep.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; The Sleep representation deals with the activity of sleeping and
%; body posture.
%; It is similar to the finite automaton representation of sleep
%; used in ThoughtTreasure \fullcite[chap. 7]{Mueller:1998}.
%;
%; @book{Mueller:1998,
%;   author = "Erik T. Mueller",
%;   year = "1998",
%;   title = "Natural Language Processing with \uppercase{T}hought\uppercase{T}reasure",
%;   address = "New York",
%;   publisher = "Signiform",
%; }
%;
% ectest/ec_reader_test_ecnet.e:2152
% 
%; sleep
% 
%; agent wakes up.
% event WakeUp(agent)
 /*
event(wakeUp(agent)).
*/
event(wakeUp(agent)).

% 
%; agent gets tired.
% ectest/ec_reader_test_ecnet.e:2159
% event GetTired(agent)
 /*
event(getTired(agent)).
*/
event(getTired(agent)).

% 
%; agent falls asleep.
% event FallAsleep(agent)
 /*
event(fallAsleep(agent)).
*/
event(fallAsleep(agent)).

% 
%; agent is asleep.
% ectest/ec_reader_test_ecnet.e:2165
% fluent Sleep0(agent)
 /*
fluent(sleep0(agent)).
*/
fluent(sleep0(agent)).

%; agent is awake and in bed.
% fluent Sleep1(agent)
 /*
fluent(sleep1(agent)).
*/
fluent(sleep1(agent)).

%; agent is awake, out of bed, and undressed.
% fluent Sleep2(agent)
 /*
fluent(sleep2(agent)).
*/
fluent(sleep2(agent)).

%; agent is awake and dressed.
% ectest/ec_reader_test_ecnet.e:2171
% fluent Sleep3(agent)
 /*
fluent(sleep3(agent)).
*/
fluent(sleep3(agent)).

%; agent is tired and dressed.
% fluent Sleep4(agent)
 /*
fluent(sleep4(agent)).
*/
fluent(sleep4(agent)).

%; agent is tired and undressed.
% fluent Sleep5(agent)
 /*
fluent(sleep5(agent)).
*/
fluent(sleep5(agent)).

%; agent is in bed, waiting to fall asleep.
% ectest/ec_reader_test_ecnet.e:2177
% fluent Sleep6(agent)
 /*
fluent(sleep6(agent)).
*/
fluent(sleep6(agent)).

% 
%; At any time, an agent is in one of seven sleep states:
% xor Sleep0, Sleep1, Sleep2, Sleep3, Sleep4, Sleep5, Sleep6
 /*
xor([sleep0,sleep1,sleep2,sleep3,sleep4,sleep5,sleep6]).
*/
xor([sleep0,sleep1,sleep2,sleep3,sleep4,sleep5,sleep6]).

% 
%; constraints
% ectest/ec_reader_test_ecnet.e:2183
% 
%; agent is asleep.
% fluent Asleep(agent)
 /*
fluent(asleep(agent)).
*/
fluent(asleep(agent)).

%; agent is awake.
% fluent Awake(agent)
 /*
fluent(awake(agent)).
*/
fluent(awake(agent)).

% noninertial Asleep
 /*
noninertial(asleep).
*/
noninertial(asleep).

% ectest/ec_reader_test_ecnet.e:2189
% noninertial Awake
 /*
noninertial(awake).
*/
noninertial(awake).

% 
%; Sleep0 indicates that the agent is asleep:
% ectest/ec_reader_test_ecnet.e:2192
% [agent,time] % HoldsAt(Asleep(agent),time) <-> HoldsAt(Sleep0(agent),time).
 /*
holds_at(asleep(Agent), Time) <->
    holds_at(sleep0(Agent), Time).
*/
axiom(holds_at(sleep0(Agent),Time),
      [holds_at(asleep(Agent),Time)]).
axiom(holds_at(asleep(Agent),Time),
      [holds_at(sleep0(Agent),Time)]).

% 
% 
%; In all other sleep states, the agent is awake:
% ectest/ec_reader_test_ecnet.e:2195
% [agent,time]% 
% HoldsAt(Awake(agent),time) <->
% HoldsAt(Sleep1(agent),time) |
% HoldsAt(Sleep2(agent),time) |
% HoldsAt(Sleep3(agent),time) |
% HoldsAt(Sleep4(agent),time) |
% HoldsAt(Sleep5(agent),time) |
% HoldsAt(Sleep6(agent),time).
 /*
holds_at(awake(Agent), Time) <->
    (   holds_at(sleep1(Agent), Time)
    ;   holds_at(sleep2(Agent), Time)
    ;   holds_at(sleep3(Agent), Time)
    ;   holds_at(sleep4(Agent), Time)
    ;   holds_at(sleep5(Agent), Time)
    ;   holds_at(sleep6(Agent), Time)
    ).
*/
axiom(holds_at(sleep1(Agent),Time) ; holds_at(sleep2(Agent),Time) ; holds_at(sleep3(Agent),Time) ; holds_at(sleep4(Agent),Time) ; holds_at(sleep5(Agent),Time) ; holds_at(sleep6(Agent),Time),
      [holds_at(awake(Agent),Time)]).
axiom(holds_at(awake(Agent),Time),
      [ holds_at(sleep1(Agent),Time) ; holds_at(sleep2(Agent),Time) ; holds_at(sleep3(Agent),Time) ; holds_at(sleep4(Agent),Time) ; holds_at(sleep5(Agent),Time) ; holds_at(sleep6(Agent),Time)
      ]).

% ectest/ec_reader_test_ecnet.e:2202
% 
% 
%; A number of axioms are used to specify the transitions of
%; a finite automaton.
%;--
% 
%; Waking up causes a transition from Sleep0
%; to Sleep1:
% ectest/ec_reader_test_ecnet.e:2210
% [agent,time] % Terminates(WakeUp(agent),Sleep0(agent),time).
 /*
terminates(wakeUp(Agent),sleep0(Agent),Time).
*/
axiom(terminates(wakeUp(Agent),sleep0(Agent),Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2212
% [agent,time] % Initiates(WakeUp(agent),Sleep1(agent),time).
 /*
initiates(wakeUp(Agent),sleep1(Agent),Time).
*/
axiom(initiates(wakeUp(Agent),sleep1(Agent),Time),[]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2214
% [agent,time] % Happens(WakeUp(agent),time) -> HoldsAt(Sleep0(agent),time).
 /*
happens(wakeUp(Agent), Time) ->
    holds_at(sleep0(Agent), Time).
*/
axiom(holds_at(sleep0(Agent),Time),
      [happens(wakeUp(Agent),Time)]).

% 
% 
%;--
% 
%; Getting out of bed causes a transition from Sleep1
%; to Sleep2:
% ectest/ec_reader_test_ecnet.e:2220
% [agent,bed,time] % Terminates(RiseFrom(agent,bed),Sleep1(agent),time).
 /*
terminates(riseFrom(Agent,Bed),
	   sleep1(Agent),
	   Time).
*/
axiom(terminates(riseFrom(Agent,Bed),
		 sleep1(Agent),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2222
% [agent,bed,time] % Initiates(RiseFrom(agent,bed),Sleep2(agent),time).
 /*
initiates(riseFrom(Agent,Bed),
	  sleep2(Agent),
	  Time).
*/
axiom(initiates(riseFrom(Agent,Bed),
		sleep2(Agent),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2224
% [agent,bed,time]% 
% Happens(RiseFrom(agent,bed),time) -> HoldsAt(Sleep1(agent),time).
 /*
happens(riseFrom(Agent, Bed), Time) ->
    holds_at(sleep1(Agent), Time).
*/
axiom(holds_at(sleep1(Agent),Time),
      [happens(riseFrom(Agent,Bed),Time)]).

% 
% 
%;--
% 
%; Getting dressed causes a transition from Sleep2
%; to Sleep3, the normal state of awakeness:
% ectest/ec_reader_test_ecnet.e:2231
% [agent,time] % Terminates(GetDressed(agent),Sleep2(agent),time).
 /*
terminates(getDressed(Agent),sleep2(Agent),Time).
*/
axiom(terminates(getDressed(Agent),
		 sleep2(Agent),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2233
% [agent,time] % Initiates(GetDressed(agent),Sleep3(agent),time).
 /*
initiates(getDressed(Agent),sleep3(Agent),Time).
*/
axiom(initiates(getDressed(Agent),sleep3(Agent),Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2235
% [agent,time] % Happens(GetDressed(agent),time) -> HoldsAt(Sleep2(agent),time).
 /*
happens(getDressed(Agent), Time) ->
    holds_at(sleep2(Agent), Time).
*/
axiom(holds_at(sleep2(Agent),Time),
      [happens(getDressed(Agent),Time)]).

% 
% 
%;--
% 
%; Getting tired causes a transition from Sleep3
%; to Sleep4:
% ectest/ec_reader_test_ecnet.e:2241
% [agent,time] % Terminates(GetTired(agent),Sleep3(agent),time).
 /*
terminates(getTired(Agent),sleep3(Agent),Time).
*/
axiom(terminates(getTired(Agent),sleep3(Agent),Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2243
% [agent,time] % Initiates(GetTired(agent),Sleep4(agent),time).
 /*
initiates(getTired(Agent),sleep4(Agent),Time).
*/
axiom(initiates(getTired(Agent),sleep4(Agent),Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2245
% [agent,time] % Happens(GetTired(agent),time) -> HoldsAt(Sleep3(agent),time).
 /*
happens(getTired(Agent), Time) ->
    holds_at(sleep3(Agent), Time).
*/
axiom(holds_at(sleep3(Agent),Time),
      [happens(getTired(Agent),Time)]).

% 
% 
%;--
% 
%; Getting undressed causes a transition from Sleep4
%; to Sleep5:
% ectest/ec_reader_test_ecnet.e:2251
% [agent,time] % Terminates(GetUndressed(agent),Sleep4(agent),time).
 /*
terminates(getUndressed(Agent),sleep4(Agent),Time).
*/
axiom(terminates(getUndressed(Agent),
		 sleep4(Agent),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2253
% [agent,time] % Initiates(GetUndressed(agent),Sleep5(agent),time).
 /*
initiates(getUndressed(Agent),sleep5(Agent),Time).
*/
axiom(initiates(getUndressed(Agent),
		sleep5(Agent),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2255
% [agent,time] % Happens(GetUndressed(agent),time) -> HoldsAt(Sleep4(agent),time).
 /*
happens(getUndressed(Agent), Time) ->
    holds_at(sleep4(Agent), Time).
*/
axiom(holds_at(sleep4(Agent),Time),
      [happens(getUndressed(Agent),Time)]).

% 
% 
%;--
% 
%; Lying on a bed causes a transition from Sleep5
%; to Sleep6:
% ectest/ec_reader_test_ecnet.e:2261
% [agent,bed,time] % Terminates(LieOn(agent,bed),Sleep5(agent),time).
 /*
terminates(lieOn(Agent,Bed),sleep5(Agent),Time).
*/
axiom(terminates(lieOn(Agent,Bed),
		 sleep5(Agent),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2263
% [agent,bed,time] % Initiates(LieOn(agent,bed),Sleep6(agent),time).
 /*
initiates(lieOn(Agent,Bed),sleep6(Agent),Time).
*/
axiom(initiates(lieOn(Agent,Bed),
		sleep6(Agent),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2265
% [agent,bed,time] % Happens(LieOn(agent,bed),time) -> HoldsAt(Sleep5(agent),time).
 /*
happens(lieOn(Agent, Bed), Time) ->
    holds_at(sleep5(Agent), Time).
*/
axiom(holds_at(sleep5(Agent),Time),
      [happens(lieOn(Agent,Bed),Time)]).

% 
% 
%;--
% 
%; Falling asleep causes a transition from Sleep6
%; to Sleep0:
% ectest/ec_reader_test_ecnet.e:2271
% [agent,time] % Terminates(FallAsleep(agent),Sleep6(agent),time).
 /*
terminates(fallAsleep(Agent),sleep6(Agent),Time).
*/
axiom(terminates(fallAsleep(Agent),
		 sleep6(Agent),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2273
% [agent,time] % Initiates(FallAsleep(agent),Sleep0(agent),time).
 /*
initiates(fallAsleep(Agent),sleep0(Agent),Time).
*/
axiom(initiates(fallAsleep(Agent),sleep0(Agent),Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2275
% [agent,time] % Happens(FallAsleep(agent),time) -> HoldsAt(Sleep6(agent),time).
 /*
happens(fallAsleep(Agent), Time) ->
    holds_at(sleep6(Agent), Time).
*/
axiom(holds_at(sleep6(Agent),Time),
      [happens(fallAsleep(Agent),Time)]).

% 
% 
%;--
% 
%; agent acts on being in state Sleep5.
% fluent ActOnSleep5(agent)
 /*
fluent(actOnSleep5(agent)).
*/
fluent(actOnSleep5(agent)).

% ectest/ec_reader_test_ecnet.e:2281
% noninertial ActOnSleep5
 /*
noninertial(actOnSleep5).
*/
noninertial(actOnSleep5).

% 
%; We reduce the number of models by asserting that
%; an agent only acts on being in state Sleep5 while in
%; that state:
% ectest/ec_reader_test_ecnet.e:2286
% [agent,time]% 
% !HoldsAt(Sleep5(agent),time) ->
% !HoldsAt(ActOnSleep5(agent),time).
 /*
not(holds_at(sleep5(Agent), Time)) ->
    not(holds_at(actOnSleep5(Agent), Time)).
*/
axiom(holds_at(neg(actOnSleep5(Agent)),Time),
      [holds_at(neg(sleep5(Agent)),Time)]).

% 
% 
%; Undressed is like IntentionToPlay
%; ActOnSleep5 is like ActOnIntentionToPlay
% ectest/ec_reader_test_ecnet.e:2292
% 
%; A trigger axiom states that if an agent is in state Sleep5,
%; the agent acts on this state, the agent is in a room, and
%; a bed is at the room, the agent lies on the bed:
% ectest/ec_reader_test_ecnet.e:2296
% [agent,room,bed,time]% 
% HoldsAt(Sleep5(agent),time) &
% HoldsAt(ActOnSleep5(agent),time) &
% HoldsAt(At(agent,room),time) &
% HoldsAt(At(bed,room),time) ->
% Happens(LieOn(agent,bed),time).
 /*
holds_at(sleep5(Agent), Time), holds_at(actOnSleep5(Agent), Time), holds_at(at(Agent, Room), Time), holds_at(at(Bed, Room), Time) ->
    happens(lieOn(Agent, Bed), Time).
*/
axiom(happens(lieOn(Agent,Bed),Time),
      [ holds_at(sleep5(Agent),Time),
	holds_at(actOnSleep5(Agent),Time),
	holds_at(at(Agent,Room),Time),
	holds_at(at(Bed,Room),Time)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:2302
% 
%; A precondition axiom states that for
%; an agent to lie on a bed,
%; the agent must be in state Sleep5,
%; the agent must act on this state, and
%; there must be a room such that
%; the agent is in the room and the bed is in the room:
% ectest/ec_reader_test_ecnet.e:2309
% [agent,bed,time]% 
% Happens(LieOn(agent,bed),time) ->
% HoldsAt(Sleep5(agent),time) &
% HoldsAt(ActOnSleep5(agent),time) &
% ectest/ec_reader_test_ecnet.e:2313
% {room}% 
%  HoldsAt(At(agent,room),time) &
%  HoldsAt(At(bed,room),time).
 /*
exists([Room],  (happens(lieOn(Agent, Bed), Time)->holds_at(sleep5(Agent), Time), holds_at(actOnSleep5(Agent), Time), holds_at(at(Agent, Room), Time), holds_at(at(Bed, Room), Time))).
*/
axiom(holds_at(sleep5(Agent),Time) ',' holds_at(actOnSleep5(Agent),Time) ',' holds_at(at(Agent,Room),Time) ',' holds_at(at(Bed,Room),Time) ',' some([Room]),
      [happens(lieOn(Agent,Bed),Time)]).

% 
% 
%; (body) posture
% 
%; agent lies on physobj.
% ectest/ec_reader_test_ecnet.e:2320
% event LieOn(agent,physobj)
 /*
event(lieOn(agent,physobj)).
*/
event(lieOn(agent,physobj)).

% 
%; agent sits on physobj.
% event SitOn(agent,physobj)
 /*
event(sitOn(agent,physobj)).
*/
event(sitOn(agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:2325
% [agent,physobj,time]% 
% Happens(SitOn(agent,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:2327
% {location}% 
%  HoldsAt(At(agent,location),time) &
%  HoldsAt(At(physobj,location),time).
 /*
exists([Location],  (happens(sitOn(Agent, Physobj), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Physobj, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Physobj,Location),Time) ',' some([Location]),
      [happens(sitOn(Agent,Physobj),Time)]).

% 
% 
%; agent rises from physobj.
% event RiseFrom(agent,physobj)
 /*
event(riseFrom(agent,physobj)).
*/
event(riseFrom(agent,physobj)).

% ectest/ec_reader_test_ecnet.e:2333
% 
%; agent is lying on physobj.
% fluent LyingOn(agent,physobj)
 /*
fluent(lyingOn(agent,physobj)).
*/
fluent(lyingOn(agent,physobj)).

%; agent is sitting on physobj.
% fluent SittingOn(agent,physobj)
 /*
fluent(sittingOn(agent,physobj)).
*/
fluent(sittingOn(agent,physobj)).

%; agent is standing.
% ectest/ec_reader_test_ecnet.e:2339
% fluent Standing(agent)
 /*
fluent(standing(agent)).
*/
fluent(standing(agent)).

% 
%; agent is lying down.
% fluent Lying(agent)
 /*
fluent(lying(agent)).
*/
fluent(lying(agent)).

%; agent is sitting.
% fluent Sitting(agent)
 /*
fluent(sitting(agent)).
*/
fluent(sitting(agent)).

% ectest/ec_reader_test_ecnet.e:2345
% noninertial Lying
 /*
noninertial(lying).
*/
noninertial(lying).

% noninertial Sitting
 /*
noninertial(sitting).
*/
noninertial(sitting).

% 
%; At any time, an agent is either lying, sitting, or standing:
% xor Lying, Sitting, Standing
 /*
xor([lying,sitting,standing]).
*/
xor([lying,sitting,standing]).

% 
% ectest/ec_reader_test_ecnet.e:2351
% [agent,physobj,time]% 
% HoldsAt(LyingOn(agent,physobj),time) ->
% HoldsAt(Lying(agent),time).
 /*
holds_at(lyingOn(Agent, Physobj), Time) ->
    holds_at(lying(Agent), Time).
*/
axiom(holds_at(lying(Agent),Time),
      [holds_at(lyingOn(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2355
% [agent,physobj,time]% 
% HoldsAt(SittingOn(agent,physobj),time) ->
% HoldsAt(Sitting(agent),time).
 /*
holds_at(sittingOn(Agent, Physobj), Time) ->
    holds_at(sitting(Agent), Time).
*/
axiom(holds_at(sitting(Agent),Time),
      [holds_at(sittingOn(Agent,Physobj),Time)]).

% 
% 
%; State constraints represent that an agent can lie or sit
%; on at most one object at a time:
% ectest/ec_reader_test_ecnet.e:2361
% [agent,physobj1,physobj2,time]% 
% HoldsAt(LyingOn(agent,physobj1),time) &
% HoldsAt(LyingOn(agent,physobj2),time) ->
% physobj1=physobj2.
 /*
holds_at(lyingOn(Agent, Physobj1), Time), holds_at(lyingOn(Agent, Physobj2), Time) ->
    Physobj1=Physobj2.
*/
axiom(equals(Physobj1,Physobj2),
      [ holds_at(lyingOn(Agent,Physobj1),Time),
	holds_at(lyingOn(Agent,Physobj2),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2366
% [agent,physobj1,physobj2,time]% 
% HoldsAt(SittingOn(agent,physobj1),time) &
% HoldsAt(SittingOn(agent,physobj2),time) ->
% physobj1=physobj2.
 /*
holds_at(sittingOn(Agent, Physobj1), Time), holds_at(sittingOn(Agent, Physobj2), Time) ->
    Physobj1=Physobj2.
*/
axiom(equals(Physobj1,Physobj2),
      [ holds_at(sittingOn(Agent,Physobj1),Time),
	holds_at(sittingOn(Agent,Physobj2),Time)
      ]).

% 
% 
%; An effect axiom states that if an agent is standing and
%; lies on a physical object, the agent will be lying on
%; the physical object:
% ectest/ec_reader_test_ecnet.e:2374
% [agent,physobj,time]% 
% HoldsAt(Standing(agent),time) ->
% Initiates(LieOn(agent,physobj),
%           LyingOn(agent,physobj),
%           time).
 /*
holds_at(standing(Agent), Time) ->
    initiates(lieOn(Agent, Physobj),
              lyingOn(Agent, Physobj),
              Time).
*/
axiom(initiates(lieOn(Agent,Physobj),
		lyingOn(Agent,Physobj),
		Time),
      [holds_at(standing(Agent),Time)]).

% 
% 
%; An effect axiom states that if an agent
%; lies on a physical object, the agent will no longer
%; be standing:
% ectest/ec_reader_test_ecnet.e:2383
% [agent,physobj,time]% 
% Terminates(LieOn(agent,physobj),
%            Standing(agent),
%            time).
 /*
terminates(lieOn(Agent,Physobj),
	   standing(Agent),
	   Time).
*/
axiom(terminates(lieOn(Agent,Physobj),
		 standing(Agent),
		 Time),
      []).

% 
% 
%; An effect axiom states that if an agent is standing and
%; sits on a physical object, the agent will be sitting on
%; the physical object:
% ectest/ec_reader_test_ecnet.e:2391
% [agent,physobj,time]% 
% HoldsAt(Standing(agent),time) ->
% Initiates(SitOn(agent,physobj),
%           SittingOn(agent,physobj),
%           time).
 /*
holds_at(standing(Agent), Time) ->
    initiates(sitOn(Agent, Physobj),
              sittingOn(Agent, Physobj),
              Time).
*/
axiom(initiates(sitOn(Agent,Physobj),
		sittingOn(Agent,Physobj),
		Time),
      [holds_at(standing(Agent),Time)]).

% 
% 
%; An effect axiom states that if an agent
%; sits on a physical object, the agent will no longer
%; be standing:
% ectest/ec_reader_test_ecnet.e:2400
% [agent,physobj,time]% 
% Terminates(SitOn(agent,physobj),
%            Standing(agent),
%            time).
 /*
terminates(sitOn(Agent,Physobj),
	   standing(Agent),
	   Time).
*/
axiom(terminates(sitOn(Agent,Physobj),
		 standing(Agent),
		 Time),
      []).

% 
% 
%; An effect axiom states that if an agent
%; is sitting or lying on a physical object and
%; the agent rises from the physical object,
%; the agent will be standing:
% ectest/ec_reader_test_ecnet.e:2409
% [agent,physobj,time]% 
% (HoldsAt(SittingOn(agent,physobj),time) |
%  HoldsAt(LyingOn(agent,physobj),time)) ->
% Initiates(RiseFrom(agent,physobj),
%           Standing(agent),
%           time).
 /*
holds_at(sittingOn(Agent, Physobj), Time);holds_at(lyingOn(Agent, Physobj), Time) ->
    initiates(riseFrom(Agent, Physobj),
              standing(Agent),
              Time).
*/
axiom(initiates(riseFrom(Agent,Physobj),
		standing(Agent),
		Time),
      [ holds_at(sittingOn(Agent,Physobj),Time) ; holds_at(lyingOn(Agent,Physobj),Time)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:2415
% 
%; An effect axiom states that if an agent is sitting on
%; a physical object and the agent rises from the physical
%; object, the agent will no longer be sitting on the
%; physical object:
% ectest/ec_reader_test_ecnet.e:2420
% [agent,physobj,time]% 
% HoldsAt(SittingOn(agent,physobj),time) ->
% Terminates(RiseFrom(agent,physobj),
%            SittingOn(agent,physobj),
%            time).
 /*
holds_at(sittingOn(Agent, Physobj), Time) ->
    terminates(riseFrom(Agent, Physobj),
               sittingOn(Agent, Physobj),
               Time).
*/
axiom(terminates(riseFrom(Agent,Physobj),
		 sittingOn(Agent,Physobj),
		 Time),
      [holds_at(sittingOn(Agent,Physobj),Time)]).

% 
% 
%; An effect axiom states that if an agent is lying on
%; a physical object and the agent rises from the physical
%; object, the agent will no longer be lying on the
%; physical object:
% ectest/ec_reader_test_ecnet.e:2430
% [agent,physobj,time]% 
% HoldsAt(LyingOn(agent,physobj),time) ->
% Terminates(RiseFrom(agent,physobj),
%            LyingOn(agent,physobj),
%            time).
 /*
holds_at(lyingOn(Agent, Physobj), Time) ->
    terminates(riseFrom(Agent, Physobj),
               lyingOn(Agent, Physobj),
               Time).
*/
axiom(terminates(riseFrom(Agent,Physobj),
		 lyingOn(Agent,Physobj),
		 Time),
      [holds_at(lyingOn(Agent,Physobj),Time)]).

% 
% 
%; dressing
% ectest/ec_reader_test_ecnet.e:2437
% 
%; agent gets undressed.
% event GetDressed(agent)
 /*
event(getDressed(agent)).
*/
event(getDressed(agent)).

%; agent gets dressed.
% event GetUndressed(agent)
 /*
event(getUndressed(agent)).
*/
event(getUndressed(agent)).

%; agent is dressed.
% ectest/ec_reader_test_ecnet.e:2443
% fluent Dressed(agent)
 /*
fluent(dressed(agent)).
*/
fluent(dressed(agent)).

% 
%; Effect axioms deal with getting dressed and undressed:
% ectest/ec_reader_test_ecnet.e:2446
% [agent,time] % Initiates(GetDressed(agent),Dressed(agent),time).
 /*
initiates(getDressed(Agent),dressed(Agent),Time).
*/
axiom(initiates(getDressed(Agent),
		dressed(Agent),
		Time),
      []).

% 
% ectest/ec_reader_test_ecnet.e:2447
% [agent,time] % Terminates(GetUndressed(agent),Dressed(agent),time).
 /*
terminates(getUndressed(Agent),dressed(Agent),Time).
*/
axiom(terminates(getUndressed(Agent),
		 dressed(Agent),
		 Time),
      []).

% 
% 
%; End of file.
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Sleeping.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:2456
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; @article{Mueller:2004c,
%;   author = "Erik T. Mueller",
%;   year = "2004",
%;   title = "Understanding script-based stories using commonsense reasoning",
%;   journal = "Cognitive Systems Research",
%;   volume = "5",
%;   number = "4",
%;   pages = "307--340",
%; }
%;
% ectest/ec_reader_test_ecnet.e:2477
% 
% option modeldiff on
 /*
option(modeldiff,on).
*/

% 
% ignore Love, ThreatenedBy
 /*
ignore(love).
*/

 /*
ignore(threatenedBy).
*/

% ignore LookOutOnto, Floor, BuildingOf, SkyOf, GroundOf
 /*
ignore(lookOutOnto).
*/

 /*
ignore(floor).
*/

 /*
ignore(buildingOf).
*/

 /*
ignore(skyOf).
*/

 /*
ignore(groundOf).
*/

% ignore Inside, Near
 /*
ignore(inside).
*/

 /*
ignore(near).
*/

% ectest/ec_reader_test_ecnet.e:2483
% ignore See
 /*
ignore(see).
*/

% 
% ignore ActOnSleep5
 /*
ignore(actOnSleep5).
*/

% 
% option renaming off
 /*
option(renaming,off).
*/

% 
% ectest/ec_reader_test_ecnet.e:2489
% load foundations/Root.e% load foundations/EC.e% load answers/Mueller2003/Ontology.e
 /*
load('answers/Mueller2003/Ontology.e').
*/
load('answers/Mueller2003/Ontology.e').

% load answers/Mueller2004c/RTSpaceM.e
 /*
load('answers/Mueller2004c/RTSpaceM.e').
*/
load('answers/Mueller2004c/RTSpaceM.e').

% load answers/Mueller2004c/OTSpaceM.e
 /*
load('answers/Mueller2004c/OTSpaceM.e').
*/
load('answers/Mueller2004c/OTSpaceM.e').

% load answers/Mueller2004c/Cognition.e
 /*
load('answers/Mueller2004c/Cognition.e').
*/
load('answers/Mueller2004c/Cognition.e').

% ectest/ec_reader_test_ecnet.e:2495
% load answers/Mueller2003/Sleep.e
 /*
load('answers/Mueller2003/Sleep.e').
*/
load('answers/Mueller2003/Sleep.e').

% 
% door Door1
 /*
t(door,door1).
*/
sort(door).
t(door,door1).

% 
% room Room0
 /*
t(room,room0).
*/
sort(room).
t(room,room0).

% 
% ectest/ec_reader_test_ecnet.e:2501
% room Room1
 /*
t(room,room1).
*/
sort(room).
t(room,room1).

% 
% Side1(Door1)=Room0.
 /*
side1(door1) = room0.
*/
equals(side1(door1),room0).

% 
% Side2(Door1)=Room1.
 /*
side2(door1) = room1.
*/
equals(side2(door1),room1).

% 
% 
% agent Sleeper1
 /*
t(agent,sleeper1).
*/
sort(agent).
t(agent,sleeper1).

% ectest/ec_reader_test_ecnet.e:2507
% 
% bed Bed1
 /*
t(bed,bed1).
*/
sort(bed).
t(bed,bed1).

% 
% outside Outside1
 /*
t(outside,outside1).
*/
sort(outside).
t(outside,outside1).

% 
%; initial state
% ectest/ec_reader_test_ecnet.e:2513
% [agent,object] % !HoldsAt(Holding(agent,object),0).
 /*
not(holds_at(holding(Agent,Object),0)).
*/
axiom(initially(neg(holding(Agent,Object))),[]).

% 
% ectest/ec_reader_test_ecnet.e:2514
% [agent,physobj] % !HoldsAt(SittingOn(agent,physobj),0).
 /*
not(holds_at(sittingOn(Agent,Physobj),0)).
*/
axiom(initially(neg(sittingOn(Agent,Physobj))),[]).

% 
% ectest/ec_reader_test_ecnet.e:2515
% [agent,physobj] % !HoldsAt(LyingOn(agent,physobj),0).
 /*
not(holds_at(lyingOn(Agent,Physobj),0)).
*/
axiom(initially(neg(lyingOn(Agent,Physobj))),[]).

% 
% HoldsAt(Dressed(Sleeper1),0).
 /*
holds_at(dressed(sleeper1),0).
*/
axiom(holds_at(dressed(sleeper1),0),[]).

% 
% HoldsAt(Awake(Sleeper1),0).
 /*
holds_at(awake(sleeper1),0).
*/
axiom(holds_at(awake(sleeper1),0),[]).

% 
% HoldsAt(Sleep3(Sleeper1),0).
 /*
holds_at(sleep3(sleeper1),0).
*/
axiom(holds_at(sleep3(sleeper1),0),[]).

% 
% HoldsAt(Standing(Sleeper1),0).
 /*
holds_at(standing(sleeper1),0).
*/
axiom(holds_at(standing(sleeper1),0),[]).

% 
% HoldsAt(DoorUnlocked(Door1),0).
 /*
holds_at(doorUnlocked(door1),0).
*/
axiom(holds_at(doorUnlocked(door1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:2521
% HoldsAt(DoorIsOpen(Door1),0).
 /*
holds_at(doorIsOpen(door1),0).
*/
axiom(holds_at(doorIsOpen(door1),0),[]).

% 
% HoldsAt(At(Sleeper1,Room0),0).
 /*
holds_at(at(sleeper1,room0),0).
*/
axiom(holds_at(at(sleeper1,room0),0),[]).

% 
% HoldsAt(At(Bed1,Room1),0).
 /*
holds_at(at(bed1,room1),0).
*/
axiom(holds_at(at(bed1,room1),0),[]).

% 
% 
%; narrative
% Happens(GetTired(Sleeper1),0).
 /*
happens(getTired(sleeper1),0).
*/
axiom(happens(getTired(sleeper1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:2527
% Happens(WalkThroughDoor12(Sleeper1,Door1),1).
 /*
happens(walkThroughDoor12(sleeper1,door1),1).
*/
axiom(happens(walkThroughDoor12(sleeper1,door1),1),[]).

% 
% Happens(GetUndressed(Sleeper1),2).
 /*
happens(getUndressed(sleeper1),2).
*/
axiom(happens(getUndressed(sleeper1),2),[]).

% 
% Happens(LieOn(Sleeper1,Bed1),3).
 /*
happens(lieOn(sleeper1,bed1),3).
*/
axiom(happens(lieOn(sleeper1,bed1),3),[]).

% 
% Happens(FallAsleep(Sleeper1),4).
 /*
happens(fallAsleep(sleeper1),4).
*/
axiom(happens(fallAsleep(sleeper1),4),[]).

% 
% Happens(Dream(Sleeper1),5).
 /*
happens(dream(sleeper1),5).
*/
axiom(happens(dream(sleeper1),5),[]).

% 
% Happens(WakeUp(Sleeper1),6).
 /*
happens(wakeUp(sleeper1),6).
*/
axiom(happens(wakeUp(sleeper1),6),[]).

% 
% ectest/ec_reader_test_ecnet.e:2533
% Happens(RiseFrom(Sleeper1,Bed1),7).
 /*
happens(riseFrom(sleeper1,bed1),7).
*/
axiom(happens(riseFrom(sleeper1,bed1),7),[]).

% 
% Happens(GetDressed(Sleeper1),8).
 /*
happens(getDressed(sleeper1),8).
*/
axiom(happens(getDressed(sleeper1),8),[]).

% 
% Happens(WalkThroughDoor21(Sleeper1,Door1),9).
 /*
happens(walkThroughDoor21(sleeper1,door1),9).
*/
axiom(happens(walkThroughDoor21(sleeper1,door1),9),[]).

% 
% 
% range time 0 10
 /*
range(time,0,10).
*/
range(time,0,10).

% range offset 0 0
 /*
range(offset,0,0).
*/
range(offset,0,0).

% ectest/ec_reader_test_ecnet.e:2539
% range diameter 0 0
 /*
range(diameter,0,0).
*/
range(diameter,0,0).

% 
% completion Happens
 /*
completion(happens).
*/
completion(happens).

% 
%; End of file.
% 
% ectest/ec_reader_test_ecnet.e:2545
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Rest.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; @article{Mueller:InPress,
%;   author = "Erik T. Mueller",
%;   year = "in press",
%;   title = "Modelling space and time in narratives about restaurants",
%;   journal = "Literary and Linguistic Computing",
%; }
%;
% ectest/ec_reader_test_ecnet.e:2568
% 
% option renaming off
 /*
option(renaming,off).
*/

% option encoding 3
 /*
option(encoding,3).
*/

% 
% load foundations/Root.e% load foundations/EC.e
% ectest/ec_reader_test_ecnet.e:2574
% load answers/Mueller2003/Ontology.e
 /*
load('answers/Mueller2003/Ontology.e').
*/
load('answers/Mueller2003/Ontology.e').

% load answers/MuellerInPress/RepRest.e
 /*
load('answers/MuellerInPress/RepRest.e').
*/
load('answers/MuellerInPress/RepRest.e').

% 
% door MainEntrance1
 /*
t(door,mainEntrance1).
*/
sort(door).
t(door,mainEntrance1).

% 
%; room-scale topological space
% ectest/ec_reader_test_ecnet.e:2580
% outside Street1
 /*
t(outside,street1).
*/
sort(outside).
t(outside,street1).

% room DiningRoom1
 /*
t(room,diningRoom1).
*/
sort(room).
t(room,diningRoom1).

% door KitchenDoor1
 /*
t(door,kitchenDoor1).
*/
sort(door).
t(door,kitchenDoor1).

% room Kitchen1
 /*
t(room,kitchen1).
*/
sort(room).
t(room,kitchen1).

% Side1(MainEntrance1)=Street1.
 /*
side1(mainEntrance1) = street1.
*/
equals(side1(mainEntrance1),street1).

% 
% Side2(MainEntrance1)=DiningRoom1.
 /*
side2(mainEntrance1) = diningRoom1.
*/
equals(side2(mainEntrance1),diningRoom1).

% 
% ectest/ec_reader_test_ecnet.e:2586
% Side1(KitchenDoor1)=DiningRoom1.
 /*
side1(kitchenDoor1) = diningRoom1.
*/
equals(side1(kitchenDoor1),diningRoom1).

% 
% Side2(KitchenDoor1)=Kitchen1.
 /*
side2(kitchenDoor1) = kitchen1.
*/
equals(side2(kitchenDoor1),kitchen1).

% 
% 
% agent Customer1
 /*
t(agent,customer1).
*/
sort(agent).
t(agent,customer1).

% menu Menu1
 /*
t(menu,menu1).
*/
sort(menu).
t(menu,menu1).

% chair Chair1
 /*
t(chair,chair1).
*/
sort(chair).
t(chair,chair1).

% ectest/ec_reader_test_ecnet.e:2592
% food Food1
 /*
t(food,food1).
*/
sort(food).
t(food,food1).

% HoldsAt(At(Customer1,Street1),0).
 /*
holds_at(at(customer1,street1),0).
*/
axiom(holds_at(at(customer1,street1),0),[]).

% 
% HoldsAt(Hungry(Customer1),0).
 /*
holds_at(hungry(customer1),0).
*/
axiom(holds_at(hungry(customer1),0),[]).

% 
% HoldsAt(At(Chair1,DiningRoom1),0).
 /*
holds_at(at(chair1,diningRoom1),0).
*/
axiom(holds_at(at(chair1,diningRoom1),0),[]).

% 
% HoldsAt(At(Menu1,DiningRoom1),0).
 /*
holds_at(at(menu1,diningRoom1),0).
*/
axiom(holds_at(at(menu1,diningRoom1),0),[]).

% 
% HoldsAt(On(Menu1,Table1),0).
 /*
holds_at(on(menu1,table1),0).
*/
axiom(holds_at(on(menu1,table1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:2598
% HoldsAt(At(Food1,Kitchen1),0).
 /*
holds_at(at(food1,kitchen1),0).
*/
axiom(holds_at(at(food1,kitchen1),0),[]).

% 
% 
% waiter Waiter1
 /*
t(waiter,waiter1).
*/
sort(waiter).
t(waiter,waiter1).

% cook Cook1
 /*
t(cook,cook1).
*/
sort(cook).
t(cook,cook1).

% 
%; props
% ectest/ec_reader_test_ecnet.e:2604
% table Table1
 /*
t(table,table1).
*/
sort(table).
t(table,table1).

% bill Bill1
 /*
t(bill,bill1).
*/
sort(bill).
t(bill,bill1).

% 
%; restaurant
% restaurant Restaurant1
 /*
t(restaurant,restaurant1).
*/
sort(restaurant).
t(restaurant,restaurant1).

% CookOf(Restaurant1)=Cook1.
 /*
cookOf(restaurant1) = cook1.
*/
equals(cookOf(restaurant1),cook1).

% 
% ectest/ec_reader_test_ecnet.e:2610
% TableOf(Restaurant1)=Table1.
 /*
tableOf(restaurant1) = table1.
*/
equals(tableOf(restaurant1),table1).

% 
% WaiterOf(Restaurant1)=Waiter1.
 /*
waiterOf(restaurant1) = waiter1.
*/
equals(waiterOf(restaurant1),waiter1).

% 
% KitchenDoorOf(Restaurant1)=KitchenDoor1.
 /*
kitchenDoorOf(restaurant1) = kitchenDoor1.
*/
equals(kitchenDoorOf(restaurant1),kitchenDoor1).

% 
% BillOf(Restaurant1)=Bill1.
 /*
billOf(restaurant1) = bill1.
*/
equals(billOf(restaurant1),bill1).

% 
% 
%; prune
% ectest/ec_reader_test_ecnet.e:2616
% sort ona, onb
 /*
sort(ona).
*/
sort(ona).

 /*
sort(onb).
*/
sort(onb).

% fluent! On(ona,onb)
 /*
fluent(on(ona,onb)).
*/
fluent(on(ona,onb)).

% event! PlaceOn(agent,ona,onb)
 /*
event(placeOn(agent,ona,onb)).
*/
event(placeOn(agent,ona,onb)).

% event! TakeOffOf(agent,ona,onb)
 /*
event(takeOffOf(agent,ona,onb)).
*/
event(takeOffOf(agent,ona,onb)).

% 
% sort ordera, orderb, orderc
 /*
sort(ordera).
*/
sort(ordera).

 /*
sort(orderb).
*/
sort(orderb).

 /*
sort(orderc).
*/
sort(orderc).

% ectest/ec_reader_test_ecnet.e:2622
% event! Order(ordera,orderb,orderc)
 /*
event(order(ordera,orderb,orderc)).
*/
event(order(ordera,orderb,orderc)).

% fluent! KnowOrder(orderb,ordera,orderc)
 /*
fluent(knowOrder(orderb,ordera,orderc)).
*/
fluent(knowOrder(orderb,ordera,orderc)).

% 
% sort requesta, requestb, requestc
 /*
sort(requesta).
*/
sort(requesta).

 /*
sort(requestb).
*/
sort(requestb).

 /*
sort(requestc).
*/
sort(requestc).

% event! Request(requesta,requestb,requestc)
 /*
event(request(requesta,requestb,requestc)).
*/
event(request(requesta,requestb,requestc)).

% fluent! KnowRequest(requestb,requesta,requestc)
 /*
fluent(knowRequest(requestb,requesta,requestc)).
*/
fluent(knowRequest(requestb,requesta,requestc)).

% ectest/ec_reader_test_ecnet.e:2628
% 
% sort holda, holdb, holdc
 /*
sort(holda).
*/
sort(holda).

 /*
sort(holdb).
*/
sort(holdb).

 /*
sort(holdc).
*/
sort(holdc).

% event! TakeOffOf(holda,holdb,holdc)
 /*
event(takeOffOf(holda,holdb,holdc)).
*/
event(takeOffOf(holda,holdb,holdc)).

% event! PickUp(holda,holdb)
 /*
event(pickUp(holda,holdb)).
*/
event(pickUp(holda,holdb)).

% event! LetGoOf(holda,holdb)
 /*
event(letGoOf(holda,holdb)).
*/
event(letGoOf(holda,holdb)).

% event! Hold(holda,holdb)
 /*
event(hold(holda,holdb)).
*/
event(hold(holda,holdb)).

% ectest/ec_reader_test_ecnet.e:2634
% fluent! Holding(holda,holdb)
 /*
fluent(holding(holda,holdb)).
*/
fluent(holding(holda,holdb)).

% 
% sort sita, sitb
 /*
sort(sita).
*/
sort(sita).

 /*
sort(sitb).
*/
sort(sitb).

% event! LieOn(sita,sitb)
 /*
event(lieOn(sita,sitb)).
*/
event(lieOn(sita,sitb)).

% event! SitOn(sita,sitb)
 /*
event(sitOn(sita,sitb)).
*/
event(sitOn(sita,sitb)).

% event! RiseFrom(sita,sitb)
 /*
event(riseFrom(sita,sitb)).
*/
event(riseFrom(sita,sitb)).

% ectest/ec_reader_test_ecnet.e:2640
% fluent! LyingOn(sita,sitb)
 /*
fluent(lyingOn(sita,sitb)).
*/
fluent(lyingOn(sita,sitb)).

% fluent! SittingOn(sita,sitb)
 /*
fluent(sittingOn(sita,sitb)).
*/
fluent(sittingOn(sita,sitb)).

% 
% sort greeta, greetb
 /*
sort(greeta).
*/
sort(greeta).

 /*
sort(greetb).
*/
sort(greetb).

% event! Greet(greeta,greetb)
 /*
event(greet(greeta,greetb)).
*/
event(greet(greeta,greetb)).

% 
% ectest/ec_reader_test_ecnet.e:2646
% ona! Menu1, Food1, Bill1
 /*
t(ona,menu1).
*/
sort(ona).
t(ona,menu1).

 /*
t(ona,food1).
*/
sort(ona).
t(ona,food1).

 /*
t(ona,bill1).
*/
sort(ona).
t(ona,bill1).

% onb! Table1
 /*
t(onb,table1).
*/
sort(onb).
t(onb,table1).

% ordera! Customer1, Waiter1
 /*
t(ordera,customer1).
*/
sort(ordera).
t(ordera,customer1).

 /*
t(ordera,waiter1).
*/
sort(ordera).
t(ordera,waiter1).

% orderb! Waiter1, Cook1
 /*
t(orderb,waiter1).
*/
sort(orderb).
t(orderb,waiter1).

 /*
t(orderb,cook1).
*/
sort(orderb).
t(orderb,cook1).

% orderc! Food1
 /*
t(orderc,food1).
*/
sort(orderc).
t(orderc,food1).

% requesta! Customer1
 /*
t(requesta,customer1).
*/
sort(requesta).
t(requesta,customer1).

% ectest/ec_reader_test_ecnet.e:2652
% requestb! Waiter1
 /*
t(requestb,waiter1).
*/
sort(requestb).
t(requestb,waiter1).

% requestc! Bill1
 /*
t(requestc,bill1).
*/
sort(requestc).
t(requestc,bill1).

% holda! Customer1, Waiter1
 /*
t(holda,customer1).
*/
sort(holda).
t(holda,customer1).

 /*
t(holda,waiter1).
*/
sort(holda).
t(holda,waiter1).

% holdb! Menu1, Food1, Bill1
 /*
t(holdb,menu1).
*/
sort(holdb).
t(holdb,menu1).

 /*
t(holdb,food1).
*/
sort(holdb).
t(holdb,food1).

 /*
t(holdb,bill1).
*/
sort(holdb).
t(holdb,bill1).

% holdc! Table1
 /*
t(holdc,table1).
*/
sort(holdc).
t(holdc,table1).

% sita! Customer1
 /*
t(sita,customer1).
*/
sort(sita).
t(sita,customer1).

% ectest/ec_reader_test_ecnet.e:2658
% sitb! Chair1
 /*
t(sitb,chair1).
*/
sort(sitb).
t(sitb,chair1).

% greeta! Customer1, Waiter1
 /*
t(greeta,customer1).
*/
sort(greeta).
t(greeta,customer1).

 /*
t(greeta,waiter1).
*/
sort(greeta).
t(greeta,waiter1).

% greetb! Customer1, Waiter1
 /*
t(greetb,customer1).
*/
sort(greetb).
t(greetb,customer1).

 /*
t(greetb,waiter1).
*/
sort(greetb).
t(greetb,waiter1).

% 
%; initial situation
% HoldsAt(At(Waiter1,DiningRoom1),0).
 /*
holds_at(at(waiter1,diningRoom1),0).
*/
axiom(holds_at(at(waiter1,diningRoom1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:2664
% HoldsAt(At(Cook1,Kitchen1),0).
 /*
holds_at(at(cook1,kitchen1),0).
*/
axiom(holds_at(at(cook1,kitchen1),0),[]).

% 
% HoldsAt(At(Table1,DiningRoom1),0).
 /*
holds_at(at(table1,diningRoom1),0).
*/
axiom(holds_at(at(table1,diningRoom1),0),[]).

% 
% !HoldsAt(On(Bill1,Table1),0).
 /*
not(holds_at(on(bill1,table1),0)).
*/
axiom(initially(neg(on(bill1,table1))),[]).

% 
% HoldsAt(At(Bill1,DiningRoom1),0).
 /*
holds_at(at(bill1,diningRoom1),0).
*/
axiom(holds_at(at(bill1,diningRoom1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:2668
% [agent] % HoldsAt(Standing(agent),0).
 /*
holds_at(standing(Agent),0).
*/
axiom(holds_at(standing(Agent),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:2669
% [agent,object] % !HoldsAt(Holding(agent,object),0).
 /*
not(holds_at(holding(Agent,Object),0)).
*/
axiom(initially(neg(holding(Agent,Object))),[]).

% 
% ectest/ec_reader_test_ecnet.e:2670
% [agent1,agent2,physobj] % !HoldsAt(KnowOrder(agent1,agent2,physobj),0).
 /*
not(holds_at(knowOrder(Agent1,Agent2,Physobj),0)).
*/
axiom(initially(neg(knowOrder(Agent1,Agent2,Physobj))),
      []).

% 
% ectest/ec_reader_test_ecnet.e:2671
% [agent1,agent2,physobj] % !HoldsAt(KnowRequest(agent1,agent2,physobj),0).
 /*
not(holds_at(knowRequest(Agent1,Agent2,Physobj),0)).
*/
axiom(initially(neg(knowRequest(Agent1,
				Agent2,
				Physobj))),
      []).

% 
% HoldsAt(BeWaiter0(Waiter1),0).
 /*
holds_at(beWaiter0(waiter1),0).
*/
axiom(holds_at(beWaiter0(waiter1),0),[]).

% 
% HoldsAt(BeCook0(Cook1),0).
 /*
holds_at(beCook0(cook1),0).
*/
axiom(holds_at(beCook0(cook1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:2674
% [food] % !HoldsAt(FoodPrepared(food),0).
 /*
not(holds_at(foodPrepared(Food),0)).
*/
axiom(initially(neg(foodPrepared(Food))),[]).

% 
% !HoldsAt(Hungry(Cook1),0).
 /*
not(holds_at(hungry(cook1),0)).
*/
axiom(initially(neg(hungry(cook1))),[]).

% 
% !HoldsAt(Hungry(Waiter1),0).
 /*
not(holds_at(hungry(waiter1),0)).
*/
axiom(initially(neg(hungry(waiter1))),[]).

% 
% 
% Happens(WalkThroughDoor12(Customer1,MainEntrance1),0).
 /*
happens(walkThroughDoor12(customer1,mainEntrance1),0).
*/
axiom(happens(walkThroughDoor12(customer1,mainEntrance1),0),[]).

% 
% Happens(Greet(Waiter1,Customer1),1).
 /*
happens(greet(waiter1,customer1),1).
*/
axiom(happens(greet(waiter1,customer1),1),[]).

% 
% ectest/ec_reader_test_ecnet.e:2680
% Happens(SitOn(Customer1,Chair1),2).
 /*
happens(sitOn(customer1,chair1),2).
*/
axiom(happens(sitOn(customer1,chair1),2),[]).

% 
% Happens(TakeOffOf(Customer1,Menu1,Table1),3).
 /*
happens(takeOffOf(customer1,menu1,table1),3).
*/
axiom(happens(takeOffOf(customer1,menu1,table1),3),[]).

% 
% Happens(Order(Customer1,Waiter1,Food1),4).
 /*
happens(order(customer1,waiter1,food1),4).
*/
axiom(happens(order(customer1,waiter1,food1),4),[]).

% 
% Happens(PlaceOn(Customer1,Menu1,Table1),5).
 /*
happens(placeOn(customer1,menu1,table1),5).
*/
axiom(happens(placeOn(customer1,menu1,table1),5),[]).

% 
% Happens(Eat(Customer1,Food1),11).
 /*
happens(eat(customer1,food1),11).
*/
axiom(happens(eat(customer1,food1),11),[]).

% 
% Happens(Request(Customer1,Waiter1,Bill1),12).
 /*
happens(request(customer1,waiter1,bill1),12).
*/
axiom(happens(request(customer1,waiter1,bill1),12),[]).

% 
% ectest/ec_reader_test_ecnet.e:2686
% Happens(Pay(Customer1,Waiter1),15).
 /*
happens(pay(customer1,waiter1),15).
*/
axiom(happens(pay(customer1,waiter1),15),[]).

% 
% Happens(Tip(Customer1,Waiter1),15).
 /*
happens(tip(customer1,waiter1),15).
*/
axiom(happens(tip(customer1,waiter1),15),[]).

% 
% Happens(RiseFrom(Customer1,Chair1),16).
 /*
happens(riseFrom(customer1,chair1),16).
*/
axiom(happens(riseFrom(customer1,chair1),16),[]).

% 
% Happens(SayGoodbye(Customer1,Waiter1),17).
 /*
happens(sayGoodbye(customer1,waiter1),17).
*/
axiom(happens(sayGoodbye(customer1,waiter1),17),[]).

% 
% Happens(WalkThroughDoor21(Customer1,MainEntrance1),18).
 /*
happens(walkThroughDoor21(customer1,mainEntrance1),18).
*/
axiom(happens(walkThroughDoor21(customer1,mainEntrance1),18),[]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2692
% range time 0 19
 /*
range(time,0,19).
*/
range(time,0,19).

% range offset 0 0
 /*
range(offset,0,0).
*/
range(offset,0,0).

% range diameter 0 0
 /*
range(diameter,0,0).
*/
range(diameter,0,0).

% 
% completion Happens
 /*
completion(happens).
*/
completion(happens).

% 
%; End of file.
% ectest/ec_reader_test_ecnet.e:2699
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/RepRest.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:2705
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; @article{Mueller:InPress,
%;   author = "Erik T. Mueller",
%;   year = "in press",
%;   title = "Modelling space and time in narratives about restaurants",
%;   journal = "Literary and Linguistic Computing",
%; }
%;
% ectest/ec_reader_test_ecnet.e:2723
% 
%;sort boolean
%;sort integer
%;reified sort predicate
%;reified sort function
%;
%;sort time: integer
%;sort offset: integer
%;
%;reified sort fluent
%;reified sort event
%;
%;predicate Happens(event,time)
%;predicate HoldsAt(fluent,time)
%;predicate ReleasedAt(fluent,time)
%;predicate Initiates(event,fluent,time)
%;predicate Terminates(event,fluent,time)
%;predicate Releases(event,fluent,time)
%;
%;sort diameter: integer
%;
%;sort object
%;
%;sort agent: object
%;
%;sort physobj: object
%;sort bed: physobj
%;sort snowflake: physobj
%;sort sky: physobj
%;
%;sort stuff: physobj
%;
%;sort surface: physobj
%;sort ground: surface
%;
%;sort snow: stuff
%;sort ball
%;
%;sort food: physobj
%;sort fruit: food
%;sort orange: fruit
%;sort salad: food
%;
%;sort clothing: physobj
%;sort scarf: clothing
%;sort hat: clothing
%;
%;sort vegetablematter: physobj
%;sort coal: vegetablematter
%;
%;sort bodypart: physobj
%;sort hand: bodypart
%;
%;sort papertowels: physobj
%;sort device: physobj
%;sort electronicdevice: device
%;sort lamp: electronicdevice
%;
%;sort cat: physobj
%;
%;sort weapon: physobj
%;sort gun: weapon
%;sort bomb: weapon
%;sort bullet: weapon
%;
%;sort location
%;sort room: location, outside: location
%;
%;sort portal
%;sort door: portal, staircase: portal
%;sort street: portal
%;
%;sort building
%;
%;sort fire: object
%;
%;sort furniture: physobj
%;sort chair: furniture
%;sort table: furniture
%;
%;sort menu: physobj
%;sort bill: physobj
%;
%;sort script
%;
% ectest/ec_reader_test_ecnet.e:2808
% fluent Holding(agent,physobj)
 /*
fluent(holding(agent,physobj)).
*/
fluent(holding(agent,physobj)).

% event PickUp(agent,physobj)
 /*
event(pickUp(agent,physobj)).
*/
event(pickUp(agent,physobj)).

% event LetGoOf(agent,physobj)
 /*
event(letGoOf(agent,physobj)).
*/
event(letGoOf(agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:2812
% [agent,physobj,time]% 
% Initiates(PickUp(agent,physobj),Holding(agent,physobj),time).
 /*
initiates(pickUp(Agent,Physobj),
	  holding(Agent,Physobj),
	  Time).
*/
axiom(initiates(pickUp(Agent,Physobj),
		holding(Agent,Physobj),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2815
% [agent,physobj,time]% 
% Happens(PickUp(agent,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:2817
% {location}% 
%   HoldsAt(At(agent,location),time) &
%   HoldsAt(At(physobj,location),time).
 /*
exists([Location],  (happens(pickUp(Agent, Physobj), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Physobj, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Physobj,Location),Time) ',' some([Location]),
      [happens(pickUp(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2821
% [agent,physobj,time]% 
% Terminates(LetGoOf(agent,physobj),Holding(agent,physobj),time).
 /*
terminates(letGoOf(Agent,Physobj),
	   holding(Agent,Physobj),
	   Time).
*/
axiom(terminates(letGoOf(Agent,Physobj),
		 holding(Agent,Physobj),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2824
% [agent,physobj,time]% 
% Happens(LetGoOf(agent,physobj),time) ->
% HoldsAt(Holding(agent,physobj),time).
 /*
happens(letGoOf(Agent, Physobj), Time) ->
    holds_at(holding(Agent, Physobj), Time).
*/
axiom(holds_at(holding(Agent,Physobj),Time),
      [happens(letGoOf(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2828
% [agent,physobj,location,time]% 
% Releases(PickUp(agent,physobj),At(physobj,location),time).
 /*
releases(pickUp(Agent,Physobj),
	 at(Physobj,Location),
	 Time).
*/
axiom(releases(pickUp(Agent,Physobj),
	       at(Physobj,Location),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2831
% [agent,physobj,location,time]% 
% HoldsAt(Holding(agent,physobj),time) &
% HoldsAt(At(agent,location),time) ->
% HoldsAt(At(physobj,location),time).
 /*
holds_at(holding(Agent, Physobj), Time), holds_at(at(Agent, Location), Time) ->
    holds_at(at(Physobj, Location), Time).
*/
axiom(holds_at(at(Physobj,Location),Time),
      [ holds_at(holding(Agent,Physobj),Time),
	holds_at(at(Agent,Location),Time)
      ]).

% 
% 
%;[agent,physobj,location1,location2,time]
%;HoldsAt(At(agent,location1),time) &
%;location1!=location2 ->
%;Terminates(LetGoOf(agent,physobj),At(physobj,location2),time).
% ectest/ec_reader_test_ecnet.e:2840
% 
% ectest/ec_reader_test_ecnet.e:2841
% [agent,physobj,location,time]% 
% HoldsAt(At(agent,location),time) ->
% Initiates(LetGoOf(agent,physobj),At(physobj,location),time).
 /*
holds_at(at(Agent, Location), Time) ->
    initiates(letGoOf(Agent, Physobj),
              at(Physobj, Location),
              Time).
*/
axiom(initiates(letGoOf(Agent,Physobj),
		at(Physobj,Location),
		Time),
      [holds_at(at(Agent,Location),Time)]).

% 
% 
% fluent On(physobj,physobj)
 /*
fluent(on(physobj,physobj)).
*/
fluent(on(physobj,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:2847
% event PlaceOn(agent,physobj,physobj)
 /*
event(placeOn(agent,physobj,physobj)).
*/
event(placeOn(agent,physobj,physobj)).

% 
% event TakeOffOf(agent,physobj,physobj)
 /*
event(takeOffOf(agent,physobj,physobj)).
*/
event(takeOffOf(agent,physobj,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:2851
% [physobj1,physobj2,time]% 
% HoldsAt(On(physobj1,physobj2),time) ->
% physobj1!=physobj2.
 /*
holds_at(on(Physobj1, Physobj2), Time) ->
    Physobj1\=Physobj2.
*/
axiom(diff(Physobj1,Physobj2),
      [holds_at(on(Physobj1,Physobj2),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2855
% [physobj1,physobj2,time]% 
% HoldsAt(On(physobj1,physobj2),time) ->
% !HoldsAt(On(physobj2,physobj1),time).
 /*
holds_at(on(Physobj1, Physobj2), Time) ->
    not(holds_at(on(Physobj2, Physobj1), Time)).
*/
axiom(holds_at(neg(on(Physobj2,Physobj1)),Time),
      [holds_at(on(Physobj1,Physobj2),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2859
% [agent,physobj1,physobj2,time]% 
% Initiates(PlaceOn(agent,physobj1,physobj2),
%           On(physobj1,physobj2),time).
 /*
initiates(placeOn(Agent,Physobj1,Physobj2),
	  on(Physobj1,Physobj2),
	  Time).
*/
axiom(initiates(placeOn(Agent,Physobj1,Physobj2),
		on(Physobj1,Physobj2),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2863
% [agent,physobj1,physobj2,time]% 
% Terminates(PlaceOn(agent,physobj1,physobj2),
%            Holding(agent,physobj1),time).
 /*
terminates(placeOn(Agent,Physobj1,Physobj2),
	   holding(Agent,Physobj1),
	   Time).
*/
axiom(terminates(placeOn(Agent,Physobj1,Physobj2),
		 holding(Agent,Physobj1),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2867
% [agent,physobj1,physobj2,time]% 
% Happens(PlaceOn(agent,physobj1,physobj2),time) ->
% HoldsAt(Holding(agent,physobj1),time) &
% ectest/ec_reader_test_ecnet.e:2870
% {location}% 
%  HoldsAt(At(agent,location),time) &
%  HoldsAt(At(physobj2,location),time).
 /*
exists([Location],  (happens(placeOn(Agent, Physobj1, Physobj2), Time)->holds_at(holding(Agent, Physobj1), Time), holds_at(at(Agent, Location), Time), holds_at(at(Physobj2, Location), Time))).
*/
axiom(holds_at(holding(Agent,Physobj1),Time) ',' holds_at(at(Agent,Location),Time) ',' holds_at(at(Physobj2,Location),Time) ',' some([Location]),
      [ happens(placeOn(Agent,Physobj1,Physobj2),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2874
% [agent,physobj1,physobj2,time]% 
% Terminates(TakeOffOf(agent,physobj1,physobj2),
%            On(physobj1,physobj2),time).
 /*
terminates(takeOffOf(Agent,Physobj1,Physobj2),
	   on(Physobj1,Physobj2),
	   Time).
*/
axiom(terminates(takeOffOf(Agent,Physobj1,Physobj2),
		 on(Physobj1,Physobj2),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2878
% [agent,physobj1,physobj2,time]% 
% Initiates(TakeOffOf(agent,physobj1,physobj2),
%           Holding(agent,physobj1),time).
 /*
initiates(takeOffOf(Agent,Physobj1,Physobj2),
	  holding(Agent,Physobj1),
	  Time).
*/
axiom(initiates(takeOffOf(Agent,Physobj1,Physobj2),
		holding(Agent,Physobj1),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2882
% [agent,physobj1,physobj2,location,time]% 
% Releases(TakeOffOf(agent,physobj1,physobj2),
%          At(physobj1,location),
%          time).
 /*
releases(takeOffOf(Agent,Physobj1,Physobj2),
	 at(Physobj1,Location),
	 Time).
*/
axiom(releases(takeOffOf(Agent,Physobj1,Physobj2),
	       at(Physobj1,Location),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2887
% [agent,physobj1,physobj2,time]% 
% Happens(TakeOffOf(agent,physobj1,physobj2),time) ->
% HoldsAt(On(physobj1,physobj2),time) &
% ectest/ec_reader_test_ecnet.e:2890
% {location}% 
%  HoldsAt(At(agent,location),time) &
%  HoldsAt(At(physobj1,location),time) &
%  HoldsAt(At(physobj2,location),time).
 /*
exists([Location],  (happens(takeOffOf(Agent, Physobj1, Physobj2), Time)->holds_at(on(Physobj1, Physobj2), Time), holds_at(at(Agent, Location), Time), holds_at(at(Physobj1, Location), Time), holds_at(at(Physobj2, Location), Time))).
*/
axiom(holds_at(on(Physobj1,Physobj2),Time) ',' holds_at(at(Agent,Location),Time) ',' holds_at(at(Physobj1,Location),Time) ',' holds_at(at(Physobj2,Location),Time) ',' some([Location]),
      [ happens(takeOffOf(Agent,Physobj1,Physobj2),
		Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2895
% [agent,physobj1,physobj2,location,time]% 
% Releases(PlaceOn(agent,physobj1,physobj2),
%          At(physobj1,location),
%          time).
 /*
releases(placeOn(Agent,Physobj1,Physobj2),
	 at(Physobj1,Location),
	 Time).
*/
axiom(releases(placeOn(Agent,Physobj1,Physobj2),
	       at(Physobj1,Location),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:2900
% [physobj1,physobj2,location,time]% 
% HoldsAt(On(physobj1,physobj2),time) &
% HoldsAt(At(physobj2,location),time) ->
% HoldsAt(At(physobj1,location),time).
 /*
holds_at(on(Physobj1, Physobj2), Time), holds_at(at(Physobj2, Location), Time) ->
    holds_at(at(Physobj1, Location), Time).
*/
axiom(holds_at(at(Physobj1,Location),Time),
      [ holds_at(on(Physobj1,Physobj2),Time),
	holds_at(at(Physobj2,Location),Time)
      ]).

% 
% 
% fluent At(object,location)
 /*
fluent(at(object,location)).
*/
fluent(at(object,location)).

% ectest/ec_reader_test_ecnet.e:2906
% 
% ectest/ec_reader_test_ecnet.e:2907
% [object,time]% 
% ectest/ec_reader_test_ecnet.e:2908
% {location} % HoldsAt(At(object,location),time).
 /*
exists([Location],
       holds_at(at(Object,Location),Time)).
*/
axiom(holds_at(at(Object,Location),Time),[]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2910
% [object,location1,location2,time]% 
% HoldsAt(At(object,location1),time) &
% HoldsAt(At(object,location2),time) ->
% location1=location2.
 /*
holds_at(at(Object, Location1), Time), holds_at(at(Object, Location2), Time) ->
    Location1=Location2.
*/
axiom(equals(Location1,Location2),
      [ holds_at(at(Object,Location1),Time),
	holds_at(at(Object,Location2),Time)
      ]).

% 
% 
% function Side1(portal): location
 /*
function(side1(portal),location).
*/
function(side1(portal),location).

% ectest/ec_reader_test_ecnet.e:2916
% function Side2(portal): location
 /*
function(side2(portal),location).
*/
function(side2(portal),location).

% 
% fluent NearPortal(object,portal)
 /*
fluent(nearPortal(object,portal)).
*/
fluent(nearPortal(object,portal)).

% noninertial NearPortal
 /*
noninertial(nearPortal).
*/
noninertial(nearPortal).

% 
% ectest/ec_reader_test_ecnet.e:2921
% [object,portal,time]% 
% HoldsAt(NearPortal(object,portal),time) <->
% ectest/ec_reader_test_ecnet.e:2923
% {location}% 
%  (Side1(portal)=location|
%   Side2(portal)=location) &
%  HoldsAt(At(object,location),time).
 /*
exists([Location],  (holds_at(nearPortal(Object, Portal), Time)<->(side1(Portal)=Location;side2(Portal)=Location), holds_at(at(Object, Location), Time))).
*/
axiom((side1(Portal) = Location ; side2(Portal) = Location) ',' holds_at(at(Object,Location),Time),
      [holds_at(nearPortal(Object,Portal),Time)]).
axiom(holds_at(nearPortal(Object,Portal),Time),
      [ side1(Portal) = Location ; side2(Portal) = Location,
	holds_at(at(Object,Location),Time)
      ]).

% 
% 
% event WalkThroughDoor12(agent,door)
 /*
event(walkThroughDoor12(agent,door)).
*/
event(walkThroughDoor12(agent,door)).

% ectest/ec_reader_test_ecnet.e:2929
% event WalkThroughDoor21(agent,door)
 /*
event(walkThroughDoor21(agent,door)).
*/
event(walkThroughDoor21(agent,door)).

% 
% ectest/ec_reader_test_ecnet.e:2931
% [agent,door,time]% 
% Happens(WalkThroughDoor12(agent,door),time) ->
% HoldsAt(Standing(agent),time) &
% HoldsAt(At(agent,Side1(door)),time).
 /*
happens(walkThroughDoor12(Agent, Door), Time) ->
    holds_at(standing(Agent), Time),
    holds_at(at(Agent, side1(Door)), Time).
*/
axiom(holds_at(standing(Agent),Time) ',' holds_at(at(Agent,side1(Door)),Time),
      [happens(walkThroughDoor12(Agent,Door),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2936
% [agent,door,time]% 
% Happens(WalkThroughDoor21(agent,door),time) ->
% HoldsAt(Standing(agent),time) &
% HoldsAt(At(agent,Side2(door)),time).
 /*
happens(walkThroughDoor21(Agent, Door), Time) ->
    holds_at(standing(Agent), Time),
    holds_at(at(Agent, side2(Door)), Time).
*/
axiom(holds_at(standing(Agent),Time) ',' holds_at(at(Agent,side2(Door)),Time),
      [happens(walkThroughDoor21(Agent,Door),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2941
% [agent,door,location,time]% 
% Side2(door)=location ->
% Initiates(WalkThroughDoor12(agent,door),At(agent,location),time).
 /*
side2(Door)=Location ->
    initiates(walkThroughDoor12(Agent, Door),
              at(Agent, Location),
              Time).
*/
axiom(initiates(walkThroughDoor12(Agent,Door),
		at(Agent,Location),
		Time),
      [equals(side2(Door),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2945
% [agent,door,location,time]% 
% Side1(door)=location ->
% Initiates(WalkThroughDoor21(agent,door),At(agent,location),time).
 /*
side1(Door)=Location ->
    initiates(walkThroughDoor21(Agent, Door),
              at(Agent, Location),
              Time).
*/
axiom(initiates(walkThroughDoor21(Agent,Door),
		at(Agent,Location),
		Time),
      [equals(side1(Door),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2949
% [agent,door,location,time]% 
% Side1(door)=location ->
% Terminates(WalkThroughDoor12(agent,door),At(agent,location),time).
 /*
side1(Door)=Location ->
    terminates(walkThroughDoor12(Agent, Door),
               at(Agent, Location),
               Time).
*/
axiom(terminates(walkThroughDoor12(Agent,Door),
		 at(Agent,Location),
		 Time),
      [equals(side1(Door),Location)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2953
% [agent,door,location,time]% 
% Side2(door)=location ->
% Terminates(WalkThroughDoor21(agent,door),At(agent,location),time).
 /*
side2(Door)=Location ->
    terminates(walkThroughDoor21(Agent, Door),
               at(Agent, Location),
               Time).
*/
axiom(terminates(walkThroughDoor21(Agent,Door),
		 at(Agent,Location),
		 Time),
      [equals(side2(Door),Location)]).

% 
% 
% fluent Hungry(agent)
 /*
fluent(hungry(agent)).
*/
fluent(hungry(agent)).

% 
% ectest/ec_reader_test_ecnet.e:2959
% fluent Satiated(agent)
 /*
fluent(satiated(agent)).
*/
fluent(satiated(agent)).

% noninertial Satiated
 /*
noninertial(satiated).
*/
noninertial(satiated).

% 
% ectest/ec_reader_test_ecnet.e:2962
% [agent,time] % HoldsAt(Hungry(agent),time) <-> !HoldsAt(Satiated(agent),time).
 /*
holds_at(hungry(Agent), Time) <->
    not(holds_at(satiated(Agent), Time)).
*/
axiom(holds_at(neg(satiated(Agent)),Time),
      [holds_at(hungry(Agent),Time)]).
axiom(holds_at(hungry(Agent),Time),
      [holds_at(neg(satiated(Agent)),Time)]).

% 
% 
% event Eat(agent,food)
 /*
event(eat(agent,food)).
*/
event(eat(agent,food)).

% 
% ectest/ec_reader_test_ecnet.e:2966
% [agent,food,time]% 
% Happens(Eat(agent,food),time) ->
% ectest/ec_reader_test_ecnet.e:2968
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(food,location),time).
 /*
exists([Location],  (happens(eat(Agent, Food), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Food, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Food,Location),Time) ',' some([Location]),
      [happens(eat(Agent,Food),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:2972
% [agent,food,time]% 
% Terminates(Eat(agent,food),Hungry(agent),time).
 /*
terminates(eat(Agent,Food),hungry(Agent),Time).
*/
axiom(terminates(eat(Agent,Food),
		 hungry(Agent),
		 Time),
      []).

% 
% 
% sort restaurant: script
 /*
subsort(restaurant,script).
*/
subsort(restaurant,script).
sort(restaurant).
sort(script).

% sort waiter: agent
 /*
subsort(waiter,agent).
*/
subsort(waiter,agent).
sort(waiter).
sort(agent).

% sort cook: agent
 /*
subsort(cook,agent).
*/
subsort(cook,agent).
sort(cook).
sort(agent).

% ectest/ec_reader_test_ecnet.e:2978
% 
% function BillOf(restaurant): bill
 /*
function(billOf(restaurant),bill).
*/
function(billOf(restaurant),bill).

% function CookOf(restaurant): cook
 /*
function(cookOf(restaurant),cook).
*/
function(cookOf(restaurant),cook).

% function TableOf(restaurant): table
 /*
function(tableOf(restaurant),table).
*/
function(tableOf(restaurant),table).

% function WaiterOf(restaurant): waiter
 /*
function(waiterOf(restaurant),waiter).
*/
function(waiterOf(restaurant),waiter).

% function KitchenDoorOf(restaurant): door
 /*
function(kitchenDoorOf(restaurant),door).
*/
function(kitchenDoorOf(restaurant),door).

% ectest/ec_reader_test_ecnet.e:2984
% 
% fluent BeWaiter0(waiter)
 /*
fluent(beWaiter0(waiter)).
*/
fluent(beWaiter0(waiter)).

% 
% fluent BeWaiter1(waiter)
 /*
fluent(beWaiter1(waiter)).
*/
fluent(beWaiter1(waiter)).

% 
% fluent BeWaiter2(waiter)
 /*
fluent(beWaiter2(waiter)).
*/
fluent(beWaiter2(waiter)).

% ectest/ec_reader_test_ecnet.e:2990
% 
% fluent BeWaiter3(waiter)
 /*
fluent(beWaiter3(waiter)).
*/
fluent(beWaiter3(waiter)).

% 
% fluent BeWaiter4(waiter)
 /*
fluent(beWaiter4(waiter)).
*/
fluent(beWaiter4(waiter)).

% 
% fluent BeWaiter5(waiter)
 /*
fluent(beWaiter5(waiter)).
*/
fluent(beWaiter5(waiter)).

% ectest/ec_reader_test_ecnet.e:2996
% 
% fluent BeWaiter6(waiter)
 /*
fluent(beWaiter6(waiter)).
*/
fluent(beWaiter6(waiter)).

% 
% fluent BeWaiter7(waiter)
 /*
fluent(beWaiter7(waiter)).
*/
fluent(beWaiter7(waiter)).

% 
% fluent BeWaiter8(waiter)
 /*
fluent(beWaiter8(waiter)).
*/
fluent(beWaiter8(waiter)).

% ectest/ec_reader_test_ecnet.e:3002
% 
% fluent BeWaiter9(waiter)
 /*
fluent(beWaiter9(waiter)).
*/
fluent(beWaiter9(waiter)).

% 
% xor BeWaiter0, BeWaiter1, BeWaiter2, BeWaiter3, BeWaiter4, BeWaiter5, BeWaiter6, BeWaiter7, BeWaiter8, BeWaiter9
 /*
xor([ beWaiter0,
      beWaiter1,
      beWaiter2,
      beWaiter3,
      beWaiter4,
      beWaiter5,
      beWaiter6,
      beWaiter7,
      beWaiter8,
      beWaiter9
    ]).
*/
xor([ beWaiter0,
      beWaiter1,
      beWaiter2,
      beWaiter3,
      beWaiter4,
      beWaiter5,
      beWaiter6,
      beWaiter7,
      beWaiter8,
      beWaiter9
    ]).

% 
% ectest/ec_reader_test_ecnet.e:3007
% [waiter,agent,time]% 
% HoldsAt(BeWaiter0(waiter),time) ->
% Terminates(Greet(waiter,agent),
%            BeWaiter0(waiter),
%            time).
 /*
holds_at(beWaiter0(Waiter), Time) ->
    terminates(greet(Waiter, Agent),
               beWaiter0(Waiter),
               Time).
*/
axiom(terminates(greet(Waiter,Agent),
		 beWaiter0(Waiter),
		 Time),
      [holds_at(beWaiter0(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3013
% [waiter,agent,time]% 
% HoldsAt(BeWaiter0(waiter),time) ->
% Initiates(Greet(waiter,agent),
%           BeWaiter1(waiter),
%           time).
 /*
holds_at(beWaiter0(Waiter), Time) ->
    initiates(greet(Waiter, Agent),
              beWaiter1(Waiter),
              Time).
*/
axiom(initiates(greet(Waiter,Agent),
		beWaiter1(Waiter),
		Time),
      [holds_at(beWaiter0(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3019
% [waiter,agent,food,time]% 
% HoldsAt(BeWaiter1(waiter),time) ->
% Terminates(Order(agent,waiter,food),
%            BeWaiter1(waiter),
%            time).
 /*
holds_at(beWaiter1(Waiter), Time) ->
    terminates(order(Agent, Waiter, Food),
               beWaiter1(Waiter),
               Time).
*/
axiom(terminates(order(Agent,Waiter,Food),
		 beWaiter1(Waiter),
		 Time),
      [holds_at(beWaiter1(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3025
% [waiter,agent,food,time]% 
% HoldsAt(BeWaiter1(waiter),time) ->
% Initiates(Order(agent,waiter,food),
%           BeWaiter2(waiter),
%           time).
 /*
holds_at(beWaiter1(Waiter), Time) ->
    initiates(order(Agent, Waiter, Food),
              beWaiter2(Waiter),
              Time).
*/
axiom(initiates(order(Agent,Waiter,Food),
		beWaiter2(Waiter),
		Time),
      [holds_at(beWaiter1(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3031
% [restaurant,waiter,time]% 
% WaiterOf(restaurant)=waiter &
% HoldsAt(BeWaiter2(waiter),time) ->
% Happens(WalkThroughDoor12(waiter,KitchenDoorOf(restaurant)),time).
 /*
waiterOf(Restaurant)=Waiter, holds_at(beWaiter2(Waiter), Time) ->
    happens(walkThroughDoor12(Waiter, kitchenDoorOf(Restaurant)),
            Time).
*/
axiom(happens(walkThroughDoor12(Waiter,
				kitchenDoorOf(Restaurant)),
	      Time),
      [ equals(waiterOf(Restaurant),Waiter),
	holds_at(beWaiter2(Waiter),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3036
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter2(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Terminates(WalkThroughDoor12(waiter,door),
%            BeWaiter2(waiter),
%            time).
 /*
holds_at(beWaiter2(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    terminates(walkThroughDoor12(Waiter, Door),
               beWaiter2(Waiter),
               Time).
*/
axiom(terminates(walkThroughDoor12(Waiter,Door),
		 beWaiter2(Waiter),
		 Time),
      [ holds_at(beWaiter2(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:3042
% 
% 
% ectest/ec_reader_test_ecnet.e:3044
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter2(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Initiates(WalkThroughDoor12(waiter,door),
%           BeWaiter3(waiter),
%           time).
 /*
holds_at(beWaiter2(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    initiates(walkThroughDoor12(Waiter, Door),
              beWaiter3(Waiter),
              Time).
*/
axiom(initiates(walkThroughDoor12(Waiter,Door),
		beWaiter3(Waiter),
		Time),
      [ holds_at(beWaiter2(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:3050
% 
% 
% ectest/ec_reader_test_ecnet.e:3052
% [restaurant,food,time]% 
% HoldsAt(BeWaiter3(WaiterOf(restaurant)),time) &
% ({agent} HoldsAt(KnowOrder(WaiterOf(restaurant),agent,food),time)) ->
% Happens(Order(WaiterOf(restaurant),CookOf(restaurant),food),time).
 /*
holds_at(beWaiter3(waiterOf(Restaurant)), Time), exists([Agent], holds_at(knowOrder(waiterOf(Restaurant), Agent, Food), Time)) ->
    happens(order(waiterOf(Restaurant),
                  cookOf(Restaurant),
                  Food),
            Time).
*/
axiom(happens(order(waiterOf(Restaurant),
		    cookOf(Restaurant),
		    Food),
	      Time),
      [ holds_at(beWaiter3(waiterOf(Restaurant)),Time),
	holds_at(knowOrder(waiterOf(Restaurant),
			   Agent,
			   Food),
		 Time),
	some([Agent])
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3057
% [restaurant,waiter,cook,food,time]% 
% WaiterOf(restaurant)=waiter &
% CookOf(restaurant)=cook &
% HoldsAt(BeWaiter3(waiter),time) ->
% Terminates(Order(waiter,cook,food),
%            BeWaiter3(waiter),
%            time).
 /*
waiterOf(Restaurant)=Waiter, cookOf(Restaurant)=Cook, holds_at(beWaiter3(Waiter), Time) ->
    terminates(order(Waiter, Cook, Food),
               beWaiter3(Waiter),
               Time).
*/
axiom(terminates(order(Waiter,Cook,Food),
		 beWaiter3(Waiter),
		 Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(cookOf(Restaurant),Cook),
	holds_at(beWaiter3(Waiter),Time)
      ]).

% ectest/ec_reader_test_ecnet.e:3063
% 
% 
% ectest/ec_reader_test_ecnet.e:3065
% [restaurant,waiter,cook,food,time]% 
% WaiterOf(restaurant)=waiter &
% CookOf(restaurant)=cook &
% HoldsAt(BeWaiter3(waiter),time) ->
% Initiates(Order(waiter,cook,food),
%           BeWaiter4(waiter),
%           time).
 /*
waiterOf(Restaurant)=Waiter, cookOf(Restaurant)=Cook, holds_at(beWaiter3(Waiter), Time) ->
    initiates(order(Waiter, Cook, Food),
              beWaiter4(Waiter),
              Time).
*/
axiom(initiates(order(Waiter,Cook,Food),
		beWaiter4(Waiter),
		Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(cookOf(Restaurant),Cook),
	holds_at(beWaiter3(Waiter),Time)
      ]).

% ectest/ec_reader_test_ecnet.e:3071
% 
% 
% ectest/ec_reader_test_ecnet.e:3073
% [waiter,food,time]% 
% HoldsAt(BeWaiter4(waiter),time) &
% ({agent} HoldsAt(KnowOrder(waiter,agent,food),time)) &
% HoldsAt(FoodPrepared(food),time) ->
% Happens(PickUp(waiter,food),time).
 /*
holds_at(beWaiter4(Waiter), Time), exists([Agent], holds_at(knowOrder(Waiter, Agent, Food), Time)), holds_at(foodPrepared(Food), Time) ->
    happens(pickUp(Waiter, Food), Time).
*/
axiom(happens(pickUp(Waiter,Food),Time),
      [ holds_at(beWaiter4(Waiter),Time),
	holds_at(knowOrder(Waiter,Agent,Food),
		 Time),
	some([Agent]),
	holds_at(foodPrepared(Food),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3079
% [waiter,food,time]% 
% HoldsAt(BeWaiter4(waiter),time) &
% ({agent} HoldsAt(KnowOrder(waiter,agent,food),time)) ->
% Terminates(PickUp(waiter,food),
%            BeWaiter4(waiter),
%            time).
 /*
holds_at(beWaiter4(Waiter), Time), exists([Agent], holds_at(knowOrder(Waiter, Agent, Food), Time)) ->
    terminates(pickUp(Waiter, Food),
               beWaiter4(Waiter),
               Time).
*/
axiom(terminates(pickUp(Waiter,Food),
		 beWaiter4(Waiter),
		 Time),
      [ holds_at(beWaiter4(Waiter),Time),
	holds_at(knowOrder(Waiter,Agent,Food),
		 Time),
	some([Agent])
      ]).

% 
% ectest/ec_reader_test_ecnet.e:3085
% 
% ectest/ec_reader_test_ecnet.e:3086
% [waiter,food,time]% 
% HoldsAt(BeWaiter4(waiter),time) &
% ({agent} HoldsAt(KnowOrder(waiter,agent,food),time)) ->
% Initiates(PickUp(waiter,food),
%           BeWaiter5(waiter),
%           time).
 /*
holds_at(beWaiter4(Waiter), Time), exists([Agent], holds_at(knowOrder(Waiter, Agent, Food), Time)) ->
    initiates(pickUp(Waiter, Food),
              beWaiter5(Waiter),
              Time).
*/
axiom(initiates(pickUp(Waiter,Food),
		beWaiter5(Waiter),
		Time),
      [ holds_at(beWaiter4(Waiter),Time),
	holds_at(knowOrder(Waiter,Agent,Food),
		 Time),
	some([Agent])
      ]).

% 
% ectest/ec_reader_test_ecnet.e:3092
% 
% ectest/ec_reader_test_ecnet.e:3093
% [restaurant,waiter,time]% 
% WaiterOf(restaurant)=waiter &
% HoldsAt(BeWaiter5(waiter),time) ->
% Happens(WalkThroughDoor21(waiter,KitchenDoorOf(restaurant)),time).
 /*
waiterOf(Restaurant)=Waiter, holds_at(beWaiter5(Waiter), Time) ->
    happens(walkThroughDoor21(Waiter, kitchenDoorOf(Restaurant)),
            Time).
*/
axiom(happens(walkThroughDoor21(Waiter,
				kitchenDoorOf(Restaurant)),
	      Time),
      [ equals(waiterOf(Restaurant),Waiter),
	holds_at(beWaiter5(Waiter),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3098
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter5(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Terminates(WalkThroughDoor21(waiter,door),
%            BeWaiter5(waiter),
%            time).
 /*
holds_at(beWaiter5(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    terminates(walkThroughDoor21(Waiter, Door),
               beWaiter5(Waiter),
               Time).
*/
axiom(terminates(walkThroughDoor21(Waiter,Door),
		 beWaiter5(Waiter),
		 Time),
      [ holds_at(beWaiter5(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:3104
% 
% 
% ectest/ec_reader_test_ecnet.e:3106
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter5(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Initiates(WalkThroughDoor21(waiter,door),
%           BeWaiter6(waiter),
%           time).
 /*
holds_at(beWaiter5(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    initiates(walkThroughDoor21(Waiter, Door),
              beWaiter6(Waiter),
              Time).
*/
axiom(initiates(walkThroughDoor21(Waiter,Door),
		beWaiter6(Waiter),
		Time),
      [ holds_at(beWaiter5(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:3112
% 
% 
% ectest/ec_reader_test_ecnet.e:3114
% [restaurant,waiter,table,food,time]% 
% WaiterOf(restaurant)=waiter &
% TableOf(restaurant)=table &
% HoldsAt(BeWaiter6(waiter),time) &
% HoldsAt(Holding(waiter,food),time) ->
% Happens(PlaceOn(waiter,food,table),time).
 /*
waiterOf(Restaurant)=Waiter, tableOf(Restaurant)=Table, holds_at(beWaiter6(Waiter), Time), holds_at(holding(Waiter, Food), Time) ->
    happens(placeOn(Waiter, Food, Table), Time).
*/
axiom(happens(placeOn(Waiter,Food,Table),Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(tableOf(Restaurant),Table),
	holds_at(beWaiter6(Waiter),Time),
	holds_at(holding(Waiter,Food),Time)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:3120
% 
% ectest/ec_reader_test_ecnet.e:3121
% [waiter,food,table,time]% 
% HoldsAt(BeWaiter6(waiter),time) ->
% Terminates(PlaceOn(waiter,food,table),
%            BeWaiter6(waiter),
%            time).
 /*
holds_at(beWaiter6(Waiter), Time) ->
    terminates(placeOn(Waiter, Food, Table),
               beWaiter6(Waiter),
               Time).
*/
axiom(terminates(placeOn(Waiter,Food,Table),
		 beWaiter6(Waiter),
		 Time),
      [holds_at(beWaiter6(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3127
% [waiter,food,table,time]% 
% HoldsAt(BeWaiter6(waiter),time) ->
% Initiates(PlaceOn(waiter,food,table),
%           BeWaiter7(waiter),
%           time).
 /*
holds_at(beWaiter6(Waiter), Time) ->
    initiates(placeOn(Waiter, Food, Table),
              beWaiter7(Waiter),
              Time).
*/
axiom(initiates(placeOn(Waiter,Food,Table),
		beWaiter7(Waiter),
		Time),
      [holds_at(beWaiter6(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3133
% [waiter,agent,bill,time]% 
% HoldsAt(BeWaiter7(waiter),time) ->
% Terminates(Request(agent,waiter,bill),
%            BeWaiter7(waiter),
%            time).
 /*
holds_at(beWaiter7(Waiter), Time) ->
    terminates(request(Agent, Waiter, Bill),
               beWaiter7(Waiter),
               Time).
*/
axiom(terminates(request(Agent,Waiter,Bill),
		 beWaiter7(Waiter),
		 Time),
      [holds_at(beWaiter7(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3139
% [waiter,agent,bill,time]% 
% HoldsAt(BeWaiter7(waiter),time) ->
% Initiates(Request(agent,waiter,bill),
%           BeWaiter8(waiter),
%           time).
 /*
holds_at(beWaiter7(Waiter), Time) ->
    initiates(request(Agent, Waiter, Bill),
              beWaiter8(Waiter),
              Time).
*/
axiom(initiates(request(Agent,Waiter,Bill),
		beWaiter8(Waiter),
		Time),
      [holds_at(beWaiter7(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3145
% [restaurant,waiter,bill,time]% 
% WaiterOf(restaurant)=waiter &
% BillOf(restaurant)=bill &
% HoldsAt(BeWaiter8(waiter),time) ->
% Happens(PickUp(waiter,bill),time).
 /*
waiterOf(Restaurant)=Waiter, billOf(Restaurant)=Bill, holds_at(beWaiter8(Waiter), Time) ->
    happens(pickUp(Waiter, Bill), Time).
*/
axiom(happens(pickUp(Waiter,Bill),Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(billOf(Restaurant),Bill),
	holds_at(beWaiter8(Waiter),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3151
% [waiter,bill,time]% 
% HoldsAt(BeWaiter8(waiter),time) ->
% Terminates(PickUp(waiter,bill),
%            BeWaiter8(waiter),
%            time).
 /*
holds_at(beWaiter8(Waiter), Time) ->
    terminates(pickUp(Waiter, Bill),
               beWaiter8(Waiter),
               Time).
*/
axiom(terminates(pickUp(Waiter,Bill),
		 beWaiter8(Waiter),
		 Time),
      [holds_at(beWaiter8(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3157
% [waiter,bill,time]% 
% HoldsAt(BeWaiter8(waiter),time) ->
% Initiates(PickUp(waiter,bill),
%           BeWaiter9(waiter),
%           time).
 /*
holds_at(beWaiter8(Waiter), Time) ->
    initiates(pickUp(Waiter, Bill),
              beWaiter9(Waiter),
              Time).
*/
axiom(initiates(pickUp(Waiter,Bill),
		beWaiter9(Waiter),
		Time),
      [holds_at(beWaiter8(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3163
% [restaurant,waiter,bill,table,time]% 
% WaiterOf(restaurant)=waiter &
% BillOf(restaurant)=bill &
% TableOf(restaurant)=table &
% HoldsAt(BeWaiter9(waiter),time) ->
% Happens(PlaceOn(waiter,bill,table),time).
 /*
waiterOf(Restaurant)=Waiter, billOf(Restaurant)=Bill, tableOf(Restaurant)=Table, holds_at(beWaiter9(Waiter), Time) ->
    happens(placeOn(Waiter, Bill, Table), Time).
*/
axiom(happens(placeOn(Waiter,Bill,Table),Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(billOf(Restaurant),Bill),
	equals(tableOf(Restaurant),Table),
	holds_at(beWaiter9(Waiter),Time)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:3169
% 
% ectest/ec_reader_test_ecnet.e:3170
% [waiter,bill,table,time]% 
% HoldsAt(BeWaiter9(waiter),time) ->
% Terminates(PlaceOn(waiter,bill,table),
%            BeWaiter9(waiter),
%            time).
 /*
holds_at(beWaiter9(Waiter), Time) ->
    terminates(placeOn(Waiter, Bill, Table),
               beWaiter9(Waiter),
               Time).
*/
axiom(terminates(placeOn(Waiter,Bill,Table),
		 beWaiter9(Waiter),
		 Time),
      [holds_at(beWaiter9(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3176
% [waiter,bill,table,time]% 
% HoldsAt(BeWaiter9(waiter),time) ->
% Initiates(PlaceOn(waiter,bill,table),
%           BeWaiter0(waiter),
%           time).
 /*
holds_at(beWaiter9(Waiter), Time) ->
    initiates(placeOn(Waiter, Bill, Table),
              beWaiter0(Waiter),
              Time).
*/
axiom(initiates(placeOn(Waiter,Bill,Table),
		beWaiter0(Waiter),
		Time),
      [holds_at(beWaiter9(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3182
% fluent BeCook0(cook)
 /*
fluent(beCook0(cook)).
*/
fluent(beCook0(cook)).

% 
% fluent BeCook1(cook)
 /*
fluent(beCook1(cook)).
*/
fluent(beCook1(cook)).

% 
% xor BeCook0, BeCook1
 /*
xor([beCook0,beCook1]).
*/
xor([beCook0,beCook1]).

% 
% ectest/ec_reader_test_ecnet.e:3188
% [cook,agent,food,time]% 
% HoldsAt(BeCook0(cook),time) ->
% Terminates(Order(agent,cook,food),
%            BeCook0(cook),
%            time).
 /*
holds_at(beCook0(Cook), Time) ->
    terminates(order(Agent, Cook, Food),
               beCook0(Cook),
               Time).
*/
axiom(terminates(order(Agent,Cook,Food),
		 beCook0(Cook),
		 Time),
      [holds_at(beCook0(Cook),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3194
% [cook,agent,food,time]% 
% HoldsAt(BeCook0(cook),time) ->
% Initiates(Order(agent,cook,food),
%           BeCook1(cook),
%           time).
 /*
holds_at(beCook0(Cook), Time) ->
    initiates(order(Agent, Cook, Food),
              beCook1(Cook),
              Time).
*/
axiom(initiates(order(Agent,Cook,Food),
		beCook1(Cook),
		Time),
      [holds_at(beCook0(Cook),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3200
% event FoodPrepare(agent,food)
 /*
event(foodPrepare(agent,food)).
*/
event(foodPrepare(agent,food)).

% 
% fluent FoodPrepared(food)
 /*
fluent(foodPrepared(food)).
*/
fluent(foodPrepared(food)).

% 
% ectest/ec_reader_test_ecnet.e:3204
% [agent,food,time]% 
% Initiates(FoodPrepare(agent,food),
%           FoodPrepared(food),
%           time).
 /*
initiates(foodPrepare(Agent,Food),
	  foodPrepared(Food),
	  Time).
*/
axiom(initiates(foodPrepare(Agent,Food),
		foodPrepared(Food),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3209
% [agent,food,time]% 
% Happens(FoodPrepare(agent,food),time) ->
% ectest/ec_reader_test_ecnet.e:3211
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(food,location),time).
 /*
exists([Location],  (happens(foodPrepare(Agent, Food), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Food, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Food,Location),Time) ',' some([Location]),
      [happens(foodPrepare(Agent,Food),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3215
% [cook,agent,food,time]% 
% HoldsAt(BeCook1(cook),time) &
% HoldsAt(KnowOrder(cook,agent,food),time) ->
% Happens(FoodPrepare(cook,food),time).
 /*
holds_at(beCook1(Cook), Time), holds_at(knowOrder(Cook, Agent, Food), Time) ->
    happens(foodPrepare(Cook, Food), Time).
*/
axiom(happens(foodPrepare(Cook,Food),Time),
      [ holds_at(beCook1(Cook),Time),
	holds_at(knowOrder(Cook,Agent,Food),
		 Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3220
% [cook,food,time]% 
% HoldsAt(BeCook1(cook),time) ->
% Terminates(FoodPrepare(cook,food),
%            BeCook1(cook),
%            time).
 /*
holds_at(beCook1(Cook), Time) ->
    terminates(foodPrepare(Cook, Food),
               beCook1(Cook),
               Time).
*/
axiom(terminates(foodPrepare(Cook,Food),
		 beCook1(Cook),
		 Time),
      [holds_at(beCook1(Cook),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3226
% [cook,food,time]% 
% HoldsAt(BeCook1(cook),time) ->
% Initiates(FoodPrepare(cook,food),
%           BeCook0(cook),
%           time).
 /*
holds_at(beCook1(Cook), Time) ->
    initiates(foodPrepare(Cook, Food),
              beCook0(Cook),
              Time).
*/
axiom(initiates(foodPrepare(Cook,Food),
		beCook0(Cook),
		Time),
      [holds_at(beCook1(Cook),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3232
% event Pay(agent,agent)
 /*
event(pay(agent,agent)).
*/
event(pay(agent,agent)).

% 
% event Tip(agent,agent)
 /*
event(tip(agent,agent)).
*/
event(tip(agent,agent)).

% 
% ectest/ec_reader_test_ecnet.e:3236
% [agent,physobj,time]% 
% Happens(LieOn(agent,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:3238
% {room}% 
%  HoldsAt(At(agent,room),time) &
%  HoldsAt(At(physobj,room),time).
 /*
exists([Room],  (happens(lieOn(Agent, Physobj), Time)->holds_at(at(Agent, Room), Time), holds_at(at(Physobj, Room), Time))).
*/
axiom(holds_at(at(Agent,Room),Time) ',' holds_at(at(Physobj,Room),Time) ',' some([Room]),
      [happens(lieOn(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3242
% [agent,physobj,time]% 
% Happens(SitOn(agent,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:3244
% {room}% 
%  HoldsAt(At(agent,room),time) &
%  HoldsAt(At(physobj,room),time).
 /*
exists([Room],  (happens(sitOn(Agent, Physobj), Time)->holds_at(at(Agent, Room), Time), holds_at(at(Physobj, Room), Time))).
*/
axiom(holds_at(at(Agent,Room),Time) ',' holds_at(at(Physobj,Room),Time) ',' some([Room]),
      [happens(sitOn(Agent,Physobj),Time)]).

% 
% 
% event LieOn(agent,physobj)
 /*
event(lieOn(agent,physobj)).
*/
event(lieOn(agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:3250
% event SitOn(agent,physobj)
 /*
event(sitOn(agent,physobj)).
*/
event(sitOn(agent,physobj)).

% 
% event RiseFrom(agent,physobj)
 /*
event(riseFrom(agent,physobj)).
*/
event(riseFrom(agent,physobj)).

% 
% fluent LyingOn(agent,physobj)
 /*
fluent(lyingOn(agent,physobj)).
*/
fluent(lyingOn(agent,physobj)).

% fluent SittingOn(agent,physobj)
 /*
fluent(sittingOn(agent,physobj)).
*/
fluent(sittingOn(agent,physobj)).

% ectest/ec_reader_test_ecnet.e:3256
% fluent Standing(agent)
 /*
fluent(standing(agent)).
*/
fluent(standing(agent)).

% 
% fluent Lying(agent)
 /*
fluent(lying(agent)).
*/
fluent(lying(agent)).

% fluent Sitting(agent)
 /*
fluent(sitting(agent)).
*/
fluent(sitting(agent)).

% noninertial Lying
 /*
noninertial(lying).
*/
noninertial(lying).

% noninertial Sitting
 /*
noninertial(sitting).
*/
noninertial(sitting).

% ectest/ec_reader_test_ecnet.e:3262
% 
% xor Lying, Sitting, Standing
 /*
xor([lying,sitting,standing]).
*/
xor([lying,sitting,standing]).

% 
% ectest/ec_reader_test_ecnet.e:3265
% [agent,physobj,time]% 
% HoldsAt(LyingOn(agent,physobj),time) ->
% HoldsAt(Lying(agent),time).
 /*
holds_at(lyingOn(Agent, Physobj), Time) ->
    holds_at(lying(Agent), Time).
*/
axiom(holds_at(lying(Agent),Time),
      [holds_at(lyingOn(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3269
% [agent,physobj,time]% 
% HoldsAt(SittingOn(agent,physobj),time) ->
% HoldsAt(Sitting(agent),time).
 /*
holds_at(sittingOn(Agent, Physobj), Time) ->
    holds_at(sitting(Agent), Time).
*/
axiom(holds_at(sitting(Agent),Time),
      [holds_at(sittingOn(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3273
% [agent,physobj1,physobj2,time]% 
% HoldsAt(LyingOn(agent,physobj1),time) &
% HoldsAt(LyingOn(agent,physobj2),time) ->
% physobj1=physobj2.
 /*
holds_at(lyingOn(Agent, Physobj1), Time), holds_at(lyingOn(Agent, Physobj2), Time) ->
    Physobj1=Physobj2.
*/
axiom(equals(Physobj1,Physobj2),
      [ holds_at(lyingOn(Agent,Physobj1),Time),
	holds_at(lyingOn(Agent,Physobj2),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3278
% [agent,physobj1,physobj2,time]% 
% HoldsAt(SittingOn(agent,physobj1),time) &
% HoldsAt(SittingOn(agent,physobj2),time) ->
% physobj1=physobj2.
 /*
holds_at(sittingOn(Agent, Physobj1), Time), holds_at(sittingOn(Agent, Physobj2), Time) ->
    Physobj1=Physobj2.
*/
axiom(equals(Physobj1,Physobj2),
      [ holds_at(sittingOn(Agent,Physobj1),Time),
	holds_at(sittingOn(Agent,Physobj2),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3283
% [agent,physobj,time]% 
% HoldsAt(Standing(agent),time) ->
% Initiates(LieOn(agent,physobj),
%           LyingOn(agent,physobj),
%           time).
 /*
holds_at(standing(Agent), Time) ->
    initiates(lieOn(Agent, Physobj),
              lyingOn(Agent, Physobj),
              Time).
*/
axiom(initiates(lieOn(Agent,Physobj),
		lyingOn(Agent,Physobj),
		Time),
      [holds_at(standing(Agent),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3289
% [agent,physobj,time]% 
% Terminates(LieOn(agent,physobj),
%            Standing(agent),
%            time).
 /*
terminates(lieOn(Agent,Physobj),
	   standing(Agent),
	   Time).
*/
axiom(terminates(lieOn(Agent,Physobj),
		 standing(Agent),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3294
% [agent,physobj,time]% 
% HoldsAt(Standing(agent),time) ->
% Initiates(SitOn(agent,physobj),
%           SittingOn(agent,physobj),
%           time).
 /*
holds_at(standing(Agent), Time) ->
    initiates(sitOn(Agent, Physobj),
              sittingOn(Agent, Physobj),
              Time).
*/
axiom(initiates(sitOn(Agent,Physobj),
		sittingOn(Agent,Physobj),
		Time),
      [holds_at(standing(Agent),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3300
% [agent,physobj,time]% 
% Terminates(SitOn(agent,physobj),
%            Standing(agent),
%            time).
 /*
terminates(sitOn(Agent,Physobj),
	   standing(Agent),
	   Time).
*/
axiom(terminates(sitOn(Agent,Physobj),
		 standing(Agent),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3305
% [agent,physobj,time]% 
% (HoldsAt(SittingOn(agent,physobj),time) |
%  HoldsAt(LyingOn(agent,physobj),time)) ->
% Initiates(RiseFrom(agent,physobj),
%           Standing(agent),
%           time).
 /*
holds_at(sittingOn(Agent, Physobj), Time);holds_at(lyingOn(Agent, Physobj), Time) ->
    initiates(riseFrom(Agent, Physobj),
              standing(Agent),
              Time).
*/
axiom(initiates(riseFrom(Agent,Physobj),
		standing(Agent),
		Time),
      [ holds_at(sittingOn(Agent,Physobj),Time) ; holds_at(lyingOn(Agent,Physobj),Time)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:3311
% 
% ectest/ec_reader_test_ecnet.e:3312
% [agent,physobj,time]% 
% HoldsAt(LyingOn(agent,physobj),time) ->
% Terminates(RiseFrom(agent,physobj),
%            LyingOn(agent,physobj),
%            time).
 /*
holds_at(lyingOn(Agent, Physobj), Time) ->
    terminates(riseFrom(Agent, Physobj),
               lyingOn(Agent, Physobj),
               Time).
*/
axiom(terminates(riseFrom(Agent,Physobj),
		 lyingOn(Agent,Physobj),
		 Time),
      [holds_at(lyingOn(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3318
% [agent,physobj,time]% 
% HoldsAt(SittingOn(agent,physobj),time) ->
% Terminates(RiseFrom(agent,physobj),
%            SittingOn(agent,physobj),
%            time).
 /*
holds_at(sittingOn(Agent, Physobj), Time) ->
    terminates(riseFrom(Agent, Physobj),
               sittingOn(Agent, Physobj),
               Time).
*/
axiom(terminates(riseFrom(Agent,Physobj),
		 sittingOn(Agent,Physobj),
		 Time),
      [holds_at(sittingOn(Agent,Physobj),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3324
% event Greet(agent,agent)
 /*
event(greet(agent,agent)).
*/
event(greet(agent,agent)).

% 
% event SayGoodbye(agent,agent)
 /*
event(sayGoodbye(agent,agent)).
*/
event(sayGoodbye(agent,agent)).

% 
% ectest/ec_reader_test_ecnet.e:3328
% [agent1,agent2,time]% 
% Happens(Greet(agent1,agent2),time) ->
% ectest/ec_reader_test_ecnet.e:3330
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(greet(Agent1, Agent2), Time)->holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [happens(greet(Agent1,Agent2),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3334
% [agent1,agent2,time]% 
% Happens(SayGoodbye(agent1,agent2),time) ->
% ectest/ec_reader_test_ecnet.e:3336
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(sayGoodbye(Agent1, Agent2), Time)->holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [happens(sayGoodbye(Agent1,Agent2),Time)]).

% 
% 
% event Order(agent,agent,physobj)
 /*
event(order(agent,agent,physobj)).
*/
event(order(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:3342
% fluent KnowOrder(agent,agent,physobj)
 /*
fluent(knowOrder(agent,agent,physobj)).
*/
fluent(knowOrder(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:3344
% [agent1,agent2,physobj,time]% 
% Initiates(Order(agent1,agent2,physobj),
%           KnowOrder(agent2,agent1,physobj),
%           time).
 /*
initiates(order(Agent1,Agent2,Physobj),
	  knowOrder(Agent2,Agent1,Physobj),
	  Time).
*/
axiom(initiates(order(Agent1,Agent2,Physobj),
		knowOrder(Agent2,Agent1,Physobj),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3349
% [agent1,agent2,physobj,time]% 
% Happens(Order(agent1,agent2,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:3351
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(order(Agent1, Agent2, Physobj), Time)->holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [ happens(order(Agent1,Agent2,Physobj),
		Time)
      ]).

% 
% 
% event Request(agent,agent,physobj)
 /*
event(request(agent,agent,physobj)).
*/
event(request(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:3357
% fluent KnowRequest(agent,agent,physobj)
 /*
fluent(knowRequest(agent,agent,physobj)).
*/
fluent(knowRequest(agent,agent,physobj)).

% 
% ectest/ec_reader_test_ecnet.e:3359
% [agent1,agent2,physobj,time]% 
% Initiates(Request(agent1,agent2,physobj),
%           KnowRequest(agent2,agent1,physobj),
%           time).
 /*
initiates(request(Agent1,Agent2,Physobj),
	  knowRequest(Agent2,Agent1,Physobj),
	  Time).
*/
axiom(initiates(request(Agent1,Agent2,Physobj),
		knowRequest(Agent2,Agent1,Physobj),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3364
% [agent1,agent2,physobj,time]% 
% Happens(Request(agent1,agent2,physobj),time) ->
% ectest/ec_reader_test_ecnet.e:3366
% {location}% 
% HoldsAt(At(agent1,location),time) &
% HoldsAt(At(agent2,location),time).
 /*
exists([Location],  (happens(request(Agent1, Agent2, Physobj), Time)->holds_at(at(Agent1, Location), Time), holds_at(at(Agent2, Location), Time))).
*/
axiom(holds_at(at(Agent1,Location),Time) ',' holds_at(at(Agent2,Location),Time) ',' some([Location]),
      [ happens(request(Agent1,Agent2,Physobj),
		Time)
      ]).

% 
% 
%; End of file.
% 
% ectest/ec_reader_test_ecnet.e:3372
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Diving.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; scuba diving
%;
% ectest/ec_reader_test_ecnet.e:3390
% 
% sort object
 /*
sort(object).
*/
sort(object).

% sort agent: object
 /*
subsort(agent,object).
*/
subsort(agent,object).
sort(agent).
sort(object).

% sort diver: agent
 /*
subsort(diver,agent).
*/
subsort(diver,agent).
sort(diver).
sort(agent).

% sort depth: integer
 /*
subsort(depth,integer).
*/
subsort(depth,integer).
sort(depth).
sort(integer).

% sort boat: object
 /*
subsort(boat,object).
*/
subsort(boat,object).
sort(boat).
sort(object).

% ectest/ec_reader_test_ecnet.e:3396
% 
%; reference line, anchor line, shotline, SMB line, ...
% sort line: object
 /*
subsort(line,object).
*/
subsort(line,object).
sort(line).
sort(object).

% 
% sort equipment: object
 /*
subsort(equipment,object).
*/
subsort(equipment,object).
sort(equipment).
sort(object).

% sort weight: equipment
 /*
subsort(weight,equipment).
*/
subsort(weight,equipment).
sort(weight).
sort(equipment).

% ectest/ec_reader_test_ecnet.e:3402
% sort fin: equipment
 /*
subsort(fin,equipment).
*/
subsort(fin,equipment).
sort(fin).
sort(equipment).

% sort airtank: equipment
 /*
subsort(airtank,equipment).
*/
subsort(airtank,equipment).
sort(airtank).
sort(equipment).

% 
%; buoyancy compensator (BC)
%; buoyancy control device (BCD)
% sort computer: equipment
 /*
subsort(computer,equipment).
*/
subsort(computer,equipment).
sort(computer).
sort(equipment).

% ectest/ec_reader_test_ecnet.e:3408
% sort bc: equipment
 /*
subsort(bc,equipment).
*/
subsort(bc,equipment).
sort(bc).
sort(equipment).

% 
% fluent AtDepth(object,depth)
 /*
fluent(atDepth(object,depth)).
*/
fluent(atDepth(object,depth)).

% 
% ectest/ec_reader_test_ecnet.e:3412
% [object,depth1,depth2,time]% 
% HoldsAt(AtDepth(object,depth1),time) &
% HoldsAt(AtDepth(object,depth2),time) ->
% depth1 = depth2.
 /*
holds_at(atDepth(Object, Depth1), Time), holds_at(atDepth(Object, Depth2), Time) ->
    Depth1=Depth2.
*/
axiom(equals(Depth1,Depth2),
      [ holds_at(atDepth(Object,Depth1),Time),
	holds_at(atDepth(Object,Depth2),Time)
      ]).

% 
% 
% event Ascend(diver,depth)
 /*
event(ascend(diver,depth)).
*/
event(ascend(diver,depth)).

% ectest/ec_reader_test_ecnet.e:3418
% 
% event Descend(diver,depth)
 /*
event(descend(diver,depth)).
*/
event(descend(diver,depth)).

% 
% ectest/ec_reader_test_ecnet.e:3421
% [diver,depth1,depth2,time]% 
% HoldsAt(AtDepth(diver,depth1),time) &
% Happens(Descend(diver,depth2),time) ->
% depth2>depth1.
 /*
holds_at(atDepth(Diver, Depth1), Time), happens(descend(Diver, Depth2), Time) ->
    Depth2>Depth1.
*/
axiom(Depth2 > Depth1,
      [ holds_at(atDepth(Diver,Depth1),Time),
	happens(descend(Diver,Depth2),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3426
% [diver,depth1,depth2,time]% 
% HoldsAt(AtDepth(diver,depth1),time) &
% Happens(Ascend(diver,depth2),time) ->
% depth2<depth1.
 /*
holds_at(atDepth(Diver, Depth1), Time), happens(ascend(Diver, Depth2), Time) ->
    Depth2<Depth1.
*/
axiom(Depth2 < Depth1,
      [ holds_at(atDepth(Diver,Depth1),Time),
	happens(ascend(Diver,Depth2),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3431
% [diver,depth,time]% 
% Initiates(Descend(diver,depth),AtDepth(diver,depth),time).
 /*
initiates(descend(Diver,Depth),
	  atDepth(Diver,Depth),
	  Time).
*/
axiom(initiates(descend(Diver,Depth),
		atDepth(Diver,Depth),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3434
% [diver,depth1,depth2,time]% 
% HoldsAt(AtDepth(diver,depth1),time) ->
% Terminates(Descend(diver,depth2),AtDepth(diver,depth1),time).
 /*
holds_at(atDepth(Diver, Depth1), Time) ->
    terminates(descend(Diver, Depth2),
               atDepth(Diver, Depth1),
               Time).
*/
axiom(terminates(descend(Diver,Depth2),
		 atDepth(Diver,Depth1),
		 Time),
      [holds_at(atDepth(Diver,Depth1),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3438
% [diver,depth,time]% 
% Initiates(Ascend(diver,depth),AtDepth(diver,depth),time).
 /*
initiates(ascend(Diver,Depth),
	  atDepth(Diver,Depth),
	  Time).
*/
axiom(initiates(ascend(Diver,Depth),
		atDepth(Diver,Depth),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3441
% [diver,depth1,depth2,time]% 
% HoldsAt(AtDepth(diver,depth1),time) ->
% Terminates(Ascend(diver,depth2),AtDepth(diver,depth1),time).
 /*
holds_at(atDepth(Diver, Depth1), Time) ->
    terminates(ascend(Diver, Depth2),
               atDepth(Diver, Depth1),
               Time).
*/
axiom(terminates(ascend(Diver,Depth2),
		 atDepth(Diver,Depth1),
		 Time),
      [holds_at(atDepth(Diver,Depth1),Time)]).

% 
% 
% fluent Wearing(diver,equipment)
 /*
fluent(wearing(diver,equipment)).
*/
fluent(wearing(diver,equipment)).

% 
% ectest/ec_reader_test_ecnet.e:3447
% event PutOn(diver,equipment)
 /*
event(putOn(diver,equipment)).
*/
event(putOn(diver,equipment)).

% 
% event TakeOff(diver,equipment)
 /*
event(takeOff(diver,equipment)).
*/
event(takeOff(diver,equipment)).

% 
% event Lose(diver,equipment)
 /*
event(lose(diver,equipment)).
*/
event(lose(diver,equipment)).

% 
% ectest/ec_reader_test_ecnet.e:3453
% [diver,equipment,depth,time]% 
% Releases(PutOn(diver,equipment),AtDepth(equipment,depth),time).
 /*
releases(putOn(Diver,Equipment),
	 atDepth(Equipment,Depth),
	 Time).
*/
axiom(releases(putOn(Diver,Equipment),
	       atDepth(Equipment,Depth),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3456
% [diver,equipment,time]% 
% Releases(PutOn(diver,equipment),UnderWater(equipment),time).
 /*
releases(putOn(Diver,Equipment),
	 underWater(Equipment),
	 Time).
*/
axiom(releases(putOn(Diver,Equipment),
	       underWater(Equipment),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3459
% [diver,equipment,time]% 
% Happens(PutOn(diver,equipment),time) ->
% !{diver1} HoldsAt(Wearing(diver1,equipment),time).
 /*
happens(putOn(Diver, Equipment), Time) ->
    not(exists([Diver1],
               holds_at(wearing(Diver1, Equipment), Time))).
*/
axiom(holds_at(neg(wearing(Diver1,Equipment)),Time),
      [happens(putOn(Diver,Equipment),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3463
% [diver,depth,equipment,time]% 
% HoldsAt(Wearing(diver,equipment),time) ->
% (HoldsAt(AtDepth(diver,depth),time) <->
%  HoldsAt(AtDepth(equipment,depth),time)).
 /*
holds_at(wearing(Diver, Equipment), Time) ->
    ( holds_at(atDepth(Diver, Depth), Time)<->holds_at(atDepth(Equipment, Depth), Time)
    ).
*/
axiom(holds_at(wearing(Diver,Equipment),Time) ',' holds_at(atDepth(Equipment,Depth),Time),
      [ holds_at(wearing(Diver,Equipment),Time),
	holds_at(atDepth(Diver,Depth),Time)
      ]).
axiom(holds_at(wearing(Diver,Equipment),Time) ',' holds_at(atDepth(Diver,Depth),Time),
      [ holds_at(wearing(Diver,Equipment),Time),
	holds_at(atDepth(Equipment,Depth),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3468
% [diver,depth,object,time]% 
% HoldsAt(Holding(diver,object),time) ->
% (HoldsAt(AtDepth(diver,depth),time) <->
%  HoldsAt(AtDepth(object,depth),time)).
 /*
holds_at(holding(Diver, Object), Time) ->
    ( holds_at(atDepth(Diver, Depth), Time)<->holds_at(atDepth(Object, Depth), Time)
    ).
*/
axiom(holds_at(holding(Diver,Object),Time) ',' holds_at(atDepth(Object,Depth),Time),
      [ holds_at(holding(Diver,Object),Time),
	holds_at(atDepth(Diver,Depth),Time)
      ]).
axiom(holds_at(holding(Diver,Object),Time) ',' holds_at(atDepth(Diver,Depth),Time),
      [ holds_at(holding(Diver,Object),Time),
	holds_at(atDepth(Object,Depth),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3473
% [diver,equipment,time]% 
% HoldsAt(Wearing(diver,equipment),time) ->
% (HoldsAt(UnderWater(diver),time) <->
%  HoldsAt(UnderWater(equipment),time)).
 /*
holds_at(wearing(Diver, Equipment), Time) ->
    ( holds_at(underWater(Diver), Time)<->holds_at(underWater(Equipment), Time)
    ).
*/
axiom(holds_at(wearing(Diver,Equipment),Time) ',' holds_at(underWater(Equipment),Time),
      [ holds_at(wearing(Diver,Equipment),Time),
	holds_at(underWater(Diver),Time)
      ]).
axiom(holds_at(wearing(Diver,Equipment),Time) ',' holds_at(underWater(Diver),Time),
      [ holds_at(wearing(Diver,Equipment),Time),
	holds_at(underWater(Equipment),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3478
% [diver,object,time]% 
% HoldsAt(Holding(diver,object),time) ->
% (HoldsAt(UnderWater(diver),time) <->
%  HoldsAt(UnderWater(object),time)).
 /*
holds_at(holding(Diver, Object), Time) ->
    ( holds_at(underWater(Diver), Time)<->holds_at(underWater(Object), Time)
    ).
*/
axiom(holds_at(holding(Diver,Object),Time) ',' holds_at(underWater(Object),Time),
      [ holds_at(holding(Diver,Object),Time),
	holds_at(underWater(Diver),Time)
      ]).
axiom(holds_at(holding(Diver,Object),Time) ',' holds_at(underWater(Diver),Time),
      [ holds_at(holding(Diver,Object),Time),
	holds_at(underWater(Object),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3483
% [diver,depth,equipment,time]% 
% HoldsAt(AtDepth(diver,depth),time) &
% HoldsAt(Wearing(diver,equipment),time) ->
% Initiates(TakeOff(diver,equipment),AtDepth(equipment,depth),time).
 /*
holds_at(atDepth(Diver, Depth), Time), holds_at(wearing(Diver, Equipment), Time) ->
    initiates(takeOff(Diver, Equipment),
              atDepth(Equipment, Depth),
              Time).
*/
axiom(initiates(takeOff(Diver,Equipment),
		atDepth(Equipment,Depth),
		Time),
      [ holds_at(atDepth(Diver,Depth),Time),
	holds_at(wearing(Diver,Equipment),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3488
% [diver,depth,equipment,time]% 
% !HoldsAt(AtDepth(diver,depth),time) &
% HoldsAt(Wearing(diver,equipment),time) ->
% Terminates(TakeOff(diver,equipment),AtDepth(equipment,depth),time).
 /*
not(holds_at(atDepth(Diver, Depth), Time)), holds_at(wearing(Diver, Equipment), Time) ->
    terminates(takeOff(Diver, Equipment),
               atDepth(Equipment, Depth),
               Time).
*/
axiom(terminates(takeOff(Diver,Equipment),
		 atDepth(Equipment,Depth),
		 Time),
      [ holds_at(neg(atDepth(Diver,Depth)),Time),
	holds_at(wearing(Diver,Equipment),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3493
% [diver,equipment,time]% 
% HoldsAt(UnderWater(diver),time) ->
% Initiates(TakeOff(diver,equipment),UnderWater(equipment),time).
 /*
holds_at(underWater(Diver), Time) ->
    initiates(takeOff(Diver, Equipment),
              underWater(Equipment),
              Time).
*/
axiom(initiates(takeOff(Diver,Equipment),
		underWater(Equipment),
		Time),
      [holds_at(underWater(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3497
% [diver,equipment,time]% 
% !HoldsAt(UnderWater(diver),time) ->
% Terminates(TakeOff(diver,equipment),UnderWater(equipment),time).
 /*
not(holds_at(underWater(Diver), Time)) ->
    terminates(takeOff(Diver, Equipment),
               underWater(Equipment),
               Time).
*/
axiom(terminates(takeOff(Diver,Equipment),
		 underWater(Equipment),
		 Time),
      [holds_at(neg(underWater(Diver)),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3501
% [diver,equipment,depth,time]% 
% HoldsAt(AtDepth(diver,depth),time) &
% HoldsAt(Wearing(diver,equipment),time) ->
% Initiates(Lose(diver,equipment),AtDepth(equipment,depth),time).
 /*
holds_at(atDepth(Diver, Depth), Time), holds_at(wearing(Diver, Equipment), Time) ->
    initiates(lose(Diver, Equipment),
              atDepth(Equipment, Depth),
              Time).
*/
axiom(initiates(lose(Diver,Equipment),
		atDepth(Equipment,Depth),
		Time),
      [ holds_at(atDepth(Diver,Depth),Time),
	holds_at(wearing(Diver,Equipment),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3506
% [diver,equipment,depth,time]% 
% !HoldsAt(AtDepth(diver,depth),time) &
% HoldsAt(Wearing(diver,equipment),time) ->
% Terminates(Lose(diver,equipment),AtDepth(equipment,depth),time).
 /*
not(holds_at(atDepth(Diver, Depth), Time)), holds_at(wearing(Diver, Equipment), Time) ->
    terminates(lose(Diver, Equipment),
               atDepth(Equipment, Depth),
               Time).
*/
axiom(terminates(lose(Diver,Equipment),
		 atDepth(Equipment,Depth),
		 Time),
      [ holds_at(neg(atDepth(Diver,Depth)),Time),
	holds_at(wearing(Diver,Equipment),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3511
% [diver,equipment,time]% 
% HoldsAt(UnderWater(diver),time) ->
% Initiates(Lose(diver,equipment),UnderWater(equipment),time).
 /*
holds_at(underWater(Diver), Time) ->
    initiates(lose(Diver, Equipment),
              underWater(Equipment),
              Time).
*/
axiom(initiates(lose(Diver,Equipment),
		underWater(Equipment),
		Time),
      [holds_at(underWater(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3515
% [diver,equipment,time]% 
% !HoldsAt(UnderWater(diver),time) ->
% Terminates(Lose(diver,equipment),UnderWater(equipment),time).
 /*
not(holds_at(underWater(Diver), Time)) ->
    terminates(lose(Diver, Equipment),
               underWater(Equipment),
               Time).
*/
axiom(terminates(lose(Diver,Equipment),
		 underWater(Equipment),
		 Time),
      [holds_at(neg(underWater(Diver)),Time)]).

% 
% 
% fluent Holding(diver,object)
 /*
fluent(holding(diver,object)).
*/
fluent(holding(diver,object)).

% 
% ectest/ec_reader_test_ecnet.e:3521
% [diver1,diver2,time]% 
% HoldsAt(Holding(diver1,diver2),time) ->
% !HoldsAt(Holding(diver2,diver1),time).
 /*
holds_at(holding(Diver1, Diver2), Time) ->
    not(holds_at(holding(Diver2, Diver1), Time)).
*/
axiom(holds_at(neg(holding(Diver2,Diver1)),Time),
      [holds_at(holding(Diver1,Diver2),Time)]).

% 
% 
% event Grab(diver,object)
 /*
event(grab(diver,object)).
*/
event(grab(diver,object)).

% 
% ectest/ec_reader_test_ecnet.e:3527
% event LetGoOf(diver,object)
 /*
event(letGoOf(diver,object)).
*/
event(letGoOf(diver,object)).

% 
% ectest/ec_reader_test_ecnet.e:3529
% [diver,object,time]% 
% Initiates(Grab(diver,object),Holding(diver,object),time).
 /*
initiates(grab(Diver,Object),
	  holding(Diver,Object),
	  Time).
*/
axiom(initiates(grab(Diver,Object),
		holding(Diver,Object),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3532
% [diver,object,time]% 
% Terminates(LetGoOf(diver,object),Holding(diver,object),time).
 /*
terminates(letGoOf(Diver,Object),
	   holding(Diver,Object),
	   Time).
*/
axiom(terminates(letGoOf(Diver,Object),
		 holding(Diver,Object),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3535
% [diver,object,depth,time]% 
% Releases(Grab(diver,object),AtDepth(object,depth),time).
 /*
releases(grab(Diver,Object),
	 atDepth(Object,Depth),
	 Time).
*/
axiom(releases(grab(Diver,Object),
	       atDepth(Object,Depth),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3538
% [diver,object,time]% 
% Releases(Grab(diver,object),UnderWater(object),time).
 /*
releases(grab(Diver,Object),
	 underWater(Object),
	 Time).
*/
axiom(releases(grab(Diver,Object),
	       underWater(Object),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3541
% [diver,object,depth,time]% 
% HoldsAt(AtDepth(diver,depth),time) &
% HoldsAt(Holding(diver,object),time) ->
% Initiates(LetGoOf(diver,object),AtDepth(object,depth),time).
 /*
holds_at(atDepth(Diver, Depth), Time), holds_at(holding(Diver, Object), Time) ->
    initiates(letGoOf(Diver, Object),
              atDepth(Object, Depth),
              Time).
*/
axiom(initiates(letGoOf(Diver,Object),
		atDepth(Object,Depth),
		Time),
      [ holds_at(atDepth(Diver,Depth),Time),
	holds_at(holding(Diver,Object),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3546
% [diver,object,depth,time]% 
% !HoldsAt(AtDepth(diver,depth),time) &
% HoldsAt(Holding(diver,object),time) ->
% Terminates(LetGoOf(diver,object),AtDepth(object,depth),time).
 /*
not(holds_at(atDepth(Diver, Depth), Time)), holds_at(holding(Diver, Object), Time) ->
    terminates(letGoOf(Diver, Object),
               atDepth(Object, Depth),
               Time).
*/
axiom(terminates(letGoOf(Diver,Object),
		 atDepth(Object,Depth),
		 Time),
      [ holds_at(neg(atDepth(Diver,Depth)),Time),
	holds_at(holding(Diver,Object),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3551
% [diver,object,time]% 
% HoldsAt(UnderWater(diver),time) ->
% Initiates(LetGoOf(diver,object),UnderWater(object),time).
 /*
holds_at(underWater(Diver), Time) ->
    initiates(letGoOf(Diver, Object),
              underWater(Object),
              Time).
*/
axiom(initiates(letGoOf(Diver,Object),
		underWater(Object),
		Time),
      [holds_at(underWater(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3555
% [diver,object,time]% 
% !HoldsAt(UnderWater(diver),time) ->
% Terminates(LetGoOf(diver,object),UnderWater(object),time).
 /*
not(holds_at(underWater(Diver), Time)) ->
    terminates(letGoOf(Diver, Object),
               underWater(Object),
               Time).
*/
axiom(terminates(letGoOf(Diver,Object),
		 underWater(Object),
		 Time),
      [holds_at(neg(underWater(Diver)),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3559
% [diver,equipment,time]% 
% Initiates(PutOn(diver,equipment),Wearing(diver,equipment),time).
 /*
initiates(putOn(Diver,Equipment),
	  wearing(Diver,Equipment),
	  Time).
*/
axiom(initiates(putOn(Diver,Equipment),
		wearing(Diver,Equipment),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3562
% [diver,equipment,time]% 
% Happens(PutOn(diver,equipment),time) ->
% !HoldsAt(UnderWater(diver),time).
 /*
happens(putOn(Diver, Equipment), Time) ->
    not(holds_at(underWater(Diver), Time)).
*/
axiom(holds_at(neg(underWater(Diver)),Time),
      [happens(putOn(Diver,Equipment),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3566
% [diver,equipment,time]% 
% Terminates(TakeOff(diver,equipment),Wearing(diver,equipment),time).
 /*
terminates(takeOff(Diver,Equipment),
	   wearing(Diver,Equipment),
	   Time).
*/
axiom(terminates(takeOff(Diver,Equipment),
		 wearing(Diver,Equipment),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3569
% [diver,equipment,time]% 
% Terminates(Lose(diver,equipment),Wearing(diver,equipment),time).
 /*
terminates(lose(Diver,Equipment),
	   wearing(Diver,Equipment),
	   Time).
*/
axiom(terminates(lose(Diver,Equipment),
		 wearing(Diver,Equipment),
		 Time),
      []).

% 
% 
% fluent Vertical(diver)
 /*
fluent(vertical(diver)).
*/
fluent(vertical(diver)).

% 
% fluent HorizontalDown(diver)
 /*
fluent(horizontalDown(diver)).
*/
fluent(horizontalDown(diver)).

% ectest/ec_reader_test_ecnet.e:3575
% 
% fluent Inverted(diver)
 /*
fluent(inverted(diver)).
*/
fluent(inverted(diver)).

% 
% fluent HorizontalUp(diver)
 /*
fluent(horizontalUp(diver)).
*/
fluent(horizontalUp(diver)).

% 
% xor Vertical, HorizontalDown, Inverted, HorizontalUp
 /*
xor([vertical,horizontalDown,inverted,horizontalUp]).
*/
xor([vertical,horizontalDown,inverted,horizontalUp]).

% ectest/ec_reader_test_ecnet.e:3581
% 
% event RotatePitch(diver)
 /*
event(rotatePitch(diver)).
*/
event(rotatePitch(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3584
% [diver,time]% 
% HoldsAt(Vertical(diver),time) ->
% Initiates(RotatePitch(diver),HorizontalDown(diver),time).
 /*
holds_at(vertical(Diver), Time) ->
    initiates(rotatePitch(Diver), horizontalDown(Diver), Time).
*/
axiom(initiates(rotatePitch(Diver),
		horizontalDown(Diver),
		Time),
      [holds_at(vertical(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3588
% [diver,time]% 
% HoldsAt(HorizontalDown(diver),time) ->
% Initiates(RotatePitch(diver),Inverted(diver),time).
 /*
holds_at(horizontalDown(Diver), Time) ->
    initiates(rotatePitch(Diver), inverted(Diver), Time).
*/
axiom(initiates(rotatePitch(Diver),
		inverted(Diver),
		Time),
      [holds_at(horizontalDown(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3592
% [diver,time]% 
% HoldsAt(HorizontalDown(diver),time) ->
% Terminates(RotatePitch(diver),HorizontalDown(diver),time).
 /*
holds_at(horizontalDown(Diver), Time) ->
    terminates(rotatePitch(Diver),
               horizontalDown(Diver),
               Time).
*/
axiom(terminates(rotatePitch(Diver),
		 horizontalDown(Diver),
		 Time),
      [holds_at(horizontalDown(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3596
% [diver,time]% 
% HoldsAt(Inverted(diver),time) ->
% Initiates(RotatePitch(diver),HorizontalUp(diver),time).
 /*
holds_at(inverted(Diver), Time) ->
    initiates(rotatePitch(Diver), horizontalUp(Diver), Time).
*/
axiom(initiates(rotatePitch(Diver),
		horizontalUp(Diver),
		Time),
      [holds_at(inverted(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3600
% [diver,time]% 
% HoldsAt(Inverted(diver),time) ->
% Terminates(RotatePitch(diver),Inverted(diver),time).
 /*
holds_at(inverted(Diver), Time) ->
    terminates(rotatePitch(Diver), inverted(Diver), Time).
*/
axiom(terminates(rotatePitch(Diver),
		 inverted(Diver),
		 Time),
      [holds_at(inverted(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3604
% [diver,time]% 
% HoldsAt(HorizontalUp(diver),time) ->
% Initiates(RotatePitch(diver),Vertical(diver),time).
 /*
holds_at(horizontalUp(Diver), Time) ->
    initiates(rotatePitch(Diver), vertical(Diver), Time).
*/
axiom(initiates(rotatePitch(Diver),
		vertical(Diver),
		Time),
      [holds_at(horizontalUp(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3608
% [diver,time]% 
% HoldsAt(HorizontalUp(diver),time) ->
% Terminates(RotatePitch(diver),HorizontalUp(diver),time).
 /*
holds_at(horizontalUp(Diver), Time) ->
    terminates(rotatePitch(Diver), horizontalUp(Diver), Time).
*/
axiom(terminates(rotatePitch(Diver),
		 horizontalUp(Diver),
		 Time),
      [holds_at(horizontalUp(Diver),Time)]).

% 
% 
% event RotateYaw(diver)
 /*
event(rotateYaw(diver)).
*/
event(rotateYaw(diver)).

% 
%; try taking out Holding condition here
% ectest/ec_reader_test_ecnet.e:3615
% [diver,time]% 
% Happens(Ascend1(diver),time) &
% !Happens(RapidAscendToSurface(diver),time) &
% !({diver1} HoldsAt(Holding(diver,diver1),time)) ->
% Happens(RotateYaw(diver),time).
 /*
happens(ascend1(Diver), Time), not(happens(rapidAscendToSurface(Diver), Time)), not(exists([Diver1], holds_at(holding(Diver, Diver1), Time))) ->
    happens(rotateYaw(Diver), Time).
*/
axiom(happens(rotateYaw(Diver),Time),
      [ happens(ascend1(Diver),Time),
	not(happens(rapidAscendToSurface(Diver),Time)),
	holds_at(neg(holding(Diver,Diver1)),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3621
% fluent UnderWater(object)
 /*
fluent(underWater(object)).
*/
fluent(underWater(object)).

% 
% ectest/ec_reader_test_ecnet.e:3623
% [object,depth,time]% 
% depth>% 0 &
% HoldsAt(AtDepth(object,depth),time) ->
% HoldsAt(UnderWater(object),time).
 /*
Depth>0, holds_at(atDepth(Object, Depth), Time) ->
    holds_at(underWater(Object), Time).
*/
axiom(holds_at(underWater(Object),Time),
      [ Depth > 0,
	holds_at(atDepth(Object,Depth),Time)
      ]).

% 
% 
% event EnterWater(object)
 /*
event(enterWater(object)).
*/
event(enterWater(object)).

% ectest/ec_reader_test_ecnet.e:3629
% 
% event Surface(object)
 /*
event(surface(object)).
*/
event(surface(object)).

% 
% ectest/ec_reader_test_ecnet.e:3632
% [object,time]% 
% Initiates(EnterWater(object),UnderWater(object),time).
 /*
initiates(enterWater(Object),underWater(Object),Time).
*/
axiom(initiates(enterWater(Object),
		underWater(Object),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3635
% [diver,time]% 
% Happens(EnterWater(diver),time) ->
% !{diver1} HoldsAt(Holding(diver1,diver),time).
 /*
happens(enterWater(Diver), Time) ->
    not(exists([Diver1],
               holds_at(holding(Diver1, Diver), Time))).
*/
axiom(holds_at(neg(holding(Diver1,Diver)),Time),
      [happens(enterWater(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3639
% [object,depth,time]% 
% depth=% 0 ->
% Initiates(EnterWater(object),AtDepth(object,depth),time).
 /*
Depth=0 ->
    initiates(enterWater(Object),
              atDepth(Object, Depth),
              Time).
*/
axiom(initiates(enterWater(Object),
		atDepth(Object,Depth),
		Time),
      [equals(Depth,0)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3643
% [object,time]% 
% Terminates(Surface(object),UnderWater(object),time).
 /*
terminates(surface(Object),underWater(Object),Time).
*/
axiom(terminates(surface(Object),
		 underWater(Object),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3646
% [diver,time]% 
% Terminates(Surface(diver),PositivelyBuoyant(diver),time).
 /*
terminates(surface(Diver),
	   positivelyBuoyant(Diver),
	   Time).
*/
axiom(terminates(surface(Diver),
		 positivelyBuoyant(Diver),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3649
% [diver,time]% 
% Terminates(Surface(diver),NegativelyBuoyant(diver),time).
 /*
terminates(surface(Diver),
	   negativelyBuoyant(Diver),
	   Time).
*/
axiom(terminates(surface(Diver),
		 negativelyBuoyant(Diver),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3652
% [diver,time]% 
% Terminates(Surface(diver),NeutrallyBuoyant(diver),time).
 /*
terminates(surface(Diver),
	   neutrallyBuoyant(Diver),
	   Time).
*/
axiom(terminates(surface(Diver),
		 neutrallyBuoyant(Diver),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3655
% [object,depth,time]% 
% Terminates(Surface(object),AtDepth(object,depth),time).
 /*
terminates(surface(Object),
	   atDepth(Object,Depth),
	   Time).
*/
axiom(terminates(surface(Object),
		 atDepth(Object,Depth),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3658
% [diver,time] % Happens(EnterWater(diver),time) ->
% HoldsAt(Vertical(diver),time).
 /*
happens(enterWater(Diver), Time) ->
    holds_at(vertical(Diver), Time).
*/
axiom(holds_at(vertical(Diver),Time),
      [happens(enterWater(Diver),Time)]).

% 
% 
% fluent StandingOn(diver,boat)
 /*
fluent(standingOn(diver,boat)).
*/
fluent(standingOn(diver,boat)).

% 
% event StandOn(diver,boat)
 /*
event(standOn(diver,boat)).
*/
event(standOn(diver,boat)).

% ectest/ec_reader_test_ecnet.e:3664
% 
% ectest/ec_reader_test_ecnet.e:3665
% [diver,boat,time]% 
% Terminates(EnterWater(diver),StandingOn(diver,boat),time).
 /*
terminates(enterWater(Diver),
	   standingOn(Diver,Boat),
	   Time).
*/
axiom(terminates(enterWater(Diver),
		 standingOn(Diver,Boat),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3668
% [diver,boat,time]% 
% Initiates(StandOn(diver,boat),StandingOn(diver,boat),time).
 /*
initiates(standOn(Diver,Boat),
	  standingOn(Diver,Boat),
	  Time).
*/
axiom(initiates(standOn(Diver,Boat),
		standingOn(Diver,Boat),
		Time),
      []).

% 
% 
% fluent PositivelyBuoyant(diver)
 /*
fluent(positivelyBuoyant(diver)).
*/
fluent(positivelyBuoyant(diver)).

% 
% fluent NeutrallyBuoyant(diver)
 /*
fluent(neutrallyBuoyant(diver)).
*/
fluent(neutrallyBuoyant(diver)).

% ectest/ec_reader_test_ecnet.e:3674
% 
% fluent NegativelyBuoyant(diver)
 /*
fluent(negativelyBuoyant(diver)).
*/
fluent(negativelyBuoyant(diver)).

% 
% mutex PositivelyBuoyant, NeutrallyBuoyant, NegativelyBuoyant
 /*
mutex(positivelyBuoyant).
*/
mutex(positivelyBuoyant).

 /*
mutex(neutrallyBuoyant).
*/
mutex(neutrallyBuoyant).

 /*
mutex(negativelyBuoyant).
*/
mutex(negativelyBuoyant).

% 
% ectest/ec_reader_test_ecnet.e:3679
% [diver,time]% 
% HoldsAt(PositivelyBuoyant(diver),time) ->
% HoldsAt(UnderWater(diver),time).
 /*
holds_at(positivelyBuoyant(Diver), Time) ->
    holds_at(underWater(Diver), Time).
*/
axiom(holds_at(underWater(Diver),Time),
      [holds_at(positivelyBuoyant(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3683
% [diver,time]% 
% HoldsAt(NeutrallyBuoyant(diver),time) ->
% HoldsAt(UnderWater(diver),time).
 /*
holds_at(neutrallyBuoyant(Diver), Time) ->
    holds_at(underWater(Diver), Time).
*/
axiom(holds_at(underWater(Diver),Time),
      [holds_at(neutrallyBuoyant(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3687
% [diver,time]% 
% HoldsAt(NegativelyBuoyant(diver),time) ->
% HoldsAt(UnderWater(diver),time).
 /*
holds_at(negativelyBuoyant(Diver), Time) ->
    holds_at(underWater(Diver), Time).
*/
axiom(holds_at(underWater(Diver),Time),
      [holds_at(negativelyBuoyant(Diver),Time)]).

% 
% 
% event PressDeflateButton(diver,bc)
 /*
event(pressDeflateButton(diver,bc)).
*/
event(pressDeflateButton(diver,bc)).

% 
% ectest/ec_reader_test_ecnet.e:3693
% event PressDumpButton(diver,bc)
 /*
event(pressDumpButton(diver,bc)).
*/
event(pressDumpButton(diver,bc)).

% 
% event PressInflateButton(diver,bc)
 /*
event(pressInflateButton(diver,bc)).
*/
event(pressInflateButton(diver,bc)).

% 
% ectest/ec_reader_test_ecnet.e:3697
% [diver,bc,time]% 
% Happens(PressDeflateButton(diver,bc),time) ->
% HoldsAt(Vertical(diver),time) &
% HoldsAt(UnderWater(bc),time).
 /*
happens(pressDeflateButton(Diver, Bc), Time) ->
    holds_at(vertical(Diver), Time),
    holds_at(underWater(Bc), Time).
*/
axiom(holds_at(vertical(Diver),Time) ',' holds_at(underWater(Bc),Time),
      [happens(pressDeflateButton(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3702
% [diver,bc,time]% 
% Happens(PressDumpButton(diver,bc),time) ->
% HoldsAt(Vertical(diver),time) &
% HoldsAt(UnderWater(bc),time).
 /*
happens(pressDumpButton(Diver, Bc), Time) ->
    holds_at(vertical(Diver), Time),
    holds_at(underWater(Bc), Time).
*/
axiom(holds_at(vertical(Diver),Time) ',' holds_at(underWater(Bc),Time),
      [happens(pressDumpButton(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3707
% [diver,bc,time] % Happens(PressDumpButton(diver,bc),time) ->
% HoldsAt(UncontrolledBuoyancy(diver),time).
 /*
happens(pressDumpButton(Diver, Bc), Time) ->
    holds_at(uncontrolledBuoyancy(Diver), Time).
*/
axiom(holds_at(uncontrolledBuoyancy(Diver),Time),
      [happens(pressDumpButton(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3710
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Initiates(PressDeflateButton(diver,bc),NegativelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    initiates(pressDeflateButton(Diver, Bc),
              negativelyBuoyant(Diver),
              Time).
*/
axiom(initiates(pressDeflateButton(Diver,Bc),
		negativelyBuoyant(Diver),
		Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3714
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Terminates(PressDeflateButton(diver,bc),NeutrallyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    terminates(pressDeflateButton(Diver, Bc),
               neutrallyBuoyant(Diver),
               Time).
*/
axiom(terminates(pressDeflateButton(Diver,Bc),
		 neutrallyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3718
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Terminates(PressDeflateButton(diver,bc),PositivelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    terminates(pressDeflateButton(Diver, Bc),
               positivelyBuoyant(Diver),
               Time).
*/
axiom(terminates(pressDeflateButton(Diver,Bc),
		 positivelyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3722
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Initiates(PressDumpButton(diver,bc),NegativelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    initiates(pressDumpButton(Diver, Bc),
              negativelyBuoyant(Diver),
              Time).
*/
axiom(initiates(pressDumpButton(Diver,Bc),
		negativelyBuoyant(Diver),
		Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3726
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Terminates(PressDumpButton(diver,bc),NeutrallyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    terminates(pressDumpButton(Diver, Bc),
               neutrallyBuoyant(Diver),
               Time).
*/
axiom(terminates(pressDumpButton(Diver,Bc),
		 neutrallyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3730
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Terminates(PressDumpButton(diver,bc),PositivelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    terminates(pressDumpButton(Diver, Bc),
               positivelyBuoyant(Diver),
               Time).
*/
axiom(terminates(pressDumpButton(Diver,Bc),
		 positivelyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3734
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Initiates(PressInflateButton(diver,bc),NeutrallyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    initiates(pressInflateButton(Diver, Bc),
              neutrallyBuoyant(Diver),
              Time).
*/
axiom(initiates(pressInflateButton(Diver,Bc),
		neutrallyBuoyant(Diver),
		Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3738
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Terminates(PressInflateButton(diver,bc),PositivelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    terminates(pressInflateButton(Diver, Bc),
               positivelyBuoyant(Diver),
               Time).
*/
axiom(terminates(pressInflateButton(Diver,Bc),
		 positivelyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3742
% [diver,bc,time]% 
% HoldsAt(Wearing(diver,bc),time) ->
% Terminates(PressInflateButton(diver,bc),NegativelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Bc), Time) ->
    terminates(pressInflateButton(Diver, Bc),
               negativelyBuoyant(Diver),
               Time).
*/
axiom(terminates(pressInflateButton(Diver,Bc),
		 negativelyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Bc),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3746
% [diver,weight,time]% 
% HoldsAt(Wearing(diver,weight),time) ->
% Initiates(TakeOff(diver,weight),PositivelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Weight), Time) ->
    initiates(takeOff(Diver, Weight),
              positivelyBuoyant(Diver),
              Time).
*/
axiom(initiates(takeOff(Diver,Weight),
		positivelyBuoyant(Diver),
		Time),
      [holds_at(wearing(Diver,Weight),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3750
% [diver,weight,time]% 
% HoldsAt(Wearing(diver,weight),time) ->
% Terminates(TakeOff(diver,weight),NegativelyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Weight), Time) ->
    terminates(takeOff(Diver, Weight),
               negativelyBuoyant(Diver),
               Time).
*/
axiom(terminates(takeOff(Diver,Weight),
		 negativelyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Weight),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3754
% [diver,weight,time]% 
% HoldsAt(Wearing(diver,weight),time) ->
% Terminates(TakeOff(diver,weight),NeutrallyBuoyant(diver),time).
 /*
holds_at(wearing(Diver, Weight), Time) ->
    terminates(takeOff(Diver, Weight),
               neutrallyBuoyant(Diver),
               Time).
*/
axiom(terminates(takeOff(Diver,Weight),
		 neutrallyBuoyant(Diver),
		 Time),
      [holds_at(wearing(Diver,Weight),Time)]).

% 
% 
% fluent UncontrolledBuoyancy(diver)
 /*
fluent(uncontrolledBuoyancy(diver)).
*/
fluent(uncontrolledBuoyancy(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3760
% event LoseBuoyancyControl(diver)
 /*
event(loseBuoyancyControl(diver)).
*/
event(loseBuoyancyControl(diver)).

% 
% predicate IsInexperiencedDiver(diver)
 /*
predicate(isInexperiencedDiver(diver)).
*/
predicate(isInexperiencedDiver(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3764
% [diver,time]% 
% Happens(LoseBuoyancyControl(diver),time) ->
% IsInexperiencedDiver(diver).
 /*
happens(loseBuoyancyControl(Diver), Time) ->
    isInexperiencedDiver(Diver).
*/
axiom(isInexperiencedDiver(Diver),
      [happens(loseBuoyancyControl(Diver),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3768
% [diver,time]% 
% Initiates(LoseBuoyancyControl(diver),UncontrolledBuoyancy(diver),time).
 /*
initiates(loseBuoyancyControl(Diver),
	  uncontrolledBuoyancy(Diver),
	  Time).
*/
axiom(initiates(loseBuoyancyControl(Diver),
		uncontrolledBuoyancy(Diver),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3771
% [diver,time]% 
% Initiates(LoseBuoyancyControl(diver),PositivelyBuoyant(diver),time).
 /*
initiates(loseBuoyancyControl(Diver),
	  positivelyBuoyant(Diver),
	  Time).
*/
axiom(initiates(loseBuoyancyControl(Diver),
		positivelyBuoyant(Diver),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3774
% [diver,time]% 
% Terminates(LoseBuoyancyControl(diver),NegativelyBuoyant(diver),time).
 /*
terminates(loseBuoyancyControl(Diver),
	   negativelyBuoyant(Diver),
	   Time).
*/
axiom(terminates(loseBuoyancyControl(Diver),
		 negativelyBuoyant(Diver),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3777
% [diver,time]% 
% Terminates(LoseBuoyancyControl(diver),NeutrallyBuoyant(diver),time).
 /*
terminates(loseBuoyancyControl(Diver),
	   neutrallyBuoyant(Diver),
	   Time).
*/
axiom(terminates(loseBuoyancyControl(Diver),
		 neutrallyBuoyant(Diver),
		 Time),
      []).

% 
% 
%; determining fluent
% fluent AscendDescendAmount(diver,depth)
 /*
fluent(ascendDescendAmount(diver,depth)).
*/
fluent(ascendDescendAmount(diver,depth)).

% noninertial AscendDescendAmount
 /*
noninertial(ascendDescendAmount).
*/
noninertial(ascendDescendAmount).

% ectest/ec_reader_test_ecnet.e:3783
% 
% ectest/ec_reader_test_ecnet.e:3784
% [diver,depth1,depth2,time]% 
% HoldsAt(AscendDescendAmount(diver,depth1),time) &
% HoldsAt(AscendDescendAmount(diver,depth2),time) ->
% depth1=depth2.
 /*
holds_at(ascendDescendAmount(Diver, Depth1), Time), holds_at(ascendDescendAmount(Diver, Depth2), Time) ->
    Depth1=Depth2.
*/
axiom(equals(Depth1,Depth2),
      [ holds_at(ascendDescendAmount(Diver,Depth1),
		 Time),
	holds_at(ascendDescendAmount(Diver,Depth2),
		 Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3789
% [diver,depth,time]% 
% Happens(Descend(diver,depth),time) ->
% HoldsAt(NegativelyBuoyant(diver),time) &
% ({depth1}
%  HoldsAt(AscendDescendAmount(diver,depth1),time) &
%  HoldsAt(AtDepth(diver,depth-depth1),time)).
 /*
happens(descend(Diver, Depth), Time) ->
    holds_at(negativelyBuoyant(Diver), Time),
    exists([Depth1],
            (holds_at(ascendDescendAmount(Diver, Depth1), Time), holds_at(atDepth(Diver, Depth-Depth1), Time))).
*/
axiom(holds_at(negativelyBuoyant(Diver),Time) ',' exists([Depth1],
	     holds_at(ascendDescendAmount(Diver,Depth1),
		      Time) ',' holds_at(atDepth(Diver,Depth-Depth1),
		      Time)),
      [happens(descend(Diver,Depth),Time)]).

% 
% ectest/ec_reader_test_ecnet.e:3795
% 
% event KickUp(diver)
 /*
event(kickUp(diver)).
*/
event(kickUp(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3798
% [diver,depth,time]% 
% Happens(Ascend(diver,depth),time) ->
% (HoldsAt(PositivelyBuoyant(diver),time) |
%  (HoldsAt(NeutrallyBuoyant(diver),time) & Happens(KickUp(diver),time))) &
% ({depth1}
%  HoldsAt(AscendDescendAmount(diver,depth1),time) &
%  HoldsAt(AtDepth(diver,depth+depth1),time)).
 /*
happens(ascend(Diver, Depth), Time) ->
    (   holds_at(positivelyBuoyant(Diver), Time)
    ;   holds_at(neutrallyBuoyant(Diver), Time),
        happens(kickUp(Diver), Time)
    ),
    exists([Depth1],
            (holds_at(ascendDescendAmount(Diver, Depth1), Time), holds_at(atDepth(Diver, Depth+Depth1), Time))).
*/
axiom((holds_at(positivelyBuoyant(Diver),Time) ; holds_at(neutrallyBuoyant(Diver),Time) ',' happens(kickUp(Diver),Time)) ',' exists([Depth1],
	     holds_at(ascendDescendAmount(Diver,Depth1),
		      Time) ',' holds_at(atDepth(Diver,Depth+Depth1),
		      Time)),
      [happens(ascend(Diver,Depth),Time)]).

% ectest/ec_reader_test_ecnet.e:3804
% 
% 
% ectest/ec_reader_test_ecnet.e:3806
% [diver,time]% 
% Happens(KickUp(diver),time) ->
% HoldsAt(Vertical(diver),time).
 /*
happens(kickUp(Diver), Time) ->
    holds_at(vertical(Diver), Time).
*/
axiom(holds_at(vertical(Diver),Time),
      [happens(kickUp(Diver),Time)]).

% 
% 
% event SwimAround(diver)
 /*
event(swimAround(diver)).
*/
event(swimAround(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3812
% [diver,time]% 
% Happens(SwimAround(diver),time) ->
% HoldsAt(HorizontalDown(diver),time).
 /*
happens(swimAround(Diver), Time) ->
    holds_at(horizontalDown(Diver), Time).
*/
axiom(holds_at(horizontalDown(Diver),Time),
      [happens(swimAround(Diver),Time)]).

% 
% 
%; signaling
% 
% ectest/ec_reader_test_ecnet.e:3818
% event SignalDescend(diver,diver)
 /*
event(signalDescend(diver,diver)).
*/
event(signalDescend(diver,diver)).

% 
% event SignalOutOfTime(diver,diver)
 /*
event(signalOutOfTime(diver,diver)).
*/
event(signalOutOfTime(diver,diver)).

% 
% event SignalAscend(diver,diver)
 /*
event(signalAscend(diver,diver)).
*/
event(signalAscend(diver,diver)).

% 
%;[diver1,diver2,time]
%;Happens(SignalAscend(diver1,diver2),time) ->
%;Happens(SignalOutOfTime(diver1,diver2),time-1).
% ectest/ec_reader_test_ecnet.e:3827
% 
%;[diver1,diver2,time]
%;Happens(SignalDescend(diver1,diver2),time) ->
%;HoldsAt(See(diver1,diver2),time) &
%;HoldsAt(See(diver2,diver1),time).
% 
%;[diver1,diver2,time]
%;Happens(SignalOutOfTime(diver1,diver2),time) ->
%;HoldsAt(See(diver1,diver2),time) &
%;HoldsAt(See(diver2,diver1),time).
% ectest/ec_reader_test_ecnet.e:3837
% 
%;[diver1,diver2,time]
%;Happens(SignalAscend(diver1,diver2),time) ->
%;HoldsAt(See(diver1,diver2),time) &
%;HoldsAt(See(diver2,diver1),time).
% 
%;event LookAt(agent,object)
% ectest/ec_reader_test_ecnet.e:3844
% 
%;fluent See(agent,object)
% 
%;[agent,object,time]
%;Initiates(LookAt(agent,object),See(agent,object),time).
% 
%;[agent,object1,object2,time]
%;object1!=object2 ->
%;Terminates(LookAt(agent,object1),
%;           See(agent,object2),
%;           time).
% ectest/ec_reader_test_ecnet.e:3855
% 
% event Descend1(diver)
 /*
event(descend1(diver)).
*/
event(descend1(diver)).

% 
% event Ascend1(diver)
 /*
event(ascend1(diver)).
*/
event(ascend1(diver)).

% 
%;[diver,object,time]
%;Terminates(Descend1(diver),See(diver,object),time).
% ectest/ec_reader_test_ecnet.e:3862
% 
%;[diver,object,time]
%;Terminates(Ascend1(diver),See(diver,object),time).
% 
%;[diver,object,time]
%;Terminates(RotateYaw(diver),See(diver,object),time).
% ectest/ec_reader_test_ecnet.e:3868
% 
% event RapidAscendToSurface(diver)
 /*
event(rapidAscendToSurface(diver)).
*/
event(rapidAscendToSurface(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3871
% [diver,time]% 
% Happens(Descend1(diver),time) <->
% ({depth} Happens(Descend(diver,depth),time)).
 /*
happens(descend1(Diver), Time) <->
    exists([Depth], happens(descend(Diver, Depth), Time)).
*/
axiom(happens(descend(Diver,Depth),Time) ',' some([Depth]),
      [happens(descend1(Diver),Time)]).
axiom(happens(descend1(Diver),Time),
      [ happens(descend(Diver,Depth),Time),
	some([Depth])
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3875
% [diver,time]% 
% Happens(Ascend1(diver),time) <->
% ({depth} Happens(Ascend(diver,depth),time)).
 /*
happens(ascend1(Diver), Time) <->
    exists([Depth], happens(ascend(Diver, Depth), Time)).
*/
axiom(happens(ascend(Diver,Depth),Time) ',' some([Depth]),
      [happens(ascend1(Diver),Time)]).
axiom(happens(ascend1(Diver),Time),
      [ happens(ascend(Diver,Depth),Time),
	some([Depth])
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3879
% [diver,time]% 
% Happens(RapidAscendToSurface(diver),time) ->
% Happens(Ascend(diver,0),time).
 /*
happens(rapidAscendToSurface(Diver), Time) ->
    happens(ascend(Diver, 0), Time).
*/
axiom(happens(ascend(Diver,0),Time),
      [happens(rapidAscendToSurface(Diver),Time)]).

% 
% 
% event AscendLine(diver,line)
 /*
event(ascendLine(diver,line)).
*/
event(ascendLine(diver,line)).

% 
% ectest/ec_reader_test_ecnet.e:3885
% [diver,line,time]% 
% Happens(AscendLine(diver,line),time) ->
% Happens(Ascend1(diver),time).
 /*
happens(ascendLine(Diver, Line), Time) ->
    happens(ascend1(Diver), Time).
*/
axiom(happens(ascend1(Diver),Time),
      [happens(ascendLine(Diver,Line),Time)]).

% 
% 
% fluent Disoriented(diver)
 /*
fluent(disoriented(diver)).
*/
fluent(disoriented(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3891
% event BecomeDisoriented(diver)
 /*
event(becomeDisoriented(diver)).
*/
event(becomeDisoriented(diver)).

% 
% event BecomeReoriented(diver)
 /*
event(becomeReoriented(diver)).
*/
event(becomeReoriented(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3895
% [diver,time]% 
% Initiates(BecomeDisoriented(diver),Disoriented(diver),time).
 /*
initiates(becomeDisoriented(Diver),
	  disoriented(Diver),
	  Time).
*/
axiom(initiates(becomeDisoriented(Diver),
		disoriented(Diver),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3898
% [diver,time]% 
% Terminates(BecomeReoriented(diver),Disoriented(diver),time).
 /*
terminates(becomeReoriented(Diver),
	   disoriented(Diver),
	   Time).
*/
axiom(terminates(becomeReoriented(Diver),
		 disoriented(Diver),
		 Time),
      []).

% 
% 
% fluent DisturbedSilt()
 /*
fluent(disturbedSilt()).
*/
fluent(disturbedSilt()).

% 
% event DisturbSilt(diver)
 /*
event(disturbSilt(diver)).
*/
event(disturbSilt(diver)).

% ectest/ec_reader_test_ecnet.e:3904
% 
% ectest/ec_reader_test_ecnet.e:3905
% [diver,time]% 
% Initiates(DisturbSilt(diver),DisturbedSilt(),time).
 /*
initiates(disturbSilt(Diver),disturbedSilt(),Time).
*/
axiom(initiates(disturbSilt(Diver),disturbedSilt(),Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3908
% [diver,time]% 
% Happens(BecomeDisoriented(diver),time) ->
% (!HoldsAt(DisturbedSilt(),time-1) &
%  HoldsAt(DisturbedSilt(),time)).
 /*
happens(becomeDisoriented(Diver), Time) ->
    not(holds_at(disturbedSilt(), Time-1)),
    holds_at(disturbedSilt(), Time).
*/
axiom(not(holds_at(disturbedSilt(),Time-1)) ',' holds_at(disturbedSilt(),Time),
      [happens(becomeDisoriented(Diver),Time)]).

% 
% 
% event Panic(diver)
 /*
event(panic(diver)).
*/
event(panic(diver)).

% ectest/ec_reader_test_ecnet.e:3914
% 
% ectest/ec_reader_test_ecnet.e:3915
% [diver,time] % Happens(Panic(diver),time) ->
% HoldsAt(Disoriented(diver),time) |
% HoldsAt(UncontrolledBuoyancy(diver),time) |
% ({equipment} Happens(Lose(diver,equipment),time-1)) |
% Happens(Vomit(diver),time-1).
 /*
(   ( happens(panic(Diver), Time)->holds_at(disoriented(Diver), Time)
    )
;   holds_at(uncontrolledBuoyancy(Diver), Time)
;   exists([Equipment],
           happens(lose(Diver, Equipment), Time-1))
;   happens(vomit(Diver), Time-1)
).
*/
axiom(holds_at(disoriented(Diver),Time),
      [happens(panic(Diver),Time)]) ; holds_at(uncontrolledBuoyancy(Diver),Time) ; exists([Equipment],
       happens(lose(Diver,Equipment),Time-1)) ; happens(vomit(Diver),Time-1).

% 
% 
% ectest/ec_reader_test_ecnet.e:3921
% event Vomit(diver)
 /*
event(vomit(diver)).
*/
event(vomit(diver)).

% 
%; conditions
% 
% fluent Unconscious(diver)
 /*
fluent(unconscious(diver)).
*/
fluent(unconscious(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3927
% event GoUnconscious(diver)
 /*
event(goUnconscious(diver)).
*/
event(goUnconscious(diver)).

% 
% event RegainConsciousness(diver)
 /*
event(regainConsciousness(diver)).
*/
event(regainConsciousness(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3931
% [diver,time]% 
% Initiates(GoUnconscious(diver),Unconscious(diver),time).
 /*
initiates(goUnconscious(Diver),
	  unconscious(Diver),
	  Time).
*/
axiom(initiates(goUnconscious(Diver),
		unconscious(Diver),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3934
% [diver,time]% 
% Terminates(RegainConsciousness(diver),Unconscious(diver),time).
 /*
terminates(regainConsciousness(Diver),
	   unconscious(Diver),
	   Time).
*/
axiom(terminates(regainConsciousness(Diver),
		 unconscious(Diver),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:3937
% [diver,time]% 
% Happens(GoUnconscious(diver),time) ->
% Happens(RapidAscendToSurface(diver),time).
 /*
happens(goUnconscious(Diver), Time) ->
    happens(rapidAscendToSurface(Diver), Time).
*/
axiom(happens(rapidAscendToSurface(Diver),Time),
      [happens(goUnconscious(Diver),Time)]).

% 
% 
% fluent HasEarPain(diver)
 /*
fluent(hasEarPain(diver)).
*/
fluent(hasEarPain(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3943
% event StartEarPain(diver)
 /*
event(startEarPain(diver)).
*/
event(startEarPain(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3945
% [diver,time] % Initiates(StartEarPain(diver),HasEarPain(diver),time).
 /*
initiates(startEarPain(Diver),hasEarPain(Diver),Time).
*/
axiom(initiates(startEarPain(Diver),
		hasEarPain(Diver),
		Time),
      []).

% 
% 
% fluent HasRupturedEardrum(diver)
 /*
fluent(hasRupturedEardrum(diver)).
*/
fluent(hasRupturedEardrum(diver)).

% 
% event RuptureEardrum(diver)
 /*
event(ruptureEardrum(diver)).
*/
event(ruptureEardrum(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3951
% [diver,time]% 
% Initiates(RuptureEardrum(diver),HasRupturedEardrum(diver),time).
 /*
initiates(ruptureEardrum(Diver),
	  hasRupturedEardrum(Diver),
	  Time).
*/
axiom(initiates(ruptureEardrum(Diver),
		hasRupturedEardrum(Diver),
		Time),
      []).

% 
% fluent ConditionOK(diver)
 /*
fluent(conditionOK(diver)).
*/
fluent(conditionOK(diver)).

% 
% fluent HasDecompressionIllness(diver)
 /*
fluent(hasDecompressionIllness(diver)).
*/
fluent(hasDecompressionIllness(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3957
% event StartDecompressionIllness(diver)
 /*
event(startDecompressionIllness(diver)).
*/
event(startDecompressionIllness(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3959
% [diver,time]% 
% Initiates(StartDecompressionIllness(diver),
%           HasDecompressionIllness(diver),
%           time).
 /*
initiates(startDecompressionIllness(Diver),
	  hasDecompressionIllness(Diver),
	  Time).
*/
axiom(initiates(startDecompressionIllness(Diver),
		hasDecompressionIllness(Diver),
		Time),
      []).

% 
% 
% fluent SignalingDecompress(computer,diver)
 /*
fluent(signalingDecompress(computer,diver)).
*/
fluent(signalingDecompress(computer,diver)).

% ectest/ec_reader_test_ecnet.e:3965
% 
% fluent SignalingLowOnAir(computer,airtank,diver)
 /*
fluent(signalingLowOnAir(computer,airtank,diver)).
*/
fluent(signalingLowOnAir(computer,airtank,diver)).

% 
% ectest/ec_reader_test_ecnet.e:3968
% [computer,airtank,diver,time]% 
% HoldsAt(SignalingLowOnAir(computer,airtank,diver),time) ->
% HoldsAt(LowOnAir(airtank),time).
 /*
holds_at(signalingLowOnAir(Computer, Airtank, Diver), Time) ->
    holds_at(lowOnAir(Airtank), Time).
*/
axiom(holds_at(lowOnAir(Airtank),Time),
      [ holds_at(signalingLowOnAir(Computer,
				   Airtank,
				   Diver),
		 Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3972
% [computer,diver,time]% 
% HoldsAt(SignalingDecompress(computer,diver),time) ->
% !{time1} time1<time & Happens(Decompress(diver),time1).
 /*
holds_at(signalingDecompress(Computer, Diver), Time) ->
    not(exists([Time1],
                (Time1<Time, happens(decompress(Diver), Time1)))).
*/
axiom(neg(exists([Time1],
		 Time1 < Time ',' happens(decompress(Diver),Time1))),
      [ holds_at(signalingDecompress(Computer,Diver),
		 Time)
      ]).

% 
% 
% event Decompress(diver)
 /*
event(decompress(diver)).
*/
event(decompress(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3978
% event EqualizeEars(diver)
 /*
event(equalizeEars(diver)).
*/
event(equalizeEars(diver)).

% 
% ectest/ec_reader_test_ecnet.e:3980
% [diver,time]% 
% (Happens(Descend1(diver),time) | Happens(Ascend1(diver),time)) &
% !Happens(EqualizeEars(diver),time) ->
% Happens(StartEarPain(diver),time) &
% Happens(RuptureEardrum(diver),time).
 /*
(happens(descend1(Diver), Time);happens(ascend1(Diver), Time)), not(happens(equalizeEars(Diver), Time)) ->
    happens(startEarPain(Diver), Time),
    happens(ruptureEardrum(Diver), Time).
*/
axiom(happens(startEarPain(Diver),Time) ',' happens(ruptureEardrum(Diver),Time),
      [ happens(descend1(Diver),Time) ; happens(ascend1(Diver),Time),
	not(happens(equalizeEars(Diver),Time))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3986
% [diver,time]% 
% Happens(Ascend1(diver),time) &
% !Happens(Decompress(diver),time) ->
% Happens(StartDecompressionIllness(diver),time).
 /*
happens(ascend1(Diver), Time), not(happens(decompress(Diver), Time)) ->
    happens(startDecompressionIllness(Diver), Time).
*/
axiom(happens(startDecompressionIllness(Diver),Time),
      [ happens(ascend1(Diver),Time),
	not(happens(decompress(Diver),Time))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3991
% [diver1,diver2,time]% 
% HoldsAt(Holding(diver1,diver2),time) &
% Happens(Ascend1(diver1),time) &
% !Happens(Decompress(diver2),time) ->
% Happens(StartDecompressionIllness(diver2),time).
 /*
holds_at(holding(Diver1, Diver2), Time), happens(ascend1(Diver1), Time), not(happens(decompress(Diver2), Time)) ->
    happens(startDecompressionIllness(Diver2), Time).
*/
axiom(happens(startDecompressionIllness(Diver2),Time),
      [ holds_at(holding(Diver1,Diver2),Time),
	happens(ascend1(Diver1),Time),
	not(happens(decompress(Diver2),Time))
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:3997
% [diver,time]% 
% Happens(Decompress(diver),time) ->
% ({depth} depth>0 & HoldsAt(AtDepth(diver,depth),time)) &
% !HoldsAt(UncontrolledBuoyancy(diver),time).
 /*
happens(decompress(Diver), Time) ->
    exists([Depth],
            (Depth>0, holds_at(atDepth(Diver, Depth), Time))),
    not(holds_at(uncontrolledBuoyancy(Diver), Time)).
*/
axiom(exists([Depth],
	     (Depth > 0 ',' holds_at(atDepth(Diver,Depth),Time))) ',' not(holds_at(uncontrolledBuoyancy(Diver),Time)),
      [happens(decompress(Diver),Time)]).

% 
% 
% fluent HasHeadache(diver)
 /*
fluent(hasHeadache(diver)).
*/
fluent(hasHeadache(diver)).

% ectest/ec_reader_test_ecnet.e:4003
% 
% ectest/ec_reader_test_ecnet.e:4004
% [diver,time]% 
% HoldsAt(ConditionOK(diver),time) ->
% !HoldsAt(Unconscious(diver),time) &
% !HoldsAt(HasEarPain(diver),time) &
% !HoldsAt(HasRupturedEardrum(diver),time) &
% !HoldsAt(HasDecompressionIllness(diver),time) &
% !HoldsAt(HasHeadache(diver),time).
 /*
holds_at(conditionOK(Diver), Time) ->
    not(holds_at(unconscious(Diver), Time)),
    not(holds_at(hasEarPain(Diver), Time)),
    not(holds_at(hasRupturedEardrum(Diver), Time)),
    not(holds_at(hasDecompressionIllness(Diver), Time)),
    not(holds_at(hasHeadache(Diver), Time)).
*/
axiom(not(holds_at(unconscious(Diver),Time)) ',' not(holds_at(hasEarPain(Diver),Time)) ',' not(holds_at(hasRupturedEardrum(Diver),Time)) ',' not(holds_at(hasDecompressionIllness(Diver),Time)) ',' not(holds_at(hasHeadache(Diver),Time)),
      [holds_at(conditionOK(Diver),Time)]).

% ectest/ec_reader_test_ecnet.e:4010
% 
% 
% event BeAirlifted(diver)
 /*
event(beAirlifted(diver)).
*/
event(beAirlifted(diver)).

% 
% event TakeInWater(diver)
 /*
event(takeInWater(diver)).
*/
event(takeInWater(diver)).

% 
% ectest/ec_reader_test_ecnet.e:4016
% fluent LowOnAir(airtank)
 /*
fluent(lowOnAir(airtank)).
*/
fluent(lowOnAir(airtank)).

% 
% event BecomeLowOnAir(airtank)
 /*
event(becomeLowOnAir(airtank)).
*/
event(becomeLowOnAir(airtank)).

% 
% ectest/ec_reader_test_ecnet.e:4020
% [airtank,time]% 
% Initiates(BecomeLowOnAir(airtank),LowOnAir(airtank),time).
 /*
initiates(becomeLowOnAir(Airtank),
	  lowOnAir(Airtank),
	  Time).
*/
axiom(initiates(becomeLowOnAir(Airtank),
		lowOnAir(Airtank),
		Time),
      []).

% 
% 
%; initial state
% ectest/ec_reader_test_ecnet.e:4024
% [diver] % HoldsAt(ConditionOK(diver),0).
 /*
holds_at(conditionOK(Diver),0).
*/
axiom(holds_at(conditionOK(Diver),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4025
% [diver] % HoldsAt(Vertical(diver),0).
 /*
holds_at(vertical(Diver),0).
*/
axiom(holds_at(vertical(Diver),0),[]).

% 
% !HoldsAt(DisturbedSilt(),0).
 /*
not(holds_at(disturbedSilt(),0)).
*/
axiom(initially(neg(disturbedSilt())),[]).

% 
% ectest/ec_reader_test_ecnet.e:4027
% [diver] % !HoldsAt(UncontrolledBuoyancy(diver),0).
 /*
not(holds_at(uncontrolledBuoyancy(Diver),0)).
*/
axiom(initially(neg(uncontrolledBuoyancy(Diver))),[]).

% 
% ectest/ec_reader_test_ecnet.e:4028
% [diver] % !HoldsAt(Disoriented(diver),0).
 /*
not(holds_at(disoriented(Diver),0)).
*/
axiom(initially(neg(disoriented(Diver))),[]).

% 
% ectest/ec_reader_test_ecnet.e:4029
% [diver] % !HoldsAt(PositivelyBuoyant(diver),0) &
%         !HoldsAt(NeutrallyBuoyant(diver),0) &
%         !HoldsAt(NegativelyBuoyant(diver),0).
 /*
not(holds_at(positivelyBuoyant(Diver),0)) ',' not(holds_at(neutrallyBuoyant(Diver),0)) ',' not(holds_at(negativelyBuoyant(Diver),0)).
*/

% 
% ectest/ec_reader_test_ecnet.e:4032
% [diver,object] % !HoldsAt(Wearing(diver,object),0).
 /*
not(holds_at(wearing(Diver,Object),0)).
*/
axiom(initially(neg(wearing(Diver,Object))),[]).

% 
% ectest/ec_reader_test_ecnet.e:4033
% [diver,object] % !HoldsAt(Holding(diver,object),0).
 /*
not(holds_at(holding(Diver,Object),0)).
*/
axiom(initially(neg(holding(Diver,Object))),[]).

% 
% ectest/ec_reader_test_ecnet.e:4034
% [diver1,diver2] % !HoldsAt(Separated(diver1,diver2),0).
 /*
not(holds_at(separated(Diver1,Diver2),0)).
*/
axiom(initially(neg(separated(Diver1,Diver2))),[]).

% 
%;[agent,object] !HoldsAt(See(agent,object),0).
% 
% fluent Separated(diver,diver)
 /*
fluent(separated(diver,diver)).
*/
fluent(separated(diver,diver)).

% 
% ectest/ec_reader_test_ecnet.e:4039
% [diver1,diver2,time]% 
% HoldsAt(Separated(diver1,diver2),time) ->
% HoldsAt(Separated(diver2,diver1),time).
 /*
holds_at(separated(Diver1, Diver2), Time) ->
    holds_at(separated(Diver2, Diver1), Time).
*/
axiom(holds_at(separated(Diver2,Diver1),Time),
      [holds_at(separated(Diver1,Diver2),Time)]).

% 
% 
% event BecomeSeparated(diver,diver)
 /*
event(becomeSeparated(diver,diver)).
*/
event(becomeSeparated(diver,diver)).

% 
% ectest/ec_reader_test_ecnet.e:4045
% event BeReunitedWith(diver,diver)
 /*
event(beReunitedWith(diver,diver)).
*/
event(beReunitedWith(diver,diver)).

% 
% ectest/ec_reader_test_ecnet.e:4047
% [diver1,diver2,time]% 
% Initiates(BecomeSeparated(diver1,diver2),Separated(diver1,diver2),time).
 /*
initiates(becomeSeparated(Diver1,Diver2),
	  separated(Diver1,Diver2),
	  Time).
*/
axiom(initiates(becomeSeparated(Diver1,Diver2),
		separated(Diver1,Diver2),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:4050
% [diver1,diver2,time]% 
% Initiates(BecomeSeparated(diver1,diver2),Separated(diver2,diver1),time).
 /*
initiates(becomeSeparated(Diver1,Diver2),
	  separated(Diver2,Diver1),
	  Time).
*/
axiom(initiates(becomeSeparated(Diver1,Diver2),
		separated(Diver2,Diver1),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:4053
% [diver1,diver2,time]% 
% Terminates(BeReunitedWith(diver1,diver2),Separated(diver1,diver2),time).
 /*
terminates(beReunitedWith(Diver1,Diver2),
	   separated(Diver1,Diver2),
	   Time).
*/
axiom(terminates(beReunitedWith(Diver1,Diver2),
		 separated(Diver1,Diver2),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:4056
% [diver1,diver2,time]% 
% Terminates(BeReunitedWith(diver1,diver2),Separated(diver2,diver1),time).
 /*
terminates(beReunitedWith(Diver1,Diver2),
	   separated(Diver2,Diver1),
	   Time).
*/
axiom(terminates(beReunitedWith(Diver1,Diver2),
		 separated(Diver2,Diver1),
		 Time),
      []).

% 
% 
%; End of file.
% 
% 
% ectest/ec_reader_test_ecnet.e:4062
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Dress.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; Dress
%; (cf Sleep)
%;
% ectest/ec_reader_test_ecnet.e:4080
% 
% event PutOn(agent,clothing)
 /*
event(putOn(agent,clothing)).
*/
event(putOn(agent,clothing)).

% 
% event TakeOff(agent,clothing)
 /*
event(takeOff(agent,clothing)).
*/
event(takeOff(agent,clothing)).

% 
% fluent Wearing(agent,clothing)
 /*
fluent(wearing(agent,clothing)).
*/
fluent(wearing(agent,clothing)).

% ectest/ec_reader_test_ecnet.e:4086
% 
% ectest/ec_reader_test_ecnet.e:4087
% [agent,clothing,time]% 
% Initiates(PutOn(agent,clothing),
%           Wearing(agent,clothing),
%           time).
 /*
initiates(putOn(Agent,Clothing),
	  wearing(Agent,Clothing),
	  Time).
*/
axiom(initiates(putOn(Agent,Clothing),
		wearing(Agent,Clothing),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:4092
% [agent,clothing,time]% 
% Happens(PutOn(agent,clothing),time) ->
% !HoldsAt(Wearing(agent,clothing),time) &
% ectest/ec_reader_test_ecnet.e:4095
% {location}%  HoldsAt(At(agent,location),time) &
%            HoldsAt(At(clothing,location),time).
 /*
exists([Location],  (happens(putOn(Agent, Clothing), Time)->not(holds_at(wearing(Agent, Clothing), Time)), holds_at(at(Agent, Location), Time), holds_at(at(Clothing, Location), Time))).
*/
axiom(not(holds_at(wearing(Agent,Clothing),Time)) ',' holds_at(at(Agent,Location),Time) ',' holds_at(at(Clothing,Location),Time) ',' some([Location]),
      [happens(putOn(Agent,Clothing),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4098
% [agent,clothing,time]% 
% Terminates(TakeOff(agent,clothing),
%            Wearing(agent,clothing),
%            time).
 /*
terminates(takeOff(Agent,Clothing),
	   wearing(Agent,Clothing),
	   Time).
*/
axiom(terminates(takeOff(Agent,Clothing),
		 wearing(Agent,Clothing),
		 Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:4103
% [agent,clothing,time]% 
% Happens(TakeOff(agent,clothing),time) ->
% HoldsAt(Wearing(agent,clothing),time).
 /*
happens(takeOff(Agent, Clothing), Time) ->
    holds_at(wearing(Agent, Clothing), Time).
*/
axiom(holds_at(wearing(Agent,Clothing),Time),
      [happens(takeOff(Agent,Clothing),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4107
% [agent,clothing,location,time]% 
% Releases(PutOn(agent,clothing),At(clothing,location),time).
 /*
releases(putOn(Agent,Clothing),
	 at(Clothing,Location),
	 Time).
*/
axiom(releases(putOn(Agent,Clothing),
	       at(Clothing,Location),
	       Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:4110
% [agent,clothing,location,time]% 
% HoldsAt(Wearing(agent,clothing),time) &
% HoldsAt(At(agent,location),time) ->
% HoldsAt(At(clothing,location),time).
 /*
holds_at(wearing(Agent, Clothing), Time), holds_at(at(Agent, Location), Time) ->
    holds_at(at(Clothing, Location), Time).
*/
axiom(holds_at(at(Clothing,Location),Time),
      [ holds_at(wearing(Agent,Clothing),Time),
	holds_at(at(Agent,Location),Time)
      ]).

% 
% 
%;[agent,clothing,location1,location2,time]
%;HoldsAt(At(agent,location1),time) &
%;location1 != location2 ->
%;Terminates(TakeOff(agent,clothing),At(clothing,location2),time).
% ectest/ec_reader_test_ecnet.e:4119
% 
% ectest/ec_reader_test_ecnet.e:4120
% [agent,clothing,location,time]% 
% HoldsAt(At(agent,location),time) ->
% Initiates(TakeOff(agent,clothing),At(clothing,location),time).
 /*
holds_at(at(Agent, Location), Time) ->
    initiates(takeOff(Agent, Clothing),
              at(Clothing, Location),
              Time).
*/
axiom(initiates(takeOff(Agent,Clothing),
		at(Clothing,Location),
		Time),
      [holds_at(at(Agent,Location),Time)]).

% 
% 
%; End of file.
% 
% ectest/ec_reader_test_ecnet.e:4126
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/HungerNeed.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; hunger need
%;
% ectest/ec_reader_test_ecnet.e:4144
% 
% fluent Hungry(agent)
 /*
fluent(hungry(agent)).
*/
fluent(hungry(agent)).

% 
% fluent Satiated(agent)
 /*
fluent(satiated(agent)).
*/
fluent(satiated(agent)).

% noninertial Satiated
 /*
noninertial(satiated).
*/
noninertial(satiated).

% 
% ectest/ec_reader_test_ecnet.e:4150
% [agent,time] % HoldsAt(Hungry(agent),time) <-> !HoldsAt(Satiated(agent),time).
 /*
holds_at(hungry(Agent), Time) <->
    not(holds_at(satiated(Agent), Time)).
*/
axiom(holds_at(neg(satiated(Agent)),Time),
      [holds_at(hungry(Agent),Time)]).
axiom(holds_at(hungry(Agent),Time),
      [holds_at(neg(satiated(Agent)),Time)]).

% 
% 
% event Eat(agent,food)
 /*
event(eat(agent,food)).
*/
event(eat(agent,food)).

% 
% ectest/ec_reader_test_ecnet.e:4154
% [agent,food,time]% 
% Happens(Eat(agent,food),time) ->
% ectest/ec_reader_test_ecnet.e:4156
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(food,location),time).
 /*
exists([Location],  (happens(eat(Agent, Food), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Food, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Food,Location),Time) ',' some([Location]),
      [happens(eat(Agent,Food),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4160
% [agent,food,time]% 
% Terminates(Eat(agent,food),Hungry(agent),time).
 /*
terminates(eat(Agent,Food),hungry(Agent),Time).
*/
axiom(terminates(eat(Agent,Food),
		 hungry(Agent),
		 Time),
      []).

% 
% 
%; End of file.
% 
% 
% ectest/ec_reader_test_ecnet.e:4166
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/Restaurant.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
% ectest/ec_reader_test_ecnet.e:4181
% sort restaurant: script
 /*
subsort(restaurant,script).
*/
subsort(restaurant,script).
sort(restaurant).
sort(script).

% sort waiter: agent
 /*
subsort(waiter,agent).
*/
subsort(waiter,agent).
sort(waiter).
sort(agent).

% sort cook: agent
 /*
subsort(cook,agent).
*/
subsort(cook,agent).
sort(cook).
sort(agent).

% 
% function BillOf(restaurant): bill
 /*
function(billOf(restaurant),bill).
*/
function(billOf(restaurant),bill).

% function CookOf(restaurant): cook
 /*
function(cookOf(restaurant),cook).
*/
function(cookOf(restaurant),cook).

% ectest/ec_reader_test_ecnet.e:4187
% function TableOf(restaurant): table
 /*
function(tableOf(restaurant),table).
*/
function(tableOf(restaurant),table).

% function WaiterOf(restaurant): waiter
 /*
function(waiterOf(restaurant),waiter).
*/
function(waiterOf(restaurant),waiter).

% function KitchenDoorOf(restaurant): door
 /*
function(kitchenDoorOf(restaurant),door).
*/
function(kitchenDoorOf(restaurant),door).

% 
%; awaiting customer/waiter has set down bill on customer's table
% fluent BeWaiter0(waiter)
 /*
fluent(beWaiter0(waiter)).
*/
fluent(beWaiter0(waiter)).

% ectest/ec_reader_test_ecnet.e:4193
% 
%; awaiting customer order
% fluent BeWaiter1(waiter)
 /*
fluent(beWaiter1(waiter)).
*/
fluent(beWaiter1(waiter)).

% 
%; has customer order
% fluent BeWaiter2(waiter)
 /*
fluent(beWaiter2(waiter)).
*/
fluent(beWaiter2(waiter)).

% ectest/ec_reader_test_ecnet.e:4199
% 
%; in kitchen
% fluent BeWaiter3(waiter)
 /*
fluent(beWaiter3(waiter)).
*/
fluent(beWaiter3(waiter)).

% 
%; awaiting preparation of order
% fluent BeWaiter4(waiter)
 /*
fluent(beWaiter4(waiter)).
*/
fluent(beWaiter4(waiter)).

% ectest/ec_reader_test_ecnet.e:4205
% 
%; has order
% fluent BeWaiter5(waiter)
 /*
fluent(beWaiter5(waiter)).
*/
fluent(beWaiter5(waiter)).

% 
%; back in dining room
% fluent BeWaiter6(waiter)
 /*
fluent(beWaiter6(waiter)).
*/
fluent(beWaiter6(waiter)).

% ectest/ec_reader_test_ecnet.e:4211
% 
%; order delivered to customer (can ask if all is OK)
% fluent BeWaiter7(waiter)
 /*
fluent(beWaiter7(waiter)).
*/
fluent(beWaiter7(waiter)).

% 
%; customer has requested bill
% fluent BeWaiter8(waiter)
 /*
fluent(beWaiter8(waiter)).
*/
fluent(beWaiter8(waiter)).

% ectest/ec_reader_test_ecnet.e:4217
% 
%; waiter is holding bill
% fluent BeWaiter9(waiter)
 /*
fluent(beWaiter9(waiter)).
*/
fluent(beWaiter9(waiter)).

% 
% xor BeWaiter0, BeWaiter1, BeWaiter2, BeWaiter3, BeWaiter4, BeWaiter5, BeWaiter6, BeWaiter7, BeWaiter8, BeWaiter9
 /*
xor([ beWaiter0,
      beWaiter1,
      beWaiter2,
      beWaiter3,
      beWaiter4,
      beWaiter5,
      beWaiter6,
      beWaiter7,
      beWaiter8,
      beWaiter9
    ]).
*/
xor([ beWaiter0,
      beWaiter1,
      beWaiter2,
      beWaiter3,
      beWaiter4,
      beWaiter5,
      beWaiter6,
      beWaiter7,
      beWaiter8,
      beWaiter9
    ]).

% 
% ectest/ec_reader_test_ecnet.e:4223
% [waiter,agent,time]% 
% HoldsAt(BeWaiter0(waiter),time) ->
% Terminates(Greet(waiter,agent),
%            BeWaiter0(waiter),
%            time).
 /*
holds_at(beWaiter0(Waiter), Time) ->
    terminates(greet(Waiter, Agent),
               beWaiter0(Waiter),
               Time).
*/
axiom(terminates(greet(Waiter,Agent),
		 beWaiter0(Waiter),
		 Time),
      [holds_at(beWaiter0(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4229
% [waiter,agent,time]% 
% HoldsAt(BeWaiter0(waiter),time) ->
% Initiates(Greet(waiter,agent),
%           BeWaiter1(waiter),
%           time).
 /*
holds_at(beWaiter0(Waiter), Time) ->
    initiates(greet(Waiter, Agent),
              beWaiter1(Waiter),
              Time).
*/
axiom(initiates(greet(Waiter,Agent),
		beWaiter1(Waiter),
		Time),
      [holds_at(beWaiter0(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4235
% [waiter,agent,food,time]% 
% HoldsAt(BeWaiter1(waiter),time) ->
% Terminates(Order(agent,waiter,food),
%            BeWaiter1(waiter),
%            time).
 /*
holds_at(beWaiter1(Waiter), Time) ->
    terminates(order(Agent, Waiter, Food),
               beWaiter1(Waiter),
               Time).
*/
axiom(terminates(order(Agent,Waiter,Food),
		 beWaiter1(Waiter),
		 Time),
      [holds_at(beWaiter1(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4241
% [waiter,agent,food,time]% 
% HoldsAt(BeWaiter1(waiter),time) ->
% Initiates(Order(agent,waiter,food),
%           BeWaiter2(waiter),
%           time).
 /*
holds_at(beWaiter1(Waiter), Time) ->
    initiates(order(Agent, Waiter, Food),
              beWaiter2(Waiter),
              Time).
*/
axiom(initiates(order(Agent,Waiter,Food),
		beWaiter2(Waiter),
		Time),
      [holds_at(beWaiter1(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4247
% [restaurant,waiter,time]% 
% WaiterOf(restaurant)=waiter &
% HoldsAt(BeWaiter2(waiter),time) ->
% Happens(WalkThroughDoor12(waiter,KitchenDoorOf(restaurant)),time).
 /*
waiterOf(Restaurant)=Waiter, holds_at(beWaiter2(Waiter), Time) ->
    happens(walkThroughDoor12(Waiter, kitchenDoorOf(Restaurant)),
            Time).
*/
axiom(happens(walkThroughDoor12(Waiter,
				kitchenDoorOf(Restaurant)),
	      Time),
      [ equals(waiterOf(Restaurant),Waiter),
	holds_at(beWaiter2(Waiter),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4252
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter2(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Terminates(WalkThroughDoor12(waiter,door),
%            BeWaiter2(waiter),
%            time).
 /*
holds_at(beWaiter2(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    terminates(walkThroughDoor12(Waiter, Door),
               beWaiter2(Waiter),
               Time).
*/
axiom(terminates(walkThroughDoor12(Waiter,Door),
		 beWaiter2(Waiter),
		 Time),
      [ holds_at(beWaiter2(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:4258
% 
% 
% ectest/ec_reader_test_ecnet.e:4260
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter2(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Initiates(WalkThroughDoor12(waiter,door),
%           BeWaiter3(waiter),
%           time).
 /*
holds_at(beWaiter2(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    initiates(walkThroughDoor12(Waiter, Door),
              beWaiter3(Waiter),
              Time).
*/
axiom(initiates(walkThroughDoor12(Waiter,Door),
		beWaiter3(Waiter),
		Time),
      [ holds_at(beWaiter2(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:4266
% 
% 
% ectest/ec_reader_test_ecnet.e:4268
% [restaurant,food,time]% 
% HoldsAt(BeWaiter3(WaiterOf(restaurant)),time) &
% ({agent} HoldsAt(KnowOrder(WaiterOf(restaurant),agent,food),time)) ->
% Happens(Order(WaiterOf(restaurant),CookOf(restaurant),food),time).
 /*
holds_at(beWaiter3(waiterOf(Restaurant)), Time), exists([Agent], holds_at(knowOrder(waiterOf(Restaurant), Agent, Food), Time)) ->
    happens(order(waiterOf(Restaurant),
                  cookOf(Restaurant),
                  Food),
            Time).
*/
axiom(happens(order(waiterOf(Restaurant),
		    cookOf(Restaurant),
		    Food),
	      Time),
      [ holds_at(beWaiter3(waiterOf(Restaurant)),Time),
	holds_at(knowOrder(waiterOf(Restaurant),
			   Agent,
			   Food),
		 Time),
	some([Agent])
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4273
% [restaurant,waiter,cook,food,time]% 
% WaiterOf(restaurant)=waiter &
% CookOf(restaurant)=cook &
% HoldsAt(BeWaiter3(waiter),time) ->
% Terminates(Order(waiter,cook,food),
%            BeWaiter3(waiter),
%            time).
 /*
waiterOf(Restaurant)=Waiter, cookOf(Restaurant)=Cook, holds_at(beWaiter3(Waiter), Time) ->
    terminates(order(Waiter, Cook, Food),
               beWaiter3(Waiter),
               Time).
*/
axiom(terminates(order(Waiter,Cook,Food),
		 beWaiter3(Waiter),
		 Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(cookOf(Restaurant),Cook),
	holds_at(beWaiter3(Waiter),Time)
      ]).

% ectest/ec_reader_test_ecnet.e:4279
% 
% 
% ectest/ec_reader_test_ecnet.e:4281
% [restaurant,waiter,cook,food,time]% 
% WaiterOf(restaurant)=waiter &
% CookOf(restaurant)=cook &
% HoldsAt(BeWaiter3(waiter),time) ->
% Initiates(Order(waiter,cook,food),
%           BeWaiter4(waiter),
%           time).
 /*
waiterOf(Restaurant)=Waiter, cookOf(Restaurant)=Cook, holds_at(beWaiter3(Waiter), Time) ->
    initiates(order(Waiter, Cook, Food),
              beWaiter4(Waiter),
              Time).
*/
axiom(initiates(order(Waiter,Cook,Food),
		beWaiter4(Waiter),
		Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(cookOf(Restaurant),Cook),
	holds_at(beWaiter3(Waiter),Time)
      ]).

% ectest/ec_reader_test_ecnet.e:4287
% 
% 
% ectest/ec_reader_test_ecnet.e:4289
% [waiter,food,time]% 
% HoldsAt(BeWaiter4(waiter),time) &
% ({agent} HoldsAt(KnowOrder(waiter,agent,food),time)) &
% HoldsAt(FoodPrepared(food),time) ->
% Happens(PickUp(waiter,food),time).
 /*
holds_at(beWaiter4(Waiter), Time), exists([Agent], holds_at(knowOrder(Waiter, Agent, Food), Time)), holds_at(foodPrepared(Food), Time) ->
    happens(pickUp(Waiter, Food), Time).
*/
axiom(happens(pickUp(Waiter,Food),Time),
      [ holds_at(beWaiter4(Waiter),Time),
	holds_at(knowOrder(Waiter,Agent,Food),
		 Time),
	some([Agent]),
	holds_at(foodPrepared(Food),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4295
% [waiter,food,time]% 
% HoldsAt(BeWaiter4(waiter),time) &
% ({agent} HoldsAt(KnowOrder(waiter,agent,food),time)) ->
% Terminates(PickUp(waiter,food),
%            BeWaiter4(waiter),
%            time).
 /*
holds_at(beWaiter4(Waiter), Time), exists([Agent], holds_at(knowOrder(Waiter, Agent, Food), Time)) ->
    terminates(pickUp(Waiter, Food),
               beWaiter4(Waiter),
               Time).
*/
axiom(terminates(pickUp(Waiter,Food),
		 beWaiter4(Waiter),
		 Time),
      [ holds_at(beWaiter4(Waiter),Time),
	holds_at(knowOrder(Waiter,Agent,Food),
		 Time),
	some([Agent])
      ]).

% 
% ectest/ec_reader_test_ecnet.e:4301
% 
% ectest/ec_reader_test_ecnet.e:4302
% [waiter,food,time]% 
% HoldsAt(BeWaiter4(waiter),time) &
% ({agent} HoldsAt(KnowOrder(waiter,agent,food),time)) ->
% Initiates(PickUp(waiter,food),
%           BeWaiter5(waiter),
%           time).
 /*
holds_at(beWaiter4(Waiter), Time), exists([Agent], holds_at(knowOrder(Waiter, Agent, Food), Time)) ->
    initiates(pickUp(Waiter, Food),
              beWaiter5(Waiter),
              Time).
*/
axiom(initiates(pickUp(Waiter,Food),
		beWaiter5(Waiter),
		Time),
      [ holds_at(beWaiter4(Waiter),Time),
	holds_at(knowOrder(Waiter,Agent,Food),
		 Time),
	some([Agent])
      ]).

% 
% ectest/ec_reader_test_ecnet.e:4308
% 
% ectest/ec_reader_test_ecnet.e:4309
% [restaurant,waiter,time]% 
% WaiterOf(restaurant)=waiter &
% HoldsAt(BeWaiter5(waiter),time) ->
% Happens(WalkThroughDoor21(waiter,KitchenDoorOf(restaurant)),time).
 /*
waiterOf(Restaurant)=Waiter, holds_at(beWaiter5(Waiter), Time) ->
    happens(walkThroughDoor21(Waiter, kitchenDoorOf(Restaurant)),
            Time).
*/
axiom(happens(walkThroughDoor21(Waiter,
				kitchenDoorOf(Restaurant)),
	      Time),
      [ equals(waiterOf(Restaurant),Waiter),
	holds_at(beWaiter5(Waiter),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4314
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter5(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Terminates(WalkThroughDoor21(waiter,door),
%            BeWaiter5(waiter),
%            time).
 /*
holds_at(beWaiter5(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    terminates(walkThroughDoor21(Waiter, Door),
               beWaiter5(Waiter),
               Time).
*/
axiom(terminates(walkThroughDoor21(Waiter,Door),
		 beWaiter5(Waiter),
		 Time),
      [ holds_at(beWaiter5(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:4320
% 
% 
% ectest/ec_reader_test_ecnet.e:4322
% [restaurant,waiter,door,time]% 
% HoldsAt(BeWaiter5(waiter),time) &
% WaiterOf(restaurant)=waiter &
% KitchenDoorOf(restaurant)=door ->
% Initiates(WalkThroughDoor21(waiter,door),
%           BeWaiter6(waiter),
%           time).
 /*
holds_at(beWaiter5(Waiter), Time), waiterOf(Restaurant)=Waiter, kitchenDoorOf(Restaurant)=Door ->
    initiates(walkThroughDoor21(Waiter, Door),
              beWaiter6(Waiter),
              Time).
*/
axiom(initiates(walkThroughDoor21(Waiter,Door),
		beWaiter6(Waiter),
		Time),
      [ holds_at(beWaiter5(Waiter),Time),
	equals(waiterOf(Restaurant),Waiter),
	equals(kitchenDoorOf(Restaurant),Door)
      ]).

% ectest/ec_reader_test_ecnet.e:4328
% 
% 
% ectest/ec_reader_test_ecnet.e:4330
% [restaurant,waiter,table,food,time]% 
% WaiterOf(restaurant)=waiter &
% TableOf(restaurant)=table &
% HoldsAt(BeWaiter6(waiter),time) &
% HoldsAt(Holding(waiter,food),time) ->
% Happens(PlaceOn(waiter,food,table),time).
 /*
waiterOf(Restaurant)=Waiter, tableOf(Restaurant)=Table, holds_at(beWaiter6(Waiter), Time), holds_at(holding(Waiter, Food), Time) ->
    happens(placeOn(Waiter, Food, Table), Time).
*/
axiom(happens(placeOn(Waiter,Food,Table),Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(tableOf(Restaurant),Table),
	holds_at(beWaiter6(Waiter),Time),
	holds_at(holding(Waiter,Food),Time)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:4336
% 
% ectest/ec_reader_test_ecnet.e:4337
% [waiter,food,table,time]% 
% HoldsAt(BeWaiter6(waiter),time) ->
% Terminates(PlaceOn(waiter,food,table),
%            BeWaiter6(waiter),
%            time).
 /*
holds_at(beWaiter6(Waiter), Time) ->
    terminates(placeOn(Waiter, Food, Table),
               beWaiter6(Waiter),
               Time).
*/
axiom(terminates(placeOn(Waiter,Food,Table),
		 beWaiter6(Waiter),
		 Time),
      [holds_at(beWaiter6(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4343
% [waiter,food,table,time]% 
% HoldsAt(BeWaiter6(waiter),time) ->
% Initiates(PlaceOn(waiter,food,table),
%           BeWaiter7(waiter),
%           time).
 /*
holds_at(beWaiter6(Waiter), Time) ->
    initiates(placeOn(Waiter, Food, Table),
              beWaiter7(Waiter),
              Time).
*/
axiom(initiates(placeOn(Waiter,Food,Table),
		beWaiter7(Waiter),
		Time),
      [holds_at(beWaiter6(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4349
% [waiter,agent,bill,time]% 
% HoldsAt(BeWaiter7(waiter),time) ->
% Terminates(Request(agent,waiter,bill),
%            BeWaiter7(waiter),
%            time).
 /*
holds_at(beWaiter7(Waiter), Time) ->
    terminates(request(Agent, Waiter, Bill),
               beWaiter7(Waiter),
               Time).
*/
axiom(terminates(request(Agent,Waiter,Bill),
		 beWaiter7(Waiter),
		 Time),
      [holds_at(beWaiter7(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4355
% [waiter,agent,bill,time]% 
% HoldsAt(BeWaiter7(waiter),time) ->
% Initiates(Request(agent,waiter,bill),
%           BeWaiter8(waiter),
%           time).
 /*
holds_at(beWaiter7(Waiter), Time) ->
    initiates(request(Agent, Waiter, Bill),
              beWaiter8(Waiter),
              Time).
*/
axiom(initiates(request(Agent,Waiter,Bill),
		beWaiter8(Waiter),
		Time),
      [holds_at(beWaiter7(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4361
% [restaurant,waiter,bill,time]% 
% WaiterOf(restaurant)=waiter &
% BillOf(restaurant)=bill &
% HoldsAt(BeWaiter8(waiter),time) ->
% Happens(PickUp(waiter,bill),time).
 /*
waiterOf(Restaurant)=Waiter, billOf(Restaurant)=Bill, holds_at(beWaiter8(Waiter), Time) ->
    happens(pickUp(Waiter, Bill), Time).
*/
axiom(happens(pickUp(Waiter,Bill),Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(billOf(Restaurant),Bill),
	holds_at(beWaiter8(Waiter),Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4367
% [waiter,bill,time]% 
% HoldsAt(BeWaiter8(waiter),time) ->
% Terminates(PickUp(waiter,bill),
%            BeWaiter8(waiter),
%            time).
 /*
holds_at(beWaiter8(Waiter), Time) ->
    terminates(pickUp(Waiter, Bill),
               beWaiter8(Waiter),
               Time).
*/
axiom(terminates(pickUp(Waiter,Bill),
		 beWaiter8(Waiter),
		 Time),
      [holds_at(beWaiter8(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4373
% [waiter,bill,time]% 
% HoldsAt(BeWaiter8(waiter),time) ->
% Initiates(PickUp(waiter,bill),
%           BeWaiter9(waiter),
%           time).
 /*
holds_at(beWaiter8(Waiter), Time) ->
    initiates(pickUp(Waiter, Bill),
              beWaiter9(Waiter),
              Time).
*/
axiom(initiates(pickUp(Waiter,Bill),
		beWaiter9(Waiter),
		Time),
      [holds_at(beWaiter8(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4379
% [restaurant,waiter,bill,table,time]% 
% WaiterOf(restaurant)=waiter &
% BillOf(restaurant)=bill &
% TableOf(restaurant)=table &
% HoldsAt(BeWaiter9(waiter),time) ->
% Happens(PlaceOn(waiter,bill,table),time).
 /*
waiterOf(Restaurant)=Waiter, billOf(Restaurant)=Bill, tableOf(Restaurant)=Table, holds_at(beWaiter9(Waiter), Time) ->
    happens(placeOn(Waiter, Bill, Table), Time).
*/
axiom(happens(placeOn(Waiter,Bill,Table),Time),
      [ equals(waiterOf(Restaurant),Waiter),
	equals(billOf(Restaurant),Bill),
	equals(tableOf(Restaurant),Table),
	holds_at(beWaiter9(Waiter),Time)
      ]).

% 
% ectest/ec_reader_test_ecnet.e:4385
% 
% ectest/ec_reader_test_ecnet.e:4386
% [waiter,bill,table,time]% 
% HoldsAt(BeWaiter9(waiter),time) ->
% Terminates(PlaceOn(waiter,bill,table),
%            BeWaiter9(waiter),
%            time).
 /*
holds_at(beWaiter9(Waiter), Time) ->
    terminates(placeOn(Waiter, Bill, Table),
               beWaiter9(Waiter),
               Time).
*/
axiom(terminates(placeOn(Waiter,Bill,Table),
		 beWaiter9(Waiter),
		 Time),
      [holds_at(beWaiter9(Waiter),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4392
% [waiter,bill,table,time]% 
% HoldsAt(BeWaiter9(waiter),time) ->
% Initiates(PlaceOn(waiter,bill,table),
%           BeWaiter0(waiter),
%           time).
 /*
holds_at(beWaiter9(Waiter), Time) ->
    initiates(placeOn(Waiter, Bill, Table),
              beWaiter0(Waiter),
              Time).
*/
axiom(initiates(placeOn(Waiter,Bill,Table),
		beWaiter0(Waiter),
		Time),
      [holds_at(beWaiter9(Waiter),Time)]).

% 
% 
%; awaiting next waiter order
% ectest/ec_reader_test_ecnet.e:4399
% fluent BeCook0(cook)
 /*
fluent(beCook0(cook)).
*/
fluent(beCook0(cook)).

% 
%; waiter order received
% fluent BeCook1(cook)
 /*
fluent(beCook1(cook)).
*/
fluent(beCook1(cook)).

% 
% xor BeCook0, BeCook1
 /*
xor([beCook0,beCook1]).
*/
xor([beCook0,beCook1]).

% ectest/ec_reader_test_ecnet.e:4405
% 
% ectest/ec_reader_test_ecnet.e:4406
% [cook,agent,food,time]% 
% HoldsAt(BeCook0(cook),time) ->
% Terminates(Order(agent,cook,food),
%            BeCook0(cook),
%            time).
 /*
holds_at(beCook0(Cook), Time) ->
    terminates(order(Agent, Cook, Food),
               beCook0(Cook),
               Time).
*/
axiom(terminates(order(Agent,Cook,Food),
		 beCook0(Cook),
		 Time),
      [holds_at(beCook0(Cook),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4412
% [cook,agent,food,time]% 
% HoldsAt(BeCook0(cook),time) ->
% Initiates(Order(agent,cook,food),
%           BeCook1(cook),
%           time).
 /*
holds_at(beCook0(Cook), Time) ->
    initiates(order(Agent, Cook, Food),
              beCook1(Cook),
              Time).
*/
axiom(initiates(order(Agent,Cook,Food),
		beCook1(Cook),
		Time),
      [holds_at(beCook0(Cook),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4418
% event FoodPrepare(agent,food)
 /*
event(foodPrepare(agent,food)).
*/
event(foodPrepare(agent,food)).

% 
% fluent FoodPrepared(food)
 /*
fluent(foodPrepared(food)).
*/
fluent(foodPrepared(food)).

% 
% ectest/ec_reader_test_ecnet.e:4422
% [agent,food,time]% 
% Initiates(FoodPrepare(agent,food),
%           FoodPrepared(food),
%           time).
 /*
initiates(foodPrepare(Agent,Food),
	  foodPrepared(Food),
	  Time).
*/
axiom(initiates(foodPrepare(Agent,Food),
		foodPrepared(Food),
		Time),
      []).

% 
% 
% ectest/ec_reader_test_ecnet.e:4427
% [agent,food,time]% 
% Happens(FoodPrepare(agent,food),time) ->
% ectest/ec_reader_test_ecnet.e:4429
% {location}% 
% HoldsAt(At(agent,location),time) &
% HoldsAt(At(food,location),time).
 /*
exists([Location],  (happens(foodPrepare(Agent, Food), Time)->holds_at(at(Agent, Location), Time), holds_at(at(Food, Location), Time))).
*/
axiom(holds_at(at(Agent,Location),Time) ',' holds_at(at(Food,Location),Time) ',' some([Location]),
      [happens(foodPrepare(Agent,Food),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4433
% [cook,agent,food,time]% 
% HoldsAt(BeCook1(cook),time) &
% HoldsAt(KnowOrder(cook,agent,food),time) ->
% Happens(FoodPrepare(cook,food),time).
 /*
holds_at(beCook1(Cook), Time), holds_at(knowOrder(Cook, Agent, Food), Time) ->
    happens(foodPrepare(Cook, Food), Time).
*/
axiom(happens(foodPrepare(Cook,Food),Time),
      [ holds_at(beCook1(Cook),Time),
	holds_at(knowOrder(Cook,Agent,Food),
		 Time)
      ]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4438
% [cook,food,time]% 
% HoldsAt(BeCook1(cook),time) ->
% Terminates(FoodPrepare(cook,food),
%            BeCook1(cook),
%            time).
 /*
holds_at(beCook1(Cook), Time) ->
    terminates(foodPrepare(Cook, Food),
               beCook1(Cook),
               Time).
*/
axiom(terminates(foodPrepare(Cook,Food),
		 beCook1(Cook),
		 Time),
      [holds_at(beCook1(Cook),Time)]).

% 
% 
% ectest/ec_reader_test_ecnet.e:4444
% [cook,food,time]% 
% HoldsAt(BeCook1(cook),time) ->
% Initiates(FoodPrepare(cook,food),
%           BeCook0(cook),
%           time).
 /*
holds_at(beCook1(Cook), Time) ->
    initiates(foodPrepare(Cook, Food),
              beCook0(Cook),
              Time).
*/
axiom(initiates(foodPrepare(Cook,Food),
		beCook0(Cook),
		Time),
      [holds_at(beCook1(Cook),Time)]).

% 
% 
%; End of file.
% ectest/ec_reader_test_ecnet.e:4451
% 
% 
% 
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%; FILE: ecnet/EatingInAHouse.e
%; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
% ectest/ec_reader_test_ecnet.e:4457
% 
%;
%; Copyright (c) 2005 IBM Corporation and others.
%; All rights reserved. This program and the accompanying materials
%; are made available under the terms of the Common Public License v1.0
%; which accompanies this distribution, and is available at
%; http://www.eclipse.org/legal/cpl-v10.html
%;
%; Contributors:
%; IBM - Initial implementation
%;
%; @article{Mueller:2004c,
%;   author = "Erik T. Mueller",
%;   year = "2004",
%;   title = "Understanding script-based stories using commonsense reasoning",
%;   journal = "Cognitive Systems Research",
%;   volume = "5",
%;   number = "4",
%;   pages = "307--340",
%; }
%;
% ectest/ec_reader_test_ecnet.e:4478
% 
% option modeldiff on
 /*
option(modeldiff,on).
*/

% option encoding 3
 /*
option(encoding,3).
*/

% option renaming off
 /*
option(renaming,off).
*/

% 
% ignore Love, ThreatenedBy
 /*
ignore(love).
*/

 /*
ignore(threatenedBy).
*/

% ectest/ec_reader_test_ecnet.e:4484
% ignore LookOutOnto, Floor, BuildingOf, SkyOf, GroundOf
 /*
ignore(lookOutOnto).
*/

 /*
ignore(floor).
*/

 /*
ignore(buildingOf).
*/

 /*
ignore(skyOf).
*/

 /*
ignore(groundOf).
*/

% ignore Inside
 /*
ignore(inside).
*/

% ignore Near, WalkFrom, WalkFromTo, RunFromTo
 /*
ignore(near).
*/

 /*
ignore(walkFrom).
*/

 /*
ignore(walkFromTo).
*/

 /*
ignore(runFromTo).
*/

% ignore BillOf, CookOf, TableOf, WaiterOf, KitchenDoorOf
 /*
ignore(billOf).
*/

 /*
ignore(cookOf).
*/

 /*
ignore(tableOf).
*/

 /*
ignore(waiterOf).
*/

 /*
ignore(kitchenDoorOf).
*/

% ignore BeWaiter0, BeWaiter1, BeWaiter2, BeWaiter3, BeWaiter4
 /*
ignore(beWaiter0).
*/

 /*
ignore(beWaiter1).
*/

 /*
ignore(beWaiter2).
*/

 /*
ignore(beWaiter3).
*/

 /*
ignore(beWaiter4).
*/

% ignore BeWaiter5, BeWaiter6, BeWaiter7, BeWaiter8, BeWaiter9
 /*
ignore(beWaiter5).
*/

 /*
ignore(beWaiter6).
*/

 /*
ignore(beWaiter7).
*/

 /*
ignore(beWaiter8).
*/

 /*
ignore(beWaiter9).
*/

% ectest/ec_reader_test_ecnet.e:4490
% ignore BeCook0, BeCook1
 /*
ignore(beCook0).
*/

 /*
ignore(beCook1).
*/

% ignore InviteIn, InvitedIn, IntendToWalkIn, IntentionToWalkIn
 /*
ignore(inviteIn).
*/

 /*
ignore(invitedIn).
*/

 /*
ignore(intendToWalkIn).
*/

 /*
ignore(intentionToWalkIn).
*/

% ignore ActOnIntentionToWalkIn, Greet, SayGoodbye, CryForJoy
 /*
ignore(actOnIntentionToWalkIn).
*/

 /*
ignore(greet).
*/

 /*
ignore(sayGoodbye).
*/

 /*
ignore(cryForJoy).
*/

% ignore Threaten, ReleaseFromThreat, ThreatenedBy
 /*
ignore(threaten).
*/

 /*
ignore(releaseFromThreat).
*/

 /*
ignore(threatenedBy).
*/

% ignore Order, KnowOrder, Request, KnowRequest
 /*
ignore(order).
*/

 /*
ignore(knowOrder).
*/

 /*
ignore(request).
*/

 /*
ignore(knowRequest).
*/

% ignore PutInside, TakeOutOf
 /*
ignore(putInside).
*/

 /*
ignore(takeOutOf).
*/

% ectest/ec_reader_test_ecnet.e:4496
% ignore SayPleaseToMeet, Move
 /*
ignore(sayPleaseToMeet).
*/

 /*
ignore(move).
*/

% 
% load foundations/Root.e% load foundations/EC.e% load answers/Mueller2003/Ontology.e
 /*
load('answers/Mueller2003/Ontology.e').
*/
load('answers/Mueller2003/Ontology.e').

% load answers/Mueller2004c/RTSpaceM.e
 /*
load('answers/Mueller2004c/RTSpaceM.e').
*/
load('answers/Mueller2004c/RTSpaceM.e').

% ectest/ec_reader_test_ecnet.e:4502
% load answers/Mueller2004c/OTSpaceM.e
 /*
load('answers/Mueller2004c/OTSpaceM.e').
*/
load('answers/Mueller2004c/OTSpaceM.e').

% load answers/Mueller2004c/HungerNeed.e
 /*
load('answers/Mueller2004c/HungerNeed.e').
*/
load('answers/Mueller2004c/HungerNeed.e').

% load answers/Mueller2004c/Restaurant.e
 /*
load('answers/Mueller2004c/Restaurant.e').
*/
load('answers/Mueller2004c/Restaurant.e').

% load answers/Mueller2003/Sleep.e
 /*
load('answers/Mueller2003/Sleep.e').
*/
load('answers/Mueller2003/Sleep.e').

% load answers/Mueller2003/SpeechAct.e
 /*
load('answers/Mueller2003/SpeechAct.e').
*/
load('answers/Mueller2003/SpeechAct.e').

% load answers/Mueller2004c/Dress.e
 /*
load('answers/Mueller2004c/Dress.e').
*/
load('answers/Mueller2004c/Dress.e').

% ectest/ec_reader_test_ecnet.e:4508
% 
% room Upstairs1
 /*
t(room,upstairs1).
*/
sort(room).
t(room,upstairs1).

% 
% staircase Staircase1
 /*
t(staircase,staircase1).
*/
sort(staircase).
t(staircase,staircase1).

% 
% room Hallway1
 /*
t(room,hallway1).
*/
sort(room).
t(room,hallway1).

% ectest/ec_reader_test_ecnet.e:4514
% 
% Side1(Staircase1)=Hallway1.
 /*
side1(staircase1) = hallway1.
*/
equals(side1(staircase1),hallway1).

% 
% Side2(Staircase1)=Upstairs1.
 /*
side2(staircase1) = upstairs1.
*/
equals(side2(staircase1),upstairs1).

% 
% 
% door DiningRoomDoor1
 /*
t(door,diningRoomDoor1).
*/
sort(door).
t(door,diningRoomDoor1).

% 
% ectest/ec_reader_test_ecnet.e:4520
% room DiningRoom1
 /*
t(room,diningRoom1).
*/
sort(room).
t(room,diningRoom1).

% 
% Side1(DiningRoomDoor1)=Hallway1.
 /*
side1(diningRoomDoor1) = hallway1.
*/
equals(side1(diningRoomDoor1),hallway1).

% 
% Side2(DiningRoomDoor1)=DiningRoom1.
 /*
side2(diningRoomDoor1) = diningRoom1.
*/
equals(side2(diningRoomDoor1),diningRoom1).

% 
% 
% door KitchenDoor1
 /*
t(door,kitchenDoor1).
*/
sort(door).
t(door,kitchenDoor1).

% ectest/ec_reader_test_ecnet.e:4526
% 
% room Kitchen1
 /*
t(room,kitchen1).
*/
sort(room).
t(room,kitchen1).

% 
% Side1(KitchenDoor1)=DiningRoom1.
 /*
side1(kitchenDoor1) = diningRoom1.
*/
equals(side1(kitchenDoor1),diningRoom1).

% 
% Side2(KitchenDoor1)=Kitchen1.
 /*
side2(kitchenDoor1) = kitchen1.
*/
equals(side2(kitchenDoor1),kitchen1).

% 
% 
% ectest/ec_reader_test_ecnet.e:4532
% agent Eater1
 /*
t(agent,eater1).
*/
sort(agent).
t(agent,eater1).

% 
% agent Eater2
 /*
t(agent,eater2).
*/
sort(agent).
t(agent,eater2).

% 
% clothing Clothing1
 /*
t(clothing,clothing1).
*/
sort(clothing).
t(clothing,clothing1).

% 
% ectest/ec_reader_test_ecnet.e:4538
% clothing Clothing2
 /*
t(clothing,clothing2).
*/
sort(clothing).
t(clothing,clothing2).

% 
% chair Chair1
 /*
t(chair,chair1).
*/
sort(chair).
t(chair,chair1).

% 
% chair Chair2
 /*
t(chair,chair2).
*/
sort(chair).
t(chair,chair2).

% 
% ectest/ec_reader_test_ecnet.e:4544
% food Food1
 /*
t(food,food1).
*/
sort(food).
t(food,food1).

% 
% agent Cook1
 /*
t(agent,cook1).
*/
sort(agent).
t(agent,cook1).

% 
% table Table1
 /*
t(table,table1).
*/
sort(table).
t(table,table1).

% 
% ectest/ec_reader_test_ecnet.e:4550
% content Content1
 /*
t(content,content1).
*/
sort(content).
t(content,content1).

% 
% content Content2
 /*
t(content,content2).
*/
sort(content).
t(content,content2).

% 
% outside DummyOutside1
 /*
t(outside,dummyOutside1).
*/
sort(outside).
t(outside,dummyOutside1).

% 
%; prune
% ectest/ec_reader_test_ecnet.e:4557
% sort ona, onb
 /*
sort(ona).
*/
sort(ona).

 /*
sort(onb).
*/
sort(onb).

% fluent! On(ona,onb)
 /*
fluent(on(ona,onb)).
*/
fluent(on(ona,onb)).

% event! PlaceOn(agent,ona,onb)
 /*
event(placeOn(agent,ona,onb)).
*/
event(placeOn(agent,ona,onb)).

% event! TakeOffOf(agent,ona,onb)
 /*
event(takeOffOf(agent,ona,onb)).
*/
event(takeOffOf(agent,ona,onb)).

% 
% sort ordera, orderb, orderc
 /*
sort(ordera).
*/
sort(ordera).

 /*
sort(orderb).
*/
sort(orderb).

 /*
sort(orderc).
*/
sort(orderc).

% ectest/ec_reader_test_ecnet.e:4563
% event! Order(ordera,orderb,orderc)
 /*
event(order(ordera,orderb,orderc)).
*/
event(order(ordera,orderb,orderc)).

% fluent! KnowOrder(orderb,ordera,orderc)
 /*
fluent(knowOrder(orderb,ordera,orderc)).
*/
fluent(knowOrder(orderb,ordera,orderc)).

% 
% sort requesta, requestb, requestc
 /*
sort(requesta).
*/
sort(requesta).

 /*
sort(requestb).
*/
sort(requestb).

 /*
sort(requestc).
*/
sort(requestc).

% event! Request(requesta,requestb,requestc)
 /*
event(request(requesta,requestb,requestc)).
*/
event(request(requesta,requestb,requestc)).

% fluent! KnowRequest(requestb,requesta,requestc)
 /*
fluent(knowRequest(requestb,requesta,requestc)).
*/
fluent(knowRequest(requestb,requesta,requestc)).

% ectest/ec_reader_test_ecnet.e:4569
% 
% sort holda, holdb, holdc
 /*
sort(holda).
*/
sort(holda).

 /*
sort(holdb).
*/
sort(holdb).

 /*
sort(holdc).
*/
sort(holdc).

% event! TakeOffOf(holda,holdb,holdc)
 /*
event(takeOffOf(holda,holdb,holdc)).
*/
event(takeOffOf(holda,holdb,holdc)).

% event! PickUp(holda,holdb)
 /*
event(pickUp(holda,holdb)).
*/
event(pickUp(holda,holdb)).

% event! LetGoOf(holda,holdb)
 /*
event(letGoOf(holda,holdb)).
*/
event(letGoOf(holda,holdb)).

% event! Hold(holda,holdb)
 /*
event(hold(holda,holdb)).
*/
event(hold(holda,holdb)).

% ectest/ec_reader_test_ecnet.e:4575
% fluent! Holding(holda,holdb)
 /*
fluent(holding(holda,holdb)).
*/
fluent(holding(holda,holdb)).

% 
% sort sita, sitb
 /*
sort(sita).
*/
sort(sita).

 /*
sort(sitb).
*/
sort(sitb).

% event! LieOn(sita,sitb)
 /*
event(lieOn(sita,sitb)).
*/
event(lieOn(sita,sitb)).

% event! SitOn(sita,sitb)
 /*
event(sitOn(sita,sitb)).
*/
event(sitOn(sita,sitb)).

% event! RiseFrom(sita,sitb)
 /*
event(riseFrom(sita,sitb)).
*/
event(riseFrom(sita,sitb)).

% ectest/ec_reader_test_ecnet.e:4581
% fluent! LyingOn(sita,sitb)
 /*
fluent(lyingOn(sita,sitb)).
*/
fluent(lyingOn(sita,sitb)).

% fluent! SittingOn(sita,sitb)
 /*
fluent(sittingOn(sita,sitb)).
*/
fluent(sittingOn(sita,sitb)).

% 
% ona! Food1
 /*
t(ona,food1).
*/
sort(ona).
t(ona,food1).

% onb! Table1
 /*
t(onb,table1).
*/
sort(onb).
t(onb,table1).

% holda! Cook1
 /*
t(holda,cook1).
*/
sort(holda).
t(holda,cook1).

% ectest/ec_reader_test_ecnet.e:4587
% holdb! Food1
 /*
t(holdb,food1).
*/
sort(holdb).
t(holdb,food1).

% holdc! Table1
 /*
t(holdc,table1).
*/
sort(holdc).
t(holdc,table1).

% sita! Eater1
 /*
t(sita,eater1).
*/
sort(sita).
t(sita,eater1).

% sitb! Chair1
 /*
t(sitb,chair1).
*/
sort(sitb).
t(sitb,chair1).

% 
%; initial situation
% ectest/ec_reader_test_ecnet.e:4593
% [agent] % HoldsAt(Dressed(agent),0).
 /*
holds_at(dressed(Agent),0).
*/
axiom(holds_at(dressed(Agent),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4594
% [agent] % HoldsAt(Awake(agent),0).
 /*
holds_at(awake(Agent),0).
*/
axiom(holds_at(awake(Agent),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4595
% [agent] % HoldsAt(Sleep3(agent),0).
 /*
holds_at(sleep3(Agent),0).
*/
axiom(holds_at(sleep3(Agent),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4596
% [agent] % HoldsAt(Standing(agent),0).
 /*
holds_at(standing(Agent),0).
*/
axiom(holds_at(standing(Agent),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4597
% [agent] % HoldsAt(Standing(agent),0).
 /*
holds_at(standing(Agent),0).
*/
axiom(holds_at(standing(Agent),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4598
% [agent,object] % !HoldsAt(Holding(agent,object),0).
 /*
not(holds_at(holding(Agent,Object),0)).
*/
axiom(initially(neg(holding(Agent,Object))),[]).

% 
% ectest/ec_reader_test_ecnet.e:4599
% [food] % HoldsAt(At(food,Kitchen1),0).
 /*
holds_at(at(Food,kitchen1),0).
*/
axiom(holds_at(at(Food,kitchen1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4600
% [food] % !HoldsAt(FoodPrepared(food),0).
 /*
not(holds_at(foodPrepared(Food),0)).
*/
axiom(initially(neg(foodPrepared(Food))),[]).

% 
% ectest/ec_reader_test_ecnet.e:4601
% [agent] % HoldsAt(Hungry(agent),0).
 /*
holds_at(hungry(Agent),0).
*/
axiom(holds_at(hungry(Agent),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4602
% [door] % HoldsAt(DoorIsOpen(door),0).
 /*
holds_at(doorIsOpen(Door),0).
*/
axiom(holds_at(doorIsOpen(Door),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4603
% [clothing] % HoldsAt(At(clothing,Upstairs1),0).
 /*
holds_at(at(Clothing,upstairs1),0).
*/
axiom(holds_at(at(Clothing,upstairs1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4604
% [chair] % HoldsAt(At(chair,DiningRoom1),0).
 /*
holds_at(at(Chair,diningRoom1),0).
*/
axiom(holds_at(at(Chair,diningRoom1),0),[]).

% 
% HoldsAt(At(Cook1,Kitchen1),0).
 /*
holds_at(at(cook1,kitchen1),0).
*/
axiom(holds_at(at(cook1,kitchen1),0),[]).

% 
% HoldsAt(At(Table1,DiningRoom1),0).
 /*
holds_at(at(table1,diningRoom1),0).
*/
axiom(holds_at(at(table1,diningRoom1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4607
% [agent,clothing] % !HoldsAt(Wearing(agent,clothing),0).
 /*
not(holds_at(wearing(Agent,Clothing),0)).
*/
axiom(initially(neg(wearing(Agent,Clothing))),[]).

% 
% 
%; narrative
% HoldsAt(At(Cook1,Kitchen1),0).
 /*
holds_at(at(cook1,kitchen1),0).
*/
axiom(holds_at(at(cook1,kitchen1),0),[]).

% 
% HoldsAt(At(Eater1,Upstairs1),0).
 /*
holds_at(at(eater1,upstairs1),0).
*/
axiom(holds_at(at(eater1,upstairs1),0),[]).

% 
% HoldsAt(At(Eater2,Upstairs1),0).
 /*
holds_at(at(eater2,upstairs1),0).
*/
axiom(holds_at(at(eater2,upstairs1),0),[]).

% 
% ectest/ec_reader_test_ecnet.e:4613
% Happens(FoodPrepare(Cook1,Food1),0).
 /*
happens(foodPrepare(cook1,food1),0).
*/
axiom(happens(foodPrepare(cook1,food1),0),[]).

% 
% Happens(PutOn(Eater1,Clothing1),1).
 /*
happens(putOn(eater1,clothing1),1).
*/
axiom(happens(putOn(eater1,clothing1),1),[]).

% 
% Happens(PutOn(Eater2,Clothing2),2).
 /*
happens(putOn(eater2,clothing2),2).
*/
axiom(happens(putOn(eater2,clothing2),2),[]).

% 
% Happens(WalkDownStaircase(Eater1,Staircase1),3).
 /*
happens(walkDownStaircase(eater1,staircase1),3).
*/
axiom(happens(walkDownStaircase(eater1,staircase1),3),[]).

% 
% Happens(WalkDownStaircase(Eater2,Staircase1),4).
 /*
happens(walkDownStaircase(eater2,staircase1),4).
*/
axiom(happens(walkDownStaircase(eater2,staircase1),4),[]).

% 
% Happens(WalkThroughDoor12(Eater1,DiningRoomDoor1),5).
 /*
happens(walkThroughDoor12(eater1,diningRoomDoor1),5).
*/
axiom(happens(walkThroughDoor12(eater1,diningRoomDoor1),5),[]).

% 
% ectest/ec_reader_test_ecnet.e:4619
% Happens(WalkThroughDoor12(Eater2,DiningRoomDoor1),6).
 /*
happens(walkThroughDoor12(eater2,diningRoomDoor1),6).
*/
axiom(happens(walkThroughDoor12(eater2,diningRoomDoor1),6),[]).

% 
% Happens(SitOn(Eater1,Chair1),7).
 /*
happens(sitOn(eater1,chair1),7).
*/
axiom(happens(sitOn(eater1,chair1),7),[]).

% 
% Happens(SitOn(Eater2,Chair2),8).
 /*
happens(sitOn(eater2,chair2),8).
*/
axiom(happens(sitOn(eater2,chair2),8),[]).

% 
% Happens(PickUp(Cook1, Food1),9).
 /*
happens(pickUp(cook1,food1),9).
*/
axiom(happens(pickUp(cook1,food1),9),[]).

% 
% Happens(WalkThroughDoor21(Cook1, KitchenDoor1),10).
 /*
happens(walkThroughDoor21(cook1,kitchenDoor1),10).
*/
axiom(happens(walkThroughDoor21(cook1,kitchenDoor1),10),[]).

% 
% Happens(PlaceOn(Cook1, Food1, Table1),11).
 /*
happens(placeOn(cook1,food1,table1),11).
*/
axiom(happens(placeOn(cook1,food1,table1),11),[]).

% 
% ectest/ec_reader_test_ecnet.e:4625
% Happens(WalkThroughDoor12(Cook1, KitchenDoor1),12).
 /*
happens(walkThroughDoor12(cook1,kitchenDoor1),12).
*/
axiom(happens(walkThroughDoor12(cook1,kitchenDoor1),12),[]).

% 
% Happens(Eat(Eater1,Food1),13).
 /*
happens(eat(eater1,food1),13).
*/
axiom(happens(eat(eater1,food1),13),[]).

% 
% Happens(Eat(Eater2,Food1),14).
 /*
happens(eat(eater2,food1),14).
*/
axiom(happens(eat(eater2,food1),14),[]).

% 
% Happens(Converse(Eater1,Eater2),15).
 /*
happens(converse(eater1,eater2),15).
*/
axiom(happens(converse(eater1,eater2),15),[]).

% 
% Happens(TalkAbout(Eater1,Content1),16).
 /*
happens(talkAbout(eater1,content1),16).
*/
axiom(happens(talkAbout(eater1,content1),16),[]).

% 
% Happens(TalkAbout(Eater2,Content2),17).
 /*
happens(talkAbout(eater2,content2),17).
*/
axiom(happens(talkAbout(eater2,content2),17),[]).

% 
% ectest/ec_reader_test_ecnet.e:4631
% Happens(RiseFrom(Eater1,Chair1),18).
 /*
happens(riseFrom(eater1,chair1),18).
*/
axiom(happens(riseFrom(eater1,chair1),18),[]).

% 
% Happens(RiseFrom(Eater2,Chair2),19).
 /*
happens(riseFrom(eater2,chair2),19).
*/
axiom(happens(riseFrom(eater2,chair2),19),[]).

% 
% 
% range time 0 20
 /*
range(time,0,20).
*/
range(time,0,20).

% range offset 0 0
 /*
range(offset,0,0).
*/
range(offset,0,0).

% range diameter 0 0
 /*
range(diameter,0,0).
*/
range(diameter,0,0).

% ectest/ec_reader_test_ecnet.e:4637
% 
% completion Happens
 /*
completion(happens).
*/
completion(happens).

% 
%; End of file.