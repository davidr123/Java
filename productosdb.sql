--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

-- Started on 2018-09-07 21:47:44 -05

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
-- TOC entry 2261 (class 0 OID 0)
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
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 192
-- Name: Administrador_id_administrador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Administrador_id_administrador_seq" OWNED BY public."Administrador".id_administrador;


--
-- TOC entry 186 (class 1259 OID 58398)
-- Name: Imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Imagenes" (
    id_imagen integer NOT NULL,
    imagen character varying,
    descripcion character varying(100),
    id_partida integer
);


ALTER TABLE public."Imagenes" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 58404)
-- Name: Partida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Partida" (
    id_partida integer NOT NULL,
    puntaje integer,
    piezas integer,
    intentos integer,
    usuarios_id integer,
    rompecabeza_id integer
);


ALTER TABLE public."Partida" OWNER TO postgres;

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
-- TOC entry 2107 (class 2604 OID 58467)
-- Name: Administrador id_administrador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Administrador" ALTER COLUMN id_administrador SET DEFAULT nextval('public."Administrador_id_administrador_seq"'::regclass);


--
-- TOC entry 2246 (class 0 OID 58392)
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
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 192
-- Name: Administrador_id_administrador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Administrador_id_administrador_seq"', 6, true);


--
-- TOC entry 2247 (class 0 OID 58398)
-- Dependencies: 186
-- Data for Name: Imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Imagenes" (id_imagen, imagen, descripcion, id_partida) FROM stdin;
\.


--
-- TOC entry 2248 (class 0 OID 58404)
-- Dependencies: 187
-- Data for Name: Partida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Partida" (id_partida, puntaje, piezas, intentos, usuarios_id, rompecabeza_id) FROM stdin;
1	2	4	21	1	1
\.


--
-- TOC entry 2249 (class 0 OID 58407)
-- Dependencies: 188
-- Data for Name: Pieza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pieza" (id_pieza, url) FROM stdin;
1	www.google.com
\.


--
-- TOC entry 2250 (class 0 OID 58410)
-- Dependencies: 189
-- Data for Name: Rompecabeza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rompecabeza" (id_rompecabeza, pieza_id) FROM stdin;
1	1
\.


--
-- TOC entry 2251 (class 0 OID 58413)
-- Dependencies: 190
-- Data for Name: Sesion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sesion" (id_sesion, usuarios_id) FROM stdin;
1	1
\.


--
-- TOC entry 2252 (class 0 OID 58416)
-- Dependencies: 191
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuarios" (id_usuarios, usuarios) FROM stdin;
1	hola
\.


--
-- TOC entry 2109 (class 2606 OID 58475)
-- Name: Administrador id_administrador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Administrador"
    ADD CONSTRAINT id_administrador PRIMARY KEY (id_administrador);


--
-- TOC entry 2111 (class 2606 OID 58422)
-- Name: Imagenes id_imagen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Imagenes"
    ADD CONSTRAINT id_imagen PRIMARY KEY (id_imagen);


--
-- TOC entry 2114 (class 2606 OID 58424)
-- Name: Partida id_partida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Partida"
    ADD CONSTRAINT id_partida PRIMARY KEY (id_partida);


--
-- TOC entry 2116 (class 2606 OID 58426)
-- Name: Pieza id_pieza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pieza"
    ADD CONSTRAINT id_pieza PRIMARY KEY (id_pieza);


--
-- TOC entry 2119 (class 2606 OID 58428)
-- Name: Rompecabeza id_rompecabeza; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rompecabeza"
    ADD CONSTRAINT id_rompecabeza PRIMARY KEY (id_rompecabeza);


--
-- TOC entry 2121 (class 2606 OID 58430)
-- Name: Sesion id_sesion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sesion"
    ADD CONSTRAINT id_sesion PRIMARY KEY (id_sesion);


--
-- TOC entry 2123 (class 2606 OID 58432)
-- Name: Usuarios id_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT id_usuarios PRIMARY KEY (id_usuarios);


--
-- TOC entry 2112 (class 1259 OID 58433)
-- Name: fki_partida; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_partida ON public."Partida" USING btree (rompecabeza_id);


--
-- TOC entry 2117 (class 1259 OID 58434)
-- Name: fki_pieza; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_pieza ON public."Rompecabeza" USING btree (pieza_id);


--
-- TOC entry 2125 (class 2606 OID 58435)
-- Name: Partida fk_partida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Partida"
    ADD CONSTRAINT fk_partida FOREIGN KEY (rompecabeza_id) REFERENCES public."Rompecabeza"(id_rompecabeza);


--
-- TOC entry 2127 (class 2606 OID 58440)
-- Name: Rompecabeza fk_rompecabeza; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rompecabeza"
    ADD CONSTRAINT fk_rompecabeza FOREIGN KEY (pieza_id) REFERENCES public."Pieza"(id_pieza);


--
-- TOC entry 2128 (class 2606 OID 58450)
-- Name: Usuarios fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuarios) REFERENCES public."Sesion"(id_sesion);


--
-- TOC entry 2124 (class 2606 OID 58455)
-- Name: Imagenes id_partida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Imagenes"
    ADD CONSTRAINT id_partida FOREIGN KEY (id_partida) REFERENCES public."Partida"(id_partida);


--
-- TOC entry 2126 (class 2606 OID 58460)
-- Name: Partida id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Partida"
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_partida) REFERENCES public."Usuarios"(id_usuarios);


-- Completed on 2018-09-07 21:47:44 -05

--
-- PostgreSQL database dump complete
--

