--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    guesses integer NOT NULL
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
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 1, 7);
INSERT INTO public.games VALUES (2, 25, 300);
INSERT INTO public.games VALUES (3, 25, 33);
INSERT INTO public.games VALUES (4, 26, 125);
INSERT INTO public.games VALUES (5, 26, 647);
INSERT INTO public.games VALUES (6, 25, 660);
INSERT INTO public.games VALUES (7, 25, 8);
INSERT INTO public.games VALUES (8, 25, 866);
INSERT INTO public.games VALUES (9, 27, 127);
INSERT INTO public.games VALUES (10, 27, 803);
INSERT INTO public.games VALUES (11, 28, 915);
INSERT INTO public.games VALUES (12, 28, 949);
INSERT INTO public.games VALUES (13, 27, 396);
INSERT INTO public.games VALUES (14, 27, 759);
INSERT INTO public.games VALUES (15, 27, 725);
INSERT INTO public.games VALUES (16, 29, 428);
INSERT INTO public.games VALUES (17, 29, 768);
INSERT INTO public.games VALUES (18, 30, 764);
INSERT INTO public.games VALUES (19, 30, 139);
INSERT INTO public.games VALUES (20, 29, 137);
INSERT INTO public.games VALUES (21, 29, 871);
INSERT INTO public.games VALUES (22, 29, 44);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'adolf');
INSERT INTO public.users VALUES (2, 'user_1723680930344');
INSERT INTO public.users VALUES (3, 'user_1723680930344');
INSERT INTO public.users VALUES (4, 'user_1723680930343');
INSERT INTO public.users VALUES (5, 'user_1723680930343');
INSERT INTO public.users VALUES (6, 'user_1723680930344');
INSERT INTO public.users VALUES (7, 'user_1723680930344');
INSERT INTO public.users VALUES (8, 'user_1723680930344');
INSERT INTO public.users VALUES (9, 'user_1723681072454');
INSERT INTO public.users VALUES (10, 'user_1723681072453');
INSERT INTO public.users VALUES (11, 'user_1723681104419');
INSERT INTO public.users VALUES (12, 'user_1723681104418');
INSERT INTO public.users VALUES (13, 'user_1723681144797');
INSERT INTO public.users VALUES (14, 'user_1723681144796');
INSERT INTO public.users VALUES (15, 'user_1723681183254');
INSERT INTO public.users VALUES (16, 'user_1723681183253');
INSERT INTO public.users VALUES (17, 'user_1723681231277');
INSERT INTO public.users VALUES (18, 'user_1723681231276');
INSERT INTO public.users VALUES (19, 'user_1723681302268');
INSERT INTO public.users VALUES (20, 'user_1723681302267');
INSERT INTO public.users VALUES (21, 'user_1723681313476');
INSERT INTO public.users VALUES (22, 'user_1723681313475');
INSERT INTO public.users VALUES (23, 'user_1723681369560');
INSERT INTO public.users VALUES (24, 'user_1723681369559');
INSERT INTO public.users VALUES (25, 'user_1723681541831');
INSERT INTO public.users VALUES (26, 'user_1723681541830');
INSERT INTO public.users VALUES (27, 'user_1723681707467');
INSERT INTO public.users VALUES (28, 'user_1723681707466');
INSERT INTO public.users VALUES (29, 'user_1723681747290');
INSERT INTO public.users VALUES (30, 'user_1723681747289');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 22, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 30, true);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

