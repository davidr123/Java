--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

-- Started on 2018-09-07 22:41:41 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12469)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 58392)
-- Name: Administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Administrador" (
    usuario character varying(25),
    password character varying,
    rol character varying,
    id_administrador integer NOT NULL
);


ALTER TABLE public."Administrador" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 58465)
-- Name: Administrador_id_administrador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Administrador_id_administrador_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Administrador_id_administrador_seq" OWNER TO postgres;

--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 192
-- Name: Administrador_id_administrador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Administrador_id_administrador_seq" OWNED BY public."Administrador".id_administrador;


--
-- TOC entry 186 (class 1259 OID 58398)
-- Name: Imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Imagenes" (
    imagen character varying,
    descripcion character varying(100),
    id_partida integer,
    id_imagen integer NOT NULL
);


ALTER TABLE public."Imagenes" OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 58483)
-- Name: Imagenes_id_imagen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Imagenes_id_imagen_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Imagenes_id_imagen_seq" OWNER TO postgres;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 194
-- Name: Imagenes_id_imagen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Imagenes_id_imagen_seq" OWNED BY public."Imagenes".id_imagen;


--
-- TOC entry 187 (class 1259 OID 58404)
-- Name: Partida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Partida" (
    puntaje integer,
    piezas integer,
    intentos integer,
    usuarios_id integer,
    rompecabeza_id integer,
    id_partida integer NOT NULL
);


ALTER TABLE public."Partida" OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 58476)
-- Name: Partida_id_partida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Partida_id_partida_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Partida_id_partida_seq" OWNER TO postgres;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 193
-- Name: Partida_id_partida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Partida_id_partida_seq" OWNED BY public."Partida".id_partida;


--
-- TOC entry 188 (class 1259 OID 58407)
-- Name: Pieza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pieza" (
    id_pieza integer NOT NULL,
    url character varying(100)
);


ALTER TABLE public."Pieza" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 58410)
-- Name: Rompecabeza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rompecabeza" (
    id_rompecabeza integer NOT NULL,
    pieza_id integer
);


ALTER TABLE public."Rompecabeza" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 58413)
-- Name: Sesion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sesion" (
    id_sesion integer NOT NULL,
    usuarios_id integer
);


ALTER TABLE public."Sesion" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 58416)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuarios" (
    id_usuarios integer NOT NULL,
    usuarios character varying(10)
);


ALTER TABLE public."Usuarios" OWNER TO postgres;

--
-- TOC entry 2111 (class 2604 OID 58467)
-- Name: Administrador id_administrador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Administrador" ALTER COLUMN id_administrador SET DEFAULT nextval('public."Administrador_id_administrador_seq"'::regclass);


--
-- TOC entry 2112 (class 2604 OID 58485)
-- Name: Imagenes id_imagen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Imagenes" ALTER COLUMN id_imagen SET DEFAULT nextval('public."Imagenes_id_imagen_seq"'::regclass);


--
-- TOC entry 2113 (class 2604 OID 58478)
-- Name: Partida id_partida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Partida" ALTER COLUMN id_partida SET DEFAULT nextval('public."Partida_id_partida_seq"'::regclass);


--
-- TOC entry 2253 (class 0 OID 58392)
-- Dependencies: 185
-- Data for Name: Administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Administrador" (usuario, password, rol, id_administrador) FROM stdin;
prueba	as	admin	1
fradae	da	visitante	2
gloria	sdas	administrador	3
jango	12	admn	6
\.


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 192
-- Name: Administrador_id_administrador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Administrador_id_administrador_seq"', 6, true);


--
-- TOC entry 2254 (class 0 OID 58398)
-- Dependencies: 186
-- Data for Name: Imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Imagenes" (imagen, descripcion, id_partida, id_imagen) FROM stdin;
\.


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 194
-- Name: Imagenes_id_imagen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Imagenes_id_imagen_seq"', 1, false);


--
-- TOC entry 2255 (class 0 OID 58404)
-- Dependencies: 187
-- Data for Name: Partida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Partida" (puntaje, piezas, intentos, usuarios_id, rompecabeza_id, id_partida) FROM stdin;
12	8	3	1	1	2
2	4	21	3	1	1
\.


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 193
-- Name: Partida_id_partida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Partida_id_partida_seq"', 2, true);


