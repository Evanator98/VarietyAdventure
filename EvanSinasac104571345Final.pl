/* Evan Sinasac - 104571345 
A short text adventure that explores a few different areas because I wasn't sure what to do
That ended up being just two areas because I am running out of time and couldn't think of anything for the other two areas
*/

:- dynamic at/2, i_am_at/1, alive/1.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).

/* This defines the current location */

i_am_at(startA).

/* These facts describe how areas are connected */

path(startA, n, clearing).

path(clearing, e, town).
path(clearing, w, forest).
path(clearing, s, startA).
path(clearing, n, mountain).


path(town, e, inn).
path(town, s, well).
path(town, n, mountain).
path(town, w, clearing).

path(inn, w, town).

path(forest, w, fclearing).
path(forest, n, mountain).
path(forest, e, clearing).

path(fclearing, n, mountain).
path(fclearing, e, forest).

path(mountain, s, clearing).
path(mountain, n, cave).


path(cave, d, cave1).
path(cave1, d, cave2).
path(cave2, d, cave3).
path(cave3, d, cave4).

/* Maze */

path(well, n, town).
path(well, s, a2).

path(a2, n, well).
path(a2, s, a3).

path(a3, n, a2).
path(a3, s, a4).

path(a4, n, a3).
path(a4, e, b4).
path(a4, s, a5).

path(a5, n, a4).

path(a6, s, a7).

path(a7, n, a6).
path(a7, s, a8).

path(a8, n, a7).
path(a8, e, b8).

path(a9, e, b9).
path(a9, s, a10).

path(a10, n, a9).
path(a10, e, b10).
path(a10, s, a11).

path(a11, n, a10).


path(b2, e, c2).
path(b2, s, b3).

path(b3, n, b2).

path(b4, e, c4).
path(b4, w, a4).

path(b5, e, c5).
path(b5, s, b6).

path(b6, n, b5).
path(b6, s, b7).

path(b7, n, b6).

path(b8, e, c8).
path(b8, w, a8).

path(b9, w, a9).

path(b10, e, c10).
path(b10, w, a10).

path(b11, e, c11).


path(c2, s, c3).
path(c2, w, b2).

path(c3, n, c2).
path(c3, e, d3).
path(c3, s, c4).

path(c4, n, c3).
path(c4, s, c5).
path(c4, w, b4).

path(c5, n, c4).
path(c5, s, c6).
path(c5, w, b5).

path(c6, n, c5).
path(c6, s, c7).

path(c7, n, c6).
path(c7, e, d7).
path(c7, s, c8).

path(c8, n, c7).
path(c8, e, d8).
path(c8, s, c9).
path(c8, w, b8).

path(c9, n, c8).
path(c9, s, c10).

path(c10, n, c9).
path(c10, w, b10).

path(c11, e, d11).
path(c11, w, b11).


path(d2, s, d3).

path(d3, n, d2).
path(d3, w, c3).

path(d4, e, e4).
path(d4, s, d5).

path(d5, n, d4).
path(d5, s, d6).

path(d6, n, d5).
path(d6, s, d7).

path(d7, n, d6).
path(d7, e, e7).
path(d7, w, c7).

path(d8, e, e8).
path(d8, w, c8).

path(d9, e, e9).
path(d9, s, d10).

path(d10, n, d9).
path(d10, e, e10).
path(d10, s, d11).

path(d11, n, d10).
path(d11, e, e11).
path(d11, w, c11).


path(e2, s, e3).

path(e3, n, e2).
path(e3, e, f3).
path(e3, s, e4).

path(e4, n, e3).
path(e4, s, e5).
path(e4, w, d4).

path(e5, n, e4).
path(e5, s, e6).

path(e6, n, e5).
path(e6, e, f6).

path(e7, e, f7).
path(e7, w, d7).

path(e8, s, e9).
path(e8, w, d8).

path(e9, n, e8).
path(e9, w, d9).

path(e10, w, d10).
path(e11, w, d11).


