--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: collectibles; Type: TABLE; Schema: public; Owner: tyler
--

CREATE TABLE public.collectibles (
    collectible_id integer NOT NULL,
    title character varying(255) NOT NULL,
    reward character varying(255) NOT NULL,
    prerequisites character varying(255) NOT NULL,
    picture text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.collectibles OWNER TO tyler;

--
-- Name: notes; Type: TABLE; Schema: public; Owner: tyler
--

CREATE TABLE public.notes (
    note_id integer NOT NULL,
    description text NOT NULL,
    user_id integer,
    collectible_id integer
);


ALTER TABLE public.notes OWNER TO tyler;

--
-- Name: notes_note_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler
--

CREATE SEQUENCE public.notes_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notes_note_id_seq OWNER TO tyler;

--
-- Name: notes_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler
--

ALTER SEQUENCE public.notes_note_id_seq OWNED BY public.notes.note_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tyler
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO tyler;

--
-- Name: users_collect_clicks; Type: TABLE; Schema: public; Owner: tyler
--

CREATE TABLE public.users_collect_clicks (
    users_collect_click_id integer NOT NULL,
    user_id integer,
    collectible_id integer
);


ALTER TABLE public.users_collect_clicks OWNER TO tyler;

--
-- Name: users_collect_clicks_users_collect_click_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler
--

CREATE SEQUENCE public.users_collect_clicks_users_collect_click_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_collect_clicks_users_collect_click_id_seq OWNER TO tyler;

--
-- Name: users_collect_clicks_users_collect_click_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler
--

ALTER SEQUENCE public.users_collect_clicks_users_collect_click_id_seq OWNED BY public.users_collect_clicks.users_collect_click_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tyler
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO tyler;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tyler
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: notes note_id; Type: DEFAULT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.notes ALTER COLUMN note_id SET DEFAULT nextval('public.notes_note_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_collect_clicks users_collect_click_id; Type: DEFAULT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.users_collect_clicks ALTER COLUMN users_collect_click_id SET DEFAULT nextval('public.users_collect_clicks_users_collect_click_id_seq'::regclass);


--
-- Data for Name: collectibles; Type: TABLE DATA; Schema: public; Owner: tyler
--

COPY public.collectibles (collectible_id, title, reward, prerequisites, picture, description) FROM stdin;
185	title 185	reward 185	prereq 185	picture 185	desc 185
236	Flash Freeze the Fireballs	Legendary Gem	Ice Sword	picture 236	This room will have four fireballs that shoot downward from the ceiling. Use the Ice Sword to freeze them so that you can jump up to the ledges on the right side. Alternatively, you can also use Dragon Form to reach the chest.
285	title 285	reward 285	prereq 285	picture 285	desc 285
321	Pinball Madness for a Power Gem	Power Gem	Lion Form, Lion Talisman	picture 321	In the pinball room you'll need to strike two buttons to open the way to the chest. The first is to the left. Find the path that allows you to slide down to the area with moving springs and a spiked ceiling. Carefully traverse the area until you come across the button on the right of the room. Next, you're going to head to the other side of the pinball machine, looking for an entrance with another spring and fireballs shooting upwards. Climb through the fireballs to reach the button at the top right of the room. Finally, you'll find the chest at the very top center of the pinball room.
333	Fire Serpent's Helpful Ride	Coin Chest	Ice Boots, Snake Form	picture 333	This room will have many challenges, but the chest itself is on the far left side. Continue throuhg until you find a fire serpent that flies back and forth slowly while rising upwards. Ride on the serpent using the Ice Boots until the serpent is lined up with the small gap on the right. Quickly switch to Snake Form to enter the tunnel and get the chest.
432	Ancient Secrets Lead the Way	Golden Boots Piece	Ice Boots	picture 432	In the main room of the Volcano, head upwards until you reach the very top, and then exit left. You'll find a room with four fire geysers and a chest behind a gate. You'll need to stand on each geyser with the Ice Boots, and then ground pound them into the correct placement to open the gate. The mural in the main room of the Volcano displays the positions that each geyser needs to be in, if you've progressed far enough through ringing the gongs. The order from left to right and the number of ground pounds needed is: First 2, Second 1, Third 0, and Fourth 3. The fire geysers will eventually reset their positions, so you'll need to put them all in the correct position quickly.
434	Hot-Climbing in the Volcano	Legendary Gem	Frog Form, Lion Form, Lion Talisman	picture 434	In the main room of the Volcano, head upwards. When you encounter the fire serpent, use Lion Form's Upward Charge to reach the platform. Continue upward, uisng the slingshots to reach the highest chamber in the main room. The chest will be waiting for you.
435	The Smelly Smell of a Legendary Gem	Legendary Gem	Pig Form	picture 435	After entering this hallway, you'll notice smoke in the middle of the floor. Use Pig Form's Sniffer ability to reveal the chest.
437	Pepelogoo's Hint at Treasure	Coin Chest	None	picture 437	From the Volcanos main room with the professor, move upwards as far as possible, and then take the right exit. You'll come across a trapped Pepelogoo, which you'll need to free and follow. After completing the sequence you'll come into a large, open room with many fire serpents. Immediately after entering the room, double jump to the left to find the secret entrance to the chest.
463	Bombs in the Sky	Life Heart	20 Bombs, Dragon Form	picture 463	Fly up to the top left of the Village of Aeria to find a spell chest above the Nurse's location. Use the 20 Bombs on the chest to unlock it.
544	Frozen Assets in the Volcano	Ice Boots	None	picture 544	Enter this room by standing on the breakable path above and exiting at the bottom. This vertical room will require you to use many of your traversal powers. In the initial portion, you can follow the coin trails to avoid spikes as you're falling. Afterward, make your way down defeating enemies and freezing lava where needed. After navigating the gauntlet, you'll find the chest.
589	Cut Through the Darkness	Life Heart	Golden Weapon	picture 589	After obtaining the Golden Weapon, go left from the Fast Travel point and take the portal. Continue onward until you reach a split between left and right; go left and cut through the dark matter. You'll eventually drop into a room with a cyclops and two gem enemies. Defeating the cyclops will spawn the chest.
597	Discovering the Golden Weapon	Golden Weapon Piece	None	picture 597	During natural progression in the Dark Realm, you will come across this chest after teleporting to a giant map in the background. You can interact with the map in the room to give hints as to the other locations of the Golden Weapon pieces.
627	False Ceiling Saunter	Boomerang Truffle	Frog Form	picture 627	On the far left of the Volcano will be a circular section with a save point in the top left. Go from the save point and drop downwards, which will place you on a crumbling path. Move to the right until you come to the end and jump upwards. There will be a false ceiling that reveals a room with a slingshot. Use the slingshot to go up to the door where the truffle is located.
650	Mad Dash Through the Flames	Music Sheet	Snake Form, Lion Form, Lion Talisman	picture 650	You'll need to fist complete some progression in the Volcano before you can reach this music sheet. Starting from the main room with the professor, go into the right room that is in view of the fire serpent. This will lead you into a series of chambers that will require the Lion Form Charge. After 3 rooms you'll find yourself in a small room with a fire geyser; ride the fire geyser upwards, double jump and upwards dash in order to reach the next area. To the left will be another time challenge room that requires both Lion Form Charge and Snake Form movement. At the very end of this room, after the ceiling has fully collapsed, move to the right and jump upwards until you discover the false wall. This will have a snake hole that you can enter, which leads to a series of puzzles requiring Snake Form. At the end is the music sheet.
664	On Cloud 9	Cloud Boots	None	picture 664	After falling downward from the left exit of the Village of Aeria, proceed to the left. Use the solid platforms to make your way over while avoiding the cloud enemies. At the very end will be the chest.
668	Trust Fall Exercise	Power Gem	Pig Form	picture 668	After exiting the Village of Aeria on the left, you'll notice some clouds. Fall downward to a hidden area below you. On the land below you will be some smoke. Use Pig Form's Sniffer ability to reveal the chest.
696	title 696	reward 696	prereq 696	picture 696	desc 696
732	Guiding the Boulder	Power Gem	Lion Form, Lion Talisman	picture 732	This room contains a button at the start that spawns a boulder from the upper left. You'll need to guide this boulder to the right in order to break the blocks in the way of the chest. Using Lion Form's Upward Charge, bounce each block upward to help the boulder maintain its momentum. You'll need to time the last block to push the boulder up to the path above.
743	Lava-Wrapped Treasure	Coin Chest	Ice Sword	picture 743	In the Volcano main room with the professor, head upwards until you reach two lava falls on either side of you. Use the Ice Sword to stop the flow of the left lava fall to find the chest.
746	Leaving Fire in Your Wake	Legendary Gem	Lion Form	picture 746	When you first enter the room, use Lion Form's Charge to dash to the right. Collect the souls to keep your Charge meter high. There will be a statue on the left that shoots a fireball that will also head right. You'll notice a blue chest above you once you hit the center of the room; hurry and jump into the alcove before the fireball lights the torch next to the chest, effectively closing the door. If you aren't able to make it in time, the door below the chest will take you back to the beginning of the room.
749	Enemy Arena in the Volcano	Coin Chest	Lion Form	picture 749	From the Volcano main room with the professor, head upwards until you reach the fire serpent. Exit to the right to go through a series of Lion Form charge puzzles. Once you enter the room that requires you to charge into blocks to move them, you're in the right place. Defeat all of the enemies in this long, horizontal room to have the chest appear.
753	Legendary Block Challenge	Legendary Gem	Lion Form	picture 753	Within this room you'll first need to unlock the main way foward by pushing the block onto the button in the top right. To do this, push the block on the first geyser and ground pound until you reach th bottom level. Push the block onto the second geyser, which will place the block on the top pathway. Continue pushing it to the right, making sure to freeze the lavafall when necessary. Next, go back to the start of the room and push the respawned block back to the ground floor. This time however, push the block onto the second geyser and then charge into it when it is halfway up. This will push it to the middle platforms. Use a bomb to destroy the block in your way, and then repeat this process for the third geyser. This will open up your path to the chest.
756	Decipher the Lava's Secret	Golden Armor Piece	None	picture 756	This room will begin with with a few spouts of fire dripping from the ceiling. Further in will be a group of enemies hovering in place. You need to hit specific enemies in order without touching the ground; the order can be determined from the dripping fire at the entrance of the room. The order is 1, 4, 6. You can either use ground pounds between each enemy, or use Dragon Form to fly and strike each one. If you use ground pounds, you'll need to double jump between 1 and 4, which will require Lion Form. 
804	title 804	reward 804	prereq 804	picture 804	desc 804
840	Leaping Lions	Lion Talisman	Ice Sword, Snake Form, Frog Form, Lion Form	picture 840	The room itself is straightforward, but getting to the room is the trick. You'll first need to exit the main room of the Volcano in the center left, near the fire serpent. This will involve one room with three parts, and another vertical portion. The first section will require Lion Form Charge, the second utilizes Snake Form with moss, and the third requires swinging with Frog Form. Next, you'll encounter a lavafall in the center of the room. You'll need to use various form abilities alongside the ice sword to descend to the bottom. The first part utilizes Lion Form's Charge, the second has Snake Form's Head Bash, and the third requires moving a block onto a geyser. 
845	Skyward Discovery	Fire Truffle	Lion Form, Lion Talisman	picture 845	You'll find the door to this truffle in the large room that eventually fills halfway with lava. On the top portion of this room is a section meant for the lion to dash. After completing the first portion, you'll come across a section that spawns a flaming enemy. Look toward the roof, and you'll see a section of breakable stones that you can clear using the lion's upward dash. Clear these rocks to find the secret door that leads to the truffle.
849	Sweeping Mines in the Volcano	Life Heart	Ice Boots, Pig Form, Lion Form, Lion Talisman	picture 849	Starting in the main room with the professor, head right to find a lava geyser. Stand on top of it with the Ice Boots to reach a new section. This room has many destructible blocks that have hidden mines within them. Use Pig Form's Sniffer ability to detect the mines, and break through with Lion Form's Charge. Make sure to check for mines often to avoid dying to them. At the end of the mine maze is the chest.
1054	Your Friendly Neighborhood Fireball	Music Sheet	Ice Sword with two upgrades, Snake Form	picture 1054	Starting in the main room with the professor, head through the bottom right exit. Continue until you reach the room with changing lava levels. Stand on the plaform in the center of the room to reach the door within the walled off area. Inside of the door will be a single fire enemy and the music sheet. First increase the size of the fire enemy through the fire sword or fireball attacks, and then freeze it when it's near the right wall. Use Snake Form to jump through the small tunnel to reach the music sheet
1112	title 1112	reward 1112	prereq 1112	picture 1112	desc 1112
1159	Frog's Final Form	Frog Talisman	None	picture 1159	The room itself is very simple, but getting here is the portion you'll need to solve. The room before has ceiling tiles that drop down. Take your time to notice the holes that are created when the ceiling drops, and quickly move to each one when the opportunity presents itself.
1162	The Mosquito's Treasure	Coin Chest	Pig Form, Frog Form	picture 1162	After discovering the Fast Travel point, head upwards using the slingshot. Continue onward until you come to the vertical room with many mosquitos. At the top right corner will be a patch of smoke, which can be revealed using Pig Form's Sniffer ability.
1255	Teleportation Tactics to Reach the Chest	Golden Armor Piece	Snake Form, Frog Form	picture 1255	In the Lost Temples you'll find a door on the outside that leads to the Sphinx. Instead of entering the door, climb the structure upward to find a new area. Enter the door in this area to enter a hallway with unique teleportation puzzles. Whenever glowing light blocks the exits of the room, entering the light will teleport you to the opposite side instead of exiting the room. This means that going right will take you left, going down will teleport you to the top, etc. The first room will have a couple of switches. Hit the first to activate the teleportation light, then head to the left to teleport to the right side. Hit the switch on this side to deactivate the teleporting light, which will allow you to proceed. In the next room, hit the first switch and then fall down. This will teleport you above, in which you can exit left to appear in the right section of the room. Strike the switch to deactivate the teleportation light and proceed. Once in the next room, strike the switch and jump up to access the ledge on the bottom. Proceed to the second hole on the bottom to teleport to the top to reach the enemy. You can then exit to the right. The final room will be more involved, but will follow the same rules as before. You'll first need to flip the room to turn the upside-down chest to the correct orientation, and then find your way back to the chest. Start by using Snake Form on the moss to hit the switch, then go left, teleport, then drop into the second hole on the left. Continue left, drop down and then teleport on the right, then drop down again and to the left. This should place you in the center of the room, where you can rotate the room to place the chest in the correct orientation. Backtrack the way you came to reach the hole that leads to the chest.
1356	Spring for Success	Power Gem	Pig Form, Frog Form, Frog Talisman	picture 1356	In the long horizontal corridor, continue left until you see a green spring block on a high platform. Use the ring to the left to swing up to the block, and then grab it with Frog Form's Tongue. Transport it to the left until you see the multiple tier room with bomb thrower enemies. Use the spring to get to the top where the smoke is. Use Pig Form's Sniffer ability to reveal the chest.
1362	Bomb Block Blockade	Music Sheet	None	picture 1362	Travel two rooms to the left of the Fast Travel point. You'll see some blocks with the bomb symbol on them, along with a bomb thrower enemy. Get close enough to the enemy to have them begin throwing bombs, which should clear out the bottom right corner and reveal the music sheet.
1366	Boomerang to Victory above the Waterfall	Life Heart	4 Boomerang uses 	picture 1366	Using the Fast Travel point as reference, go right one screen to the top of the waterfall. Continue heading right and pass through the false wall. This will reveal a spell chest, which requires 4 uses of Boomerang to open.
1675	Ice Stairway to Heaven	Tornado Truffle	Ice Sword, Form that can use equipment	picture 1675	After you receive the Ice Sword from the professor, you'll come across a waterfall. Instead of only crossing the waterfall using the Ice Sword, instead climb upwards by building a stairway. The room above the waterfall contains the truffle.
1771	Defeating Slimes in the Dark	Golden Boots Piece	Any Prince Equipment with Shine	picture 1771	After entering the Sphinx's mouth in the Lost Temples, Take the path to the top right. You'll find yourself in a dark room; make sure that you're prepared with equipment that has shine. Continue to the right until you find the room with a chest at the bottom. Trying to open it will trigger a group of slimes to attack you. Defeat them to unlock the chest.
1781	Pushy Pelicans	Tezca Key	None	picture 1781	When you first meet the professor and Mack, they'll remark that the door next to them is locked. After the conversation a spring will spawn above the doorway which will take you upward. You'll need to defeat the two pelican enemies to reveal the chest. These can be tricky; the priority is to make sure you don't fall out of the room, as this will reset your progress in defeating them.
1870	Princely Garb	Prince Tunic	Snake Form, Frog Form, Boots with Double Jump	picture 1870	After entering the Sphinx's mouth in the Lost Temples, take the top right path. In the first rotating room, turn the room until the springs are on the sides. Drop down to the bottom right, rotate this new room upside down, and then return using the slingshot. Now head to right exit, and use bombs to destroy the blocks you run into. Return once again to the first room, and turn it until the chest is orientated correctly. Drop downwards, and use the slingshot on the left side to propel yourself to some moss, that you can then climb on in Snake Form to reach the chest.
1969	Twisting Floor Plans for Loot	Golden Bracelet Piece	Snake Form, Frog Form	picture 1969	After solving the Sphinx's riddles, enter the inner temple and take the bottom left path. This will lead to a series of rooms that can twist around when struck with Frog Form's tongue. Rotate the first room counter-clockwise and fall downward. Defeat the two enemies you encounter to cause a green spring box to appear. Use this spring to return to the first room, and exit to the left. Reach the lever in this room to allow it to rotate as well. Return to the first room, rotate it until the slingshot is facing upwards, then use it to enter the room above. Then turn this room until you can exit to the left, which will lead to a single enemy that needs to be defeated to spawn the rotation device. Use Snake Form to reach the rotation device, and rotate until you can leave the room at the bottom left. Next, rotate this room so that you can use the slingshot on the right side, which will let you grab the green spring block from earlier. Return to the previous room with the green spring block, then turn the room so that you can use the regular spring block on the bottom. Fly up and release the green spring block in the mossy room to the right. Once it is in position, use the green spring block to bounce to the previously-inaccessible room above. Defeat the single enemy within to turn the room, and then rotate the room until you can access the chest.
1974	Turning Tiles for the Bomb Truffle	Bomb Truffle	Snake Form, Frog Form	picture 1974	After the sphinx will be four pathways. Take the upper right pathway to enter the section where you can rotate the floors using the Frog Form's tongue. Turn the room around until you can reach the room above. Head into the center of the room so that you can rotate the walls to place the door right-side up. Once you've entered the door, continue to the right to find the truffle.
2076	Revisit the Boulder Trap	Golden Weapon Piece	Frog Form	picture 2076	Head through the Sphinx's mouth in the Lost Temple, and then take the bottom right path. If you haven't survived the boulder sequence, you'll need to complete that first. Travel downward until you reach the safe zone between the boulder sequences. Fall down on the slippery slope and then jump to reach the open hallway to your right. This leads to a room utilizing platforming with Frog Form to get to the top, where the chest is located.
2127	title 2127	reward 2127	prereq 2127	picture 2127	desc 2127
2174	Princely Footwear	Prince Boots	Frog Form	picture 2174	After entering the Sphinx's mouth in the Lost Temples, go to the top left path. You'll need to navigate using Frog Form, until you eventually reach a large block in the center of the room. Ground pound it to drop it below, which will open up the path below it. Make sure to continue downward on the breakable paths until you reach the chest with the boots.
2187	Tree-Climbing Magic	Magic Refills	None	picture 2187	This chest is simple, in that it will be in the right corner once you enter the room. There are no additional puzzles involved.
2194	Hidden Treasure in the Temple	Coin Chest	Pig Form, Snake Form	picture 2194	When you first enter the Lost Temples, you'll be tasked with finding a key for the professor. After finding the key, enter the door and proceed until you come to the room where you must hit levers in a specific order. This will require Snake Form's Poison Spit. Complete this puzzle and go through the door, which will take you to a side room. Go to the smoke in the center of the room and reveal the chest using Pig Form's Sniffer ability.
2227	Bouncing the Guard	Life Heart	Morning Star with the first upgrade, Cloud Boots	picture 2227	When you reach the outside section of the castle with wind currents, ride the first section to the lower right corner. Unequip the Cloud Boots to reach the lever. Flipping the lever will cause the currents to connect to a door in the bottom left. Enter the door to find the chest behind a gate requiring a cog. Attack the floor with the morningstar to bounce the guard upward toward you. After a few bounces you can defeat the guard, who drops a cog. Use the cog to open the gate and access the chest.
2269	Breaking Down the Walls	Life Heart	Lion Form	picture 2269	After defeating the boss of the Lost Temples, you'll proceed through a long horizontal corridor. Keep moving forward until you find a section in the background with two doors. Transition to the background using the a spring, and then enter either door. Charge either wall to break through to the lower portion of the room which contains the chest.
2283	Bat Cleanup after the Giant Boulder	Thunder Truffle	None	picture 2283	After surviving being chased by the Giant Boulder, head back to the long horizontal room with spikes continually going up and down. In the center of the hallway is a barred door. Defeating the three bats in the room will open the door, allowing you to collect the Thunder Truffle.
2372	Ignore the Background Distractions	Golden Shield Piece	Dragon Form	picture 2372	In the Lost Temples, you'll need to go to the long horizontal corridor after the boss. Near the end you'll find a spring that takes you to the background. Ignore the spring and fly over the open pit to find an island in the center that contains the chest.
2374	Crouching Lion, Hidden Gem	Power Gem	Lion Form	picture 2374	After clearing the boss of Lost Temples, head to the left. After encountering a group of enemies, continue leftward until you reach some high platforms. On the left side of the high platforms will be some breakable blocks. Use Lion Form's Charge to destroy them and reveal the chest.
2375	Rumble in the Temple	Music Sheet	None	picture 2375	After defeating the boss of the Lost Temples, you'll come across a large horizontal corridor. The first portion of this corridor outside will have a group of enemies, including dragonflies and bomb throwers. Defeat them all to spawn a spring that will launch you to the background. Go to the right to collect the music sheet.
2376	Digging Down for Treasure	Coin Chest	Lion Form	picture 2376	After defeating the Lost Temples Boss, continue onward until you reach the long horizontal corridor. You'll need to charge through some pillars of blocks. Stop at the second column of blocks to see the column continue into the ground. Use the downward charge to break through and reveal the chest.
2384	Boulderdash Gem	Power Gem	None	picture 2384	After entering through the Sphinx's mouth in the Lost Temples, take the bottom right path. This will involve a boulder chasing after you. The chest with the gem won't appear until the boulder is bearing down on you. You can either clear the boulder section and then return to this spot, or you can open it, die, and then continue onward.
2491	Mosquito Rumble	Earth Aegis Shield	None	picture 2491	Once you enter the room, you will be attacked by a horde of Mosquitos. Carefully defeat all of them in order to reveal the chest. The easiest method is to use Frog Form's tongue to eat each mosquito, though you'll need to be careful of the electricly charged mosquitos. Wait until their electric aura disappears before attacking them.
2494	Ground Pound Jump to Glory	Thunder Truffle	Pig Form	picture 2494	After meeting with Foximus' wife Ginger, you'll be introduced to a giant tree. If you climb one tile above, you'll notice an opening to your left. Leave to the next tile to find a bat hovering in place. Ground pound the bat to gain extra jump distance. You'll need to land on the door to the left, which is above the magic shop.
2498	Triple Bounce Tactics	Golden Bracelet Piece	None	picture 2498	When climbing the tree to meet with Foximus, head upwards one room and then exit to the right. You'll see three bats hovering in place. Use your ground pound ability on each of the bats to travel towards the right, eventually landing on a platform with a door. Enter the door to find the chest with the bracelet piece.
2509	Freezing Great Balls of Fire	Golden Gem	Ice Sword, Snake Form	picture 2509	Go to the portion that includes the sunflower shooting fireballs to the right. You'll need to freeze a fireball right next to the small gap in order to slip through as Snake Form. If you're having trouble, Dragon Form's flight will make striking the fireball easier.
2539	title 2539	reward 2539	prereq 2539	picture 2539	desc 2539
2541	Survive the Guard's Guantlet	Golden Armor Piece	Dragon Form	picture 2541	Inside the actual Castle of Lupia, you'll find a large room with high ceilings next to the Fast Travel point. Go to the right side of the room and fly upwards to find a door. Inside the door you'll find yourself with a royal guard who will start a mini game. You'll need to either block or dodge spears that royal guards throw at you from different directions. The guard will call out directions and whether you need to block or dodge. Complete the mini-game to obtain the armor piece.
2563	Thunderstruck for a Power Gem	Power Gem	10 Lightning Uses	picture 2563	After reaching the top of the lighthouse, you can move to the right to see a platform with a spell chest. Hitting it with 10 Lightning bolts will unlock it, giving the reward.
2591	Karma for the Chameleons	Coin Chest	None	picture 2591	Within the room containing this chest will be many Chameleon enemies. Defeat all of them to cause the chest to apepar. The easiest method to defeat them is to reflect their projectiles with a shield that has physical reflect.
2609	Minesweeper Madness Power Gem	Power Gem	Snake Form, Lion Form, Pirate Doubloon	picture 2609	When you reach the section of Green Fields that heads upwards towards the Lost Temples, don't go upward. Instead, use Lion Form to run across the poisoned water to the left. You'll need the Pirate Doubloon to restore your charge gauge with the floating yellow pirate souls. At then end of the poisoned water you'll find a door. This door leads to a series of destructible blocks which are trapped with mines. Use Pig Form's Sniffer ability to detect where the mines are. Halfway down, you'll be able to detect the chest with Pig Form's Sniffer ability. Open up the left side of the shaft until you find a snake hole. Transform into Snake Form and use the hole to enter the section with the chest.
2613	The Paired Pillars Problem	Fire Truffle	Pig Form, Frog Form	picture 2613	Entering the room to the left will greet you with two pillars and a slingshot in between them. Use the slingshot to reach the top of the right pillar, and then ground pound with the pig form. Continue ground pounding until you reveal the secret door that leads to the truffle.
2625	Lupia Windmill Rooftop Escapades	Life Heart	Snake Form, 20 Fireball uses or Dragon Form	picture 2625	After you obtain Snake Form you can reactivate the windmill in the Village of Lupia. This will restart the windmill, which you can use to reach the high platform to the left of the main windmill. To open the spell chest, you'll either need 20 charges of the Fireball spell, or Dragon Form.
2626	There's a Snake in My Roof	Music Sheet	Snake Form	picture 2626	You'll need to reactivate the windmill by using Snake Form. Go inside of the windmill and climb up the mechanism on the right side. Once restarted, exit to the upper portion of the windmill and jump on one of the blades. This should take you to the roof where the music sheet is located.
2631	Rooftop Sanctuary Music	Music Sheet	Lion Form, Lion Talisman or Dragon Form	picture 2631	On top of the Sanctuary in the Village of Lupia is the music sheet. You can either use the upward dash of Lion Form or flight from Dragon Form to reach it.
2638	Royal Guard Rumble	Bomb Truffle	None	picture 2638	When you first gain access to the Castle of Lupia, you'll enter a long horizontal corridor filled with royal guards. At the end of the hallway is a blocked door. You'll need to defeat all of the guards in this corridor, which will open the door. Inside the door is the truffle.
2644	title 2644	reward 2644	prereq 2644	picture 2644	desc 2644
2660	Glittering Armor Above	Golden Armor Piece	Lion Form, Lion Talisman or Dragon Form	picture 2660	From the save point, go to the left and head upwards. There will be a hidden ceiling, with an area that holds the chest.
2665	Geometry in the Lighthouse	Golden Weapon 	Dragon Form	picture 2665	Head the lighthouse where you fought the Kraken boss and fly upwards. You'll see a laser that needs to be directed to the bulb in the room above. Start by attacking the two mirrors to direct the light to the bulb in this room, opening the upper portion of the puzzle. Hit the right mirror again, then fly up and move the statue on the left side to the right. Have it fall and then intercept the laser to reflect it further. Finally, attack the mirror in the upper right to line up the beam with the bulb. After a moment, the gate will open to allow access to the chest.
2668	Finding the Hidden Alcove Amongst the Invisible Platforms	Golden Boots Piece	Pig Form	picture 2668	In the main portion of Pirate Shore that's above water, there'll be a section of invisible platforms that require Pig Form's Sniffer ability to reveal. If you follow these platforms, you'll eventually see a wooden platform that is not invisible. If you jump above that platform, you'll find a hidden alcove inside of the wall that has the chest with the boots piece.
2670	Pirate Ship Pickle for the Pineapple	Pineapple	Pig Form, Frog Form, Frog Talisman, Lion Form	picture 2670	Starting on the ledge with the cannonballs, use Pig Form's Sniffer ability to reveal invisible platforms that you'll need to use. Next, use Frog Form's Tongue to grab a cannonball and climb up to the cannon. Load the cannon by spitting out the cannonball, and then proceed to fire by using either a fireball or the fire sword. You'll need to do this a total of three times, each time changing the aim of the cannon by using Lion Form's Charge to push it into the left, middle, or right position. You'll notice the chest in the background slide down and be bounced to a position above you. Continue to use Pig Form to reveal invisible platforms until you can reach a ring that allows you to swing to the chest.
2674	High Flying Act for Berries	Aronia Berries	Frog Form, Lion Form	picture 2674	Starting at the position of the floating platforms with a stack of wooden boxes, break enough boxes with Lion Form's Charge to get access to the floating platform to the right. Next, you'll need Frog Form's Tongue to swing between the rings and slingshots. Remeber that you'll be flung in the direction the slingshot is pointing, so look for the next element to swing on using this as a guide. You'll travel upwards and then to the right, finally launching yourself up to the chest.
2705	Pepelogoo's Gift	Life Heart	None	picture 2705	After freeing Pepelogoo from his cage in the Misty Woods, he'll fly upwards. This will release a vine that you can climb up to reach a new screen with the chest.
2712	Minesweeper Madness	Life Heart	Snake Form, Lion Form, Pirate Doubloon	picture 2712	When you reach the section of Green Fields that heads upwards towards the Lost Temples, don't go upward. Instead, use Lion Form to run across the poisoned water to the left. You'll need the Pirate Doubloon to restore your charge gauge with the floating yellow pirate souls. At then end of the poisoned water you'll find a door. This door leads to a series of destructible blocks which are trapped with mines. Use Pig Form's Sniffer ability to detect where the mines are. You will eventually reach a point where the floor beneath you has no safe path downward; when this happens, look for a snake hole on the left side. This will place you at the bottom of the floor with the chest.
2716	Music Sheet in the Ancient Ruins	Music Sheet	Pig Form	picture 2716	While traveling through Green Fields, you'll eventually run into a dark cloud enemy that will launch projectiles at you. Continue to the left until you reach the end of the corridor. You'll find a section of ruins with a pillar that has two platforms. Reach the upper platform to find smoke that can be revealed using Pig Form's Sniffer ability. If you're trying to get this on your first pass through Green Fields, you'll need to ground pound the snake enemy in order to reach the platforms.
2722	Swing Up to the Gem	Power Gem	Frog Form	picture 2722	Travel through Green Fields until you find a blue chest on top of a ruin. Use the slingshot to reach the platform and open the chest.
2723	Using the Cloud to Your Advantage	Golden Boots Piece	None	picture 2723	While traveling through Green Fields, you'll attract a cloud enemy that will drop projectiles down at you. Once it appears, lure it back to the right and have it send a projectile on the large rock stuck in the ground. This will open a hole you can drop into to find the chest.
2732	Chickens and Roads	Music Sheet	None	picture 2732	To the right of Ollie the main path slopes upward. Look for a chicken sticking out from the shrubbery. Strike the chicken with attacks until it gives the music sheet. If you're having trouble with this, wait until you have Lion Form so that you can charge through while damaging the chicken.
2750	Hidden Hole Next to Home	Golden Gem	Upgraded Ice Boots, Snake Form	picture 2750	From your character's starting home, head to the left. At the end of the water will be a snake hole. Equip the Ice Boots to create platforms on the water, and then use Snake Form to enter the hole. The chest will be inside the secret room.
2755	Water Jump to the Secret Alcove	Coin Chest	None	picture 2755	After the signpost, continue to the right until you come to a ladder. Slide down into the water and jump to the left through the false wall.
2757	Time for some Reflection	Reflection Shield	Heavy Boots	picture 2757	After obtaining the Heavy Boots, you can drop into the water outside of the equipment store and sink underwater. Make sure to keep track of your oxygen as you head toward the left. You'll need to avoid some enemies along the way until you reach the next exit to the left. Walk onto the yellow spring to launch out of the water and onto a platform next to the chest.
2759	Introduction to Magic	Fire Truffle	None	picture 2759	As part of the main story you'll run into a vine blocking your path. Your uncle then appears, spawning crabs for you to fight. Defeat the crabs, and Pepelogoo will hand over the truffle.
2760	Through the Tangled Vines	Coin Chest	Fireball Magic	picture 2760	Staying above the water, reach the lever on the highest platform using the moving platforms nearby. Hit the switch to retract the wall, and use 3 fireballs to remove the vines in your way. Going through the door will lead you to the background, which will have the chest to the right.
2762	The Magic Shop Secret	Coin Chest	Fireball Magic	picture 2762	Go to the area with the magic shop, and jump to the roof above it. Shoot a fireball to the left to make a wooden platform appear. Jump to this platform to cause the next platform to appear, which also has the chest.
2764	Tricky Breakaway Elevator	50 Coins	None	picture 2764	While traversing past the crabs, you'll notice a blue chest on a high platform. This area has plenty of breakaway portions, with one of them acting differently than the others. Stand on the breakaway platform near the chest, and it will act as an elevator upwards.
2772	Water Run Race	Music Sheet	Lion Form	picture 2772	To the left of the big save point in Pirate Shore is a button. Ground pound the button to reveal a gold coin trail that goes to the left. Dash after the coins, eventually jumping when reaching the end of a piece of ship. Land on the island with cannonballs, and the music sheet should spawn on the wooden platform to the left.
2827	Secret Water Cave Stroll	Coin Chest	None	picture 2827	When you first enter Green Fields on the left side, you'll notice a small pond in front of a sunflower enemy. Sink into the pond and move to the right, which will take you to a secret area under the bridge. The chest will be located near the bottom of the room.
2864	Underwater Jaunt	Coin Chest	None	picture 2864	Above the water, you want to look for the spot that has three vines to burn through to a door. Sink down on the right side, and then move left past some squids. You should see the chest.
2875	Twisting Currents to the Turnip	Turnip	Snake Form, Snake Talisman	picture 2875	Starting at the surface, dive down until you spot moss on the right side. Using Snake Form, enter the small tunnel. Break your way into the first current and let it sweep you away. Keep track of your oxygen, as you can't transform into Frog Form while in this maze. Move downward to the lever and strike it to change the orientation of the first shell in the current. Head back upwards and take the current again. Strike only the first lever to your right, and return to the beginning of the currents once more. Enter the current for the last time, and then use the current to the left to get to the chest.
2914	Stay Calm. It's Just Mud	Power Gem	None	picture 2914	When entering the room, you'll notice two mud patches. Stand in the mud patch on the right, and allow yourself to sink down. This will eventually take you to a new room that contains the chest.
2979	Investigate the Suspicious Underwater Platform	Golden Bracelet Piece	None	picture 2979	In the Pirate Shore, find the island with cannonballs and then sink into the water on the right side. You'll spot a covered area with a single empty platform to the bottom left. Make sure to stand on the platform with either Pig Form or Heavy Boots, and then press up to enter the secret door. This leads to the chest with the bracelet piece.
3382	Slingshot Through the Sewers	Bomb Truffle	Frog Form, Pig Form	picture 3382	Return down the path that you fell through after being turned into a pig by your uncle. You'll fall into water, where you can jump out to a platform that contains smoke. You can then use Pig Form's Sniffer ability to reveal the door that leads to the truffle. If you go too far down the waterway, you can get back up by using the slingshot as Frog Form, and then swim against the current.
3478	Icky Slime Music	Music Sheet	None	picture 3478	Proceed through the sewers until you reach the portion that requires following the correct path. Make sure to follow the correct path until you reach a room with two mermen and a slime spawner. Defeat the slime spawner to spawn the music sheet.
3661	Flying Through the Spiky Maze	Thunder Truffle	Dragon Form	picture 3661	When you first arrive at the falls, make your way towards the right by flying whenever the waterfalls are inactive. When you reach the end of the room, fly up to the left instead of going to the next map tile. You'll find a secret passage which leads to a new room above you. Make your way to the right. You'll need to dodge spikes and ice mosquitoes while not hitting the water current below. If you're having trouble, you can come back when you have the Dragon Talisman. The door at the end will lead to the truffle.
3784	Nose Goes for the Ghost	Life Heart	Pig Form	picture 3784	Obtaining this Life Heart involves following a ghost through the sewers. There are three locations you'll need to uncover, each hiding the ghost using smoke. Using Pig Form's Sniffer ability will reveal the ghost and cause it to move to the next location. After the third reveal, the ghost will fly to the bottom of the sewers; remove the smoke that you find to reveal the chest.
3968	Swimming with the Fishes	Boomerang Truffle	None	picture 3968	After finishing the Crystal Caves, you can enter the first portion of The Falls. Fall down to the water below, and defeat the three fish. Frog form will make this much easier. The wall to the right will open, leading to the room which contains the truffle.
4268	Melting Through with the Crimson Boots	Life Heart	Crimson Boots, Snake Form, Snake Talisman, Form that can use equipment	picture 4268	The room above should have destructible blocks attached to moss. Use Snake Form to charge through the blocks. You'll enter a room with a chest underneath a layer of ice blocks; equip the Crimson Boots and melt the ice blocks by standing on them.
4369	Timed Underwater Traversal	Life Heart	Snake Form	picture 4369	This room will have a normal save point, a slingshot on the right, and some water below. Use Snake Form's Poison Spit ability to light up the crystal, which will lower the wall with moss. Descend through the water and then rise back up in time, and then jump on the wall moss as Snake Form. Wait for the timer to run out, which will raise the wall back up and allow access to the chest
4402	Topsy-Turvy Arena	Coin Chest	None	picture 4402	From the main room in Haunted Manor, head to the top right exit. THe room will be disorienting due to being upside down. Defeat all of the ghosts and skeletons in the room to cause the chest to appear.
4500	Safe Cracking for the Golden Shield	Golden Shield Piece	None	picture 4500	Getting to this room will require a lot of progression through the Haunted Manor. After reaching the pinball room from the attic in the manor, head downward until you reach a small room with a save point and a safe. Use a dimensional portal to possess the safe, which will allow you to turn the dial. Turn the dial until one of the lights on the bottom of the safe becomes yellow and the safe shakes, which lets you know you've found one of the numbers. The combination for the safe is 4, 2, 6, 7, 2. There is a time limit in which to reach all of the numbers, but you have infinite tries. The shield piece will be given once the safe is opened.
4609	Possession Relay	Music Sheet	Snake Form	picture 4609	From the main room in Haunted Manor, go through the second from the bottom door. Once inside, use the dimensional portal to possess the chandelier. You'll need to move it up as high as possible to connect with the small tunnel. Next, go through the dimensional portal again, reach the chandelier, and then turn to Snake Form to go through the tunnel. Possess the spiked ball and drop it to the ground to the right. Jump with the ball to overcome the lip on the right, and then continue to roll into the bottom right corner to reveal the music sheet.
4719	title 4719	reward 4719	prereq 4719	picture 4719	desc 4719
4815	Getting That Sinking Feeling	Coin Chest	None	picture 4815	After entering Haunted Manor, head down the hole to the right. You'll eventually come to a giant pit of mud. Sink into the mud and head right until you find a dimensional portal. Use the portal to move freely, and then head down and to the right. Follow the path to the left to find the chest.
2798	Climb the Crowded Vine	Tornado Truffle	None	picture 2798	When entering the room below this truffle, you'll see a group of mushroom enemies and a vine in the center. Climb the vine upward until you reach the room with the truffle.
2823	Below the Mosquito	Thunder Truffle	Pig Form	picture 2823	The tile above includes a mosquito that you'll need to ground pound to reach the other side. Instead of moving on, fall into the pit below. You'll find smoke on the left side of the pit, which will reveal a secret door when using Pig Form's sniffer ability.
2858	Steering the Sunken Ship	Golden Shield Piece	Snake Form	picture 2858	Dive underwater, making sure you end up on the right side of the sunken ship. You'll see a steering wheel behind a one-way gate. Strike the wheel with a fireball, which will open access to the chest. Head to the bottom and transform into Snake Form to enter the small gap that leads to the chest.
2868	Swimming up in the Sunken Ship	Life Heart	Depends on your stage of the game	picture 2868	You can obtain this Life Heart in the very beginning, but it can easily be picked up later as well. You'll need to sink underwater until you reach the underside of the sunken ship. At the very bottom you'll notice windows closest to you; swim upwards when you're underneath the second window from the left. You'll go through a false ceiling, which will reveal a room with the chest.
2908	One Big Happy Family	Life Heart	None	picture 2908	The way to the deeper part of the Misty Woods will be locked until you save Jill, Foximus' daughter, from King Mushroom. After saving her, the family will thank you and open the way to the next area. This includes a chest that contains the Life Heart.
2959	Slingshot Maze in the Sewers Pt. 2 	Golden Bracelet Piece	Frog Form	picture 2959	In the Sewers, go to the vertical room with the long ladder. Climb upwards and take the exit at the top. Use the slingshot to shoot into a new room. Ignore the door and proceed down the back and forth hallways until you reach the bottom. There will be a Coin Chest here, but there is also a slingshot to the left. Use that slingshot to launch upwards to the chest with the bracelet piece.
2994	High Room Above King Mushroom	Golden Weapon Piece	Boots with Double Jump	picture 2994	Return to the boss arena for King Mushroom, and climb to the top using Lightning to flip the spiked platforms. Once there, double jump to the door and enter. You'll find a room with levers that adjust the position of platforms. The left most lever will slowly change position, while the right one will act to quickly raise up and then back down. Make sure the left position is above the spikes. Boulders will drop from the top right, and you'll need to direct them to the button at the right. It may take some practice to get the platforms in the correct positions, but once you land the boulder on the button you'll be able to access the chest.
3084	Watch for the Mines!	Power Gem	None	picture 3084	After navigate the perilous mines, you'll come across the blue chest naturally. Make sure to keep a good distance from any mines that are moving near you.
3148	title 3148	reward 3148	prereq 3148	picture 3148	desc 3148
3165	Slingshot Maze in the Sewers Pt. 1	Coin Chest	Frog Form	picture 3165	In the Sewers, go to the vertical room with the long ladder. Climb upwards and take the exit at the top. Use the slingshot to shoot into a new room. Ignore the door and proceed down the back and forth hallways until you reach the chest at the bottom.
3216	Sniff the Secret Staircase	Tornado Truffle	Pig Form	picture 3216	While moving downward through the Misty Woods from Foximus' home, you'll come to a vertical section. You'll spot some smoke, which can be revealed using Pig Form's Sniffer ability. A lever will appear, which when struck will bring out a staircase that leads up to the door containing the truffle.
3327	Torch Trouble for a Boomerang Truffle	Boomerang Truffle	Pig Form	picture 3327	The room below the truffle will be a darkened room with spikes and small, moving platforms. When you first enter the room, you'll notice a door in the upper left corner that you can't reach. If you continue to the right, you'll find an unlit torch. Light it with a fire spell to reveal a platform to the left. Jump onto this platform to be brought to the door that contains the truffle.
3353	A Shocking Display of Platforming	Music Sheet	Snake Form, Lightning	picture 3353	In the Sewers there is a room where you'll need to burn the ropes from 3 crates in order to open the way forward. On the right side of the room is a snake hole. This will lead you to a platforming challenge. Use lightning on the two platforms on the left, and then quickly on the platform on the right. Turn into Snake Form to crawl on the moss, jumping across the gaps until you reach the underside of the topmost platform on the left. Wait for this platform to reset, which will allow you to reach the music sheet.
3423	Rumble with the Spiked Slimes	Magic Refills	Pig Form	picture 3423	Traversing from Foximus' home, you'll eventually come to a large pit with smoke at the button. Using Pig Form's Sniffer ability will reveal how to defeat the armored slimes, but will also spawn a pair of them to attack. You'll first need to ground pound near the slime to flip it on its back, and then ground its exposed belly to split it into smaller slimes. Once all of the slimes have been defeated, the chest will appear. 
3476	Fight the Knight	Yellow Sewer Key	None	picture 3476	After traversing the puzzle for picking the correct path in the Sewers, you'll approach the Shield Knight mini-boss. You'll need to stike the head with fireballs to do damage, and use the springs on either side of the room to bounce over him to avoid his charge attack. The slimes in the room will drop fireball ammo, so that you can restock if you run out. Once defeated the chest will spawn.
3581	Prismatic Sewer Search	Rainbow Drop	None	picture 3581	After finding yourself in the Sewers for the first time, head to the left. In the first room with water, drop into the water and head left. You'll find a ledge at the far end with the chest.
3656	Soaring Through the Spikes	Life Heart	20 Lightning uses, Dragon Form	picture 3656	Once you enter the Falls, fly upwards as if going to the Deadwood Graveyard. Once you reach the end of the room, don't proceed to the right and instead fly up and to the left. There is a secret passage that leads upwards. Flying to the left will have a maze of thorns that you'll need to navigate carefully; fall into the running water and you'll be sent back to the start. At the end of the maze is a door that leads to a spell chest. Use 20 charges of Lightning to open the chest.
3704	Deep Underwater Maze	Music Sheet	None	picture 3704	At reaching the very bottom of the underwater section, head right. When you are presented with two choices, take the upper path. As soon as you can go downward, go to the bottom and then take the lower left path.
3757	Stock Up on Magic Ammo	Magic Refills	Crimson Boots	picture 3757	While in the room with the ice block maze, start at the beginning and melt through the first section. You'll land with the chest in view below you. Fall down the left side one level, then head right. Make sure to unequip the Crimson Boots. Hop across the alternating ice blocks until you reach the chest.
3865	title 3865	reward 3865	prereq 3865	picture 3865	desc 3865
3963	Hot-Footing it Through the Ice Maze	Tornado Truffle	Crimson Boots, Form that can use Equipment	picture 3963	Above the truffle is a vertical room that has multiple paths blocked by ice. Use the Crimson Boots to melt the ice blocks, taking care not to fall too far. At the bottom, on the right side, will be the door that contains the truffle.
4159	Snake Superior	Snake Talisman	Pig Form, Snake Form	picture 4159	When entering this room, you'll notice that there are three platforms above three buttons. Each button controls the vertical position of the platform above it. You'll need to position these properly beforehand to complete the puzzle. You'll need the right platform all the way down, while ready to go upward on the next button press. The middle platform will need to be in the center. The left plaform will need to be at the bottom. Next, climb up to the top of the middle platform, and use Pig Form's Sniffer ability to reveal a crystal on the right. Use Snake Form's Poison Spit to light it, causing the lone platform above you move to the right. This portion is on a timer, so quickly drop down, move the right platform to the top position, and then climb back up to reach the lone platform. Allow the platform to reset, and use the moss to climb over to the chest.
4260	Lighting the Way to the Boomerang Truffle	Boomerang Truffle	Snake Form	picture 4260	As you work your way through the crystal caves, you'll encounter a room that is pitch black. There are four crystals to light using the Snake Form's Poison Spit ability. The first crystal is the middle of the room on a platform, the second is by the entrance, the third is on the right, and the last one is on the ceiling. Once all four have activated, the door leading to the truffle will appear.
4282	The Graves Mark the Way	Tornado Truffle	None	picture 4282	Deadwood Graveyard consists of one long horizontal stretch, which will have a barred door in the middle. You'll need to locate two gravestones on the path and break them. Once both are broken, the door will open and the truffle will be inside.
4355	Light Up the Skeleton	Golden Shield Piece	Snake Form, Fireball Magic	picture 4355	At the beginning of the Crystal Caves, you see a crystal after traversing the initial narrow gaps in Snake Form. Hit the crystal with Snake Form's Poison Spit, which will reveal a spring on the floor. Use it to launch through the false ceiling. Enter the next room; you'll see two torches, the left one lit and the right one not. Trying to light the right torch will cause a wind to blow which extinguishes it. After the torch is extinguished, use a fireball to the left to spawn a skeleton enemy. Defeat this enemy to reveal the chest with the shield piece.
4394	Keep Your Feet On the Table	Coin Chest	Snake Form	picture 4394	Take the top left exit from the reading room in the Haunted Manor. Once inside, use the dimensional portal to possess the table. Fly to the gap at the top of the room and leave the table there. Hop onto the table, transform to Snake Form and pass through the gap to the chest.
4398	title 4398	reward 4398	prereq 4398	picture 4398	desc 4398
4484	Explosive Currents in the Falls	Golden Bracelet Piece	Frog Form	picture 4484	Starting from the Fast Travel point in the falls, head left and go underwater. There will be a false wall to the left that you can travel through. This leads to a room with two yellow springs on the left wall, two levers along the bottom, and a green spring that is moveable. The left lever will change the directions of the currents that spawn, while the right lever will release a sea mine while closing the upper section. Before beginning this puzzle, move the green spring box to the right wall directly across from the lower yellow spring. Go back to the levers and release the sea mine. Ensure the initial current direction is going left, then downward, then right. The sea mine will travel left, down and then right to the green spring box. After this, quickly switch the left/right direction to have the sea mine get pushed to the upper yellow spring. Once the sea mine hits, switch the current again to have the mine hit the upper right wall, which will clear the blocks in your way. Proceed through the open wall to reach the chest with the bracelet piece. 
4499	Reading is it's own Reward	Coin Chest	None	picture 4499	Head to the large room on the left of the Haunted Manor, which has many floating books. You'll find the chest at the top right of the room.
4572	Sliding Through the False Wall	Music Sheet	None	picture 4572	The room with this music sheet contains a slide with icy slopes. When you reach the second icy slope that leads to the right, jump at the very end to move through the false wall and reach the music sheet.
4600	Piano Pickle	Music Sheet	None	picture 4600	The left side of Haunted Manor has a large room filled with floating books and books on pedestals. You'll need to use the dimensional portal in order to interact with the pedestals. Once you've interacted with the 4 pedestals in the room, you'll need to go through a dimensional portal again and rush to the bottom left exit. Possess the piano to enter inside, and hit the far right lever to begin the song. Make sure to hit each hammer in the piano when it corresponds to the symbol on the music scroll. Once you finish the song the door to the music sheet will open. If you're having issues with reaching the piano in time, you can wait until you have the Dragon Talisman, which will allow you to turn a nearby statue to the right into a dimensional portal.
4704	title 4704	reward 4704	prereq 4704	picture 4704	desc 4704
4716	title 4716	reward 4716	prereq 4716	picture 4716	desc 4716
4811	Quick Shuffle Through the Parlor	Life Heart	Dragon Form, Dragon Talisman	picture 4811	In the main room of the Haunted Manor, fly up to the attic. There you'll find a statue that will turn into a dimensional portal when you use Dragon Form's Flamethrower attack. Once through the portal, quickly go to the bottom floor and possess the statue on the left. Move it out of the way to reveal a door that leads to the chest.
4812	Breaking into the Barricaded Basement	Golden Shield Piece	Snake Form, Pepelogoo	picture 4812	From the main room in the Haunted Manor, head into the hole to the right. Move to the right, and use Pepelogoo's laser to remove the black vine above the mud pit. Continue right until you see a block, which you'll push into the water. Go back over the mud pit to the room with two orbs. While standing in the center of the room, user Pepelogoo's laser to hit the mirror on the ceiling. This will split the beam into two allowing you to charge both orbs. This will release the gate in the water below, letting the block be brought up to you. Push the block to the left onto the button, which will open the barred gate. Head left, which will spring a trap in which ghosts will attack you. After defeating the ghosts a snake hole will appear in the bottom left. Enter it in Snake Form to find the chest with the shield piece.
2783	Sparkles of Joy	Power Gem	None	picture 2783	In the first room after exiting the Lost Temples you'll find a large vertical shaft with waterfalls and extensive springs and slingshots scattered around. Near the top of the room, underneath the first platform with a ladder, you'll find a lever. On hit, the room will spawn five sparkles that must all be touched within a time limit. This can be tricky, as the running water will force you downward and give you unwanted momentum. The yellow springs will take you back up to the top, while the blue springs are more randomized. It may take a few tries, but once you hit all five sparkles within the time limit the chest will spawn at the bottom of the room.
2845	Secret of the Drawbridge	Music Sheet	None	picture 2845	In the Castle of Lupia region, the first room you'll enter is a long horizontal corridor with many royal guards. Traverse all the way to the right. Fall down the area where the drawbridge would be if down to find an area that contains the music sheet. If the drawbridge is down, you'll need to raise it again to reach this music sheet by using the lever on the right side of the area.
2865	Caught up in the Crazy Currents	Golden Gem	Frog Form	picture 2865	The entrance to this challenge starts underwater just past the save point next to the lighthouse. Head left until you see currents and a slingshot. You'll need to carefully navigate this area, avoiding the currents while using Frog Form's tongue to reach the next section. Take your time as the safe zones are narrow. If you are caught in the current, it is possible to grab a slingshot to save some time backtracking, though this can be difficult. Eventually you'll make it to the chest at the end. 
2903	Boomerang Bust the Secret Chest	Coin Chest	Pig Form, Boomerang Magic	picture 2903	As you begin your travels through Misty Woods, you'll pass the blacksmith. Continue left until you hit an area with wood and lily pads over poisoned water. Follow the path until you come to an island, which will have smoke in the center. Use Pig Form's Sniffer ability to reveal a spell chest. Use one boomerang to unlock it for your reward.
2930	Hidden Water Tunnel Current	Music Sheet	Frog Form	picture 2930	Near the beginning of Green Fields on the right side, you'll find a small pond in front of a sunflower enemy. Drop into the water and sink down to find an underwater passage. Move right to find a secret area under the bridge. There is a coin chest here, but at the bottom you'll find a slingshot and a water current blocking the music sheet. Use Frog Form to traverse past the current to get the music sheet.
2983	The Best Place to Hide Your Ship Key	Pirate Ship Frog Form 2983	picture 2983	In the vertical hallway with currents leading upward, reach the halfway point where the next set of currents begins. Use the slingshot on the right, and then look for two more slingshots to use in order to reach the chest.
3051	title 3051	reward 3051	prereq 3051	picture 3051	desc 3051
3144	Illuminating the Sewers	Golden Weapon Piece	Any Prince Eqiupment with Shine, Bomb Magic	picture 3144	When entering the Sewers from the Village of Lupia, head left to find a block with a bomb symbol. Use a bomb to reveal the door behind. The room through the door will be pitch black, which will require careful navigating unless you have all of the Prince equipment with shine. You'll need to navigate ladders, spikes and fireballs to make it to the top of the room where the chest lies. 
3395	Go with the Flow Pt. 1	Coin Chest	None	picture 3395	After going through the underwater portion of Pirate Shore, you'll find yourself going upwards through currents. At the first junction of currents, the right side current will take you to the chest.
3575	Secret Door with the Green Key	Fire Truffle	Pig Form	picture 3575	You can discover this door by using the pig's special sniffer ability. The key is found in a chest below, which then also brings you back to the door's location. Go through the locked door to find the truffle.
3679	Green with Key Envy	Green Sewer Key	None	picture 3679	When you enter the room with the door that has a green lock, head downward. You'll notice the chest to the right. Make the jump across the gap to the chest.
3856	Though the Heavy Winds Blow	Fire Truffle	Heavy Boots, Snake Form, Any form that can use equipment	picture 3856	In the vertical room below, use Snake Form to climb to the ceiling. Continue upward until you reach the next room above. Jump on the lone platform, which will begin to rise as soon as you touch it. Plants will try to blow you off the platform; equip the heavy boots to ignore the wind until you reach the top. Once you're past the plants, unequip the boots and jump to reach the door that leads to the truffle.
4059	Horticulture Torture	Power Gem	20 Tornado uses	picture 4059	Go to the giant plant in the center, and ground pound it to be launched upward. Continue using ground pound on the rest of the plants until you reach the platform with the spell chest in the top right corner. Use 20 tornados to unlock the chest.
4279	title 4279	reward 4279	prereq 4279	picture 4279	desc 4279
4386	title 4386	reward 4386	prereq 4386	picture 4386	desc 4386
4405	Hidden Chest in Haunted Courtyard	Coin Chest	None	picture 4405	In the outside area to the right of Haunted Manor, head upwards and to the left. In the corner will be a chest slightly hidden by some trees.
4501	title 4501	reward 4501	prereq 4501	picture 4501	desc 4501
4610	title 4610	reward 4610	prereq 4610	picture 4610	desc 4610
4807	Using the Floating Table as a Floor	Bomb Truffle	None	picture 4807	After entering the Haunted Mansion, head left and go into the hole in the floor. You'll enter a long horizontal corridor with a dimensional portal. Use the portal to possess the table within the hallway, and float the table to just under the doorway to the left. This will allow you to enter the door, which contains the truffle.
4817	title 4817	reward 4817	prereq 4817	picture 4817	desc 4817
2812	Race Through the Mud	Golden Armor Piece	Pig Form, Lion Form	picture 2812	In the first room in Misty Woods, you'll see a squat tree and then a large mud pit with multiple climbable roots. Use Pig Form to remove the smoke at the top of the tree, which reveals a button. Using a ground pound on this button will start a timer and spawn the chest to the left. The timer is very strict on this, so you'll need Lion Form's Charge in order to reach the chest in time.
2862	Cats Love Water	Power Gem	Lion Form	picture 2862	Go underwater and head left past the sunken ship. You'll see the wall built with destructible blocks; use Lion Form's Charge to sweep past them. You can either continue to run past the mines, or carefully defuse them. At the end of the path will be the chest.
2874	Underwater Bombs for the Bomb Truffle	Bomb Truffle	Pig Form	picture 2874	Once you reach Pirate Shore, you'll enter a large open area. Head to the left until you encounter blocks that you can charge through in Lion Form. Don't break through the blocks, instead sink downward after finding them. You'll see a cracked wall to the left underwater, which can be broken open by using bombs with Pig Form. The room through the open wall will contain the truffle.
2911	Your First Boomerang	Boomerang Truffle	Pig Form	picture 2911	On your initial visit to the Misty Woods, you'll enter a room where Pepelogoo is trapped, along with mushrooms trapped within cages. If you explore to the left, you'll notice smoke towards the left side of the tree trunk. Using Pig Forms Sniffer ability to reveal the door that leads to the truffle.
2978	Slithering Against the Current	Music Sheet	Snake Form	picture 2978	As part of your adventures in Pirate Shore, you'll need to find ingredients for Delicious Pork Stew. Obtaining the turnip will require going underwater in the second section of water from the left. Conveniently, this area also contains the music sheet that you're after. After diving underwater, you'll come across a region with tiny tunnels, moss, and water currents. You'll need to use snake form to traverse this area, making sure to keep track of your oxygen as you can't transform while in these tiny tunnels. Follow the first current, and then head downward to hit the lever. Head back up and take the current again, which will now direct you to the left. Hit the next lever you find, grab an air bubble and then head downward to strike another lever. Ascend back to the beginning and go through the current again, which should now be directed to the bottom right with the music sheet.
3035	The Corked Well	Life Heart	Pig Form, Frog Form	picture 3035	This is a secret with multiple parts and intricate inner workings. You can complete this once you have Frog Form. There is an excellent guide that has already written on how to complete this series: https://www.neoseeker.com/monster-boy-and-the-cursed-kingdom/walkthrough/The_Corked_Well
3086	Go With the Flow Pt. 2	Coin Chest	Frog Form	picture 3086	When in the ascending portion of Pirate Shore with the currents, move upward until you see two different slingshots that you can latch onto. Use the first slingshot to land in the currents that lead to the chest.
3151	title 3151	reward 3151	prereq 3151	picture 3151	desc 3151
3180	Back the Way You Came in the Sewers	Power Gem	Frog Form,  10 Fireballs or Dragon Form	picture 3180	If you fall into the sewers from the lighthouse, you'll notice slingshots throughout the area. Use Frog Form's Tongue to fly upwards until you reach a spell chest. Use 10 fireballs to unlock the chest for your Power Gem.
3290	Thank You Crabs!	Power Gem	None	picture 3290	As you continue downward, you'll see the chest to the right of a bunch of crabs, but you won't be able to reach it yet. Keep going downward until you get underneath the crabs. You'll notice a bomb block in the ceiling that will require a mine to break. Go further down until mines start being released at you. When you see the mine on the right side, follow it back up until it destroys the obstruction. Swim up to reach the chest.
3332	Big Venom's Music Hoard	Music Sheet	Snake Form	picture 3332	After defeating Big Venom, use your new Snake Form to enter the tunnels the boss utilized. Crawl through the snake hole on the lower left, making sure to time the upper platform being aligned to the right-side hole. Ride the platform to the other side and enter that snake hole to find the music sheet.
3426	Timing the Lily Pad	Golden Boots Piece	Boomerang Magic	picture 3426	After traversing the poisoned water, you'll come across some spikes with a spider hanging above. If you stand on the lily pad here, it will slowly descend. However, there are spikes below that will be triggered eventually. Leave the lily pad as soon as you can, and then toss a boomerang to collect the boots piece from behind the wooden barrier.
3653	Deceptive Crystal Chest from Above	Coin Chest	Double Jump from Equipment, Frog Form	picture 3653	You'll come across a room that has a rope bridge that requires Snake Form to cross. There is a slingshot hidden in the center of ceiling of this room. You'll need to jump out and aim Frog Form's tongue upwards in order to connect with the slingshot.
3756	Return to the Crystal Caves	Power Gem	Lion Form	picture 3756	In the room with the moss bridge, fall down. You'll see a place with destructible blocks; use Lion Form to downward charge through them. This will open up the area with the chest.
3960	Crimson is the New Black	Crimson Boots	Snake Form	picture 3960	At the top of the room will be a drop with coins to collect. Fall down, and then shoot up the center to the top. You'll find a crystal to light with Snake Form's Poison Spit. This will melt the blocks to the lower right to melt, allowing you to proceed. Fall into the hole and proceed to the chest.
4164	Tricky Crystal Platforms	Music Sheet	Snake Form	picture 4164	In the long vertical room filled with moss-covered platforms, there will be three crystals that you can light up with Snake Form's Poison Spit. Light up all three in order to have the music sheet appear at the top of the room.
4295	title 4295	reward 4295	prereq 4295	picture 4295	desc 4295
4397	title 4397	reward 4397	prereq 4397	picture 4397	desc 4397
4497	title 4497	reward 4497	prereq 4497	picture 4497	desc 4497
4613	Focus on the Telescope	Thunder Truffle	Dragon Form, Pepelogoo	picture 4613	Trying to fire Pepelogoo's beam at the bulb above entrance to this room won't work. Instead, you'll need to go back inside the manor. In the large room on the right, you'll find a telescope pointing to the right. You'll need to possess it using one of the dimensional portals. Once inside, proceed to fly into each section and reach the ceiling. There will be one lever per section for a total of two that you'll need to flip to lower the lenses into position. Once both of them are flipped, head back to the start of the telescope and aim Pepelogoo's beam through the first lense. This will allow the laser to open the door that leads to the Thunder Truffle
4810	title 4810	reward 4810	prereq 4810	picture 4810	desc 4810
2863	Crabbing Around with Music	Music Sheet	None	picture 2863	You can obtain this music sheet at the beginning of the game if you have the Heavy Boots. Find the above water location that has multiple floating crates, and then sink into the water. Move to the right, defeating or ignoring the enemies until you reach the music sheet. It should be near a green crab.
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: tyler
--

COPY public.notes (note_id, description, user_id, collectible_id) FROM stdin;
2	Note 2979	1	2979
3	Note 4811	1	4811
4	Note 2908	2	2908
5	Note 4484	2	4484
6	Note 2911	2	2911
7	Note 2865	3	2865
8	Note 2541	3	2541
9	Note 2994	3	2994
11	You don't win no silver	5	2908
12	You only lose the gold	5	2908
15	Another Pairing for test	5	2755
16	I'm the better half!	5	2755
14	Question the Twin!	5	2626
19	What do I do?	2	4059
20	I've got a fever	2	4059
21	Panic at the disco	2	2908
23	Post Note	5	2908
24	Look at this test note! What a nice test note	5	2269
13	See the rainbow	5	2626
26	Check it out!	5	437
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tyler
--

COPY public.users (user_id, email, password) FROM stdin;
1	user0@test.com	$2a$10$Xm.rCEbqsa9nQpIAdoVt0uRJIy5OirlNaTti/7I4wcspisOffouhG
2	user1@test.com	$2a$10$Xm.rCEbqsa9nQpIAdoVt0uRJIy5OirlNaTti/7I4wcspisOffouhG
3	user2@test.com	$2a$10$Xm.rCEbqsa9nQpIAdoVt0uRJIy5OirlNaTti/7I4wcspisOffouhG
4	testAccount@test.com	$2a$10$Qh0ClRuMhhcPnkeeuzR6fuMihzrl4Z5lhu7aBdJLYlOj3D.qHjUwe
5	1	$2a$10$JRIXN6m6V1I.FH3ijlTdeOhQbkJtfMIdZ4c5DUSB96ldy0z0eZNei
\.


--
-- Data for Name: users_collect_clicks; Type: TABLE DATA; Schema: public; Owner: tyler
--

COPY public.users_collect_clicks (users_collect_click_id, user_id, collectible_id) FROM stdin;
3	1	2979
16	2	4059
17	2	2908
27	5	437
\.


--
-- Name: notes_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler
--

SELECT pg_catalog.setval('public.notes_note_id_seq', 26, true);


--
-- Name: users_collect_clicks_users_collect_click_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler
--

SELECT pg_catalog.setval('public.users_collect_clicks_users_collect_click_id_seq', 27, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tyler
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- Name: collectibles collectibles_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.collectibles
    ADD CONSTRAINT collectibles_pkey PRIMARY KEY (collectible_id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: users_collect_clicks users_collect_clicks_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.users_collect_clicks
    ADD CONSTRAINT users_collect_clicks_pkey PRIMARY KEY (users_collect_click_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: notes notes_collectible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_collectible_id_fkey FOREIGN KEY (collectible_id) REFERENCES public.collectibles(collectible_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: notes notes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users_collect_clicks users_collect_clicks_collectible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.users_collect_clicks
    ADD CONSTRAINT users_collect_clicks_collectible_id_fkey FOREIGN KEY (collectible_id) REFERENCES public.collectibles(collectible_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users_collect_clicks users_collect_clicks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tyler
--

ALTER TABLE ONLY public.users_collect_clicks
    ADD CONSTRAINT users_collect_clicks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

