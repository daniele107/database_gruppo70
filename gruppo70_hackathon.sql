--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-27 18:10:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 223 (class 1259 OID 16435)
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento (
    id integer NOT NULL,
    data date NOT NULL,
    documento character varying NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.documento OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16462)
-- Name: documento_giudice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento_giudice (
    documento_id integer NOT NULL,
    giudice_id integer NOT NULL
);


ALTER TABLE public.documento_giudice OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16434)
-- Name: documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documento_id_seq OWNER TO postgres;

--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 222
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documento_id_seq OWNED BY public.documento.id;


--
-- TOC entry 220 (class 1259 OID 16414)
-- Name: giudice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.giudice (
    utente_id integer NOT NULL
);


ALTER TABLE public.giudice OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16516)
-- Name: hackathon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hackathon (
    id integer NOT NULL,
    titolo character varying NOT NULL,
    sede character varying NOT NULL,
    massimo_partecipanti integer NOT NULL,
    dimensione_team integer NOT NULL,
    data_inizio timestamp without time zone NOT NULL,
    data_fine timestamp without time zone NOT NULL,
    organizzatore_id integer NOT NULL
);


ALTER TABLE public.hackathon OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16515)
-- Name: hackathon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hackathon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hackathon_id_seq OWNER TO postgres;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 230
-- Name: hackathon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hackathon_id_seq OWNED BY public.hackathon.id;


--
-- TOC entry 229 (class 1259 OID 16498)
-- Name: invito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invito (
    mittente_id integer NOT NULL,
    destinatario_id integer NOT NULL,
    data_invito date NOT NULL,
    messaggio character varying NOT NULL
);


ALTER TABLE public.invito OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16404)
-- Name: organizzatore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizzatore (
    utente_id integer NOT NULL
);


ALTER TABLE public.organizzatore OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16424)
-- Name: partecipante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partecipante (
    utente_id integer NOT NULL,
    team_id integer
);


ALTER TABLE public.partecipante OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16444)
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id integer NOT NULL,
    nome_team character varying NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16529)
-- Name: team_hackathon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_hackathon (
    team_id integer NOT NULL,
    hackathon_id integer NOT NULL
);


ALTER TABLE public.team_hackathon OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16443)
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_id_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 224
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- TOC entry 218 (class 1259 OID 16396)
-- Name: utente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utente (
    id integer NOT NULL,
    nome character varying NOT NULL,
    cognome character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    data_nascita date
);


ALTER TABLE public.utente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16395)
-- Name: utente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utente_id_seq OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 217
-- Name: utente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utente_id_seq OWNED BY public.utente.id;


--
-- TOC entry 228 (class 1259 OID 16478)
-- Name: voto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voto (
    id integer NOT NULL,
    giudice_id integer NOT NULL,
    team_id integer NOT NULL,
    voto integer NOT NULL,
    CONSTRAINT voto_voto_check CHECK (((voto >= 0) AND (voto <= 10)))
);


ALTER TABLE public.voto OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16477)
-- Name: voto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.voto_id_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 227
-- Name: voto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voto_id_seq OWNED BY public.voto.id;


--
-- TOC entry 4787 (class 2604 OID 16438)
-- Name: documento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento ALTER COLUMN id SET DEFAULT nextval('public.documento_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 16519)
-- Name: hackathon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hackathon ALTER COLUMN id SET DEFAULT nextval('public.hackathon_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 16447)
-- Name: team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 16399)
-- Name: utente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utente ALTER COLUMN id SET DEFAULT nextval('public.utente_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 16481)
-- Name: voto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voto ALTER COLUMN id SET DEFAULT nextval('public.voto_id_seq'::regclass);


--
-- TOC entry 4981 (class 0 OID 16435)
-- Dependencies: 223
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documento (id, data, documento, team_id) FROM stdin;
\.


--
-- TOC entry 4984 (class 0 OID 16462)
-- Dependencies: 226
-- Data for Name: documento_giudice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documento_giudice (documento_id, giudice_id) FROM stdin;
\.


--
-- TOC entry 4978 (class 0 OID 16414)
-- Dependencies: 220
-- Data for Name: giudice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.giudice (utente_id) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 16516)
-- Dependencies: 231
-- Data for Name: hackathon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hackathon (id, titolo, sede, massimo_partecipanti, dimensione_team, data_inizio, data_fine, organizzatore_id) FROM stdin;
\.


--
-- TOC entry 4987 (class 0 OID 16498)
-- Dependencies: 229
-- Data for Name: invito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invito (mittente_id, destinatario_id, data_invito, messaggio) FROM stdin;
\.


--
-- TOC entry 4977 (class 0 OID 16404)
-- Dependencies: 219
-- Data for Name: organizzatore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizzatore (utente_id) FROM stdin;
\.


--
-- TOC entry 4979 (class 0 OID 16424)
-- Dependencies: 221
-- Data for Name: partecipante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partecipante (utente_id, team_id) FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 16444)
-- Dependencies: 225
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, nome_team) FROM stdin;
\.


--
-- TOC entry 4990 (class 0 OID 16529)
-- Dependencies: 232
-- Data for Name: team_hackathon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_hackathon (team_id, hackathon_id) FROM stdin;
\.


--
-- TOC entry 4976 (class 0 OID 16396)
-- Dependencies: 218
-- Data for Name: utente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utente (id, nome, cognome, email, password, data_nascita) FROM stdin;
\.