path(f2, e, g2).

path(f3, e, g3).
path(f3, w, e3).

path(f4, e, g4).
path(f4, s, f5).

path(f5, n, f4).
path(f5, e, g5).

path(f6, e, g6).
path(f6, w, e6).

path(f7, s, f8).
path(f7, w, e7).

path(f8, n, f7).
path(f8, s, f9).

path(f9, n, f8).
path(f9, s, f10).

path(f10, n, f9).
path(f10, s, f11).

path(f11, n, f10).
path(f11, e, g11).


path(g2, e, h2).
path(g2, w, f2).

path(g3, e, h3).
path(g3, w, f3).

path(g4, w, f4).

path(g5, e, h5).
path(g5, w, f5).

path(g6, s, g7).
path(g6, w, f6).

path(g7, n, g6).
path(g7, s, g8).

path(g8, n, g7).
path(g8, s, g9).

path(g9, n, g8).
path(g9, s, g10).

path(g10, n, g9).
path(g10, e, h10).

path(g11, w, f11).


path(h2, e, i2).
path(h2, s, h3).
path(h2, w, g2).

path(h3, n, h2).
path(h3, e, i3).
path(h3, s, h4).
path(h3, w, g3).

path(h4, n, h3).
path(h4, s, h5).

path(h5, n, h4).
path(h5, e, i5).
path(h5, w, g5).

path(h6, e, i6).
path(h6, s, h7).

path(h7, n, h6).
path(h7, s, h8).

path(h8, n, h7).
path(h8, e, i8).

path(h9, e, i9).
path(h10, w, g10).

path(h11, e, i11).
path(h11, s, endofmaze).


path(i2, e, j2).
path(i2, w, h2).

path(i3, e, j3).
path(i3, w, h3).

path(i4, s, i5).

path(i5, n, i4).
path(i5, w, h5).

path(i6, e, j6).
path(i6, w, h6).

path(i7, s, i8).

path(i8, n, i7).
path(i8, w, h8).

path(i9, e, j9).
path(i9, s, i10).
path(i9, w, h9).

path(i10, n, i9).
path(i11, e, j11).
path(i11, w, h11).


path(j2, w, i2).

path(j3, s, j4).
path(j3, w, i3).

path(j4, n, j3).
path(j4, s, j5).

path(j5, n, j4).
path(j5, s, j6).

path(j6, n, j5).
path(j6, s, j7).
path(j6, w, i6).

path(j7, n, j6).
path(j7, s, j8).

path(j8, n, j7).
path(j8, s, j9).

path(j9, n, j8).
path(j9, s, j10).
path(j9, w, i9).

path(j10, n, j9).
path(j10, s, j11).

path(j11, n, j10).
path(j11, w, i11).


path(endofmaze, e, well).



path(startA, w, outside).

path(outside, s, soutside).
path(outside, n, noutside).
path(outside, w, lobby).
path(outside, e, startA).

path(soutside, s, lolexit).
path(noutside, n, lolexit).
path(noutside, s, outside).
path(soutside, n, outside).

path(lobby, s, poolroom).
path(lobby, n, dining).
path(lobby, w, ballroom) :- at(key, in_hand).
path(lobby, w, ballroom) :-
	write('The door to the ballroom is locked.  You need to find the key'), nl, !, fail.
path(lobby, e, outside).
	
path(poolroom, w, lounge).
path(poolroom, n, lobby).

path(lounge, s, closet).
path(lounge, e, poolroom).

path(closet, n, lounge).

path(dining, w, kitchen).
path(dining, s, lobby).
path(kitchen, e, dining).

path(ballroom, w, rexit).
path(ballroom, e, lobby).


/* These rules define the 4 direction letters as calls to go */

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).

d :- go(d).


/* These facts tell where objects are in the game */

at(sword, fclearing).
at(shield, endofmaze).
at(key, closet).

/* This fact specifies if the dragon is alive */

alive(dragon).
alive(wolf).

/* These rules describe how to pick up an object. */

