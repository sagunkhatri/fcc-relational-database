--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guess integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    user_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (166, 58, 416);
INSERT INTO public.games VALUES (167, 59, 680);
INSERT INTO public.games VALUES (168, 59, 23);
INSERT INTO public.games VALUES (169, 58, 673);
INSERT INTO public.games VALUES (170, 58, 681);
INSERT INTO public.games VALUES (171, 58, 980);
INSERT INTO public.games VALUES (172, 60, 757);
INSERT INTO public.games VALUES (173, 61, 200);
INSERT INTO public.games VALUES (174, 61, 650);
INSERT INTO public.games VALUES (175, 60, 390);
INSERT INTO public.games VALUES (176, 60, 133);
INSERT INTO public.games VALUES (177, 60, 541);
INSERT INTO public.games VALUES (178, 62, 384);
INSERT INTO public.games VALUES (179, 63, 792);
INSERT INTO public.games VALUES (180, 63, 391);
INSERT INTO public.games VALUES (181, 62, 526);
INSERT INTO public.games VALUES (182, 62, 643);
INSERT INTO public.games VALUES (183, 62, 344);
INSERT INTO public.games VALUES (184, 64, 538);
INSERT INTO public.games VALUES (185, 64, 141);
INSERT INTO public.games VALUES (186, 65, 59);
INSERT INTO public.games VALUES (187, 65, 737);
INSERT INTO public.games VALUES (188, 64, 777);
INSERT INTO public.games VALUES (189, 64, 64);
INSERT INTO public.games VALUES (190, 64, 350);
INSERT INTO public.games VALUES (191, 66, 640);
INSERT INTO public.games VALUES (192, 66, 718);
INSERT INTO public.games VALUES (193, 67, 864);
INSERT INTO public.games VALUES (194, 67, 915);
INSERT INTO public.games VALUES (195, 66, 233);
INSERT INTO public.games VALUES (196, 66, 525);
INSERT INTO public.games VALUES (197, 66, 114);
INSERT INTO public.games VALUES (198, 68, 236);
INSERT INTO public.games VALUES (199, 68, 54);
INSERT INTO public.games VALUES (200, 69, 270);
INSERT INTO public.games VALUES (201, 69, 576);
INSERT INTO public.games VALUES (202, 68, 44);
INSERT INTO public.games VALUES (203, 68, 908);
INSERT INTO public.games VALUES (204, 68, 185);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1684260895197', 58);
INSERT INTO public.users VALUES ('user_1684260895196', 59);
INSERT INTO public.users VALUES ('user_1684260935604', 60);
INSERT INTO public.users VALUES ('user_1684260935603', 61);
INSERT INTO public.users VALUES ('user_1684260959482', 62);
INSERT INTO public.users VALUES ('user_1684260959481', 63);
INSERT INTO public.users VALUES ('user_1684260975153', 64);
INSERT INTO public.users VALUES ('user_1684260975152', 65);
INSERT INTO public.users VALUES ('user_1684260997442', 66);
INSERT INTO public.users VALUES ('user_1684260997441', 67);
INSERT INTO public.users VALUES ('user_1684261017969', 68);
INSERT INTO public.users VALUES ('user_1684261017968', 69);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 204, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 69, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


