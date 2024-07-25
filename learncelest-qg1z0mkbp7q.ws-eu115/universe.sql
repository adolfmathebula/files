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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    circum numeric(15,2),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    circum numeric(15,2),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    circum numeric(15,2),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    circum numeric(15,2),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: visited; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.visited (
    visited_id integer NOT NULL,
    by_who character varying(30) NOT NULL,
    visited_when date NOT NULL,
    name character varying(30)
);


ALTER TABLE public.visited OWNER TO freecodecamp;

--
-- Name: visited_visited_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.visited_visited_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visited_visited_id_seq OWNER TO freecodecamp;

--
-- Name: visited_visited_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.visited_visited_id_seq OWNED BY public.visited.visited_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: visited visited_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visited ALTER COLUMN visited_id SET DEFAULT nextval('public.visited_visited_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 13600, NULL, 13.50, 'The Milky Way is a barred spiral galaxy containing our solar system. It is approximately 13.6 billion years old and is known to support life.', true, false);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 10000, NULL, 13.50, 'The Andromeda Galaxy is a spiral galaxy located near the Milky Way. It is the closest large galaxy to the Milky Way and is approximately 10 billion years old.', false, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 13000, NULL, 13.50, 'The Sombrero Galaxy is a spiral galaxy known for its bright nucleus and prominent dust lane. It is approximately 13 billion years old and is classified as a spiral galaxy with a significant bulge.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 10000, NULL, 10.00, 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years away in the constellation Triangulum. It is part of the Local Group of galaxies and is about 10 billion years old.', false, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 9000, NULL, 11.00, 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy located in the constellation Canes Venatici. It is approximately 9 billion years old.', false, true);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 12000, NULL, 12.50, 'The Pinwheel Galaxy is a face-on spiral galaxy located 21 million light-years away in the constellation Ursa Major. It is approximately 12 billion years old.', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 4500, NULL, 3122.00, 'Europa is one of Jupiters largest moons and is known for its smooth ice-covered surface, which may cover an ocean of liquid water beneath. It is approximately 4.5 billion years old.', false, true, 1);
INSERT INTO public.moon VALUES (2, 'Titan', 4500, NULL, 5150.00, 'Titan is Saturns largest moon and is known for its thick atmosphere and liquid methane lakes on its surface. It is approximately 4.5 billion years old.', false, true, 2);
INSERT INTO public.moon VALUES (3, 'Phobos', 200, NULL, 224.00, 'Phobos is one of Mars two small moons and is characterized by its irregular shape and rapidly decreasing orbit. It is estimated to be about 200 million years old.', false, false, 3);
INSERT INTO public.moon VALUES (7, 'Eufropa', 4500, NULL, 3122.00, 'Eufropa is one of Jupiters largest moons and is known for its smooth ice-covered surface, which may cover an ocean of liquid water beneath. It is approximately 4.5 billion years old.', false, true, 1);
INSERT INTO public.moon VALUES (8, 'Titafn', 4500, NULL, 5150.00, 'Titan is Saturns largest moon and is known for its thick atmosphere and liquid methane lakes on its surface. It is approximately 4.5 billion years old.', false, true, 2);
INSERT INTO public.moon VALUES (9, 'Phfobos', 200, NULL, 224.00, 'Phobos is one of Mars two small moons and is characterized by its irregular shape and rapidly decreasing orbit. It is estimated to be about 200 million years old.', false, false, 3);
INSERT INTO public.moon VALUES (10, 'Ganfymede', 4500, NULL, 5262.00, 'Ganymede is the largest moon of Jupiter and the largest moon in the solar system. It is approximately 4.5 billion years old.', false, true, 1);
INSERT INTO public.moon VALUES (11, 'Callifsto', 4500, NULL, 4821.00, 'Callisto is a large moon of Jupiter with a heavily cratered surface. It is approximately 4.5 billion years old.', false, true, 1);
INSERT INTO public.moon VALUES (12, 'Io', 4500, NULL, 3643.00, 'Io is the most volcanically active moon in the solar system, orbiting Jupiter. It is approximately 4.5 billion years old.', false, true, 1);
INSERT INTO public.moon VALUES (13, 'Encfeladus', 4500, NULL, 1574.00, 'Enceladus is a small icy moon of Saturn, known for its geysers that spew water ice into space. It is approximately 4.5 billion years old.', false, true, 2);
INSERT INTO public.moon VALUES (14, 'Diofne', 4500, NULL, 1123.00, 'Dione is a moon of Saturn with a heavily cratered surface and bright wispy terrain. It is approximately 4.5 billion years old.', false, true, 2);
INSERT INTO public.moon VALUES (15, 'Tethfys', 4500, NULL, 1060.00, 'Tethys is a moon of Saturn with a large rift valley called Ithaca Chasma. It is approximately 4.5 billion years old.', false, true, 2);
INSERT INTO public.moon VALUES (16, 'Rhefa', 4500, NULL, 1528.00, 'Rhea is the second-largest moon of Saturn, with a surface covered in water ice. It is approximately 4.5 billion years old.', false, true, 2);
INSERT INTO public.moon VALUES (17, 'Iapefftus', 4500, NULL, 1436.00, 'Iapetus is a moon of Saturn known for its distinctive two-tone coloration. It is approximately 4.5 billion years old.', false, true, 2);
INSERT INTO public.moon VALUES (18, 'Miranda', 4500, NULL, 471.00, 'Miranda is the smallest and innermost of Uranus five major moons, with a varied and extreme surface. It is approximately 4.5 billion years old.', false, true, 4);
INSERT INTO public.moon VALUES (19, 'Arfiel', 4500, NULL, 1158.00, 'Ariel is one of the largest moons of Uranus, known for its complex network of fault canyons. It is approximately 4.5 billion years old.', false, true, 4);
INSERT INTO public.moon VALUES (20, 'Umbfriel', 4500, NULL, 1169.00, 'Umbriel is a moon of Uranus with a dark and heavily cratered surface. It is approximately 4.5 billion years old.', false, true, 4);
INSERT INTO public.moon VALUES (21, 'Titania', 4500, NULL, 1578.00, 'Titania is the largest moon of Uranus, with a surface marked by huge fault valleys. It is approximately 4.5 billion years old.', false, true, 4);
INSERT INTO public.moon VALUES (22, 'Oberon', 4500, NULL, 1523.00, 'Oberon is the second-largest moon of Uranus, with a heavily cratered icy surface. It is approximately 4.5 billion years old.', false, true, 4);
INSERT INTO public.moon VALUES (23, 'Tritfon', 4500, NULL, 2707.00, 'Triton is the largest moon of Neptune, with a retrograde orbit and geysers thought to erupt nitrogen. It is approximately 4.5 billion years old.', false, true, 5);
INSERT INTO public.moon VALUES (24, 'Charfon', 4500, NULL, 1536.00, 'Charon is the largest moon of Pluto, half the size of Pluto itself, and is thought to have a subsurface ocean. It is approximately 4.5 billion years old.', false, true, 6);
INSERT INTO public.moon VALUES (25, 'Nerfeid', 4500, NULL, 680.00, 'Nereid is a moon of Neptune with an extremely eccentric orbit. It is approximately 4.5 billion years old.', false, true, 5);
INSERT INTO public.moon VALUES (26, 'Mimdas', 4500, NULL, 396.00, 'Mimas is a small moon of Saturn, known for the large crater Herschel on its surface. It is approximately 4.5 billion years old.', false, true, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, NULL, 40075.00, 'Earth is the third planet from the Sun and the only known celestial object to harbor life. It has a diverse climate and is approximately 4.5 billion years old.', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4600, NULL, 21287.00, 'Mars is the fourth planet from the Sun and is known for its reddish appearance due to iron oxide on its surface. It is approximately 4.6 billion years old.', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4600, NULL, 439264.00, 'Jupiter is the largest planet in the Solar System and is known for its Great Red Spot, a massive storm. It is a gas giant with an age of about 4.6 billion years.', false, true, 1);
INSERT INTO public.planet VALUES (4, 'Proxima b', 4800, NULL, 30000.00, 'Proxima b is an exoplanet orbiting the red dwarf star Proxima Centauri. It is approximately 4.8 billion years old and located within the stars habitable zone.', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Vega I', 455, NULL, 15000.00, 'Vega I is a hypothetical exoplanet orbiting the star Vega. It is a young planet with an age of about 455 million years.', false, true, 2);
INSERT INTO public.planet VALUES (6, 'Rigel I', 8, NULL, 20000.00, 'Rigel I is a theoretical planet orbiting the star Rigel. It is approximately 8 million years old.', false, true, 3);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 4850, NULL, 25000.00, 'Alpha Centauri Bb is a candidate exoplanet orbiting the star Alpha Centauri B. It is about 4.85 billion years old.', false, true, 5);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', 5500, NULL, 32000.00, 'Kepler-186f is an exoplanet orbiting the red dwarf Kepler-186. It is approximately 5.5 billion years old and located in the habitable zone of its star.', false, true, 2);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1d', 7600, NULL, 29000.00, 'TRAPPIST-1d is one of seven Earth-sized planets orbiting the ultra-cool dwarf star TRAPPIST-1. It is approximately 7.6 billion years old.', false, true, 3);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 8000, NULL, 31000.00, 'Gliese 581g is an exoplanet orbiting the red dwarf star Gliese 581. It is located in the habitable zone and is approximately 8 billion years old.', false, true, 3);
INSERT INTO public.planet VALUES (11, '55 Cancri e', 8200, NULL, 45000.00, '55 Cancri e is an exoplanet orbiting the star 55 Cancri A. It is a super-Earth with an age of about 8.2 billion years.', false, true, 3);
INSERT INTO public.planet VALUES (12, 'Tau Ceti f', 7000, NULL, 42000.00, 'Tau Ceti f is an exoplanet orbiting the star Tau Ceti. It is approximately 7 billion years old.', false, true, 2);
INSERT INTO public.planet VALUES (13, 'Luyten b', 8500, NULL, 28000.00, 'Luyten b is an exoplanet orbiting the red dwarf star Luytens Star. It is approximately 8.5 billion years old and located in the habitable zone.', false, true, 2);
INSERT INTO public.planet VALUES (14, 'Wolf 1061c', 9200, NULL, 35000.00, 'Wolf 1061c is an exoplanet orbiting the star Wolf 1061. It is approximately 9.2 billion years old and potentially habitable.', false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, NULL, 1.40, 'The Sun is the star at the center of our solar system. It is a G-type main-sequence star (G dwarf) and is approximately 4.6 billion years old.', false, true, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 150, NULL, 1.20, 'Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system with an age of about 120-150 million years.', false, true, 3);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10, NULL, 1.20, 'Betelgeuse is a red supergiant star in the constellation Orion. It is one of the largest stars known and is estimated to be around 10 million years old.', false, true, 4);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4850, NULL, 0.15, 'Proxima Centauri is a red dwarf star located in the Alpha Centauri star system. It is the closest known star to the Sun and is approximately 4.85 billion years old.', false, true, 5);
INSERT INTO public.star VALUES (5, 'Vega', 455, NULL, 2.40, 'Vega is the brightest star in the constellation Lyra and the fifth-brightest star in the night sky. It is about 455 million years old.', false, true, 6);
INSERT INTO public.star VALUES (6, 'Rigel', 8, NULL, 2.10, 'Rigel is a blue supergiant star in the constellation Orion. It is one of the brightest stars in the night sky and is approximately 8 million years old.', false, true, 7);


--
-- Data for Name: visited; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.visited VALUES (1, 'earth', '1990-02-01', 'jupiter');
INSERT INTO public.visited VALUES (2, 'earth', '1990-02-03', 'jupiter');
INSERT INTO public.visited VALUES (3, 'earth', '1990-02-04', 'jupiter');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: visited_visited_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.visited_visited_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: visited visited_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visited
    ADD CONSTRAINT visited_pkey PRIMARY KEY (visited_id);


--
-- Name: visited visited_visited_when_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.visited
    ADD CONSTRAINT visited_visited_when_key UNIQUE (visited_when);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