take(X) :-
	at(X, in_hand),
	write('You\'re already holding it!'),
	nl, !.
	
take(X) :-
	i_am_at(fclearing),
	alive(wolf),
	write('You can\'t take the sword, the wolf is in the way!'), 
	nl, !.
	
take(X) :-
	i_am_at(Place),
	at(X, Place),
	retractall(at(X,Place)),
	assert(at(X,in_hand)),
	write('OK.'),
	nl, !.
	
take(_) :-
	write('I don\'t see it here.'),
	nl.


/* This rule tells how to move in a given direction. */

go(Direction) :-
	i_am_at(Here),
	path(Here, Direction, There),
	retract(i_am_at(Here)),
	assert(i_am_at(There)),
	look, !.
	
go(_) :-
	write('You can\'t go that way.').
	
/* This rule tells how to look about you. */

look :-
	i_am_at(Place),
	describe(Place),
	nl,
	notice_objects_at(Place),
	nl.
	
/* These rules set up a loop to mention all the objects in your vicinity. */

notice_objects_at(Place) :-
	at(X, Place),
	write('There is a '), write(X), write(' here.'), nl,
	fail.
	
notice_objects_at(_).

/* This rule tells how to die. */

die :-
	!, finish.
	
finish :-
	nl,
	write('Thank you for playing the game!  Please enter the \'halt\' command'),
	nl, !.
	
/* This rule just writes out the game's instructions. */

instructions :- 
	nl,
	write('Enter commands using standard Prolog syntax.'), nl,
	write('Available commands are:'), nl,
	write('start.						-- to start the game.'), nl,
	write('n. s. e. w.					-- to go in that direction.'), nl,
	write('take(Object).				-- to pick up an object.'), nl,
	write('drop(Object).				-- to put down an object.'), nl,
	write('attack.						-- to attack an enemy.'), nl,
	write('look.						-- to look around you again.'), nl,
	write('instructions.				-- to see this message again.'), nl,
	write('halt.						-- to end the game and quit.'), nl,
	nl.
	
	
/* This rule prints out instructions and tells where you are. */

start :-
	instructions,
	look.
	
	
/* Answer to the riddle */

nothing :-
	i_am_at(fclearing),
	write('The wolf grins, "That is correct.  Please take the sword on your way out.'), nl,
	retract(alive(wolf)),
	!, nl.
	
nothing :-
	i_am_at(_),
	write('What are you doing?'), nl,
	!, nl.
	
/* These rules describe the various locations. */

describe(startA) :-
	write('You are in the starting area.'), nl,
	write('To the north there appears to be a clearing'), nl,
	write('To the east there appears to be an ocean [not finished]'), nl,
	write('To the south there appears to be a space ship [not finished]'), nl,
	write('To the west there appears to be a haunted house'), nl.
	
describe(clearing) :-
	write('You are in a pleasent clearing, enjoying the summer breeze,'), nl,
	write('when a massive dragon\'s ROAR shakes the ground.  You see the'), nl,
	write('shadow of the beast circling the mountain to the north.'), nl,
	write('To the west there is a forest, and to the east there is a town.'), nl,
	write('You may return to the starting area by going south from here.'), nl.
	
describe(town) :-
	write('A small village living in fear of the dragon, most of the residents'), nl,
	write('skulk around town avoiding you and simply trying to their chores in peace.'), nl,
	write('There is an inn to the east and a small well to the south.  You could get to'), nl,
	write('the mountain by traveling north from here, or go to the clearing to the west.'), nl.
	
describe(inn) :-
	write('What appears to normally be a lively inn is extremely quiet.  The barkeep offers you'), nl,
	write('a drink.  "On the house.  We all need a bit of peace with that beast around."'), nl,
	write('You take a seat and enjoy your drink.  It stinks and doesn\'t taste too good, but it\'s'), nl,
	write('better than nothing.  While you drink, you overhear some other patrons talking about an'), nl,
	write('invincible shield located somewhere under the town, and an all-powerfull sword located in the'), nl,
	write('nearby forest guraded by some mystical guardian.  When you are ready to leave, you may do so with'), nl,
	write('the exit to the west.'), nl.
	
