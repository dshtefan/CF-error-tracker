--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2022-03-21 19:52:36

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
-- TOC entry 203 (class 1259 OID 24660)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    firstname character varying(20) NOT NULL,
    surname character varying(20) NOT NULL
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24658)
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_user_id_seq OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 202
-- Name: app_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_user_id_seq OWNED BY public.app_user.id;


--
-- TOC entry 207 (class 1259 OID 24678)
-- Name: criticality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criticality (
    id integer NOT NULL,
    criticalityname character varying(20) NOT NULL
);


ALTER TABLE public.criticality OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24676)
-- Name: criticality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.criticality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criticality_id_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 206
-- Name: criticality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.criticality_id_seq OWNED BY public.criticality.id;


--
-- TOC entry 211 (class 1259 OID 24694)
-- Name: error_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.error_info (
    id integer NOT NULL,
    errordate date DEFAULT CURRENT_DATE NOT NULL,
    shortdescription character varying(50) NOT NULL,
    fulldescription character varying(255) NOT NULL,
    userid integer,
    priorityid integer,
    criticalityid integer
);


ALTER TABLE public.error_info OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24692)
-- Name: error_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.error_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.error_info_id_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 210
-- Name: error_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.error_info_id_seq OWNED BY public.error_info.id;


--
-- TOC entry 213 (class 1259 OID 24747)
-- Name: error_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.error_log (
    id integer NOT NULL,
    actiondate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    actioncomment character varying(255) NOT NULL,
    actionid integer,
    userid integer,
    errorid integer
);


ALTER TABLE public.error_log OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24745)
-- Name: error_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.error_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.error_log_id_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 212
-- Name: error_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.error_log_id_seq OWNED BY public.error_log.id;


--
-- TOC entry 205 (class 1259 OID 24670)
-- Name: priority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priority (
    id integer NOT NULL,
    priorityname character varying(20) NOT NULL
);


ALTER TABLE public.priority OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24668)
-- Name: priority_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priority_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priority_id_seq OWNER TO postgres;

--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 204
-- Name: priority_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priority_id_seq OWNED BY public.priority.id;


--
-- TOC entry 209 (class 1259 OID 24686)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    actionname character varying(30) NOT NULL,
    statusname character varying(30) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24684)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_id_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 208
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- TOC entry 2717 (class 2604 OID 24663)
-- Name: app_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user ALTER COLUMN id SET DEFAULT nextval('public.app_user_id_seq'::regclass);


--
-- TOC entry 2719 (class 2604 OID 24681)
-- Name: criticality id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criticality ALTER COLUMN id SET DEFAULT nextval('public.criticality_id_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 24697)
-- Name: error_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_info ALTER COLUMN id SET DEFAULT nextval('public.error_info_id_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 24750)
-- Name: error_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log ALTER COLUMN id SET DEFAULT nextval('public.error_log_id_seq'::regclass);


--
-- TOC entry 2718 (class 2604 OID 24673)
-- Name: priority id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priority ALTER COLUMN id SET DEFAULT nextval('public.priority_id_seq'::regclass);


--
-- TOC entry 2720 (class 2604 OID 24689)
-- Name: status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- TOC entry 2872 (class 0 OID 24660)
-- Dependencies: 203
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (id, login, password, firstname, surname) FROM stdin;
1	admin	admin	Denis	Shtefan
\.


--
-- TOC entry 2876 (class 0 OID 24678)
-- Dependencies: 207
-- Data for Name: criticality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criticality (id, criticalityname) FROM stdin;
1	Авария
2	Критичная
3	Некритичная
4	Запрос на изменение
\.


--
-- TOC entry 2880 (class 0 OID 24694)
-- Dependencies: 211
-- Data for Name: error_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.error_info (id, errordate, shortdescription, fulldescription, userid, priorityid, criticalityid) FROM stdin;
1	2022-03-21	Короткое описание ошибки	Полное описание ошибки	1	1	1
2	2022-03-21	Короткое описание ошибки	Полное описание ошибки	1	2	3
\.


--
-- TOC entry 2882 (class 0 OID 24747)
-- Dependencies: 213
-- Data for Name: error_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.error_log (id, actiondate, actioncomment, actionid, userid, errorid) FROM stdin;
1	2022-03-21 19:51:00.53382	Комментарий	1	1	1
2	2022-03-21 19:51:10.53382	Комментарий	2	1	1
3	2022-03-21 19:51:20.53382	Комментарий	3	1	1
4	2022-03-21 19:51:30.53382	Комментарий	1	1	2
5	2022-03-21 19:51:40.53382	Комментарий	2	1	2
\.


--
-- TOC entry 2874 (class 0 OID 24670)
-- Dependencies: 205
-- Data for Name: priority; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priority (id, priorityname) FROM stdin;
1	Очень срочно
2	Срочно
3	Несрочно
4	Совсем несрочно
\.


--
-- TOC entry 2878 (class 0 OID 24686)
-- Dependencies: 209
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, actionname, statusname) FROM stdin;
1	Ввод	Новая
2	Открытие	Открытая
3	Решение	Решенная
4	Закрытие	Закрытая
\.


--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 202
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_user_id_seq', 1, true);


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 206
-- Name: criticality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criticality_id_seq', 4, true);


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 210
-- Name: error_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.error_info_id_seq', 2, true);


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 212
-- Name: error_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.error_log_id_seq', 5, true);


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 204
-- Name: priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priority_id_seq', 4, true);


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 208
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_seq', 4, true);


--
-- TOC entry 2726 (class 2606 OID 24667)
-- Name: app_user app_user_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_login_key UNIQUE (login);


--
-- TOC entry 2728 (class 2606 OID 24665)
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 24683)
-- Name: criticality criticality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criticality
    ADD CONSTRAINT criticality_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 24700)
-- Name: error_info error_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_info
    ADD CONSTRAINT error_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 24753)
-- Name: error_log error_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 24675)
-- Name: priority priority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priority
    ADD CONSTRAINT priority_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 24691)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 24711)
-- Name: error_info error_info_criticalityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_info
    ADD CONSTRAINT error_info_criticalityid_fkey FOREIGN KEY (criticalityid) REFERENCES public.criticality(id);


--
-- TOC entry 2740 (class 2606 OID 24706)
-- Name: error_info error_info_priorityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_info
    ADD CONSTRAINT error_info_priorityid_fkey FOREIGN KEY (priorityid) REFERENCES public.priority(id);


--
-- TOC entry 2739 (class 2606 OID 24701)
-- Name: error_info error_info_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_info
    ADD CONSTRAINT error_info_userid_fkey FOREIGN KEY (userid) REFERENCES public.app_user(id);


--
-- TOC entry 2742 (class 2606 OID 24754)
-- Name: error_log error_log_actionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_actionid_fkey FOREIGN KEY (actionid) REFERENCES public.status(id);


--
-- TOC entry 2744 (class 2606 OID 24764)
-- Name: error_log error_log_errorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_errorid_fkey FOREIGN KEY (errorid) REFERENCES public.error_info(id);


--
-- TOC entry 2743 (class 2606 OID 24759)
-- Name: error_log error_log_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_log
    ADD CONSTRAINT error_log_userid_fkey FOREIGN KEY (userid) REFERENCES public.app_user(id);


-- Completed on 2022-03-21 19:52:36

--
-- PostgreSQL database dump complete
--

