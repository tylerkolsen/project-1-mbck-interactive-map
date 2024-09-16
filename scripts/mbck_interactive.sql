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
463	title 463	reward 463	prereq 463	picture 463	desc 463
544	title 544	reward 544	prereq 544	picture 544	desc 544
589	title 589	reward 589	prereq 589	picture 589	desc 589
597	title 597	reward 597	prereq 597	picture 597	desc 597
627	False Ceiling Saunter	Boomerang Truffle	Frog Form	picture 627	On the far left of the Volcano will be a circular section with a save point in the top left. Go from the save point and drop downwards, which will place you on a crumbling path. Move to the right until you come to the end and jump upwards. There will be a false ceiling that reveals a room with a slingshot. Use the slingshot to go up to the door where the truffle is located.
650	title 650	reward 650	prereq 650	picture 650	desc 650
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
849	title 849	reward 849	prereq 849	picture 849	desc 849
1054	title 1054	reward 1054	prereq 1054	picture 1054	desc 1054
1112	title 1112	reward 1112	prereq 1112	picture 1112	desc 1112
1159	title 1159	reward 1159	prereq 1159	picture 1159	desc 1159
1162	title 1162	reward 1162	prereq 1162	picture 1162	desc 1162
1255	title 1255	reward 1255	prereq 1255	picture 1255	desc 1255
1356	title 1356	reward 1356	prereq 1356	picture 1356	desc 1356
1362	title 1362	reward 1362	prereq 1362	picture 1362	desc 1362
1366	title 1366	reward 1366	prereq 1366	picture 1366	desc 1366
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
2227	title 2227	reward 2227	prereq 2227	picture 2227	desc 2227
2269	title 2269	reward 2269	prereq 2269	picture 2269	desc 2269
2283	Bat Cleanup after the Giant Boulder	Thunder Truffle	None	picture 2283	After surviving being chased by the Giant Boulder, head back to the long horizontal room with spikes continually going up and down. In the center of the hallway is a barred door. Defeating the three bats in the room will open the door, allowing you to collect the Thunder Truffle.
2372	title 2372	reward 2372	prereq 2372	picture 2372	desc 2372
2374	title 2374	reward 2374	prereq 2374	picture 2374	desc 2374
2375	title 2375	reward 2375	prereq 2375	picture 2375	desc 2375
2376	title 2376	reward 2376	prereq 2376	picture 2376	desc 2376
2384	title 2384	reward 2384	prereq 2384	picture 2384	desc 2384
2491	title 2491	reward 2491	prereq 2491	picture 2491	desc 2491
2494	Ground Pound Jump to Glory	Thunder Truffle	Pig Form	picture 2494	After meeting with Foximus' wife, you'll be introduced to a giant tree. If you climb one tile above, you'll notice an opening to your left. Leave to the next tile to find a bat hovering in place. Ground pound the bat to gain extra jump distance. You'll need to land on the door to the left, which is above the magic shop.
2498	title 2498	reward 2498	prereq 2498	picture 2498	desc 2498
2509	title 2509	reward 2509	prereq 2509	picture 2509	desc 2509
2539	title 2539	reward 2539	prereq 2539	picture 2539	desc 2539
2541	title 2541	reward 2541	prereq 2541	picture 2541	desc 2541
2563	title 2563	reward 2563	prereq 2563	picture 2563	desc 2563
2591	title 2591	reward 2591	prereq 2591	picture 2591	desc 2591
2609	title 2609	reward 2609	prereq 2609	picture 2609	desc 2609
2613	The Paired Pillars Problem	Fire Truffle	Pig Form, Frog Form	picture 2613	Entering the room to the left will greet you with two pillars and a slingshot in between them. Use the slingshot to reach the top of the right pillar, and then ground pound with the pig form. Continue ground pounding until you reveal the secret door that leads to the truffle.
2625	title 2625	reward 2625	prereq 2625	picture 2625	desc 2625
2626	title 2626	reward 2626	prereq 2626	picture 2626	desc 2626
2631	title 2631	reward 2631	prereq 2631	picture 2631	desc 2631
2638	Royal Guard Rumble	Bomb Truffle	None	picture 2638	When you first gain access to the Castle of Lupia, you'll enter a long horizontal corridor filled with royal guards. At the end of the hallway is a blocked door. You'll need to defeat all of the guards in this corridor, which will open the door. Inside the door is the truffle.
2644	title 2644	reward 2644	prereq 2644	picture 2644	desc 2644
2660	title 2660	reward 2660	prereq 2660	picture 2660	desc 2660
2665	title 2665	reward 2665	prereq 2665	picture 2665	desc 2665
2668	title 2668	reward 2668	prereq 2668	picture 2668	desc 2668
2670	title 2670	reward 2670	prereq 2670	picture 2670	desc 2670
2674	title 2674	reward 2674	prereq 2674	picture 2674	desc 2674
2705	title 2705	reward 2705	prereq 2705	picture 2705	desc 2705
2712	title 2712	reward 2712	prereq 2712	picture 2712	desc 2712
2716	title 2716	reward 2716	prereq 2716	picture 2716	desc 2716
2722	title 2722	reward 2722	prereq 2722	picture 2722	desc 2722
2723	title 2723	reward 2723	prereq 2723	picture 2723	desc 2723
2732	title 2732	reward 2732	prereq 2732	picture 2732	desc 2732
2750	title 2750	reward 2750	prereq 2750	picture 2750	desc 2750
2755	title 2755	reward 2755	prereq 2755	picture 2755	desc 2755
2757	title 2757	reward 2757	prereq 2757	picture 2757	desc 2757
2759	Introduction to Magic	Fire Truffle	None	picture 2759	As part of the main story you'll run into a vine blocking your path. Your uncle then appears, spawning crabs for you to fight. Defeat the crabs, and Pepelogoo will hand over the truffle.
2760	title 2760	reward 2760	prereq 2760	picture 2760	desc 2760
2762	title 2762	reward 2762	prereq 2762	picture 2762	desc 2762
2764	title 2764	reward 2764	prereq 2764	picture 2764	desc 2764
2772	title 2772	reward 2772	prereq 2772	picture 2772	desc 2772
2827	title 2827	reward 2827	prereq 2827	picture 2827	desc 2827
2864	title 2864	reward 2864	prereq 2864	picture 2864	desc 2864
2875	title 2875	reward 2875	prereq 2875	picture 2875	desc 2875
2914	title 2914	reward 2914	prereq 2914	picture 2914	desc 2914
2979	title 2979	reward 2979	prereq 2979	picture 2979	desc 2979
3382	Slingshot Through the Sewers	Bomb Truffle	Frog Form, Pig Form	picture 3382	Return down the path that you fell through after being turned into a pig by your uncle. You'll fall into water, where you can jump out to a platform that contains smoke. You can then use Pig Form's Sniffer ability to reveal the door that leads to the truffle. If you go too far down the waterway, you can get back up by using the slingshot as Frog Form, and then swim against the current.
3478	title 3478	reward 3478	prereq 3478	picture 3478	desc 3478
3661	Flying Through the Spiky Maze	Thunder Truffle	Dragon Form	picture 3661	When you first arrive at the falls, make your way towards the right by flying whenever the waterfalls are inactive. When you reach the end of the room, fly up to the left instead of going to the next map tile. You'll find a secret passage which leads to a new room above you. Make your way to the right. You'll need to dodge spikes and ice mosquitoes while not hitting the water current below. If you're having trouble, you can come back when you have the Dragon Talisman. The door at the end will lead to the truffle.
3784	title 3784	reward 3784	prereq 3784	picture 3784	desc 3784
3968	Swimming with the Fishes	Boomerang Truffle	None	picture 3968	After finishing the Crystal Caves, you can enter the first portion of The Falls. Fall down to the water below, and defeat the three fish. Frog form will make this much easier. The wall to the right will open, leading to the room which contains the truffle.
4268	title 4268	reward 4268	prereq 4268	picture 4268	desc 4268
4369	title 4369	reward 4369	prereq 4369	picture 4369	desc 4369
4402	title 4402	reward 4402	prereq 4402	picture 4402	desc 4402
4500	title 4500	reward 4500	prereq 4500	picture 4500	desc 4500
4609	title 4609	reward 4609	prereq 4609	picture 4609	desc 4609
4719	title 4719	reward 4719	prereq 4719	picture 4719	desc 4719
4815	title 4815	reward 4815	prereq 4815	picture 4815	desc 4815
2798	Climb the Crowded Vine	Tornado Truffle	None	picture 2798	When entering the room below this truffle, you'll see a group of mushroom enemies and a vine in the center. Climb the vine upward until you reach the room with the truffle.
2823	Below the Mosquito	Thunder Truffle	Pig Form	picture 2823	The tile above includes a mosquito that you'll need to ground pound to reach the other side. Instead of moving on, fall into the pit below. You'll find smoke on the left side of the pit, which will reveal a secret door when using Pig Form's sniffer ability.
2858	title 2858	reward 2858	prereq 2858	picture 2858	desc 2858
2868	title 2868	reward 2868	prereq 2868	picture 2868	desc 2868
2908	title 2908	reward 2908	prereq 2908	picture 2908	desc 2908
2959	title 2959	reward 2959	prereq 2959	picture 2959	desc 2959
2994	title 2994	reward 2994	prereq 2994	picture 2994	desc 2994
3084	title 3084	reward 3084	prereq 3084	picture 3084	desc 3084
3148	title 3148	reward 3148	prereq 3148	picture 3148	desc 3148
3165	title 3165	reward 3165	prereq 3165	picture 3165	desc 3165
3216	Sniff the Secret Staircase	Tornado Truffle	Pig Form	picture 3216	While moving downward through the Misty Woods from Foximus' home, you'll come to a vertical section. You'll spot some smoke, which can be revealed using Pig Form's Sniffer ability. A lever will appear, which when struck will bring out a staircase that leads up to the door containing the truffle.
3327	Torch Trouble for a Boomerang Truffle	Boomerang Truffle	Pig Form	picture 3327	The room below the truffle will be a darkened room with spikes and small, moving platforms. When you first enter the room, you'll notice a door in the upper left corner that you can't reach. If you continue to the right, you'll find an unlit torch. Light it with a fire spell to reveal a platform to the left. Jump onto this platform to be brought to the door that contains the truffle.
3353	title 3353	reward 3353	prereq 3353	picture 3353	desc 3353
3423	title 3423	reward 3423	prereq 3423	picture 3423	desc 3423
3476	title 3476	reward 3476	prereq 3476	picture 3476	desc 3476
3581	title 3581	reward 3581	prereq 3581	picture 3581	desc 3581
3656	title 3656	reward 3656	prereq 3656	picture 3656	desc 3656
3704	title 3704	reward 3704	prereq 3704	picture 3704	desc 3704
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
4572	title 4572	reward 4572	prereq 4572	picture 4572	desc 4572
4600	title 4600	reward 4600	prereq 4600	picture 4600	desc 4600
4704	title 4704	reward 4704	prereq 4704	picture 4704	desc 4704
4716	title 4716	reward 4716	prereq 4716	picture 4716	desc 4716
4811	title 4811	reward 4811	prereq 4811	picture 4811	desc 4811
4812	title 4812	reward 4812	prereq 4812	picture 4812	desc 4812
2783	title 2783	reward 2783	prereq 2783	picture 2783	desc 2783
2845	title 2845	reward 2845	prereq 2845	picture 2845	desc 2845
2865	title 2865	reward 2865	prereq 2865	picture 2865	desc 2865
2903	title 2903	reward 2903	prereq 2903	picture 2903	desc 2903
2930	title 2930	reward 2930	prereq 2930	picture 2930	desc 2930
2983	title 2983	reward 2983	prereq 2983	picture 2983	desc 2983
3051	title 3051	reward 3051	prereq 3051	picture 3051	desc 3051
3144	title 3144	reward 3144	prereq 3144	picture 3144	desc 3144
3395	title 3395	reward 3395	prereq 3395	picture 3395	desc 3395
3575	Secret Door with the Green Key	Fire Truffle	Pig Form	picture 3575	You can discover this door by using the pig's special sniffer ability. The key is found in a chest below, which then also brings you back to the door's location. Go through the locked door to find the truffle.
3679	title 3679	reward 3679	prereq 3679	picture 3679	desc 3679
3856	Though the Heavy Winds Blow	Fire Truffle	Heavy Boots, Snake Form, Any form that can use equipment	picture 3856	In the vertical room below, get to the top of the room and use Snake Form to climb to the ceiling. Continue onward until you reach the next room above. Jump on the lone platform, which will begin to rise as soon as you touch it. Plants will try to blow you off the platform; equip the heavy boots to ignore the wind until you reach the top. Once you're past the plants, unequip the boots and jump to reach the door that leads to the truffle.
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
2978	title 2978	reward 2978	prereq 2978	picture 2978	desc 2978
3035	title 3035	reward 3035	prereq 3035	picture 3035	desc 3035
3086	title 3086	reward 3086	prereq 3086	picture 3086	desc 3086
3151	title 3151	reward 3151	prereq 3151	picture 3151	desc 3151
3180	title 3180	reward 3180	prereq 3180	picture 3180	desc 3180
3290	title 3290	reward 3290	prereq 3290	picture 3290	desc 3290
3332	title 3332	reward 3332	prereq 3332	picture 3332	desc 3332
3426	title 3426	reward 3426	prereq 3426	picture 3426	desc 3426
3653	title 3653	reward 3653	prereq 3653	picture 3653	desc 3653
3756	title 3756	reward 3756	prereq 3756	picture 3756	desc 3756
3960	title 3960	reward 3960	prereq 3960	picture 3960	desc 3960
4164	title 4164	reward 4164	prereq 4164	picture 4164	desc 4164
4295	title 4295	reward 4295	prereq 4295	picture 4295	desc 4295
4397	title 4397	reward 4397	prereq 4397	picture 4397	desc 4397
4497	title 4497	reward 4497	prereq 4497	picture 4497	desc 4497
4613	Focus on the Telescope	Thunder Truffle	Dragon Form, Pepelogoo	picture 4613	Trying to fire Pepelogoo's beam at the bulb above entrance to this room won't work. Instead, you'll need to go back inside the manor. In the large room on the right, you'll find a telescope pointing to the right. You'll need to possess it using one of the dimensional portals. Once inside, proceed to fly into each section and reach the ceiling. There will be one lever per section for a total of two that you'll need to flip to lower the lenses into position. Once both of them are flipped, head back to the start of the telescope and aim Pepelogoo's beam through the first lense. This will allow the laser to open the door that leads to the Thunder Truffle
4810	title 4810	reward 4810	prereq 4810	picture 4810	desc 4810
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

