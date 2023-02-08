--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-08 16:25:44

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

--
-- TOC entry 25 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 15 (class 3079 OID 17161)
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- TOC entry 4156 (class 0 OID 0)
-- Dependencies: 15
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- TOC entry 19 (class 3079 OID 17702)
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- TOC entry 4157 (class 0 OID 0)
-- Dependencies: 19
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- TOC entry 8 (class 3079 OID 16671)
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- TOC entry 4158 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- TOC entry 17 (class 3079 OID 17599)
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- TOC entry 4159 (class 0 OID 0)
-- Dependencies: 17
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 4160 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- TOC entry 14 (class 3079 OID 17152)
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 14
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- TOC entry 20 (class 3079 OID 18325)
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 20
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- TOC entry 18 (class 3079 OID 17686)
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 18
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- TOC entry 7 (class 3079 OID 16660)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 13 (class 3079 OID 17025)
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- TOC entry 12 (class 3079 OID 16903)
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- TOC entry 4 (class 3079 OID 16444)
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- TOC entry 22 (class 3079 OID 18337)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 22
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 11 (class 3079 OID 16824)
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- TOC entry 10 (class 3079 OID 16787)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 16 (class 3079 OID 17597)
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 16
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- TOC entry 5 (class 3079 OID 16629)
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- TOC entry 6 (class 3079 OID 16639)
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- TOC entry 21 (class 3079 OID 18330)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 21
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 9 (class 3079 OID 16776)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 3 (class 3079 OID 16430)
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 73137)
-- Name: exercises; Type: TABLE; Schema: public; Owner: vkggaimu
--

