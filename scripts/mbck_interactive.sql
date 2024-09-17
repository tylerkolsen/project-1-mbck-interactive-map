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
236	title 236	reward 236	prereq 236	picture 236	desc 236
285	title 285	reward 285	prereq 285	picture 285	desc 285
321	title 321	reward 321	prereq 321	picture 321	desc 321
333	title 333	reward 333	prereq 333	picture 333	desc 333
432	title 432	reward 432	prereq 432	picture 432	desc 432
434	title 434	reward 434	prereq 434	picture 434	desc 434
435	title 435	reward 435	prereq 435	picture 435	desc 435
437	title 437	reward 437	prereq 437	picture 437	desc 437
463	Bombs in the Sky	Life Heart	20 Bombs, Dragon Form	picture 463	Fly up to the top left of the Village of Aeria to find a spell chest above the Nurse's location. Use the 20 Bombs on the chest to unlock it.
544	title 544	reward 544	prereq 544	picture 544	desc 544
589	Cut Through the Darkness	Life Heart	Golden Sword	picture 589	After obtaining the Golden Sword, go left from the Fast Travel point and take the portal. Continue onward until you reach a split between left and right; go left and cut through the dark matter. You'll eventually drop into a room with a cyclops and two gem enemies. Defeating the cyclops will spawn the chest.
597	title 597	reward 597	prereq 597	picture 597	desc 597
627	False Ceiling Saunter	Boomerang Truffle	Frog Form	picture 627	On the far left of the Volcano will be a circular section with a save point in the top left. Go from the save point and drop downwards, which will place you on a crumbling path. Move to the right until you come to the end and jump upwards. There will be a false ceiling that reveals a room with a slingshot. Use the slingshot to go up to the door where the truffle is located.
650	Mad Dash Through the Flames	Music Sheet	Snake Form, Lion Form, Lion Talisman	picture 650	You'll need to fist complete some progression in the Volcano before you can reach this music sheet. Starting from the main room with the professor, go into the right room that is in view of the fire serpent. This will lead you into a series of chambers that will require the Lion Form Charge. After 3 rooms you'll find yourself in a small room with a fire geyser; ride the fire geyser upwards, double jump and upwards dash in order to reach the next area. To the left will be another time challenge room that requires both Lion Form Charge and Snake Form movement. At the very end of this room, after the ceiling has fully collapsed, move to the right and jump upwards until you discover the false wall. This will have a snake hole that you can enter, which leads to a series of puzzles requiring Snake Form. At the end is the music sheet.
664	title 664	reward 664	prereq 664	picture 664	desc 664
668	title 668	reward 668	prereq 668	picture 668	desc 668
696	title 696	reward 696	prereq 696	picture 696	desc 696
732	title 732	reward 732	prereq 732	picture 732	desc 732
743	title 743	reward 743	prereq 743	picture 743	desc 743
746	title 746	reward 746	prereq 746	picture 746	desc 746
749	title 749	reward 749	prereq 749	picture 749	desc 749
753	title 753	reward 753	prereq 753	picture 753	desc 753
756	title 756	reward 756	prereq 756	picture 756	desc 756
804	title 804	reward 804	prereq 804	picture 804	desc 804
840	title 840	reward 840	prereq 840	picture 840	desc 840
845	Skyward Discovery	Fire Truffle	Lion Form, Lion Talisman	picture 845	You'll find the door to this truffle in the large room that eventually fills halfway with lava. On the top portion of this room is a section meant for the lion to dash. After completing the first portion, you'll come across a section that spawns a flaming enemy. Look toward the roof, and you'll see a section of breakable stones that you can clear using the lion's upward dash. Clear these rocks to find the secret door that leads to the truffle.
849	Sweeping Mines in the Volcano	Life Heart	Ice Boots, Pig Form, Lion Form, Lion Talisman	picture 849	Starting in the main room with the professor, head right to find a lava geyser. Stand on top of it with the Ice Boots to reach a new section. This room has many destructible blocks that have hidden mines within them. Use Pig Form's Sniffer ability to detect the mines, and break through with Lion Form's Charge. Make sure to check for mines often to avoid dying to them. At the end of the mine maze is the chest.
1054	Your Friendly Neighborhood Fireball	Music Sheet	Ice Sword with two upgrades, Snake Form	picture 1054	Starting in the main room with the professor, head through the bottom right exit. Continue until you reach the room with changing lava levels. Stand on the plaform in the center of the room to reach the door within the walled off area. Inside of the door will be a single fire enemy and the music sheet. First increase the size of the fire enemy through the fire sword or fireball attacks, and then freeze it when it's near the right wall. Use Snake Form to jump through the small tunnel to reach the music sheet
1112	title 1112	reward 1112	prereq 1112	picture 1112	desc 1112
1159	title 1159	reward 1159	prereq 1159	picture 1159	desc 1159
1162	title 1162	reward 1162	prereq 1162	picture 1162	desc 1162
1255	title 1255	reward 1255	prereq 1255	picture 1255	desc 1255
1356	title 1356	reward 1356	prereq 1356	picture 1356	desc 1356
1362	Bomb Block Blockade	Music Sheet	None	picture 1362	Travel two rooms to the left of the Fast Travel point. You'll see some blocks with the bomb symbol on them, along with a bomb thrower enemy. Get close enough to the enemy to have them begin throwing bombs, which should clear out the bottom right corner and reveal the music sheet.
1366	Boomerang to Victory above the Waterfall	Life Heart	4 Boomerangs 	picture 1366	Using the Fast Travel point as reference, go right one screen to the top of the waterfall. Continue heading right and pass through the false wall. This will reveal a spell chest, which requires 4 uses of Boomerang to open.
1675	Ice Stairway to Heaven	Tornado Truffle	Ice Sword, Form that can use equipment	picture 1675	After you receive the Ice Sword from the professor, you'll come across a waterfall. Instead of only crossing the waterfall using the Ice Sword, instead climb upwards by building a stairway. The room above the waterfall contains the truffle.
1771	title 1771	reward 1771	prereq 1771	picture 1771	desc 1771
1781	title 1781	reward 1781	prereq 1781	picture 1781	desc 1781
1870	title 1870	reward 1870	prereq 1870	picture 1870	desc 1870
1969	title 1969	reward 1969	prereq 1969	picture 1969	desc 1969
1974	Turning Tiles for the Bomb Truffle	Bomb Truffle	Snake Form, Frog Form	picture 1974	After the sphinx will be four pathways. Take the upper right pathway to enter the section where you can rotate the floors using the Frog Form's tongue. Turn the room around until you can reach the room above. Head into the center of the room so that you can rotate the walls to place the door right-side up. Once you've entered the door, continue to the right to find the truffle.
2076	title 2076	reward 2076	prereq 2076	picture 2076	desc 2076
2127	title 2127	reward 2127	prereq 2127	picture 2127	desc 2127
2174	title 2174	reward 2174	prereq 2174	picture 2174	desc 2174
2187	title 2187	reward 2187	prereq 2187	picture 2187	desc 2187
2194	title 2194	reward 2194	prereq 2194	picture 2194	desc 2194
2227	Bouncing the Guard	Life Heart	Morning Star with the first upgrade, Cloud Boots	picture 2227	When you reach the outside section of the castle with wind currents, ride the first section to the lower right corner. Unequip the Cloud Boots to reach the lever. Flipping the lever will cause the currents to connect to a door in the bottom left. Enter the door to find the chest behind a gate requiring a cog. Attack the floor with the morningstar to bounce the guard upward toward you. After a few bounces you can defeat the guard, who drops a cog. Use the cog to open the gate and access the chest.
2269	Breaking Down the Walls	Life Heart	Lion Form	picture 2269	After defeating the boss of the Lost Temples, you'll proceed through a long horizontal corridor. Keep moving forward until you find a section in the background with two doors. Transition to the background using the a spring, and then enter either door. Charge either wall to break through to the lower portion of the room which contains the chest.
2283	Bat Cleanup after the Giant Boulder	Thunder Truffle	None	picture 2283	After surviving being chased by the Giant Boulder, head back to the long horizontal room with spikes continually going up and down. In the center of the hallway is a barred door. Defeating the three bats in the room will open the door, allowing you to collect the Thunder Truffle.
2372	title 2372	reward 2372	prereq 2372	picture 2372	desc 2372
2374	title 2374	reward 2374	prereq 2374	picture 2374	desc 2374
2375	Rumble in the Temple	Music Sheet	None	picture 2375	After defeating the boss of the Lost Temples, you'll come across a large horizontal corridor. The first portion of this corridor outside will have a group of enemies, including dragonflies and bomb throwers. Defeat them all to spawn a spring that will launch you to the background. Go to the right to collect the music sheet.
2376	title 2376	reward 2376	prereq 2376	picture 2376	desc 2376
2384	title 2384	reward 2384	prereq 2384	picture 2384	desc 2384
2491	title 2491	reward 2491	prereq 2491	picture 2491	desc 2491
2494	Ground Pound Jump to Glory	Thunder Truffle	Pig Form	picture 2494	After meeting with Foximus' wife Ginger, you'll be introduced to a giant tree. If you climb one tile above, you'll notice an opening to your left. Leave to the next tile to find a bat hovering in place. Ground pound the bat to gain extra jump distance. You'll need to land on the door to the left, which is above the magic shop.
2498	title 2498	reward 2498	prereq 2498	picture 2498	desc 2498
2509	title 2509	reward 2509	prereq 2509	picture 2509	desc 2509
2539	title 2539	reward 2539	prereq 2539	picture 2539	desc 2539
2541	title 2541	reward 2541	prereq 2541	picture 2541	desc 2541
2563	title 2563	reward 2563	prereq 2563	picture 2563	desc 2563
2591	title 2591	reward 2591	prereq 2591	picture 2591	desc 2591
2609	title 2609	reward 2609	prereq 2609	picture 2609	desc 2609
2613	The Paired Pillars Problem	Fire Truffle	Pig Form, Frog Form	picture 2613	Entering the room to the left will greet you with two pillars and a slingshot in between them. Use the slingshot to reach the top of the right pillar, and then ground pound with the pig form. Continue ground pounding until you reveal the secret door that leads to the truffle.
2625	Lupia Windmill Rooftop Escapades	Life Heart	Snake Form, 20 Fireballs or Dragon Form	picture 2625	After you obtain Snake Form you can reactivate the windmill in the Village of Lupia. This will restart the windmill, which you can use to reach the high platform to the left of the main windmill. To open the spell chest, you'll either need 20 charges of the Fireball spell, or Dragon Form.
2626	There's a Snake in My Roof	Music Sheet	Snake Form	picture 2626	You'll need to reactivate the windmill by using Snake Form. Go inside of the windmill and climb up the mechanism on the right side. Once restarted, exit to the upper portion of the windmill and jump on one of the blades. This should take you to the roof where the music sheet is located.
2631	Rooftop Sanctuary Music	Music Sheet	Lion Form, Lion Talisman or Dragon Form	picture 2631	On top of the Sanctuary in the Village of Lupia is the music sheet. You can either use the upward dash of Lion Form or flight from Dragon Form to reach it.
2638	Royal Guard Rumble	Bomb Truffle	None	picture 2638	When you first gain access to the Castle of Lupia, you'll enter a long horizontal corridor filled with royal guards. At the end of the hallway is a blocked door. You'll need to defeat all of the guards in this corridor, which will open the door. Inside the door is the truffle.
2644	title 2644	reward 2644	prereq 2644	picture 2644	desc 2644
2660	title 2660	reward 2660	prereq 2660	picture 2660	desc 2660
2665	title 2665	reward 2665	prereq 2665	picture 2665	desc 2665
2668	title 2668	reward 2668	prereq 2668	picture 2668	desc 2668
2670	title 2670	reward 2670	prereq 2670	picture 2670	desc 2670
2674	title 2674	reward 2674	prereq 2674	picture 2674	desc 2674
2705	Pepelogoo's Gift	Life Heart	None	picture 2705	After freeing Pepelogoo from his cage in the Misty Woods, he'll fly upwards. This will release a vine that you can climb up to reach a new screen with the chest.
2712	Minesweeper Madness	Life Heart	Snake Form, Lion Form, Pirate Doubloon	picture 2712	When you reach the section of Green Fields that heads upwards towards the Lost Temples, don't go upward. Instead, use Lion Form to run across the poisoned water to the left. You'll need the Pirate Doubloon to restore your charge gauge with the floating yellow pirate souls. At then end of the poisoned water you'll find a door. This door leads to a series of destructible blocks which are trapped with mines. Use Pig Form's Sniffer ability to detect where the mines are. You will eventually reach a point where the floor beneath you has no safe path downward; when this happens, look for a snake hole on the left side. This will place you at the bottom of the floor with the chest.
2716	Music Sheet in the Ancient Ruins	Music Sheet	Pig Form	picture 2716	While traveling through Green Fields, you'll eventually run into a dark cloud enemy that will launch projectiles at you. Continue to the left until you reach the end of the corridor. You'll find a section of ruins with a pillar that has two platforms. Reach the upper platform to find smoke that can be revealed using Pig Form's Sniffer ability. If you're trying to get this on your first pass through Green Fields, you'll need to ground pound the snake enemy in order to reach the platforms.
2722	title 2722	reward 2722	prereq 2722	picture 2722	desc 2722
2723	title 2723	reward 2723	prereq 2723	picture 2723	desc 2723
2732	Chickens and Roads	Music Sheet	None	picture 2732	To the right of Ollie the main path slopes upward. Look for a chicken sticking out from the shrubbery. Strike the chicken with attacks until it gives the music sheet. If you're having trouble with this, wait until you have Lion Form so that you can charge through while damaging the chicken.
2750	title 2750	reward 2750	prereq 2750	picture 2750	desc 2750
2755	title 2755	reward 2755	prereq 2755	picture 2755	desc 2755
2757	title 2757	reward 2757	prereq 2757	picture 2757	desc 2757
2759	Introduction to Magic	Fire Truffle	None	picture 2759	As part of the main story you'll run into a vine blocking your path. Your uncle then appears, spawning crabs for you to fight. Defeat the crabs, and Pepelogoo will hand over the truffle.
2760	title 2760	reward 2760	prereq 2760	picture 2760	desc 2760
2762	title 2762	reward 2762	prereq 2762	picture 2762	desc 2762
2764	title 2764	reward 2764	prereq 2764	picture 2764	desc 2764
2772	Water Run Race	Music Sheet	Lion Form	picture 2772	To the left of the big save point in Pirate Shore is a button. Ground pound the button to reveal a gold coin trail that goes to the left. Dash after the coins, eventually jumping when reaching the end of a piece of ship. Land on the island with cannonballs, and the music sheet should spawn on the wooden platform to the left.
2827	title 2827	reward 2827	prereq 2827	picture 2827	desc 2827
2864	title 2864	reward 2864	prereq 2864	picture 2864	desc 2864
2875	title 2875	reward 2875	prereq 2875	picture 2875	desc 2875
2914	title 2914	reward 2914	prereq 2914	picture 2914	desc 2914
2979	title 2979	reward 2979	prereq 2979	picture 2979	desc 2979
3382	Slingshot Through the Sewers	Bomb Truffle	Frog Form, Pig Form	picture 3382	Return down the path that you fell through after being turned into a pig by your uncle. You'll fall into water, where you can jump out to a platform that contains smoke. You can then use Pig Form's Sniffer ability to reveal the door that leads to the truffle. If you go too far down the waterway, you can get back up by using the slingshot as Frog Form, and then swim against the current.
3478	Icky Slime Music	Music Sheet	None	picture 3478	Proceed through the sewers until you reach the portion that requires following the correct path. Make sure to follow the correct path until you reach a room with two mermen and a slime spawner. Defeat the slime spawner to spawn the music sheet.
3661	Flying Through the Spiky Maze	Thunder Truffle	Dragon Form	picture 3661	When you first arrive at the falls, make your way towards the right by flying whenever the waterfalls are inactive. When you reach the end of the room, fly up to the left instead of going to the next map tile. You'll find a secret passage which leads to a new room above you. Make your way to the right. You'll need to dodge spikes and ice mosquitoes while not hitting the water current below. If you're having trouble, you can come back when you have the Dragon Talisman. The door at the end will lead to the truffle.
3784	Nose Goes for the Ghost	Life Heart	Pig Form	picture 3784	Obtaining this Life Heart involves following a ghost through the sewers. There are three locations you'll need to uncover, each hiding the ghost using smoke. Using Pig Form's Sniffer ability will reveal the ghost and cause it to move to the next location. After the third reveal, the ghost will fly to the bottom of the sewers; remove the smoke that you find to reveal the chest.
3968	Swimming with the Fishes	Boomerang Truffle	None	picture 3968	After finishing the Crystal Caves, you can enter the first portion of The Falls. Fall down to the water below, and defeat the three fish. Frog form will make this much easier. The wall to the right will open, leading to the room which contains the truffle.
4268	Melting Through with the Crimson Boots	Life Heart	Crimson Boots, Snake Form, Snake Talisman, Form that can use equipment	picture 4268	The room above should have destructible blocks attached to moss. Use Snake Form to charge through the blocks. You'll enter a room with a chest underneath a layer of ice blocks; equip the Crimson Boots and melt the ice blocks by standing on them.
4369	Timed Underwater Traversal	Life Heart	Snake Form	picture 4369	This room will have a normal save point, a slingshot on the right, and some water below. Use Snake Form's Poison Spit ability to light up the crystal, which will lower the wall with moss. Descend through the water and then rise back up in time, and then jump on the wall moss as Snake Form. Wait for the timer to run out, which will raise the wall back up and allow access to the chest
4402	title 4402	reward 4402	prereq 4402	picture 4402	desc 4402
4500	title 4500	reward 4500	prereq 4500	picture 4500	desc 4500
4609	Possession Relay	Music Sheet	Snake Form	picture 4609	From the main room in Haunted Manor, go through the second from the bottom door. Once inside, use the dimensional portal to possess the chandelier. You'll need to move it up as high as possible to connect with the small tunnel. Next, go through the dimensional portal again, reach the chandelier, and then turn to Snake Form to go through the tunnel. Possess the spiked ball and drop it to the ground to the right. Jump with the ball to overcome the lip on the right, and then continue to roll into the bottom right corner to reveal the music sheet.
4719	title 4719	reward 4719	prereq 4719	picture 4719	desc 4719
4815	title 4815	reward 4815	prereq 4815	picture 4815	desc 4815
2798	Climb the Crowded Vine	Tornado Truffle	None	picture 2798	When entering the room below this truffle, you'll see a group of mushroom enemies and a vine in the center. Climb the vine upward until you reach the room with the truffle.
2823	Below the Mosquito	Thunder Truffle	Pig Form	picture 2823	The tile above includes a mosquito that you'll need to ground pound to reach the other side. Instead of moving on, fall into the pit below. You'll find smoke on the left side of the pit, which will reveal a secret door when using Pig Form's sniffer ability.
2858	title 2858	reward 2858	prereq 2858	picture 2858	desc 2858
2868	Swimming up in the Sunken Ship	Life Heart	Depends on your stage of the game	picture 2868	You can obtain this Life Heart in the very beginning, but it can easily be picked up later as well. You'll need to sink underwater until you reach the underside of the sunken ship. At the very bottom you'll notice windows closest to you; swim upwards when you're underneath the second window from the left. You'll go through a false ceiling, which will reveal a room with the chest.
2908	One Big Happy Family	Life Heart	None	picture 2908	The way to the deeper part of the Misty Woods will be locked until you save Jill, Foximus' daughter, from King Mushroom. After saving her, the family will thank you and open the way to the next area. This includes a chest that contains the Life Heart.
2959	title 2959	reward 2959	prereq 2959	picture 2959	desc 2959
2994	title 2994	reward 2994	prereq 2994	picture 2994	desc 2994
3084	title 3084	reward 3084	prereq 3084	picture 3084	desc 3084
3148	title 3148	reward 3148	prereq 3148	picture 3148	desc 3148
3165	title 3165	reward 3165	prereq 3165	picture 3165	desc 3165
3216	Sniff the Secret Staircase	Tornado Truffle	Pig Form	picture 3216	While moving downward through the Misty Woods from Foximus' home, you'll come to a vertical section. You'll spot some smoke, which can be revealed using Pig Form's Sniffer ability. A lever will appear, which when struck will bring out a staircase that leads up to the door containing the truffle.
3327	Torch Trouble for a Boomerang Truffle	Boomerang Truffle	Pig Form	picture 3327	The room below the truffle will be a darkened room with spikes and small, moving platforms. When you first enter the room, you'll notice a door in the upper left corner that you can't reach. If you continue to the right, you'll find an unlit torch. Light it with a fire spell to reveal a platform to the left. Jump onto this platform to be brought to the door that contains the truffle.
3353	A Shocking Display of Platforming	Music Sheet	Snake Form, Lightning	picture 3353	In the Sewers there is a room where you'll need to burn the ropes from 3 crates in order to open the way forward. On the right side of the room is a snake hole. This will lead you to a platforming challenge. Use lightning on the two platforms on the left, and then quickly on the platform on the right. Turn into Snake Form to crawl on the moss, jumping across the gaps until you reach the underside of the topmost platform on the left. Wait for this platform to reset, which will allow you to reach the music sheet.
3423	title 3423	reward 3423	prereq 3423	picture 3423	desc 3423
3476	title 3476	reward 3476	prereq 3476	picture 3476	desc 3476
3581	title 3581	reward 3581	prereq 3581	picture 3581	desc 3581
3656	Soaring Through the Spikes	Life Heart	20 Lightning uses, Dragon Form	picture 3656	Once you enter the Falls, fly upwards as if going to the Deadwood Graveyard. Once you reach the end of the room, don't proceed to the right and instead fly up and to the left. There is a secret passage that leads upwards. Flying to the left will have a maze of thorns that you'll need to navigate carefully; fall into the running water and you'll be sent back to the start. At the end of the maze is a door that leads to a spell chest. Use 20 charges of Lightning to open the chest.
3704	Deep Underwater Maze	Music Sheet	None	picture 3704	At reaching the very bottom of the underwater section, head right. When you are presented with two choices, take the upper path. As soon as you can go downward, go to the bottom and then take the lower left path.
3757	title 3757	reward 3757	prereq 3757	picture 3757	desc 3757
3865	title 3865	reward 3865	prereq 3865	picture 3865	desc 3865
3963	Hot-Footing it Through the Ice Maze	Tornado Truffle	Crimson Boots, Form that can use Equipment	picture 3963	Above the truffle is a vertical room that has multiple paths blocked by ice. Use the Crimson Boots to melt the ice blocks, taking care not to fall too far. At the bottom, on the right side, will be the door that contains the truffle.
4159	title 4159	reward 4159	prereq 4159	picture 4159	desc 4159
4260	Lighting the Way to the Boomerang Truffle	Boomerang Truffle	Snake Form	picture 4260	As you work your way through the crystal caves, you'll encounter a room that is pitch black. There are four crystals to light using the Snake Form's Poison Spit ability. The first crystal is the middle of the room on a platform, the second is by the entrance, the third is on the right, and the last one is on the ceiling. Once all four have activated, the door leading to the truffle will appear.
4282	The Graves Mark the Way	Tornado Truffle	None	picture 4282	Deadwood Graveyard consists of one long horizontal stretch, which will have a barred door in the middle. You'll need to locate two gravestones on the path and break them. Once both are broken, the door will open and the truffle will be inside.
4355	title 4355	reward 4355	prereq 4355	picture 4355	desc 4355
4394	title 4394	reward 4394	prereq 4394	picture 4394	desc 4394
4398	title 4398	reward 4398	prereq 4398	picture 4398	desc 4398
4484	title 4484	reward 4484	prereq 4484	picture 4484	desc 4484
4499	title 4499	reward 4499	prereq 4499	picture 4499	desc 4499
4572	Sliding Through the False Wall	Music Sheet	None	picture 4572	The room with this music sheet contains a slide with icy slopes. When you reach the second icy slope that leads to the right, jump at the very end to move through the false wall and reach the music sheet.
4600	Piano Pickle	Music Sheet	None	picture 4600	The left side of Haunted Manor has a large room filled with floating books and books on pedestals. You'll need to use the dimensional portal in order to interact with the pedestals. Once you've interacted with the 4 pedestals in the room, you'll need to go through a dimensional portal again and rush to the bottom left exit. Possess the piano to enter inside, and hit the far right lever to begin the song. Make sure to hit each hammer in the piano when it corresponds to the symbol on the music scroll. Once you finish the song the door to the music sheet will open. If you're having issues with reaching the piano in time, you can wait until you have the Dragon Talisman, which will allow you to turn a nearby statue to the right into a dimensional portal.
4704	title 4704	reward 4704	prereq 4704	picture 4704	desc 4704
4716	title 4716	reward 4716	prereq 4716	picture 4716	desc 4716
4811	Quick Shuffle Through the Parlor	Life Heart	Dragon Form, Dragon Talisman	picture 4811	In the main room of the Haunted Manor, fly up to the attic. There you'll find a statue that will turn into a dimensional portal when you use Dragon Form's Flamethrower attack. Once through the portal, quickly go to the bottom floor and possess the statue on the left. Move it out of the way to reveal a door that leads to the chest.
4812	title 4812	reward 4812	prereq 4812	picture 4812	desc 4812
2783	title 2783	reward 2783	prereq 2783	picture 2783	desc 2783
2845	Secret of the Drawbridge	Music Sheet	None	picture 2845	In the Castle of Lupia region, the first room you'll enter is a long horizontal corridor with many royal guards. Traverse all the way to the right. Fall down the area where the drawbridge would be if down to find an area that contains the music sheet. If the drawbridge is down, you'll need to raise it again to reach this music sheet by using the lever on the right side of the area.
2865	title 2865	reward 2865	prereq 2865	picture 2865	desc 2865
2903	title 2903	reward 2903	prereq 2903	picture 2903	desc 2903
2930	Hidden Water Tunnel Current	Music Sheet	Frog Form	picture 2930	Near the beginning of Green Fields on the right side, you'll find a small pond in front of a sunflower enemy. Drop into the water and sink down to find an underwater passage. Move right to find a secret area under the bridge. There is a coin chest here, but at the bottom you'll find a slingshot and a water current blocking the music sheet. Use Frog Form to traverse past the current to get the music sheet.
2983	title 2983	reward 2983	prereq 2983	picture 2983	desc 2983
3051	title 3051	reward 3051	prereq 3051	picture 3051	desc 3051
3144	title 3144	reward 3144	prereq 3144	picture 3144	desc 3144
3395	title 3395	reward 3395	prereq 3395	picture 3395	desc 3395
3575	Secret Door with the Green Key	Fire Truffle	Pig Form	picture 3575	You can discover this door by using the pig's special sniffer ability. The key is found in a chest below, which then also brings you back to the door's location. Go through the locked door to find the truffle.
3679	title 3679	reward 3679	prereq 3679	picture 3679	desc 3679
3856	Though the Heavy Winds Blow	Fire Truffle	Heavy Boots, Snake Form, Any form that can use equipment	picture 3856	In the vertical room below, use Snake Form to climb to the ceiling. Continue upward until you reach the next room above. Jump on the lone platform, which will begin to rise as soon as you touch it. Plants will try to blow you off the platform; equip the heavy boots to ignore the wind until you reach the top. Once you're past the plants, unequip the boots and jump to reach the door that leads to the truffle.
4059	title 4059	reward 4059	prereq 4059	picture 4059	desc 4059
4279	title 4279	reward 4279	prereq 4279	picture 4279	desc 4279
4386	title 4386	reward 4386	prereq 4386	picture 4386	desc 4386
4405	title 4405	reward 4405	prereq 4405	picture 4405	desc 4405
4501	title 4501	reward 4501	prereq 4501	picture 4501	desc 4501
4610	title 4610	reward 4610	prereq 4610	picture 4610	desc 4610
4807	Using the Floating Table as a Floor	Bomb Truffle	None	picture 4807	After entering the Haunted Mansion, head left and go into the hole in the floor. You'll enter a long horizontal corridor with a dimensional portal. Use the portal to possess the table within the hallway, and float the table to just under the doorway to the left. This will allow you to enter the door, which contains the truffle.
4817	title 4817	reward 4817	prereq 4817	picture 4817	desc 4817
2812	title 2812	reward 2812	prereq 2812	picture 2812	desc 2812
2862	title 2862	reward 2862	prereq 2862	picture 2862	desc 2862
2874	Underwater Bombs for the Bomb Truffle	Bomb Truffle	Pig Form	picture 2874	Once you reach Pirate Shore, you'll enter a large open area. Head to the left until you encounter blocks that you can charge through in Lion Form. Don't break through the blocks, instead sink downward after finding them. You'll see a cracked wall to the left underwater, which can be broken open by using bombs with Pig Form. The room through the open wall will contain the truffle.
2911	Your First Boomerang	Boomerang Truffle	Pig Form	picture 2911	On your initial visit to the Misty Woods, you'll enter a room where Pepelogoo is trapped, along with mushrooms trapped within cages. If you explore to the left, you'll notice smoke towards the left side of the tree trunk. Using Pig Forms Sniffer ability to reveal the door that leads to the truffle.
2978	Slithering Against the Current	Music Sheet	Snake Form	picture 2978	As part of your adventures in Pirate Shore, you'll need to find ingredients for Delicious Pork Stew. Obtaining the turnip will require going underwater in the second section of water from the left. Conveniently, this area also contains the music sheet that you're after. After diving underwater, you'll come across a region with tiny tunnels, moss, and water currents. You'll need to use snake form to traverse this area, making sure to keep track of your oxygen as you can't transform while in these tiny tunnels. Follow the first current, and then head downward to hit the lever. Head back up and take the current again, which will now direct you to the left. Hit the next lever you find, grab an air bubble and then head downward to strike another lever. Ascend back to the beginning and go through the current again, which should now be directed to the bottom right with the music sheet.
3035	The Corked Well	Life Heart	Pig Form, Frog Form	picture 3035	This is a secret with multiple parts and intricate inner workings. You can complete this once you have Frog Form. There is an excellent guide that has already written on how to complete this series: https://www.neoseeker.com/monster-boy-and-the-cursed-kingdom/walkthrough/The_Corked_Well
3086	title 3086	reward 3086	prereq 3086	picture 3086	desc 3086
3151	title 3151	reward 3151	prereq 3151	picture 3151	desc 3151
3180	title 3180	reward 3180	prereq 3180	picture 3180	desc 3180
3290	title 3290	reward 3290	prereq 3290	picture 3290	desc 3290
3332	Big Venom's Music Hoard	Music Sheet	Snake Form	picture 3332	After defeating Big Venom, use your new Snake Form to enter the tunnels the boss utilized. Crawl through the snake hole on the lower left, making sure to time the upper platform being aligned to the right-side hole. Ride the platform to the other side and enter that snake hole to find the music sheet.
3426	title 3426	reward 3426	prereq 3426	picture 3426	desc 3426
3653	title 3653	reward 3653	prereq 3653	picture 3653	desc 3653
3756	title 3756	reward 3756	prereq 3756	picture 3756	desc 3756
3960	title 3960	reward 3960	prereq 3960	picture 3960	desc 3960
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

