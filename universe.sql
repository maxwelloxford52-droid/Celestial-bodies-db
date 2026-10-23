--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    name character varying(30) NOT NULL,
    asteroid_id integer NOT NULL,
    orbital_period integer,
    description text NOT NULL,
    diameter_km numeric,
    discovery_year integer,
    has_moon boolean,
    is_near_earth boolean
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroids.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    description text,
    has_blackholes boolean,
    number_of_spiral_arms integer NOT NULL,
    is_spiral boolean
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet numeric,
    is_spherical boolean,
    has_water boolean,
    description text,
    temperature_celsius integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    has_life boolean NOT NULL,
    temperature_celsius integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric,
    is_main_sequence boolean,
    description text,
    has_companion boolean
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
-- Name: asteroids asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES ('Vesta', 1, 1325, 'Brightest asteroid', 525.5, 1807, false, false);
INSERT INTO public.asteroids VALUES ('Pallas', 2, 1687, 'The inclined orbit', 512, 1802, false, false);
INSERT INTO public.asteroids VALUES ('Eros', 3, 643, 'Elongated strands', 16.8, 1898, false, true);
INSERT INTO public.asteroids VALUES ('Bennu', 4, 437, 'Rich in carbon', 0.49, 1999, false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 1, 13600, 'has spiral arms', true, 4, true);
INSERT INTO public.galaxy VALUES ('Milky Way', 2, 10000, 'rotating galaxy', true, 2, true);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 10000, 'star-forming regions', true, 2, true);
INSERT INTO public.galaxy VALUES ('Whirlpool', 4, 400, 'gravitional interaction', true, 2, true);
INSERT INTO public.galaxy VALUES ('Sombrero', 5, 13250, 'bright central bulge', true, 0, false);
INSERT INTO public.galaxy VALUES ('Pinwheel', 6, 10000, 'face-on spiral galaxy', true, 2, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, 384400, true, false, 'Earths satelite', -20);
INSERT INTO public.moon VALUES ('Phobos', 2, 2, 9376, false, false, 'Irregular shaped', -40);
INSERT INTO public.moon VALUES ('Deimos', 3, 2, 23463, false, false, 'Cratered surface', -40);
INSERT INTO public.moon VALUES ('Io', 4, 4, 421700, true, false, 'Most volcanic activities', -130);
INSERT INTO public.moon VALUES ('Europa', 5, 4, 671100, true, true, 'Has vast underground lake', -160);
INSERT INTO public.moon VALUES ('Ganymede', 6, 4, 1070400, true, true, 'Largest moon in the solar system', -160);
INSERT INTO public.moon VALUES ('Callisto', 7, 4, 1882700, true, true, 'It also has a vast underground ocean', -140);
INSERT INTO public.moon VALUES ('Titan', 8, 5, 1221870, true, true, 'It has methane lakes', -179);
INSERT INTO public.moon VALUES ('Enceladus', 9, 5, 237870, true, true, 'Water-rich plumos', -201);
INSERT INTO public.moon VALUES ('Mimas', 10, 5, 185539, true, true, 'It has herchel crater', -200);
INSERT INTO public.moon VALUES ('Tethys', 11, 5, 435910, true, true, 'It has heavy objects', -203);
INSERT INTO public.moon VALUES ('Dione', 12, 5, NULL, true, false, 'It has heavy crated surface', -235);
INSERT INTO public.moon VALUES ('Rhea', 13, 5, NULL, true, false, 'Icy and rocky', NULL);
INSERT INTO public.moon VALUES ('Lapetus', 14, 5, NULL, true, false, 'Bright hemispheres', NULL);
INSERT INTO public.moon VALUES ('Miranda', 15, 6, NULL, true, false, 'Uneven terrain', NULL);
INSERT INTO public.moon VALUES ('Ariel', 16, 6, NULL, true, false, 'Extensive valleys', NULL);
INSERT INTO public.moon VALUES ('Umbriel', 17, 6, NULL, true, false, 'High gas condensation', NULL);
INSERT INTO public.moon VALUES ('Titania', 18, 6, NULL, true, false, 'Heavy crated surface', NULL);
INSERT INTO public.moon VALUES ('Oberon', 19, 6, NULL, true, false, 'Bright-like system', NULL);
INSERT INTO public.moon VALUES ('Charon', 20, 8, NULL, true, false, 'The only moon on pluto', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 'Terestrial planet that supports life', true, 4540, true, 15);
INSERT INTO public.planet VALUES ('Mars', 2, 1, 'The red planet', true, 4500, false, -65);
INSERT INTO public.planet VALUES ('Venus', 3, 1, 'The hottest planet', true, 4500, false, 464);
INSERT INTO public.planet VALUES ('Jupiter', 4, 1, 'The largest planet', true, 4560, false, -110);
INSERT INTO public.planet VALUES ('Saturn', 5, 1, 'Has a spectacular ring', true, 4500, false, -140);
INSERT INTO public.planet VALUES ('Uranus', 6, 1, 'The ice giant', true, 4500, false, -195);
INSERT INTO public.planet VALUES ('Neptune', 7, 1, 'The fartherst planet', true, 4500, false, -200);
INSERT INTO public.planet VALUES ('Pluto', 8, 1, 'The dwarf planet', true, 4500, false, -230);
INSERT INTO public.planet VALUES ('Charon', 9, 1, 'Plutos largest moon', true, 4500, false, -220);
INSERT INTO public.planet VALUES ('Ceres', 10, 1, 'Largest object in asteroid belt', true, 4570, false, -105);
INSERT INTO public.planet VALUES ('Eris', 11, 1, 'A distant dwarf', true, 4500, false, -240);
INSERT INTO public.planet VALUES ('Mercury', 12, 1, 'The smallest and hottest', true, 4500, false, 167);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 2, 4600, true, 'main-sequence star', false);
INSERT INTO public.star VALUES ('Sirius', 2, 2, 240, true, 'binary star', true);
INSERT INTO public.star VALUES ('Betelgeuse', 3, 2, 8, false, 'red supergiant', false);
INSERT INTO public.star VALUES ('Rigel', 4, 2, 8, false, 'A luminous blue supergiant', true);
INSERT INTO public.star VALUES ('Vega', 5, 2, 455, true, 'Constellation lyra', false);
INSERT INTO public.star VALUES ('Polaris', 6, 2, 70, false, 'North star', true);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


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

