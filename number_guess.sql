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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_index integer NOT NULL,
    user_name character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_index_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_index_seq OWNER TO freecodecamp;

--
-- Name: users_user_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_index_seq OWNED BY public.users.user_index;


--
-- Name: users user_index; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_index SET DEFAULT nextval('public.users_user_index_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (53, 'user_1745135826217', 2, 379);
INSERT INTO public.users VALUES (63, 'user_1745137319090', 2, 880);
INSERT INTO public.users VALUES (52, 'user_1745135826218', 5, 192);
INSERT INTO public.users VALUES (62, 'user_1745137319091', 5, 116);
INSERT INTO public.users VALUES (77, 'user_1745138909852', 2, 192);
INSERT INTO public.users VALUES (55, 'user_1745136494845', 2, 621);
INSERT INTO public.users VALUES (65, 'user_1745137451638', 2, 213);
INSERT INTO public.users VALUES (76, 'user_1745138909853', 5, 73);
INSERT INTO public.users VALUES (54, 'user_1745136494846', 5, 155);
INSERT INTO public.users VALUES (64, 'user_1745137451639', 5, 52);
INSERT INTO public.users VALUES (57, 'user_1745136521529', 2, 132);
INSERT INTO public.users VALUES (56, 'user_1745136521530', 5, 215);
INSERT INTO public.users VALUES (67, 'user_1745137477834', 1, 68);
INSERT INTO public.users VALUES (66, 'user_1745137477835', 2, 677);
INSERT INTO public.users VALUES (59, 'user_1745136594961', 2, 516);
INSERT INTO public.users VALUES (58, 'user_1745136594962', 5, 454);
INSERT INTO public.users VALUES (69, 'user_1745137539750', 2, 765);
INSERT INTO public.users VALUES (68, 'user_1745137539751', 3, 115);
INSERT INTO public.users VALUES (61, 'user_1745137102468', 2, 556);
INSERT INTO public.users VALUES (60, 'user_1745137102469', 5, 221);
INSERT INTO public.users VALUES (71, 'user_1745138157380', 2, 795);
INSERT INTO public.users VALUES (70, 'user_1745138157381', 3, 133);
INSERT INTO public.users VALUES (73, 'user_1745138532381', 2, 128);
INSERT INTO public.users VALUES (72, 'user_1745138532382', 5, 301);
INSERT INTO public.users VALUES (75, 'user_1745138698198', 2, 532);
INSERT INTO public.users VALUES (74, 'user_1745138698199', 5, 73);


--
-- Name: users_user_index_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_index_seq', 77, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_index);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- PostgreSQL database dump complete
--