--
-- TOC entry 2256 (class 0 OID 58407)
-- Dependencies: 188
-- Data for Name: Pieza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pieza" (id_pieza, url) FROM stdin;
1	www.google.com
\.


--
-- TOC entry 2257 (class 0 OID 58410)
-- Dependencies: 189
-- Data for Name: Rompecabeza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rompecabeza" (id_rompecabeza, pieza_id) FROM stdin;
1	1
\.


--
-- TOC entry 2258 (class 0 OID 58413)
-- Dependencies: 190
-- Data for Name: Sesion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sesion" (id_sesion, usuarios_id) FROM stdin;
1	1
\.


--
-- TOC entry 2259 (class 0 OID 58416)
-- Dependencies: 191
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuarios" (id_usuarios, usuarios) FROM stdin;
1	hola
\.


--
-- TOC entry 2115 (class 2606 OID 58475)
-- Name: Administrador id_administrador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Administrador"
    ADD CONSTRAINT id_administrador PRIMARY KEY (id_administrador);


--
-- TOC entry 2118 (class 2606 OID 58495)
-- Name: Imagenes id_imag; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Imagenes"
    ADD CONSTRAINT id_imag PRIMARY KEY (id_imagen);


--
-- TOC entry 2122 (class 2606 OID 58493)
-- Name: Partida id_partida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Partida"
    ADD CONSTRAINT id_partida PRIMARY KEY (id_partida);


--
-- TOC entry 2124 (class 2606 OID 58426)
-- Name: Pieza id_pieza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pieza"
    ADD CONSTRAINT id_pieza PRIMARY KEY (id_pieza);


--
-- TOC entry 2127 (class 2606 OID 58428)
-- Name: Rompecabeza id_rompecabeza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rompecabeza"
    ADD CONSTRAINT id_rompecabeza PRIMARY KEY (id_rompecabeza);


--
-- TOC entry 2129 (class 2606 OID 58430)
-- Name: Sesion id_sesion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sesion"
    ADD CONSTRAINT id_sesion PRIMARY KEY (id_sesion);


--
-- TOC entry 2131 (class 2606 OID 58432)
-- Name: Usuarios id_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT id_usuarios PRIMARY KEY (id_usuarios);


--
-- TOC entry 2116 (class 1259 OID 58501)
-- Name: fki_id_par; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_par ON public."Imagenes" USING btree (id_partida);


--
-- TOC entry 2119 (class 1259 OID 58433)
-- Name: fki_partida; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_partida ON public."Partida" USING btree (rompecabeza_id);


--
-- TOC entry 2125 (class 1259 OID 58434)
-- Name: fki_pieza; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pieza ON public."Rompecabeza" USING btree (pieza_id);


--
-- TOC entry 2120 (class 1259 OID 58507)
-- Name: fki_usuario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_usuario ON public."Partida" USING btree (usuarios_id);


--
-- TOC entry 2134 (class 2606 OID 58440)
-- Name: Rompecabeza fk_rompecabeza; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rompecabeza"
    ADD CONSTRAINT fk_rompecabeza FOREIGN KEY (pieza_id) REFERENCES public."Pieza"(id_pieza);


--
-- TOC entry 2135 (class 2606 OID 58450)
-- Name: Usuarios fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuarios) REFERENCES public."Sesion"(id_sesion);


--
-- TOC entry 2132 (class 2606 OID 58496)
-- Name: Imagenes id_par; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Imagenes"
    ADD CONSTRAINT id_par FOREIGN KEY (id_partida) REFERENCES public."Partida"(id_partida);


--
-- TOC entry 2133 (class 2606 OID 58502)
-- Name: Partida usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Partida"
    ADD CONSTRAINT usuario FOREIGN KEY (usuarios_id) REFERENCES public."Administrador"(id_administrador);


-- Completed on 2018-09-07 22:41:42 -05

--
-- PostgreSQL database dump complete
--

