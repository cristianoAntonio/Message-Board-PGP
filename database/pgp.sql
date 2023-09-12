--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-09-12 15:44:11

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
-- TOC entry 3410 (class 1262 OID 74358)
-- Name: pgp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pgp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE pgp OWNER TO postgres;

\connect pgp

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
-- TOC entry 232 (class 1259 OID 74454)
-- Name: ban_usr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ban_usr (
    id bigint NOT NULL,
    usr inet NOT NULL,
    context text NOT NULL,
    r_date timestamp without time zone NOT NULL
);


ALTER TABLE public.ban_usr OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 74453)
-- Name: ban_usr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ban_usr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ban_usr_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 231
-- Name: ban_usr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ban_usr_id_seq OWNED BY public.ban_usr.id;


--
-- TOC entry 216 (class 1259 OID 74367)
-- Name: board; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.board (
    id integer NOT NULL,
    name text,
    abv text
);


ALTER TABLE public.board OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 74366)
-- Name: board_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 215
-- Name: board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.board_id_seq OWNED BY public.board.id;


--
-- TOC entry 220 (class 1259 OID 74385)
-- Name: flag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flag (
    id integer NOT NULL,
    path text NOT NULL
);


ALTER TABLE public.flag OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 74384)
-- Name: flag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flag_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 219
-- Name: flag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flag_id_seq OWNED BY public.flag.id;


--
-- TOC entry 218 (class 1259 OID 74376)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id bigint NOT NULL,
    path text NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 74375)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 217
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 230 (class 1259 OID 74445)
-- Name: moderator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moderator (
    id bigint NOT NULL,
    name text NOT NULL,
    pass text NOT NULL
);


ALTER TABLE public.moderator OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 74444)
-- Name: moderator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moderator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moderator_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 229
-- Name: moderator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moderator_id_seq OWNED BY public.moderator.id;


--
-- TOC entry 225 (class 1259 OID 74397)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id bigint NOT NULL,
    context text NOT NULL,
    board integer NOT NULL,
    usr inet NOT NULL,
    flag integer NOT NULL,
    image bigint NOT NULL,
    banned boolean NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 74394)
-- Name: post_board_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_board_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_board_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 222
-- Name: post_board_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_board_seq OWNED BY public.post.board;


--
-- TOC entry 223 (class 1259 OID 74395)
-- Name: post_flag_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_flag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_flag_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 223
-- Name: post_flag_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_flag_seq OWNED BY public.post.flag;


--
-- TOC entry 221 (class 1259 OID 74393)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 221
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 224 (class 1259 OID 74396)
-- Name: post_image_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_image_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_image_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 224
-- Name: post_image_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_image_seq OWNED BY public.post.image;


--
-- TOC entry 228 (class 1259 OID 74430)
-- Name: thread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thread (
    id bigint NOT NULL,
    name text NOT NULL,
    post bigint NOT NULL
);


ALTER TABLE public.thread OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 74428)
-- Name: thread_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thread_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.thread_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 226
-- Name: thread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thread_id_seq OWNED BY public.thread.id;


--
-- TOC entry 227 (class 1259 OID 74429)
-- Name: thread_post_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thread_post_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.thread_post_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 227
-- Name: thread_post_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thread_post_seq OWNED BY public.thread.post;


--
-- TOC entry 214 (class 1259 OID 74359)
-- Name: usr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usr (
    ip inet NOT NULL,
    name text
);


ALTER TABLE public.usr OWNER TO postgres;