CREATE TABLE public.exercises (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.exercises OWNER TO vkggaimu;

--
-- TOC entry 228 (class 1259 OID 73135)
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: vkggaimu
--

CREATE SEQUENCE public.exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_id_seq OWNER TO vkggaimu;

--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 228
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vkggaimu
--

ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;


--
-- TOC entry 235 (class 1259 OID 73171)
-- Name: plan_exercises; Type: TABLE; Schema: public; Owner: vkggaimu
--

CREATE TABLE public.plan_exercises (
    id integer NOT NULL,
    training_day_id integer NOT NULL,
    exercise_id integer NOT NULL,
    sets integer NOT NULL,
    reps integer NOT NULL
);


ALTER TABLE public.plan_exercises OWNER TO vkggaimu;

--
-- TOC entry 234 (class 1259 OID 73169)
-- Name: plan_exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: vkggaimu
--

CREATE SEQUENCE public.plan_exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_exercises_id_seq OWNER TO vkggaimu;

--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 234
-- Name: plan_exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vkggaimu
--

ALTER SEQUENCE public.plan_exercises_id_seq OWNED BY public.plan_exercises.id;


--
-- TOC entry 231 (class 1259 OID 73145)
-- Name: plans; Type: TABLE; Schema: public; Owner: vkggaimu
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.plans OWNER TO vkggaimu;

--
-- TOC entry 230 (class 1259 OID 73143)
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: vkggaimu
--

CREATE SEQUENCE public.plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO vkggaimu;

--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 230
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vkggaimu
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- TOC entry 233 (class 1259 OID 73158)
-- Name: training_days; Type: TABLE; Schema: public; Owner: vkggaimu
--

CREATE TABLE public.training_days (
    id integer NOT NULL,
    plan_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.training_days OWNER TO vkggaimu;

--
-- TOC entry 232 (class 1259 OID 73156)
-- Name: training_days_id_seq; Type: SEQUENCE; Schema: public; Owner: vkggaimu
--

CREATE SEQUENCE public.training_days_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_days_id_seq OWNER TO vkggaimu;

--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 232
-- Name: training_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vkggaimu
--

ALTER SEQUENCE public.training_days_id_seq OWNED BY public.training_days.id;


--
-- TOC entry 227 (class 1259 OID 73122)
-- Name: users; Type: TABLE; Schema: public; Owner: vkggaimu
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    type character varying(255) DEFAULT 'normal'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO vkggaimu;

--
-- TOC entry 226 (class 1259 OID 73120)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vkggaimu
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vkggaimu;

--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vkggaimu
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 237 (class 1259 OID 73189)
-- Name: workout_sessions; Type: TABLE; Schema: public; Owner: vkggaimu
--

CREATE TABLE public.workout_sessions (
    id integer NOT NULL,
    plan_exercise_id integer NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    reps integer NOT NULL,
    weight integer NOT NULL
);


ALTER TABLE public.workout_sessions OWNER TO vkggaimu;

--
-- TOC entry 236 (class 1259 OID 73187)
-- Name: workout_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: vkggaimu
--

CREATE SEQUENCE public.workout_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workout_sessions_id_seq OWNER TO vkggaimu;

--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 236
-- Name: workout_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vkggaimu
--

ALTER SEQUENCE public.workout_sessions_id_seq OWNED BY public.workout_sessions.id;


--
-- TOC entry 3983 (class 2604 OID 73140)
-- Name: exercises id; Type: DEFAULT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);


--
-- TOC entry 3986 (class 2604 OID 73174)
-- Name: plan_exercises id; Type: DEFAULT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.plan_exercises ALTER COLUMN id SET DEFAULT nextval('public.plan_exercises_id_seq'::regclass);


--
-- TOC entry 3984 (class 2604 OID 73148)
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- TOC entry 3985 (class 2604 OID 73161)
-- Name: training_days id; Type: DEFAULT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.training_days ALTER COLUMN id SET DEFAULT nextval('public.training_days_id_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 73125)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3987 (class 2604 OID 73192)
-- Name: workout_sessions id; Type: DEFAULT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.workout_sessions ALTER COLUMN id SET DEFAULT nextval('public.workout_sessions_id_seq'::regclass);


--
-- TOC entry 4141 (class 0 OID 73137)
-- Dependencies: 229
-- Data for Name: exercises; Type: TABLE DATA; Schema: public; Owner: vkggaimu
--

COPY public.exercises (id, name) FROM stdin;
1	3/4 Sit-Up
2	90/90 Hamstring
3	Ab Roller
4	Adductor
\.


--
-- TOC entry 4147 (class 0 OID 73171)
-- Dependencies: 235
-- Data for Name: plan_exercises; Type: TABLE DATA; Schema: public; Owner: vkggaimu
--

COPY public.plan_exercises (id, training_day_id, exercise_id, sets, reps) FROM stdin;
1	1	1	3	8
2	1	2	3	8
3	2	3	3	8
4	2	4	3	8
5	10	1	3	12
6	10	4	3	8
7	11	1	3	3
8	11	2	3	3
9	12	1	3	3
10	12	1	3	3
11	13	2	3	3
12	13	1	3	3
13	14	1	3	3
14	14	1	3	3
15	15	1	3	3
16	15	1	3	3
17	16	1	3	3
18	17	1	3	3
19	18	1	4	8
20	18	2	3	12
21	19	2	3	3
25	20	2	3	3
26	20	1	3	3
27	21	1	3	3
28	21	1	3	3
29	22	1	3	3
30	22	1	3	3
31	23	1	3	3
32	23	1	3	3
33	24	1	3	3
34	24	1	3	3
\.


--
-- TOC entry 4143 (class 0 OID 73145)
-- Dependencies: 231
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: vkggaimu
--

COPY public.plans (id, user_id, name) FROM stdin;
1	1	plan1
10	1	a
11	1	ale plan
12	1	aaa
13	1	aaa
14	1	aaa
15	1	test
16	1	a
17	1	abx
18	1	abx
19	1	aaa
20	1	name
21	1	a
22	1	a
23	1	avx
24	1	aaaaaa
25	1	a
26	1	a
27	1	a
28	1	a
29	1	FBW
30	1	testowy
31	1	aaaaaa
32	1	xd
33	1	a
34	1	a
35	1	plan_name
36	1	AAAAA
37	1	ergerg
38	1	
39	1	athrth
\.


--
-- TOC entry 4145 (class 0 OID 73158)
-- Dependencies: 233
-- Data for Name: training_days; Type: TABLE DATA; Schema: public; Owner: vkggaimu
--

COPY public.training_days (id, plan_id, name) FROM stdin;
1	1	Day A
2	1	Day B
8	1	a
9	28	a
10	29	Training A
11	30	test
12	31	gfdargadr
13	31	yshnjsshrthtrhrthtrehrtaehterahtera
14	32	xd1
15	32	xd2
16	33	a
17	34	a
18	35	Day_name
19	36	aaaa
20	37	greger
21	39	sfd
22	39	asg
23	39	gsfhdj
24	39	waetart
\.


--
-- TOC entry 4139 (class 0 OID 73122)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vkggaimu
--

COPY public.users (id, username, password, type, created_at) FROM stdin;
1	admin	$2y$10$wl0OKF/SdJFPd6GhGb6Gn.Yfpa9OUETCC.Km1uCwSFC19Hx.yaohW	normal	2023-02-05 10:47:12.011998
\.


--
-- TOC entry 4149 (class 0 OID 73189)
-- Dependencies: 237
-- Data for Name: workout_sessions; Type: TABLE DATA; Schema: public; Owner: vkggaimu
--

COPY public.workout_sessions (id, plan_exercise_id, "timestamp", reps, weight) FROM stdin;
2	17	2023-02-08 11:48:11.588865	3	100
3	18	2023-02-08 12:26:46.260835	3	100
4	18	2023-02-08 12:26:46.313588	3	100
5	18	2023-02-08 12:26:46.365789	3	100
6	18	2023-02-08 12:26:46.417094	3	100
7	18	2023-02-08 12:26:46.46735	3	100
8	18	2023-02-08 12:26:46.517851	3	100
9	2	2023-02-08 12:28:38.469815	9	100
10	2	2023-02-08 12:28:38.527337	10	100
11	2	2023-02-08 12:28:38.581139	11	100
12	1	2023-02-08 12:28:38.635572	7	104
13	1	2023-02-08 12:28:38.689082	6	99
14	1	2023-02-08 12:28:38.742594	5	101
15	18	2023-02-08 14:01:21.558605	3	100
16	18	2023-02-08 14:01:21.611544	3	100
17	18	2023-02-08 14:01:21.665209	3	100
18	18	2023-02-08 14:01:21.71711	3	100
19	18	2023-02-08 14:01:21.769059	3	100
20	18	2023-02-08 14:01:21.820796	3	100
21	18	2023-02-08 14:11:09.386947	3	100
22	18	2023-02-08 14:11:09.44011	3	100
23	18	2023-02-08 14:11:09.493606	3	100
24	18	2023-02-08 14:11:09.546327	3	100
25	18	2023-02-08 14:11:09.602407	3	100
26	18	2023-02-08 14:11:09.654866	3	100
\.


--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 228
-- Name: exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vkggaimu
--

SELECT pg_catalog.setval('public.exercises_id_seq', 4, true);


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 234
-- Name: plan_exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vkggaimu
--

SELECT pg_catalog.setval('public.plan_exercises_id_seq', 34, true);


--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 230
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vkggaimu
--

SELECT pg_catalog.setval('public.plans_id_seq', 39, true);


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 232
-- Name: training_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vkggaimu
--

SELECT pg_catalog.setval('public.training_days_id_seq', 24, true);


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vkggaimu
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 236
-- Name: workout_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vkggaimu
--

SELECT pg_catalog.setval('public.workout_sessions_id_seq', 26, true);


--
-- TOC entry 3993 (class 2606 OID 73142)
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- TOC entry 3999 (class 2606 OID 73176)
-- Name: plan_exercises plan_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.plan_exercises
    ADD CONSTRAINT plan_exercises_pkey PRIMARY KEY (id);


--
-- TOC entry 3995 (class 2606 OID 73150)
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- TOC entry 3997 (class 2606 OID 73163)
-- Name: training_days training_days_pkey; Type: CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.training_days
    ADD CONSTRAINT training_days_pkey PRIMARY KEY (id);


--
-- TOC entry 3989 (class 2606 OID 73132)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3991 (class 2606 OID 73134)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4001 (class 2606 OID 73194)
-- Name: workout_sessions workout_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.workout_sessions
    ADD CONSTRAINT workout_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4004 (class 2606 OID 73182)
-- Name: plan_exercises plan_exercises_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.plan_exercises
    ADD CONSTRAINT plan_exercises_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercises(id);


--
-- TOC entry 4005 (class 2606 OID 73177)
-- Name: plan_exercises plan_exercises_training_day_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.plan_exercises
    ADD CONSTRAINT plan_exercises_training_day_id_fkey FOREIGN KEY (training_day_id) REFERENCES public.training_days(id);


--
-- TOC entry 4002 (class 2606 OID 73151)
-- Name: plans plans_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4003 (class 2606 OID 73164)
-- Name: training_days training_days_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.training_days
    ADD CONSTRAINT training_days_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- TOC entry 4006 (class 2606 OID 73195)
-- Name: workout_sessions workout_sessions_plan_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vkggaimu
--

ALTER TABLE ONLY public.workout_sessions
    ADD CONSTRAINT workout_sessions_plan_exercise_id_fkey FOREIGN KEY (plan_exercise_id) REFERENCES public.plan_exercises(id);


--
-- TOC entry 4155 (class 0 OID 0)
-- Dependencies: 25
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-02-08 16:25:50

--
-- PostgreSQL database dump complete
--