describe(forest) :-
	write('It is difficult to see through the dense trees.  It seems you might find a clearing if you continue'), nl,
	write('travelling west.  Traveling north will probably get you to the mountain.'), nl.
	
describe(fclearing) :-
	alive(wolf),
	write('You reach a clearing in the forest.  In front of you a shimmering sword rests stuck in a stone.'), nl,
	write('As you approach the sword, a giant wolf appears and eyes you up and down.  It then opens its mouth, '), nl,
	write('"Answer my riddle human, and the sword is yours. \'I am greater than God, and more evil than the Devil.'), nl,
	write('The poor have me, the wealthy need me, and if you eat me, you die.  What am I?\'  Well?  What is your answer?"'), nl.
	
describe(fclearing) :-
	write('You are in the forest clearing.'), nl.

describe(mountain) :- 
	write('Reaching the mountain does not take nearly as long as you expect.  As you get closer, you see'), nl,
	write('the dragon disappear into the mountain.  If you are prepared, you can continue north to the dragon\'s cave,'), nl,
	write('otherwise, you can return to the clearing by going south.'), nl.
	
describe(cave) :-
	write('The massive dragon sits a little into the cave, the light glinting off her bright red scales.'), nl,
	write('Behind the creature, you see mounds of gold, on top of which sits a young princess in a ruby cage.'), nl,
	write('It is too late to turn back now!  The dragon lunges towards you.  Do you: '), nl,
	write('dodge.'), nl,
	write('attack.'), nl,
	write('block.'), nl.

/* <aze */

describe(well) :-
	write('You climb into the empty well.  it is a little dank at the bottom, but ahead of you,'), nl,
	write('towards the south is the entrance to a maze.'), nl.
	
describe(a2) :-
	write('To the north is the exit to the well.  You can go south from here.'), nl.
	
describe(a3) :-
	write('You can go north and south here.'), nl.
	
describe(a4) :-
	write('You can go north, east and south here.'), nl.
	
describe(a5) :-
	write('This is a dead end.  You can go north here.'), nl.
	
describe(a6) :-
	write('This is a dead end.  You can go south here.'), nl.
	
describe(a7) :-
	write('You can go north and south here.'), nl.
	
describe(a8) :-
	write('You can go north and east here.'), nl.
	
describe(a9) :-
	write('You can go east and south here.'), nl.
	
describe(a10) :-
	write('You can go north, east and south here.'), nl.
	
describe(a11) :-
	write('This is a dead end.  You can go north here.'), nl.
	
describe(b2) :-
	write('You can go east and south here.'), nl.
	
	
describe(b3) :-
	write('This is a dead end.  You can go north here.'), nl.
	
describe(b4) :-
	write('You can go east and west here.'), nl.
	
describe(b5) :-
	write('You can go east and south here.'), nl.

describe(b6) :-
	write('You can go north and south here.'), nl.
	
describe(b7) :-
	write('This is a dead end.  You can go north here.'), nl.
	
describe(b8) :-
	write('You can go east and west here.'), nl.

describe(b9) :-
	write('This is a dead end.  You can go west here.'), nl.
	
describe(b10) :-
	write('You can go east and west here.'), nl.
	
describe(b11) :-
	write('This is a dead end.  You can go east here.'), nl.
	
	
describe(c2) :-
	write('You can go south and west here.'), nl.
	
describe(c3) :-
	write('You can go north, east and south here.'), nl.
	
describe(c4) :-
	write('You can go north, south and west here.'), nl.
	
describe(c5) :-
	write('You can go north, south and west here.'), nl.
	
describe(c6) :-
	write('You can go north and south here.'), nl.
	
describe(c7) :-
	write('You can go north, east and south here.'), nl.
	
describe(c8) :-
	write('You can go north, east, south and west here.'), nl.
	
