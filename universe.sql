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
    name character varying(20) NOT NULL,
    messier character varying(10),
    distance_light_years integer,
    diameter_light_years integer,
    constellation character varying(20),
    type character varying(20),
    description text NOT NULL,
    star_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    year_discovered integer,
    distance_to_planet_miles integer,
    planetary_orbit_days numeric NOT NULL,
    diameter_miles numeric,
    is_spherical boolean,
    description text NOT NULL,
    planet_id integer NOT NULL
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(20) NOT NULL,
    designation character varying(10),
    year_discovered integer,
    distance_light_years integer,
    diameter_light_years numeric,
    apparent_magnitude numeric,
    constellation character varying(20),
    type character varying(20),
    description text NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_to_star_au numeric,
    axial_orbit_hours numeric,
    solar_orbit_days integer,
    diameter_miles integer,
    average_temperature_c integer,
    type character varying(20),
    description text NOT NULL,
    star_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    apparent_magnitude numeric,
    average_temperature_c integer,
    distance_light_years integer,
    type character varying(20),
    class character varying(10),
    constellation character varying(20),
    visible_unaided boolean,
    description text NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 0, 110000, 'Sagittarius', 'Spiral', 'Part of the Local Cluster of galaxies, the Milky Way is our home galaxy, comprising many thousands of star systems. It is a spiral galaxy, based on plotting what we know about the locations of known stars; to photograph it, would take thousands of years to get the camera into position. We live in the spiral known as the Orion spur, which is about 30,000 light years from the galactic centre. The Sun would take about 200 million years to complete one orbit around our galaxy.', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'M31', 2500000, 220000, 'Andromeda', 'Spiral', 'The closest neighbouring galaxy to our home galaxy the Milky Way, Andromeda is the name given to both a galaxy (M31) and a constellation. It is estimated to contain one trillion stars; in comparison, the Milky Way is estimated to contain 250 billion stars. It is the largest galaxy in the Local Group cluster, which also includes Triangulum. ', 2);
