"Mind Games" by Giovanni Prinzivalli

Book  1 - Actions for asking and telling about things

Chapter  1 - Action Definitions

Section 1 - New actions and grammar

include Basic Help Menu by Emily Short;

When play begins:
	choose row 1 in Table of Basic Help Options;
	now description entry is "You're going to have so much fun.";
	
Table of Instruction Options (continued)
title	description
"Verbs"	"Combine something with something.  Ingite something.  Step on something.  Break something.  Talking to someone.  Ask someone about something.  Organize something.  Spank someone.  Pinch someone.  Smack someone.  Kick someone.  Unsummon someone.  Subjugate someone."


[Credit to I7 for the whole combine function from inform 7 learn website]
[Credit to Eric Eve's "Epistemology" and "Conversation Structure" for help with implementing asking and telling functionality]

A thing can be either seen or unseen. A thing is usually unseen.

Carry out looking (this is the mark items as seen when looking rule): 
  unless in darkness begin;    
  repeat with item running through things that are enclosed by the location begin;   
	   if the item is not enclosed by an opaque closed container, now the item is seen;  
  end repeat;
 end unless.

Carry out opening a container (this is the mark items as seen on opening a container rule):
  repeat with item running through things that are enclosed by the noun begin;   
	   if the item is unseen and the item is visible, now the item is seen;  
  end repeat.

The mark items as seen on opening a container rule is listed after the standard opening rule in the carry out opening rules.

A thing can be familiar or unfamiliar. A thing is usually unfamiliar.

Carry out examining something visible (this is the mark items as seen on examining rule):
 now the noun is familiar;
 now the noun is seen.

Definition: a thing is known if it is familiar or it is seen.
Definition: a thing is unknown if it is not known.

Requesting it for is an action applying to two visible things.
Imploring it for is an action applying to one visible thing and one topic.

Understand the command "ask" as something new.

Understand "ask [someone] about [text]" as asking it about.

Understand "ask [someone] for [any known thing]" as requesting it for.
Understand "ask [someone] for [text]" as imploring it for.

Quizzing it about is an action applying to two visible things.

Understand "ask [someone] about [any known thing]" as quizzing it about.

Informing it about is an action applying to two visible things.

Understand "tell [someone] about [any known thing]" as informing it about.

Section 2 - Specifications

The specification of the quizzing it about action is "This action responds to commands like ASK FRED ABOUT BOAT, where BOAT is a thing defined in the game, rather than a topic."

The specification of the informing it about action is "This action responds to commands like TELL FRED ABOUT BOAT, where BOAT is a thing defined in the game, rather than a topic."

The specification of the requesting it for action is "This action effectively replaces the library's asking it for action. Like asking it for it matches ASK BOB FOR SOMETHING, but unlike asking it for it makes no assumptions that this is equivalent to BOB, GIVE ME SOMETHING. Instead it can match any object known to the player, and the response can be anything we care to define."

The specification of the imploring it for action is "This action provides handling for ASK SOMEONE ABOUT SOMETHING where SOMETHING is a topic rather than a thing, e.g. ASK BILL FOR ADVICE."


Chapter  2 - Some useful default rules

Report informing someone about something (this is the block informing rule):
  say "There is no reply."

Report quizzing someone about something (this is the block quizzing rule):
  say "There is no reply."

Instead of asking a female person about "herself" (this is the asking a woman about herself rule):
  try quizzing the noun about the noun.

Instead of asking a male person about "himself" (this is the asking a man about himself rule):
  try quizzing the noun about the noun.


Book  2 - Abbreviated commands for addressing the current interlocutor

The current interlocutor is an object that varies.
The current interlocutor is nothing.

Implicit-asking is an action applying to one topic.

Understand "ask about [text]" or "a [text]" as implicit-asking.

implicit-telling is an action applying to one topic.

Understand "t [text]" as implicit-telling.

implicit-quizzing is an action applying to one visible thing.
  Understand "ask about [any known thing]" or "a [any known thing]" as implicit-quizzing.

implicit-informing is an action applying to one visible thing.
  Understand "t [any known thing]" or "talk about [any known thing]" as implicit-informing.

implicit-requesting is an action applying to one visible thing.
  Understand "ask for [any known thing]" as implicit-requesting.

implicit-imploring is an action applying to one topic.
  Understand "ask for [text]" as implicit-imploring.

implicit-asking is implicit-conversing. 
implicit-telling is implicit-conversing. 
implicit-quizzing is implicit-conversing. 
implicit-informing is implicit-conversing.
implicit-requesting is implicit-conversing.
implicit-imploring is implicit-conversing.

Before implicit-conversing when the current interlocutor is nothing (this is the implicit-conversing needs current interlocutor rule):
let np be the number of visible people who are not the player;
if np is 0,  say "There's no one here to talk to.";
if np > 1, say "You need to specify who you want to speak to.";
if np is not 1, stop the action;
let the interlocutor be a random visible person who is not the player;
 if the interlocutor is a person begin;
   say "(addressing [the interlocutor])";
   let sn be the second noun;
   implicitly greet the interlocutor;
   now the second noun is sn;
 otherwise ;
  say "You're not talking to anyone.";
  stop the action;
end if.

Before implicit-conversing when the current interlocutor is not visible and the current interlocutor is not nothing  (this is the can't converse with absent interlocutor rule):
  say "[The current interlocutor] isn't here.";
  reset the interlocutor instead.

Instead of implicit-asking:
  try asking the current interlocutor about it.

Instead of implicit-telling:
  try telling the current interlocutor about it.

Instead of implicit-quizzing:
  try quizzing the current interlocutor about the noun.

Instead of implicit-informing:
  try informing the current interlocutor about the noun.

Instead of implicit-requesting:
  try requesting the current interlocutor for the noun.

Instead of implicit-imploring:
  try imploring the current interlocutor for it.

[
After reading a command when the player's command matches "a [thing]" and the current interlocutor is not a person:
  if the number of visible people who are not the player > 1 begin;
	 say "Whom do you want to ask?";
	 reject the player's command;
  end if.
]

Book 3 - Greeting Protocols

Chapter 1 - Greeting Definitions

Asking someone about something is conversing.
Telling someone about something is conversing.
Quizzing someone about something is conversing.
Informing someone about something is conversing.
Answering someone that something is conversing.
Asking someone for something is conversing.
Requesting someone for something is conversing.
Imploring someone for something is conversing.

Asking someone about something is speaking.
Telling someone about something is speaking.
Quizzing someone about something is speaking.
Informing someone about something is speaking.
Answering someone that something is speaking.
Asking someone for something is speaking.
Requesting someone for something is speaking.
Imploring someone for something is speaking.


Saying yes is speaking.
Saying no is speaking.
Saying sorry is speaking.


Chapter  2 - Greeting

Before conversing when the noun is not the current interlocutor (this is the greet a new interlocutor rule):
  implicitly greet the noun;
  if the noun is not the current interlocutor, stop the action.

Before showing something to someone when the second noun is not the current interlocutor (this is the showing needs an interlocutor rule):        
  implicitly greet the second noun;
  if the second noun is not the current interlocutor,  stop the action.
 
Before giving something to someone when the second noun is not the current interlocutor (this is the giving needs an interlocutor rule):
  if the current interlocutor is not a person, abide by the implicit-conversing needs current interlocutor rule;
  implicitly greet the second noun;
  if the second noun is not the current interlocutor, stop the action.

Before asking someone to try doing something when the person asked is not the current interlocutor (this is the giving orders needs an interlocutor rule):
  implicitly greet the person asked;
  if the person asked is not the current interlocutor, stop the action.

To implicitly greet (character - a thing):
  now the greeting type is implicit;
  try saying hello to the character.

Saying hello to is an action applying to one visible thing.

Understand "greet [something]" or "say hello/hi to [something]" as saying hello to.

Check saying hello to a person when the noun is the current interlocutor (this is the can't greet current interlocutor rule):
	if the noun is the player, say "Talking to yourself is unrewarding." instead;
	say "You are already talking to [the noun]." instead.


Carry out saying hello to a person (this is the note current interlocutor when greeted rule):
  now the current interlocutor is the noun.

Report saying hello to something that is not a person (this is the can't greet inanimate objects rule):
  say "[The noun] do[if the noun is not plural-named and the noun is not the player]es[end if] not respond."

Report saying hello to someone when the greeting type is explicit (this is the default greeting rule):
  say "You say hello to [the noun]."

Hailing is an action applying to nothing.

Understand "hello" or "hi" or "say hello/hi" as hailing.

Before asking someone to try hailing (this is the change greeting command to greeting rule):  
  now the greeting type is explicit;
  try saying hello to the person asked;
  rule succeeds.

The change greeting command to greeting rule is listed before the giving orders needs an interlocutor rule in the before rules.

Check hailing (this is the check what's being hailed rule):
  if the current interlocutor is a visible person, 
	say "You are already talking to [the current interlocutor]." instead;
  now the noun is a random visible person who is not the player;
  if the noun is a person and the noun is not yourself and the noun is not the player,  
	say "(addressing [the noun])";
  otherwise say "There's no one here but you." instead.

Carry out hailing (this is the standard hailing rule):
  try saying hello to the noun.
  

Persuasion rule for asking people to try hailing (this is the allow hailing rule): persuasion succeeds.

A protocol type is a kind of value. The protocol types are implicit and explicit.

Greeting type is a protocol type that varies. Greeting type is explicit.

When play begins: reset the interlocutor.

Chapter 2  - Saying Goodbye

Farewell type is a protocol type that varies. Farewell type is explicit.

[ This is the only way I could figure to effectively change the current interlocutor to no one]

To reset the interlocutor:
  now the current interlocutor is nothing. [a random person who is not a person]

Leavetaking is an action applying to nothing.

Understand "bye" or "goodbye" or "cheerio" or "farewell" as leavetaking.

Saying goodbye to is an action applying to one visible thing.

Understand "say bye/goodbye/farewell/cheerio to [someone]" as saying goodbye to.

Check saying goodbye to something when the noun is not the current interlocutor (this is the can't say goodbye to someone you're not talking to rule):
  say "You're not talking to [the noun]." instead.

Carry out saying goodbye to something (this is the reset interlocutor on saying goodbye rule):   
  reset the interlocutor.

Check leavetaking when the current interlocutor is not a visible person (this is the don't allow saying goodbye to no-one rule):
  say "You're not talking to anyone." instead.

Carry out leavetaking (this is the standard leavetaking rule):
  try saying goodbye to the current interlocutor.

Persuasion rule for asking people to try leavetaking (this is the alllow leavetaking rule): persuasion succeeds.

Carry out someone trying leavetaking (this is the convert npc leavetaking to player leavetaking rule):
  try saying goodbye to the person asked.

Report saying goodbye to someone when the farewell type is explicit (this is the default saying goodbye rule):
   say "You say goodbye to [the noun]."

This is the say goodbye when moving rule:
	if the current interlocutor is a person enclosed by the location begin;
		now the farewell type is implicit;
		try saying goodbye to the current interlocutor;
   end if.


The say goodbye when moving rule is listed first in the carry out going rules.

[
Before going from somewhere when the current interlocutor is a person in the location (this is the say goodbye when moving rule):
  change the farewell type to implicit;
  try saying goodbye to the current interlocutor.  

The say goodbye when moving rule is listed first in the before rules.
]

Chapter 3 - Reset protocol each turn

Every turn (this is the reset protocol rule):
  now the farewell type is explicit;
  now the greeting type is explicit.

Book 4 - Yes, No and Sorry

saying yes is implicit-conversing.
saying no is implicit-conversing.
saying sorry is implicit-conversing.

Before asking someone to try saying yes (this is the greet before saying yes rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying yes instead.

Before asking someone to try saying no (this is the greet before saying no rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying no instead.

Before asking someone to try saying sorry (this is the greet before saying sorry rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying sorry instead.

Before answering someone that "yes" (this is the change answering yes to saying yes rule):
  try saying yes instead.

Before answering someone that "no" (this is the change answering no to saying no rule):
  try saying no instead.

Before answering someone that "sorry" (this is the change answering sorry to saying sorry rule):
  try asking the noun to try saying sorry instead.

Understand "tell [someone] [text]" as answering it that. Understand "tell [someone] that [text]" as answering it that.

Book 5 - Limiting what can be spoken about

Check quizzing someone about something unknown (this is the block asking about something unknown rule):
  abide by the block asking rule.

Check informing someone about something unknown (this is the block telling about something unknown rule):
  abide by the block telling rule.

To say make (obj - a thing) known/familiar:
  now obj is familiar.

Book 6 - Functions

Chapter 0 - Setting Up

When play begins:
	say "Hey there! If you’re reading this, odds are I’m asking you for a job. Maybe I gave it to you in the hopes that you’d find me creative, skilled, or even just plain funny. This is interactive fiction, a genre that lies somewhere between a choose-your-own-story and a point-and-click adventure. This ride is only supposed to last about 5 minutes, so let’s get right to it!"

Chapter 3 - Region Function

[ When play begins, change the right hand status line to "[map region of the location]". Include Basic Help Menu by Emily Short.


Include Basic Help Menu by Emily Short.


]

Chapter 4 - Variables

HasCompass is a number that varies.HasCompass is usually 0.
TouchedBefore is a number that varies. TouchedBefore is usually 0.

[Book worlds: 1 = Sci-fi; 2 = Film Noir; 3 = Westrern; 4 = Absurdist; 5 = C'thulu; 6 = Epic Poem]
BookWorld is a number that varies. BookWorld is usually 0.

[Emnotions: 0 = meditation; 1 = rage; 2 = apathy; 3 = irritation; 4 = sadness; 5 = serenity; 6 = fear]
EngineState is a number that varies. EngineState is usually 0.

Section 1 - Numbers

Section 2 - People

The old man is a man. He is in the Nexus of Personality.

The bookworm is a man. He is in the Reading Room.

The summoner is a woman. She is in the Altar to Skatan.

The meditator is a man. He is in the Boiler Room.

The interviewee is a man.

Section 3 - Objects

[  Room of New Beginnings ]
interview notes are a thing. The description of interview notes is "'Giovanni Prinzivalli’, the name reads. Says here he studied both Sociology and Computer Science at Cal Poly. Wants to be a game designer. The game attached with his cover letter was kind of weird.”. They are on the conference table.

The index card is a thing. It is on the conference table. The description of the index card is “Sorry in advance about the mess! Listen, these things just happen sometimes. If you’re new here, you might want to try [italic type]look[roman type]ing around, [italic type]going [roman type]in certain directions, or [italic type]examining [roman type]things. You can also [italic type]take [roman type]whatever you think you can carry and [italic type]place [roman type]it elsewhere. It’s still a bit messy here, so if you help tidy anything up, I’d be pretty grateful.
[paragraph break]
 -G”.

The conference table is a fixed in place supporter. It is in the Room of New Beginnings. The description of the conference table is “Wow, this table is really sturdy! And so white! You make a mental note to yourself to try and find one of these for the office when you get back.”.

The compass is a thing. It is on the table.  The description of the compass is “Well, it’s a compass. Nothing fantastic about it. You have no idea if it really points north, but it’s consistent enough to navigate by.”.

The white chair is a fixed in place thing in the Room of New Beginnings. It is undescribed. The description of the white chair is “The chair is pretty comfortable but otherwise ordinary. It’s also as white as the walls… and everything else in this room.”.

[ Room of Old Beginnings ]
The white sign is a closed locked container.  It is in the Room of Old Beginnings.  The description of the white sign is "You barely make out the words 'Touch me!' on the sign.".

The red key unlocks the red door. It is in the white sign.  The description of the red key is “It’s a key and it’s red. Pretty basic stuff, really.” 

[ Nexus of Personality ]

Gears are a fixed in place undescribed thing. The description of gears is “The gears lining the room appear to be well-worn, but the teeth are still sharp and moving in time. Even if you could reach them, you get the sense touching them is a bad idea.".

The maze is a fixed in place undescribed thing. The description of the maze is “A vast complex of walls and doors unfold below you in every direction, seemingly limitless. Something tells you that if you got lost down there, you’d never find your way back out.”.

The platform is a fixed in place undescribed thing. The description of the platform is “The platform seems sturdy enough, suspended high above the maze. At its center appears to be an old man in another white chair much like the one you were sitting.”.

The nexus bridge is a fixed in place undescribed thing. The description of the nexus bridge is “Four stone bridges bloom out from the central platform, all identical, carved from polished stone. They’re wide enough to cross without worrying about falling off the sides, which is pretty convenient for you.”.

The nexus chair is a fixed in place undescribed thing. The description of the nexus chair is  "The chair is quite white. It looks almost exactly like the one you were sitting in not a moment before. Maybe they’re part of a set? [if the old man is in the Nexus of Personality]An old man is its current occupant.[end if]”. 

[Boiler Room]

[Small Alcove]

[Scaffolding]

[ Reading Room ]
A reading desk is a kind of thing. It is scenery. There are 16 reading desks in the Reading Room.

A bookshelf is a kind of thing. It is scenery. There are 4 bookshelves in the Reading Room.




Chapter 5 - Verbs

[ Understand "read [any interview notes]" as examining. ]

Chapter 6 - Verb Replacement 

Book 7 - The World

Chapter 1 - Rooms and Regions

Section 1 - Entry Hall

The Room of New Beginnings is a room. "[if not visited][italic type]Well this should be an interesting interview, [roman type]you think to yourself as you look up from your notes on the sturdy white conference table and out into the vast expanse of smooth white walls and bright white lights and a vaulted white ceiling.
[paragraph break]
*Blink*
[paragraph break]
What, what? You don’t remember ever entering this room. One moment you were staring at the notes on the normally-tinted conference table of your normally-colored office, getting ready to interview a potential employee. The next, well… Weird. You pick yourself up out of the comfortable white chair. You should probably gather your notes, and look for an exit.
[otherwise if HasCompass is 0]
The room is large, and L-shaped. Around the corner is the other half of the room.
[otherwise]
The room is large, and L-shaped. To the east is the other half of the room.
[end if]". The player is here.

The Room of Old Beginnings is east of the Room of New Beginnings. "[if not visited]The first thing you notice as you turn the corner is something distinctly not-white. It is so not-white, in fact, you can say with 100% certainty it is red. Everything else is still not-red. As you approach the door, you notice a white sign hiding on the wall, its letters a slight off-white. 
[otherwise] 
The eastern portion of the room is just as large and white as its counterpart.
[end if]"

The Entry Hall is a region. The Room of New Beginnings and the Room of Old Beginnings are in the Entry Hall.

Section 2 - Nexus

The Nexus of Personality is a room. "[if not visited]The sight that greets you is impressive. Cogs and gears taller than you and half as wide line the walls and spin in time with the thrum of some unseen engine. Normal color seems to have returned to the world, although the door behind you remains an obstinate red. You stand on a raised platform. A labyrinthine network of corridors serpent out below. A small, sturdy bridge extends out toward the center of the room, to another platform. You can make out a figure in a chair, and decide to proceed forward. Maybe he or she can tell you what’s going on.
[otherwise] 
Gears and cogs line the vast walls of the nexus, and a maze sprawls below you. In the center platform of the room, there is an old man sitting in a white chair. There are doors across bridges north, south, east, and west of the platform. The door to the north is remarkably red.
[end if]"

Section 3 - Emotion Engine

The Boiler Room is a room. "[if not visited]Pipes line the walls and steam can be seen coming from various cracks and crevices. You’ve entered the boiler room, apparently. Halfway into the room, you notice a figure meditating, or is he just sleeping? To his left, a panel labelled 'Furnace Controls' can be seen. Behind him is a large pit with a bridge spanning it. [italic type]How cliche, [roman type]you think. You can’t make out what’s on the other side without crossing. 
[otherwise]
Pipes and steam make up the Emotion Engine’s walls. To the left, you can see a panel labeled 'Furnace Controls.'
[end if]"

The Scaffolding is a room."[if not visited]Wow, this scaffolding is sturdier than it looks. The only thing of note up here is the ventilation unit adjacent to you. Behind you, the ladder goes back down to ground level.
[otherwise]
The scaffolding is unimpressed by your presence. It is unimpressed by most things. It's inanimate. Nearby is the ventilation unit. Behind you is a ladder.
[end if]"

The Engine Alcove is a room. "The back half of the room mirrors the first. There is no ladder, but to your right there is a panel that says 'Ventilation Controls.' From here, you can see that there are vents above the pit. [if the vents are open]They are open [else]They are closed[end if]. Behind you, the bridge extends back to the front of the room."

The Emotion Engine is a region. The Boiler Room, Scaffolding, and Boiler Room Aft are in the Emotion Engine.

Section 4 - Library

The Reading Room is a room. "[if not visited] Towering bookshelves dominate the area, neatly arranged and tiered, with ladders allowing intrepid readers to reach new heights. To the south, a particularly imposing wall of books can be seen. The room is completely silent, save the occasionall turning of a page. A familiar-looking willowy young man is engrossed at one of the reading desks nearby.
[otherwise if BookWorld is 0]
The reading room is flanked by tiered bookshelves and vaulted windows high above. Desks line the area, and a particularly large bookshelf can be seen to the south.
[otherwise if BookWorld is 1]

[otherwise if BookWorld is 2]

[otherwise if BookWorld is 3]

[otherwise if BookWorld is 4]

[otherwise if BookWorld is 5]

[otherwise if BookWorld is 6]

[otherwise if BookWorld is 7]


[end if][if the bookworm is in the Reading Room] The young man is completely unaware of his surroundings, engrossed in his book.[end if]"

The Wall of Books is south of the Reading Room. "[if not visited]
The largest of all the bookshelves in the library looms before you.
[otherwise]

[end if]"

The Second Floor is above the Wall of Books.

The Office is a room.

The Library is a region. The Reading Room, Wall of Books, Second Floor, and Office are in the Library.

Section 5 - Arena

The Altar to Skatan is a room.

Chapter 2 - Doors

The red door is a door. It is locked. It is south of the Room of Old Beginnings and north of the Nexus of Personality. The description of the red door is "[if the location is Room of Old Beginnings] This door sticks out like a sore thumb being the only thing in the room that isn't pure white. [else]The door remains an obstinate red, even from this side.[end if]".

instead of opening locked red door:
	if player has red key:
		say "Putting two and two together, you decide to use the red key on the red door. To the surprise of nobody, the key fits and the lock turns smoothly.";
		now the red door is unlocked;
		try opening the red door;
	otherwise:
		say "The door is locked. And red. There must be a key somewhere around here.".

The steel ladder is an closed unopenable door. The steel ladder is up of the Boiler Room and down of the Scaffolding. The initial appearance of the steel ladder is "A steel ladder [if the location is Scaffolding]goes down to the Boiler Room[else if the steel ladder is closed]leads to some Scaffolding, but is retracted[else]leads to some Scaffolding[end if].". The description of the steel ladder is "The ladder is retractable and made of steel. It leads up to some scaffolding above the ventilation unit."

The big bridge is an open unopenable door. The big bridge is west of the Engine Alcove and east of the Boiler Room. The initial appearance of the big bridge is "[if the big bridge is open]A big bridge leads west to the rest of the Boiler Room[else]The bridge is engulfed by flames and is unpassable[end if].". The description of the big bridge is "A precarious bridge bisects the room. At least this one has handrails, unlike the stone bridges you crossed earlier. [if big bridge is closed]There's no way you can pass it with the furnace on![end if]"

The east door is a closed door. The east door is east of the Nexus of Personality and west of the Boiler Room. The description of the east door is “As you move closer to examine the door, your heartbeat – wait, is it yours? – grows louder. Next to the door, the noise is deafening. You can make out the words 'EMOTION ENGINE’ on the door. What a peculiar name.”.

The west door is a closed door. The west door is west of the Nexus of Personality and east of the Reading Room. The description of the west door is “Approaching the door to the west, you catch a scent. It is slightly musty with hints of old vanilla. Books. Lots of books lie beyond this door. Lettering on the door reads 'LIBRARY'. Of course this place has its own library. Why wouldn't it?”.

The south door is a closed door. The south door is south of the Nexus of Personality and north of the Altar to Skatan. The description of the south door is “What a strange door. It appears to be covered in buttons like a game controller as well as a substance you instantly recognize as goat's blood. [italic type]Some stories are better left untold, [roman type]you suppose. Just for kicks, you press a few buttons…
[paragraph break]
Up Up Down Down Left Right Left Right B A Start…
[paragraph break]
Off in the distance, you hear a chime.".

The second floor door is a closed locked door. The second floor door is north of the Second Floor and south of the Office.

The fire escape is a closed unopenable undescribed door. The fire escape is up from the Reading Room and down from the office.

The vents are a closed unopenable undescribed door. They are above of the Scaffolding.

Book 9 - Events and Scripting

Chapter 0 - PORTALS, MOTHERFUCKER

Chapter 1 - Entry Hall

Instead of touching the sign:
	if TouchedBefore is 0:
		Now TouchedBefore is 1;
		say "'Hey, easy! Not so rough there, pal. I’m sensitive, you know?'
		[paragraph break]
		Holy cow! The sign talks! You pinch yourself and – [italic type]ow [roman type]– remember that you can’t wake up from pinching yourself.
		[paragraph break]
		'Cute. Listen, pal, the guy who runs this place needs your help with a problem. He’s kind of fallen to pieces, literally. Could you do me a favor and put him back together? Don’t worry, you won’t be performing surgery or anything – just gather him up and bring him back here. You look like you’re pretty sharp, so you’ll be fine.'
		[paragraph break]
		You stare at the sign, not quite over the fact that it’s talking to you.
		[paragraph break]
		'Oh, and before I forget, you’re gonna need this. Here.'
		[paragraph break]
		The sign flips open, revealing a hidden in a recess in the otherwise unblemished white wall. Inside the recess is a red key.";
		Now the white sign is open;
	otherwise:
		say "The sign says nothing, but you hear an irritated grumble.".

Chapter 2 - Nexus

instead of touching gears:
	say "Those gears look dangerous! Maybe you shouldn't touch them after all...".


Chapter 3 - Emotion Engine

[ Furnace to ladder scripting goes here. ]


Chapter 4 - Altar to Skatan


Chapter 5 - The Library


Chapter 6 - In Closing