describe(c9) :-
	write('You can go north and south here.'), nl.
	
describe(c10) :-
	write('You can go north and west here.'), nl.
	
describe(c11) :-
	write('You can go east and west here.'), nl.
	
	
describe(d2) :-
	write('This is a dead end.  You can go south here.'), nl.
	
describe(d3) :-
	write('You can go north and west here.'), nl.
	
describe(d4) :-
	write('You can go east and south here.'), nl.
	
describe(d5) :-
	write('You can go north and south here.'), nl.
	
describe(d6) :-
	write('You can go north and south here.'), nl.
	
describe(d7) :-
	write('You can go north, east and west here.'), nl.
	
describe(d8) :-
	write('You can go east and west here.'), nl.
	
describe(d9) :-
	write('You can go east and south here.'), nl.
	
describe(d10) :-
	write('You can go north, east and south here.'), nl.
	
describe(d11) :-
	write('You can go north, east and west.'), nl.
	
	
describe(e2) :-
	write('This is a dead end.  You can go south here.'), nl.
	
describe(e3) :-
	write('You can go north, east and south here.'), nl.
	
describe(e4) :-
	write('You can go north, south and west here.'), nl.
	
describe(e5) :-
	write('You can go north and south here.'), nl.
	
describe(e6) :-
	write('You can go north and east here.'), nl.
	
describe(e7) :-
	write('You can go east and west here.'), nl.
	
describe(e8) :-
	write('You can go south and west here.'), nl.
	
describe(e9) :-
	write('You can go north and west here.'), nl.
	
describe(e10) :-
	write('This is a dead end.  You can go west here.'), nl.
	
describe(e11) :-
	write('This is a dead end.  You can go west here.'), nl.
	
	
describe(f2) :-
	write('This is a dead end.  You can go east here.'), nl.
	
describe(f3) :-
	write('You can go east and west here.'), nl.
	
describe(f4) :-
	write('You can go east and south here.'), nl.
	
describe(f5) :-
	write('You can go north and east here.'), nl.
	
describe(f6) :-
	write('You can go east and west here.'), nl.
	
describe(f7) :-
	write('You can go south and west here.'), nl.
	
describe(f8) :-
	write('You can go north and south here.'), nl.
	
describe(f9) :-
	write('You can go north and south here.'), nl.
	
describe(f10) :-
	write('You can go north and south here.'), nl.
	
describe(f11) :-
	write('You can go north and east here.'), nl.
	
	
describe(g2) :-
	write('You can go east and west here.'), nl.
	
describe(g3) :-
	write('You can go east and west here.'), nl.
	
describe(g4) :-
	write('This is a dead end.  You can go west here.'), nl.

describe(g5) :-
	write('You can go east and west here.'), nl.
	
describe(g6) :-
	write('You can go south and west here.'), nl.
	
describe(g7) :-
	write('You can go north and south here.'), nl.
	
describe(g8) :-
	write('You can go north and south here.'), nl.
	
describe(g9) :-
	write('You can go north and south here.'), nl.
	
describe(g10) :-
	write('You can go north and east here.'), nl.
	
describe(g11) :-
	write('This is a dead end.  You can go west here.'), nl.
	
	
describe(h2) :-
	write('You can go east, south and west here.'), nl.
	
describe(h3) :-
	write('You can go north, east, south and west here.'), nl.
	
describe(h4) :-
	write('You can go north and south here.'), nl.
	
describe(h5) :-
	write('You can go north, east and west here.'), nl.
	
describe(h6) :-
	write('You can go east and south here.'), nl.
	
describe(h7) :-
	write('You can go north and south here.'), nl.
	
describe(h8) :-
	write('You can go north and east here.'), nl.
	
describe(h9) :-
	write('This is a dead end.  You can go east here.'), nl.
	
describe(h10) :-
	write('This is a dead end.  You can go west here.'), nl.
	
describe(h11) :-
	write('You can see the exit to the south of here.  You can also go east.'), nl.
	
	