--
-- TOC entry 3221 (class 2604 OID 74457)
-- Name: ban_usr id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ban_usr ALTER COLUMN id SET DEFAULT nextval('public.ban_usr_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 74370)
-- Name: board id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.board ALTER COLUMN id SET DEFAULT nextval('public.board_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 74388)
-- Name: flag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag ALTER COLUMN id SET DEFAULT nextval('public.flag_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 74379)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 74448)
-- Name: moderator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderator ALTER COLUMN id SET DEFAULT nextval('public.moderator_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 74400)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 74401)
-- Name: post board; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN board SET DEFAULT nextval('public.post_board_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 74402)
-- Name: post flag; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN flag SET DEFAULT nextval('public.post_flag_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 74403)
-- Name: post image; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN image SET DEFAULT nextval('public.post_image_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 74433)
-- Name: thread id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thread ALTER COLUMN id SET DEFAULT nextval('public.thread_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 74434)
-- Name: thread post; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thread ALTER COLUMN post SET DEFAULT nextval('public.thread_post_seq'::regclass);


--
-- TOC entry 3404 (class 0 OID 74454)
-- Dependencies: 232
-- Data for Name: ban_usr; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3388 (class 0 OID 74367)
-- Dependencies: 216
-- Data for Name: board; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.board VALUES (1, 'Anime and Manga', 'a');
INSERT INTO public.board VALUES (2, 'Random', 'B');


--
-- TOC entry 3392 (class 0 OID 74385)
-- Dependencies: 220
-- Data for Name: flag; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3390 (class 0 OID 74376)
-- Dependencies: 218
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3402 (class 0 OID 74445)
-- Dependencies: 230
-- Data for Name: moderator; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3397 (class 0 OID 74397)
-- Dependencies: 225
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3400 (class 0 OID 74430)
-- Dependencies: 228
-- Data for Name: thread; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3386 (class 0 OID 74359)
-- Dependencies: 214
-- Data for Name: usr; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 231
-- Name: ban_usr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ban_usr_id_seq', 1, false);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 215
-- Name: board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.board_id_seq', 2, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 219
-- Name: flag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flag_id_seq', 1, false);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 217
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 1, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 229
-- Name: moderator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moderator_id_seq', 1, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 222
-- Name: post_board_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_board_seq', 1, false);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 223
-- Name: post_flag_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_flag_seq', 1, false);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 221
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 224
-- Name: post_image_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_image_seq', 1, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 226
-- Name: thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thread_id_seq', 1, false);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 227
-- Name: thread_post_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thread_post_seq', 1, false);


--
-- TOC entry 3237 (class 2606 OID 74461)
-- Name: ban_usr ban_usr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ban_usr
    ADD CONSTRAINT ban_usr_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 74374)
-- Name: board board_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 74392)
-- Name: flag flag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag
    ADD CONSTRAINT flag_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 74383)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 74452)
-- Name: moderator moderator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moderator
    ADD CONSTRAINT moderator_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 74407)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 74438)
-- Name: thread thread_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thread
    ADD CONSTRAINT thread_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 74365)
-- Name: usr usr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usr
    ADD CONSTRAINT usr_pkey PRIMARY KEY (ip);


--
-- TOC entry 3238 (class 2606 OID 74408)
-- Name: post fk_board; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_board FOREIGN KEY (board) REFERENCES public.board(id);


--
-- TOC entry 3239 (class 2606 OID 74423)
-- Name: post fk_flag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_flag FOREIGN KEY (flag) REFERENCES public.flag(id);


--
-- TOC entry 3240 (class 2606 OID 74418)
-- Name: post fk_image; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_image FOREIGN KEY (image) REFERENCES public.image(id);


--
-- TOC entry 3242 (class 2606 OID 74439)
-- Name: thread fk_post; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thread
    ADD CONSTRAINT fk_post FOREIGN KEY (post) REFERENCES public.post(id);


--
-- TOC entry 3241 (class 2606 OID 74413)
-- Name: post fk_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_usr FOREIGN KEY (usr) REFERENCES public.usr(ip);


--
-- TOC entry 3243 (class 2606 OID 74462)
-- Name: ban_usr fk_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ban_usr
    ADD CONSTRAINT fk_usr FOREIGN KEY (usr) REFERENCES public.usr(ip);


-- Completed on 2023-09-12 15:44:12

--
-- PostgreSQL database dump complete
--