INSERT INTO public.galaxy VALUES (3, 'Sunflower', 'M63', 27000000, 130000, 'Canes Venatici', 'Spiral', 'A flocculent, spiral galaxy, having many discontinuous arms. It is part of the Canes Venatici constellation, and is best observed during the month on May.', 3);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'M33', 2730000, 60000, 'Triangulum', 'Spiral', 'Triangulum is the second closest galaxy to the Milky Way, after Andromeda, and is the third and smallest galaxy in our Local Group of galaxies. It is about 2.7 million light years away.', 8);
INSERT INTO public.galaxy VALUES (5, 'Hoag''s Object', NULL, 600000000, 100000, 'Serpens Caput', 'Ring', 'While not the only ring galaxy, Hoag''s Object is one of the more perfectly circular ring galaxies. It resembles an egg, with a yellow centre and a white outer. The outer shell has a large amont of bluer stars, which indicate that they are younger and hotter; while, nearer the centre are redder, older stars. In the area between the centre and the outer ring, there is complete darkness, except for a few stars and smaller satellite galaxies that shine through.', 5);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'M82', 11500000, 38000, 'Ursa Major', 'Starburst', 'While relatively compact in size, the Cigar galaxy is one of the largest members of the Ursa Major constellation, and is an area of heavy star-forming activity. New stars are born here at a rate ten times faster than in the Milky Way. It is thought that gravitational interactions with neighbouring galaxy M81 (Bode''s galaxy) is what causes the extraordinary high rate of star formation.', 6);
INSERT INTO public.galaxy VALUES (7, 'Markarian 231', NULL, 581000000, 185907, 'Ursa Major', 'Seyfert 1', 'Markarian 231 is a seyfert galaxy, located in the Ursa Major constellation; the nearest naked-eye star is Alioth. It is estimated to be 581 million light years away, which is too far to send a probe for current technology. However, the astronomers using the Hubble space telescope discovered that it is powered a binary black hole, that swirls one around the other. ', 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, 238855, 27, 2160, true, 'The only satellite to orbit Earth, Luna is the most studied planetary body other than our own planet. Several landings on Luna have occurred since the 20th century, and plans to establish bases have long been a goal of many nations and private organisations.', 3);
INSERT INTO public.moon VALUES (2, 'Ganymede', 1610, 665000, 7.15, 3270, true, 'Ganymede is the largest of Jupiter''s moons and the largest known satellite in our solar system. It is tidally locked, so it always faces the same side of Jupiter.', 5);
INSERT INTO public.moon VALUES (3, 'Charon', 1978, 12200, 6.4, 754, true, 'The largest of Pluto''s five moons, Charon is about half the size of Pluto, making it the largest satellite relative to its parent planet in our solar system; both have mutual tidal locking.', 9);
INSERT INTO public.moon VALUES (4, 'Titan', 1655, 759000, 15.91, 3200, true, 'Saturn''s largest moon, and the only known moon in our solar system with a dense atmosphere; Titan is also the only known world besides Earth with standing bodies of liquid, including rivers, lakes and seas.', 6);
INSERT INTO public.moon VALUES (5, 'Miranda', 1948, 80685, 1.41, 293, true, 'Miranda is one of Uranus''s five largest moons, and has the second closest orbit of its 27 satellites. It features lightly cratered collections of ridges and valleys, separated by more heavily cratered terrain, creating a visual effect resembling mismatched patches, like a moth-eaten coat.', 7);
INSERT INTO public.moon VALUES (6, 'Cordelia', 1986, 30944, 0.335, 25, false, 'Cordelia is the innermost known moon of Uranus, and acts as the inner shepherd satellite for Uranus''s ring. It is named after the youngest daughter in Shakespeare''s, ''King Lear''. ', 7);
INSERT INTO public.moon VALUES (7, 'Ophelia', 1986, 33430, 0.376, 26, false, 'Ophelia acts as the outer shepherd satellite for Uranus''s ring. Its orbit falls within the synchronous orbit radius of Uranus, and is slowly decaying due to tidal forces. It is named after a character in the Shakesperian play, ''Hamlet''.', 7);
INSERT INTO public.moon VALUES (8, 'Bianca', 1986, 36785, 0.435, 32, false, 'Bianca belongs to Uranus''s Portia group of satellites. It was named after the sister of Katherine in Shakespeare''s, ''The Taming of the Shrew''.', 7);
INSERT INTO public.moon VALUES (9, 'Cressida', 1986, 38401, 0.464, 50, false, 'This moon is named after the Trojan daughter of Calchas in Shakepeare''s tragedy, ''Trollus and Cressida''.', 7);
INSERT INTO public.moon VALUES (10, 'Desdemona', 1986, 38960, 0.474, 40, false, 'Desdemona is named after the wife of Othello in the Shakespeare play, ''Othello, the Moor of Venice''. Its orbit is in retrograde to Uranus. Its surface most likely consists of dark, unprocessed, carbon-rich materials typical of C-class asteroids.', 7);
INSERT INTO public.moon VALUES (11, 'Portia', 1986, 41073, 0.513, 85, false, 'Like many of Uranus''s inner satellites, Portia''s orbit is in retrograde. It''s namesake refers to a group of satellites that includes Cressida, Desdemona, Juliet, itself (Portia), Rosalind, Cupid, Belinda, and Perdita. The Portia group satellites have similar orbits and photometric properties.', 7);
INSERT INTO public.moon VALUES (12, 'Cupid', 2003, 46225, 0.613, 6, false, 'This moon is named after the Roman god of love who appears in the play, ''Timon of Athens'' by Shakespeare.', 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 1851, 118620, 2.52, 719, true, 'Ariel is one of Uranus''s five largest moons. It is thought to consist of roughly equal amounts of water ice and silicate rock, although carbon dioxide has also been detected. Its surface appears to be the youngest of all of Uranus''s moons, as it has many small craters but few large ones; this may indicate that recent low-impact collisions wiped out craters left by earlier, bigger strikes.', 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1851, 165285, 4.144, 727, true, 'Umbriel''s surface is the darkest of Uranus''s moons, and appears to have been shaped primarily by impacts. It is the second most cratered satellite of Uranus after Oberon. It consists mainly of ice, with a substantial fraction of rock, which can be differentiated as a rocky core with an icy mantle. It is named after a character in the 1712 poem, ''The Rape of the Lock'' by Alexander Pope.', 7);
INSERT INTO public.moon VALUES (15, 'Titania', 1787, 271104, 8.706, 980, true, 'Titania is the largest moon of Uranus, and the eighth largest satellite in our solar system. Its surface is relatively dark and slightly red in colour, and is heavily covered in craters. It consists of equal parts ice and rock, and may have a layer of liquid at the boundary of the core and mantle. It is named after the queen of the fairies in Shakepeare''s, ''A Midsommer Night''s Dream''.', 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 1787, 362570, 13.46, 946, true, 'Oberon is the second largest of Uranus'' five major moons. It is named after a character in the Shakespeare play ''A Midsommer Night''s Dream''.', 7);
INSERT INTO public.moon VALUES (17, 'Atlas', 1980, 85563, 0.602, 20, false, 'Atlas is named after one of the Titans in Greek mythology, who was condemned to hold the sky up above the Earth for all eternity. It appears as having a spherical centre, with a large, smooth, equatorial ridge.', 6);
INSERT INTO public.moon VALUES (18, 'Prometheus', 1980, 86619, 0.613, 62, false, 'Named after one the Titans from Greek mythology, Prometheus is one of Saturn''s many satellites. Researchers suggest that it may be a porous icy body, due to its low density and high albedo, but this has yet to be confirmed.', 6);
INSERT INTO public.moon VALUES (19, 'Pandora', 1980, 88048, 0.629, 52, false, 'Named after the first human woman in Greek mythology, who later unleashed great evils upon man, Pandora is a Saturnian satellite. Its surface is heavily cratered, although many appear shallow as a result of being filled with debris. Its orbit appears to be chaotic, due to orbital resonance with another Saturnian satellite, Prometheus.', 6);
INSERT INTO public.moon VALUES (20, 'Janus', 1966, 94138, 0.7, 111, false, 'Janus is a Saturnian satellite with several craters larger than 30 kilometres. Its surface appears to be older than sister satellite, Prometheus, but younger than Pandora. It is co-orbital with another satellite called Epimetheus, in a process that sees them effectively swap orbits over time; this occurs roughly every four years. It is named after the two-faced Roman God, as opposed to a Greek one.', 6);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Helix', 'NGC 7293', 1824, 650, 5.74, 7.6, 'Aquarius', 'Planetary Nebula', 'Located in the constellation Aquarius, the Helix nebula is the closest to our solar system. When viewed it looks like an ominous eyeball, but it''s actually the remnant of a dying star. It sometimes referred to as the ''Eye of God'', or the ''Eye of Sauron'' (from the Lord of the Rings series).');
INSERT INTO public.nebula VALUES (2, 'Carina', 'NGC 3372', 1752, 8500, 460, 1, 'Carina', 'Dark Nebula', 'The Carina nebula is a large, complex area of bright and dark nebulosity in the constellation Carina, located in the Carina–Sagittarius arm of the Milky Way galaxy. It contains several star forming regions, with NGC 3324 (located in the north-west of the nebula) notable for its mountainous peaks and valleys when seen in infrared.');
INSERT INTO public.nebula VALUES (3, 'Iris', 'NGC 7023', 1794, 1300, 6, 6.8, 'Cepheus', 'Reflection', 'The Iris nebula is a bright, large reflection nebula in the constellation Cepheus. It is one of many nebulae with a common name associated with a flower, and is a popular target for astrophotography.');
INSERT INTO public.nebula VALUES (4, 'Eskimo', 'NGC 2392', 1787, 6500, 0.62, 10.1, 'Gemini', 'Planetary Nebula', 'The Eskimo nebula is a bipolar planetary nebula located in the constellation Gemini. It got the nickname ''Eskimo'' because its shape resembles a head wearing a fur-lined parka hood. The hood forms a broken ring of material comprised of multiple comet-shaped objects, with their tails streaming away from the central, dying star and stretching up to a light-year out into space. The face is hot in x-rays (a result of interactions between the star''s fast winds colliding with the shell of the nebula), with temperatures reaching around 2 million degrees celsius, much hotter than the surrounding ejected material, which glows at around 14,000 degrees.');
INSERT INTO public.nebula VALUES (5, 'Eagle', 'M16', 1745, 5700, 70, 6, 'Serpens', 'Emission', 'Named for its resemblance to the bird of prey, the Eagle nebula is a stellar nursery in the Serpens constellation. Part of the active star-forming region is known as the ''Pillars of Creation'', which are three tall towers of dust, shaped by radiation and strong stellar winds interacting with dense pockets of gas. These types of structures can be found in other star-forming regions, but those within the Eagle nebula are quite spectacular.');
INSERT INTO public.nebula VALUES (6, 'Crab', 'M1', 1054, 6500, 10, 8, 'Taurus', 'Supernova Remnant', 'The Crab nebula is the leftover matter from a star that went supernova. At the centre of the nebula, lies a neturon star of the pulsar variety, which spins 30 times per second, producing the central glow that can be observed in images of the nebula. This pulsar can be observed across the entire light spectrum from radio waves to gamma rays, and the powerful winds it generates help to create the intricate and beuatiful filaments that make it so visually striking. The initial supernova event would have been so bright as to be comparable to a full moon, except, it would also have been visible during the daytime for an entire month.');
INSERT INTO public.nebula VALUES (7, 'Horsehead', 'B33', 1888, 1375, 7, 6.8, 'Orion', 'Dark Nebula', 'The Horsehead nebula is one of the closest giant star-forming regions to Earth, and is located in the constellation Orion. It is a dark nebula with a prominent silhouette, due to its cold gas and dust blocking the light from a much brighter nebula behind it; it is shaped by interaction with the intense radiation emitted by a nearby star. It is part of the much larger Orion Molecular Cloud Complex, a stellar nursery spanning hundred of light years across, which has already given birth to young stars and even some with protoplanetary disks.');
INSERT INTO public.nebula VALUES (8, 'Ring', 'M57', 1779, 2200, 2.6, 8.8, 'Lyra', 'Planetary Nebula', 'Located in the constellation Lyra, the Ring nebula is of the planetary variety, with a donut-shaped ring of glowing gas and dust. It is a popular target for astronomers and quite achieveable even for amateur telescopes. From our vantage point in the solar system, the nebula appears tilted so that it is viewed face-on. This provides the opportunity to see what is going on within the nebula, and to gain a closer look at the life and death of stars.');
INSERT INTO public.nebula VALUES (9, 'Orion', 'M42', 1610, 1344, 24, 4, 'Orion', 'Diffuse', 'Part of the Orion Molecular Cloud Complex, the Orion nebula is one of the brightest visible to the naked eye, with an apparent magnitude of 4.0. It is one of the most scrutinised and photographed objects in the night sky, and has revealed much about the process of how stars and planetary systems form from clouds of dust gas.');
INSERT INTO public.nebula VALUES (10, 'Witch Head', 'IC 2118', 1786, 900, 50, 13, 'Orion', 'Reflection', 'This nebula appears to resemble the side profile of a typical fairy tale Witch''s face, complete with a long nose and pointy chin. It is illuminated by light reflected from nearby star Rigel, which is a blue-white supergiant. Because the dust reflects blue light more efficiently than red, the nebula has a blueish colour. A similar process causes the Earth''s sky to appear blue during daytime, and red in the evening.');
INSERT INTO public.nebula VALUES (11, 'Bubble', 'NGC 7635', 1787, 7100, 7, 8.7, 'Cassiopeia', 'Emission', 'An emission nebula in the constellation Cassiopeia. Its iconic bubble shape is generated by stellar winds from the intensely hot central star ''SAO 20575'', which is rapidly losing its mass in the final stages of its life. As the stellar wind meets the material of the nearby giant molecular cloud at supersonic speeds,  it prodives a shock, shaping the bubble. This cloud contains the nebula''s expansion, and is itself lit by the nebula''s luminous central star.');
INSERT INTO public.nebula VALUES (12, 'Lagoon', 'M8', 1654, 5000, 130, 4.6, 'Sagittarius', 'Emission', 'The Lagoon nebula is an emission nebula, mostly composed of partially-ionised hydogen. The ionisation is due to radiation from the nearby young, hot star ''Herschel 36'', which has a a spectral type of O7 and a surface temperature of roughly 20,000 kelvin. The nebula is also a stellar nursery, and contains the young open cluster ''NGC 6530'', home to over 3500 stars.');
INSERT INTO public.nebula VALUES (13, 'Cat''s Paw', 'NGC 36334', 1837, 5500, 50, 10, 'Scorpius', 'Emission', 'The Cat''s Paw nebula is an active star-forming region, producing stars more rapidly than the better-known Orion nebula, making it one of the most prolific stellar nurseries in the Milky Way. The cause for this rapid star formation is unknown, and doesn''t seem to be caused by a nearby supernova event or galaxy collision, which are common causes for this phenomena. Cat''s Paw is home to about 2000 young stars, which give the nebula its glow, and are themselves still surrounded by protoplanetary disks of dense gas and dust. The dust in this region has exceptionally low temperatures of around -265 degree celcius.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.40, 58.6, 88, 3031, 167, 'Terrestrial', 'Mercury is the closest planet to our parent star, Sol; it is likely too hot to form organic life as we know it. Because it''s axial rotation tilts at just 2 degrees in relation to its plane of orbit around the sun, it spins nearly perfectly upright all year, and does not experience seasons as many other planets do.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.72, 241, 225, 7521, 464, 'Terrestrial', 'Named after the Roman goddess for love and beauty, Venus is our closest neighbour and is similar in size to Earth. Uniquely, it is the hottest planet in our solar system, and one of the only planets to spin counter-clockwise.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 24, 365, 7926, 15, 'Terrestrial', 'Our home planet, Earth is the birthplace of humanity and home to many different species of flora and fauna. It rests in the habitable zone of our parent star Sol, with an oxygen-nitrogen atmosphere that sustains life as we know it. Roughly two-thirds of the surface is covered in water; while most of the population lives on land, there is still a vast oceanic ecosystem that largely remains a mystery. The terrain ranges between rocky, tropical, desert, snow, grass and wetland. There are four regular seasons expressed differently depending on location, but there can also be hurricanes, tornadoes, earthquakes, storms and volcanic erruptions in various regions; these are predicatable, but often very deadly.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.50, 24.33, 687, 4217, -65, 'Terrestrial', 'A cold, desert-like planet, Mars is covered in iron oxide which gives it its signature red hue. While its current atmosphere is too thin to sustain liquid water, there is evidence that it may have previously been able to do so, due to the presence of water ice sheets below the surface, and ice caps at both poles. It has 2 moons.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.20, 9.8, 4344, 86881, -110, 'Gas Giant', 'The largest planet in our solar system, Jupiter has a strong magnetic field and colourful swirling clouds due to numerous trace gases. It has 95 moons, which includes the largest moon in our solar system, Ganymede. It is famous for a large red spot on the planet''s surface visible from space, which is a giant storm 10,000 miles wide, sustanining wind speeds over 400 MPH for over 150 years.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.50, 10.5, 10768, 74900, -140, 'Gas Giant', 'Known for its large and distinct ring system, Saturn is a low-density gas giant composed mostly of hydrogen and helium. It also has the highest number of moons for a single planet, at 82.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 19.00, 18, 30660, 31763, -195, 'Ice Giant', 'An oddball planet, Uranus orbits at a near right angle to its equator, and the presence of rings around the planet give the impression of it spinning on its side. It rotates counter-clockwise like Venus, but the extreme tilt causes seasons that can last for 20 or more years, while its slow solar orbit sees the sun beating down on one pole or the other for 84 years at a time.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 30.00, 19, 165, 30775, -200, 'Ice Giant', 'The coldest planet in our solar system, Neptune was the first planet to be discovered mathematically based on how it affected neighbouring Uranus''s orbit, before being visually confirmed. Surface winds can pass 1500 MPH.', 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 2.80, 9.074, 1682, 592, -66, 'Dwarf', 'One of the first asteroids to be discovered, Ceres is located between the orbits of Mars and Jupiter, and is about a quarter of the size of the moon. While most asteroids tend to be irregularly shaped, Ceres is notable in that it is spherical like a planet. It is currently classed as a dwarf planet, although, it has previously been classed as an asteroid. It shares a similar status to Pluto, which was once considered the ninth planet. It is named after the Roman goddess of corn and harvest, and shares a lexical root with the word cereal. Water exists on the planet, which is an important ingredient required for life to exist.', 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 39.00, 153, 90520, 1430, -225, 'Dwarf', 'Named after the Roman god of the underworld, Pluto is a dwarf planet that exists beyond Neptune in an area known as the Kuiper belt. It was the discovery of this asteroid belt, and subsequent objects within it, that led to Pluto being downgraded from the ninth planet in our solar system, to a dwarf planet.', 1);
INSERT INTO public.planet VALUES (11, 'Proxima b', 0.05, 268.8, 11, 8481, 39, 'Terrestrial', 'Proxima b is one of three planets orbiting Alpha Centauri, and the closest exoplanet to our solar system. Because of how close it is to its parent star, it is most likely tidally locked, meaning there would be great disparities in temperature between the side that always faces the star, and the side that does not. It is considered an Earth-like planet as it''s likely a rocky world, and is about the same size. It''s age is currently unknown, as it may have been an extrasolar capture.', 9);
INSERT INTO public.planet VALUES (12, 'Proxima c', 1.49, NULL, 1928, 47556, -234, 'Ice Giant', 'Proxima c is a super-Earth-like planet, about seven times as heavy. It is unlikely to support life as we know it due to its distance from Proxima Centauri, meaning it would have extremely cold temperatures similar to those experienced by Pluto. It has a lengthy orbital period over 1900 days long, which is about five years. Since it was only discovered in 2019, it would take until at least late 2024 to early 2025 to confirm. It is not known how long a day is on Proxima c.', 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', -27, 5505, 1, 'Dwarf', 'G2 V', NULL, true, 'Sol (commonly referred to as The Sun) is our parent star, and provides the heat that sustains life for planet Earth, and possibly others in our solar system. It is a G-type, main sequence star, that is expected to live for another 5 billion years before burning all of its hydrogen and expanding. It appears yellow from Earth because of how light passes through the atmosphere, but if viewed from space, it would be pure white.', 1);
INSERT INTO public.star VALUES (2, 'Mirach', 2.06, 3569, 197, 'Red Giant', 'M0 III', 'Andromeda', true, 'A moderately bright star in the Andromeda constellation, it has a mass three to four times that of the Sun. It is a red giant, but unlikely to go supernova at the end of its life. It''s an important guide star for stargazers due to its proximity to the Andromeda, Triangulum, and Mirach''s Ghost galaxies.', 2);
INSERT INTO public.star VALUES (3, 'Cor Caroli A', 2.9, 11326, 110000, 'Visual Binary', 'A', 'Canes Venatici', true, 'The brighter star in the Canes Venatici constellation, this binary star was named after the executed English king Charles I.', 3);
INSERT INTO public.star VALUES (4, 'Cor Caroli B', 5.5, 6806, 110000, 'Visual Binary', 'F', 'Canes Venatici', true, 'The fainter star of the two, this star is almost twice as large as our sun, and five times as bright.', 3);
INSERT INTO public.star VALUES (5, 'HIP 74746', 9.7, 3977, 391, 'Orange Dwarf', 'K0', 'Serpens', false, 'Within the borders of the Serpens contellation, and close to Hoag''s Object, HIP 74746 is a dwarf star similar in temperature to our own star. It requires a telescope for observation.', 5);
INSERT INTO public.star VALUES (6, 'HIP 48486', 7.92, 4177, 1109, 'Orange Dwarf', 'K0', 'Ursa Major', false, 'Located in the Ursa Major constellation, but not part of the big bear outline, HIP 48486 is orange-red star that is cooler than our own. It is very close to the M82 cigar galaxy, and over a thousand light years away.', 6);
INSERT INTO public.star VALUES (7, 'Alioth', 1.77, 8747, 83, 'Subgiant', 'A0', 'Ursa Major', true, 'The brightest star in the Ursa Major constellation, Aloith is both part of the Big Dipper asterism and also its brightest start. Due to its brightness, it is easy to spot without eqiupment, and should still be visible from light polluted areas.', 7);
INSERT INTO public.star VALUES (8, 'Mothallah', 3.521, 5683, 63, 'Spectroscopic Binary', 'F6IV', 'Triangulum', true, 'Part of the Triangulum galaxy, Mothallah is a spectroscopic binary star; the difference in magnitude between the primary and secondary star is 8.6. It can be seen without equipment provided the skies are dark.', 4);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', -0.27, 2800, 4, 'Red Dwarf', 'M5', 'Centaurus', true, 'The nearest star to our solar system, Promixa Centauri is the faintest star in the triple-star system Alpha Centauri. As a low mass star, the habitable zone for its surrounding planets is much closer than it is in our solar system. It is located within the Centaurus constellation.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 13, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: galaxy fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--