describe(i2) :-
	write('You can go east and west here.'), nl.
	
describe(i3) :-
	write('You can go east and west here.'), nl.
	
describe(i4) :-
	write('This is a dead end.  You can go south here.'), nl.
	
describe(i5) :-
	write('You can go north and west here.'), nl.
	
describe(i6) :-
	write('You can go east and west here.'), nl.
	
describe(i7) :-
	write('This is a dead end.  You can go south here.'), nl.
	
describe(i8) :-
	write('You can go north and west here.'), nl.
	
describe(i9) :-
	write('You can go south and west here.'), nl.
	
describe(i10) :-
	write('This is a dead end.  You can go north here.'), nl.

describe(i11) :-
	write('You can go east and west here.'), nl.


describe(j2) :-
	write('This is a dead end.  You can go west here.'), nl.
	
describe(j3) :-
	write('You can go south and west here.'), nl.
	
describe(j4) :-
	write('You can go north and south here.'), nl.
	
describe(j5) :-
	write('You can go north and south here.'), nl.
	
describe(j6) :-
	write('You can go north, south and west here.'), nl.
	
describe(j7) :-
	write('You can go north and south here.'), nl.
	
describe(j8) :-
	write('You can go north and south here.'), nl.
	
describe(j9) :-
	write('You can go north, south and west here.'), nl.
	
describe(j10) :-
	write('You can go north and south here.'), nl.
	
describe(j11) :-
	write('You can go north and west here.'), nl.

describe(endofmaze) :-
	write('You appear to be in some kind of crypt.  A hidden portal is to the east.'), nl.
	



describe(outside) :-
	write('It is a dark night, stormy clouds cover what you know to be the full moon.'), nl,
	write('In front of you looms the manor.  Behind you, your friends tease you, calling'), nl,
	write('you a scaredy cat, among other names.  You gulp and steel your nerves.  It is time'), nl,
	write('to enter the haunted house to the west.'), nl.
	
describe(soutside) :-
	write('You go around the outside of the house, and you are on the southern side.'), nl.
	
describe(noutside) :-
	write('You go around the outside of the house, and you are on the northern side.'), nl.

describe(lolexit) :-
	write('You are a coward and did not go through the haunted house.  It\'s ok scaredy cat,'), nl,
	write('you can end the game now using the halt. command'), nl.
	
describe(lobby) :-
	write('It is very dark in the entrance of the house.  The raggedy curtains let in little light.'), nl,
	write('Across the hall, there is a set of double doors, leading to the ballroom to the west.'), nl,
	write('There are small single doors to the north and south, leading to the dining room and poolroom.'), nl,
	write('You hear some slight banging sounds coming from the north door.'), nl.
	
describe(dining) :-
	write('Once inside the dining room, you see all the chairs are currently floating and dancing'), nl,
	write('around the dining table.  The banging noise is louder and is coming from the room to the west,'), nl,
	write('which appears to be the kitchen.'), nl.
	
describe(kitchen) :-
	write('Inside the kitchen, you see a ghost chef making a ghost dinner.  Noticing you, he shoos you out of the room.'), nl,
	write('There is nothing else of note in the kitchen.  You can return to the dining room to the east.'), nl.
	
describe(poolroom) :-
	write('In the center of the room, the two pool cues are playing pool by themselves.  Both players seem to be very bad.'), nl,
	write('You can return to the lobby to the north, or go to the lounge room to the west.'), nl.
	
describe(lounge) :-
	write('The furniture of the lounge room looks very comfy.  There is a purple fire glowing in the fireplace agains the north wall.'), nl,
	write('There seems to be a closet of some sort on the south end of the room.'), nl.
	
describe(closet) :-
	write('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH'), nl,
	write('A skeleton drops out of the closet onto you.  You see a key on the floor behind it.'), nl.
	
describe(ballroom) :-
	write('As you slowly enter the ballroom and take a look around, a slow eerie waltz begins playing.'), nl,
	write('You feel somethings\' breath on the back of your neck.  The back entrance of the room is to the west'), nl.
	