--
-- TOC entry 4986 (class 0 OID 16478)
-- Dependencies: 228
-- Data for Name: voto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voto (id, giudice_id, team_id, voto) FROM stdin;
\.


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 222
-- Name: documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documento_id_seq', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 230
-- Name: hackathon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hackathon_id_seq', 1, false);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 224
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 217
-- Name: utente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utente_id_seq', 1, false);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 227
-- Name: voto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voto_id_seq', 1, false);


--
-- TOC entry 4805 (class 2606 OID 16466)
-- Name: documento_giudice documento_giudice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento_giudice
    ADD CONSTRAINT documento_giudice_pkey PRIMARY KEY (documento_id, giudice_id);


--
-- TOC entry 4801 (class 2606 OID 16442)
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 16418)
-- Name: giudice giudice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giudice
    ADD CONSTRAINT giudice_pkey PRIMARY KEY (utente_id);


--
-- TOC entry 4813 (class 2606 OID 16523)
-- Name: hackathon hackathon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hackathon
    ADD CONSTRAINT hackathon_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 16504)
-- Name: invito invito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invito
    ADD CONSTRAINT invito_pkey PRIMARY KEY (mittente_id, destinatario_id);


--
-- TOC entry 4795 (class 2606 OID 16408)
-- Name: organizzatore organizzatore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizzatore
    ADD CONSTRAINT organizzatore_pkey PRIMARY KEY (utente_id);


--
-- TOC entry 4799 (class 2606 OID 16428)
-- Name: partecipante partecipante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipante
    ADD CONSTRAINT partecipante_pkey PRIMARY KEY (utente_id);


--
-- TOC entry 4815 (class 2606 OID 16533)
-- Name: team_hackathon team_hackathon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_hackathon
    ADD CONSTRAINT team_hackathon_pkey PRIMARY KEY (team_id, hackathon_id);


--
-- TOC entry 4803 (class 2606 OID 16451)
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 16403)
-- Name: utente utente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utente
    ADD CONSTRAINT utente_pkey PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 16486)
-- Name: voto voto_giudice_id_team_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_giudice_id_team_id_key UNIQUE (giudice_id, team_id);


--
-- TOC entry 4809 (class 2606 OID 16484)
-- Name: voto voto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_pkey PRIMARY KEY (id);


--
-- TOC entry 4821 (class 2606 OID 16467)
-- Name: documento_giudice documento_giudice_documento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento_giudice
    ADD CONSTRAINT documento_giudice_documento_id_fkey FOREIGN KEY (documento_id) REFERENCES public.documento(id) ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 16472)
-- Name: documento_giudice documento_giudice_giudice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento_giudice
    ADD CONSTRAINT documento_giudice_giudice_id_fkey FOREIGN KEY (giudice_id) REFERENCES public.giudice(utente_id) ON DELETE CASCADE;


--
-- TOC entry 4827 (class 2606 OID 16524)
-- Name: hackathon fk_organizzatore; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hackathon
    ADD CONSTRAINT fk_organizzatore FOREIGN KEY (organizzatore_id) REFERENCES public.organizzatore(utente_id) ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 16452)
-- Name: partecipante fk_team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipante
    ADD CONSTRAINT fk_team FOREIGN KEY (team_id) REFERENCES public.team(id) ON DELETE SET NULL;


--
-- TOC entry 4820 (class 2606 OID 16457)
-- Name: documento fk_team_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT fk_team_documento FOREIGN KEY (team_id) REFERENCES public.team(id) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 16419)
-- Name: giudice giudice_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giudice
    ADD CONSTRAINT giudice_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utente(id) ON DELETE CASCADE;


--
-- TOC entry 4825 (class 2606 OID 16510)
-- Name: invito invito_destinatario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invito
    ADD CONSTRAINT invito_destinatario_id_fkey FOREIGN KEY (destinatario_id) REFERENCES public.utente(id) ON DELETE CASCADE;


--
-- TOC entry 4826 (class 2606 OID 16505)
-- Name: invito invito_mittente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invito
    ADD CONSTRAINT invito_mittente_id_fkey FOREIGN KEY (mittente_id) REFERENCES public.utente(id) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 16409)
-- Name: organizzatore organizzatore_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizzatore
    ADD CONSTRAINT organizzatore_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utente(id) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 16429)
-- Name: partecipante partecipante_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipante
    ADD CONSTRAINT partecipante_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utente(id) ON DELETE CASCADE;


--
-- TOC entry 4828 (class 2606 OID 16539)
-- Name: team_hackathon team_hackathon_hackathon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_hackathon
    ADD CONSTRAINT team_hackathon_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathon(id) ON DELETE CASCADE;


--
-- TOC entry 4829 (class 2606 OID 16534)
-- Name: team_hackathon team_hackathon_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_hackathon
    ADD CONSTRAINT team_hackathon_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(id) ON DELETE CASCADE;


--
-- TOC entry 4823 (class 2606 OID 16487)
-- Name: voto voto_giudice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_giudice_id_fkey FOREIGN KEY (giudice_id) REFERENCES public.giudice(utente_id) ON DELETE CASCADE;


--
-- TOC entry 4824 (class 2606 OID 16492)
-- Name: voto voto_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(id) ON DELETE CASCADE;


-- Completed on 2025-06-27 18:10:38

--
-- PostgreSQL database dump complete
--

