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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(64) NOT NULL,
    center_of_galaxy boolean,
    galaxy_id integer
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    galaxy_type character varying(64),
    distance_from_earth_in_millions_lightyears numeric(8,3),
    mass_in_solar_masses double precision
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
    name character varying(64) NOT NULL,
    mean_radius_in_km numeric(7,2),
    mass double precision,
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
    name character varying(64) NOT NULL,
    mass_in_earth_masses numeric(6,2),
    has_life boolean,
    planet_types character varying(64),
    number_of_moons integer,
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
    name character varying(64) NOT NULL,
    morgan_keenan_classification character varying(5),
    stellar_mass numeric(5,2),
    temperature_in_k integer,
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A*', true, 1);
INSERT INTO public.blackhole VALUES (2, 'Gaia BH1', false, 1);
INSERT INTO public.blackhole VALUES (3, 'OGLE-2011-BLG-0462', false, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 'barred spiral', 2.500, 1500000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way. It was originally named the Andromeda Nebula. The galaxy''s name stems from the area of Earth''s sky in which it appears, the constellation of Andromeda, which itself is named after the princess who was the wife of Perseus in Greek mythology.', 'barred spiral', 0.025, 1150000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth in the constellation Triangulum. It is also designated as Messier 33 or NGC 598. The Triangulum Galaxy is the third-largest member of the Local Group of galaxies.', 'spiral', 3.000, 50000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'The Whirlpool Galaxy, also known as Messier 51a, M51a, and NGC 5194, is an interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus. It is located at a distance of approximately 23 million light-years in the constellation Canes Venatici.', 'spiral', 23.000, 160000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'The Sombrero Galaxy is a lenticular galaxy in the constellation Virgo found 31 million light-years from Earth. The galaxy has a diameter of approximately 49,000 light-years, 30% the size of the Milky Way. It has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its inclined disk.', 'lenticular', 31.000, 800000000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'The Pinwheel Galaxy is a face-on spiral galaxy distanced 21 million light-years away from Earth in the constellation Ursa Major. It was discovered by Pierre Méchain on March 27, 1781, and then communicated to Charles Messier who verified its position for inclusion in the Messier Catalogue as one of its final entries.', 'spiral', 21.000, 100000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.40, 7.342e+22, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.08, 1.06e+16, 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.27, 1.51e+15, 5);
INSERT INTO public.moon VALUES (4, 'Io', 1821.60, 8.930999999999999e+22, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 3121.60, 4.7998e+22, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268.20, 1.4819e+23, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820.60, 1.0759e+23, 6);
INSERT INTO public.moon VALUES (8, 'Amalthea', 167.00, 2.08e+18, 6);
INSERT INTO public.moon VALUES (9, 'Himalia', 139.60, 4.2e+18, 6);
INSERT INTO public.moon VALUES (10, 'Lysithea', 42.20, 3.9e+16, 6);
INSERT INTO public.moon VALUES (11, 'Ananke', 29.10, 1.3e+16, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', 396.00, 4e+19, 7);
INSERT INTO public.moon VALUES (13, 'Enceladus', 504.00, 1.1000000000000002e+20, 7);
INSERT INTO public.moon VALUES (14, 'Tethys', 1062.00, 6.2e+20, 7);
INSERT INTO public.moon VALUES (15, 'Dione', 1123.00, 1.1000000000000001e+21, 7);
INSERT INTO public.moon VALUES (16, 'Rhea', 1527.00, 2.2999999999999997e+21, 7);
INSERT INTO public.moon VALUES (17, 'Titan', 5149.00, 1.3500000000000003e+23, 7);
INSERT INTO public.moon VALUES (18, 'Iapetus', 1470.00, 1.8e+21, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 2705.20, 2.139e+22, 8);
INSERT INTO public.moon VALUES (20, 'Oberon', 1522.80, 3.1104e+21, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.00, true, 'terrestrial', 1, 3);
INSERT INTO public.planet VALUES (2, 'Proxima b', 1.10, false, 'terrestrial', 0, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 0.06, false, 'terrestrial', 0, 3);
INSERT INTO public.planet VALUES (4, 'Venus', 0.82, false, 'terrestrial', 0, 3);
INSERT INTO public.planet VALUES (5, 'Mars', 0.11, false, 'terrestrial', 2, 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 317.80, false, 'gas giant', 95, 3);
INSERT INTO public.planet VALUES (7, 'Saturn', 95.16, false, 'gas giant', 146, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.15, false, 'gas giant', 16, 3);
INSERT INTO public.planet VALUES (9, 'Uranus', 14.54, false, 'gas giant', 16, 3);
INSERT INTO public.planet VALUES (10, 'Proxima d', 0.26, false, '', 0, 1);
INSERT INTO public.planet VALUES (11, 'Ross 128 b', 1.80, false, 'terrestrial', 0, 6);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 b', 2.64, false, '', 0, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 'M5.5', 0.12, 3042, 1);
INSERT INTO public.star VALUES (2, 'Lalande 21185', 'M2', 0.39, 3547, 1);
INSERT INTO public.star VALUES (3, 'Sun', 'G2', 1.00, 5772, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M2', 16.60, 3600, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'B8', 21.00, 12000, 1);
INSERT INTO public.star VALUES (6, 'Ross 128', 'M4', 0.18, 3189, 1);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