describe(rexit) :-
	write('Congratulations!  You successfully navigated the haunted house!  Please use the halt. command to end the game.'), nl.
	

/* Dragon Fight */

dodge :-
	i_am_at(cave),
	write('You dodge out of the way of the dragon as she lunges past you.  She begins turning to make another pass at you.'), nl,
	go(d).
	
dodge :-
	i_am_at(cave1),
	write('You duck under the dragon.  The scales on the underbelly seem much softer, as she searches for you.'), nl,
	go(d).
	
dodge :-
	i_am_at(cave2),
	write('You jump out from under the dragon and get scooped up into her claws.  Without armor you are shreded to pieces.'), nl,
	write('Game Over'), nl,
	die.
	
dodge :-
	i_am_at(cave3),
	write('Attempting to dodge out of the way of the fire, turns out this dragon can spread the flames, and you are burnt to a crisp.'), nl,
	write('Game Over'), nl,
	die.
	
dodge :-
	i_am_at(cave4),
	write('You dodge back from the dragon, giving her a moment to catch her breath.  She appreciates this and promptly gobbles you up.'), nl,
	write('Game Over'), nl,
	die.


attack :-
	i_am_at(cave),
	write('You charge headlong into the dragon.  She eats you right up.'), nl,
	write('Game Over'), nl,
	die.
	
attack :-
	i_am_at(cave1),
	write('Eager to die, you leap into the dragon\'s maw.'), nl,
	write('Game Over'), nl,
	die.
	
attack :-
	i_am_at(cave2),
	at(sword, in_hand),
	write('You drag your sword down the dragon\'s belly.  She screeches and you dive out from under her.'), nl,
	write('Glaring you down, she takes a deep breath and prepares to breath fire at you.'), nl,
	go(d).
	
attack :-
	i_am_at(cave2),
	write('You uselessly punch the dragon\'s belly.  She reaches under and crushes you.'), nl,
	write('Game Over'), nl,
	die.
	
attack :-
	i_am_at(cave3),
	write('You charge the dragon and are burnt to a crisp.'), nl,
	write('Game Over'), nl,
	die.
	
attack :-
	i_am_at(cave4),
	at(sword, in_hand),
	write('You slit the dragon\'s throat and it slumps to a dead heap on the ground.'), nl,
	write('You rescue the princess, gather the gold, get married, live happily ever after or something.'),
	die.
	
attack :-
	i_am_at(cave4),
	write('You uselessly punch the dragon\'s nose.  She then eats you.'), nl,
	write('Game Over'), nl,
	die.

	
block :-
	i_am_at(cave),
	at(shield, in_hand),
	write('The dragon rams into you and sends you flying down the mountain.  The dragon did no damage to you,'), nl,
	write('but the fall down the mountain certainly killed you.'), nl,
	write('Game Over'), nl,
	die.
	
block :-
	i_am_at(cave1),
	at(shield, in_hand),
	write('The dragon slams into your shield and pushes you into the wall.  Your body snaps in half.'), nl,
	write('Game Over'), nl,
	die.
	
block :-
	i_am_at(cave2),
	at(shield, in_hand),
	write('There is nothing to block, so...uh...., let\'s call this a game over :)'), nl,
	write('Game Over'),
	die.
	
block :-
	i_am_at(cave3),
	at(shield, in_hand),
	write('The dragon\'s fire rains down on you, but you raise the magical shield and block it all.'), nl,
	write('Pressing forward, you reach the dragon\'s head, and shove the shield down her throat.'), nl,
	go(d).
	
block :-
	i_am_at(cave4),
	at(shield, in_hand),
	write('Uhm, you just shoved that down the dragon\'s throat.  You go in after it.'), nl,
	write('Game Over'), nl,
	die.
	
block :-
	write('Well, you can not block without a shield, now can you?'), nl,
	write('Game Over'), nl,
	die.
	













































