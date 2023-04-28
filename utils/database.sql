--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.paisos DROP CONSTRAINT  IF EXISTS paisos_regions_fk;
ALTER TABLE IF EXISTS ONLY public.localitzacions DROP CONSTRAINT  IF EXISTS localitzacions_paisos_fk;
ALTER TABLE IF EXISTS ONLY public.historial_treballs DROP CONSTRAINT  IF EXISTS historial_treballs_treballs_fk;
ALTER TABLE IF EXISTS ONLY public.historial_treballs DROP CONSTRAINT  IF EXISTS historial_treballs_departaments_fk;
ALTER TABLE IF EXISTS ONLY public.empleats DROP CONSTRAINT  IF EXISTS empleats_treballs_fk;
ALTER TABLE IF EXISTS ONLY public.departaments DROP CONSTRAINT  IF EXISTS departaments_localitzacions_fk;
ALTER TABLE IF EXISTS ONLY public.departaments DROP CONSTRAINT  IF EXISTS departaments_cap_fk;
ALTER TABLE IF EXISTS ONLY public.treballs DROP CONSTRAINT  IF EXISTS treballs_pk;
ALTER TABLE IF EXISTS ONLY public.regions DROP CONSTRAINT  IF EXISTS regions_pk;
ALTER TABLE IF EXISTS ONLY public.paisos DROP CONSTRAINT  IF EXISTS paisos_pk;
ALTER TABLE IF EXISTS ONLY public.localitzacions DROP CONSTRAINT  IF EXISTS localitzacions_pk;
ALTER TABLE IF EXISTS ONLY public.historial_treballs DROP CONSTRAINT  IF EXISTS historial_treballs_pk;
ALTER TABLE IF EXISTS ONLY public.empleats DROP CONSTRAINT  IF EXISTS empleats_pk;
ALTER TABLE IF EXISTS ONLY public.departaments DROP CONSTRAINT  IF EXISTS departament_pk;
DROP TABLE  IF EXISTS public.treballs;
DROP TABLE  IF EXISTS public.regions;
DROP TABLE  IF EXISTS public.paisos;
DROP TABLE  IF EXISTS public.localitzacions;
DROP TABLE  IF EXISTS public.historial_treballs;
DROP TABLE  IF EXISTS public.empleats;
DROP TABLE  IF EXISTS public.departaments;
DROP TABLE  IF EXISTS public.categories;
DROP EXTENSION  IF EXISTS plpgsql;
DROP SCHEMA  IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    categoria character varying(3),
    salari_mesbaix smallint,
    salari_mesalt integer
);


ALTER TABLE IF EXISTS categories OWNER TO postgres;

--
-- Name: departaments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departaments (
    id_departament smallint NOT NULL,
    nom_departament character varying(30),
    id_cap smallint,
    id_localitzacio smallint
);


ALTER TABLE IF EXISTS departaments OWNER TO postgres;

--
-- Name: empleats; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empleats (
    id_empleat smallint NOT NULL,
    nom character varying(20),
    cognoms character varying(25),
    email character varying(25),
    telefon character varying(20),
    data_contractacio timestamp without time zone,
    id_treball character varying(10),
    salari numeric,
    pct_commissio numeric,
    id_cap smallint,
    id_departament smallint
);


ALTER TABLE IF EXISTS empleats OWNER TO postgres;

--
-- Name: historial_treballs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE historial_treballs (
    id_empleat smallint NOT NULL,
    id_treball character varying(10) NOT NULL,
    data_inici timestamp without time zone,
    data_fi timestamp without time zone,
    id_departament smallint
);


ALTER TABLE IF EXISTS historial_treballs OWNER TO postgres;

--
-- Name: localitzacions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE localitzacions (
    id_localitzacio smallint NOT NULL,
    adreca character varying(40),
    codi_postal character varying(12),
    ciutat character varying(30),
    estat_provincia character varying(25),
    id_pais character(2)
);


ALTER TABLE IF EXISTS localitzacions OWNER TO postgres;

--
-- Name: paisos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE paisos (
    id_pais character(2) NOT NULL,
    nom_pais character varying(40),
    id_regio smallint
);


ALTER TABLE IF EXISTS paisos OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE regions (
    id_regio smallint NOT NULL,
    nom_regio character varying(25)
);


ALTER TABLE IF EXISTS regions OWNER TO postgres;

--
-- Name: treballs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE treballs (
    id_treball character varying(10) NOT NULL,
    nom_treball character varying(35),
    salari_min integer,
    salari_max integer
);


ALTER TABLE IF EXISTS treballs OWNER TO postgres;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (categoria, salari_mesbaix, salari_mesalt) FROM stdin;
B	3000	5999
C	6000	9999
D	10000	14999
E	15000	24999
F	25000	40000
B	3000	5999
C	6000	9999
D	10000	14999
E	15000	24999
F	25000	40000
B	3000	5999
C	6000	9999
D	10000	14999
E	15000	24999
F	25000	40000
B	3000	5999
C	6000	9999
D	10000	14999
E	15000	24999
F	25000	40000
B	3000	5999
C	6000	9999
D	10000	14999
E	15000	24999
F	25000	40000
B	3000	5999
C	6000	9999
D	10000	14999
E	15000	24999
F	25000	40000
A	500	2999
A	500	2999
A	500	2999
A	500	2999
A	500	2999
A	500	2999
\.


--
-- Data for Name: departaments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departaments (id_departament, nom_departament, id_cap, id_localitzacio) FROM stdin;
10	Administration	200	1700
20	Marketing	201	1800
50	Shipping	124	1500
60	IT	103	1400
80	Sales	149	2500
90	Executive	100	1700
110	Accounting	205	1700
190	Contracting	\N	1700
145	RRHH	200	1700
\.


--
-- Data for Name: empleats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empleats (id_empleat, nom, cognoms, email, telefon, data_contractacio, id_treball, salari, pct_commissio, id_cap, id_departament) FROM stdin;
101	Neena	Kochhar	NKOCHHAR	515.123.4568	1989-09-21 00:00:00	AD_VP	17000	\N	100	90
103	Alexander	Hunold	AHUNOLD	590.423.4567	1990-01-03 00:00:00	IT_PROG	9000	\N	102	60
104	Bruce	Ernst	BERNST	590.423.4568	1991-05-21 00:00:00	IT_PROG	6000	\N	103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	1999-02-07 00:00:00	IT_PROG	4200	\N	103	60
124	Kevin	Mourgos	KMOURGOS	650.123.5234	1999-11-16 00:00:00	ST_MAN	5800	\N	100	50
141	Trenna	Rajs	TRAJS	650.121.8009	1995-10-17 00:00:00	ST_CLERK	3500	\N	124	50
142	Curtis	Davies	CDAVIES	650.121.2994	1997-01-29 00:00:00	ST_CLERK	3100	\N	124	50
143	Randall	Matos	RMATOS	650.121.2874	1998-03-15 00:00:00	ST_CLERK	2600	\N	124	50
144	Peter	Vargas	PVARGAS	650.121.2004	1998-09-07 00:00:00	ST_CLERK	2500	\N	124	50
149	Eleni	Zlotkey	EZLOTKEY	011.44.1344.429018	2000-01-29 00:00:00	SA_MAN	10500	0.2	100	80
174	Ellen	Abel	EABEL	011.44.1644.429267	1996-05-11 00:00:00	SA_REP	11000	0.3	149	80
176	Jonathan	Taylor	JTAYLOR	011.44.1644.429265	1998-03-24 00:00:00	SA_REP	8600	0.2	149	80
178	Kimberely	Grant	KGRANT	011.44.1644.429263	1999-05-24 00:00:00	SA_REP	7000	0.15	149	\N
200	Jennifer	Whalen	JWHALEN	515.123.4444	1987-09-17 00:00:00	AD_ASST	4400	\N	101	10
201	Michael	Hartstein	MHARTSTE	515.123.5555	1996-02-17 00:00:00	MK_MAN	13000	\N	100	20
202	Pat	Fay	PFAY	603.123.6666	1997-08-17 00:00:00	MK_REP	6000	\N	201	20
205	Shelley	Higgins	SHIGGINS	515.123.8080	1994-06-07 00:00:00	AC_MGR	12000	\N	101	110
206	William	Gietz	WGIETZ	515.123.8181	1994-06-07 00:00:00	AC_ACCOUNT	8300	\N	205	110
100	Steven	King	SKING	515.123.4567	1987-06-17 00:00:00	AD_PRES	96000	\N	\N	90
102	Alex	De Haan	LDEHAAN	515.123.4569	1993-01-13 00:00:00	AD_VP	17000	\N	100	90
\.


--
-- Data for Name: historial_treballs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY historial_treballs (id_empleat, id_treball, data_inici, data_fi, id_departament) FROM stdin;
101	AC_ACCOUNT	1989-09-21 00:00:00	1993-10-27 00:00:00	110
101	AC_MGR	1993-10-28 00:00:00	1997-03-15 00:00:00	110
102	IT_PROG	1993-01-13 00:00:00	1998-07-24 00:00:00	60
142	ST_CLERK	1999-01-01 00:00:00	1999-12-31 00:00:00	50
144	ST_CLERK	1998-03-24 00:00:00	1999-12-31 00:00:00	50
176	SA_MAN	1999-01-01 00:00:00	1999-12-31 00:00:00	80
176	SA_REP	1998-03-24 00:00:00	1998-12-31 00:00:00	80
200	AC_ACCOUNT	1994-07-01 00:00:00	1998-12-31 00:00:00	90
200	AD_ASST	1987-09-17 00:00:00	1993-06-17 00:00:00	90
201	MK_REP	1996-02-17 00:00:00	1999-12-19 00:00:00	20
\.


--
-- Data for Name: localitzacions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY localitzacions (id_localitzacio, adreca, codi_postal, ciutat, estat_provincia, id_pais) FROM stdin;
1400	2014 Jabberwocky Rd	26192	Southlake	Texas	US
1500	2001 Interiors Blvd	99236	South San Francisco	California	US
1700	2004 Charade Rd	98199	Seattle	Washington	US
1800	460 Bloor St. W.	ON M5S 1X8	Toronto	Ontario	CA
2500	Magdalen Centre, The Ofxord Science Park	OX9 9ZB	Oxford	Oxford	UK
\.


--
-- Data for Name: paisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY paisos (id_pais, nom_pais, id_regio) FROM stdin;
CA	Canada	2
DE	Germany	1
UK	United Kingdom	1
US	United States of America	2
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY regions (id_regio, nom_regio) FROM stdin;
1	Europe
2	Americas
\.


--
-- Data for Name: treballs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY treballs (id_treball, nom_treball, salari_min, salari_max) FROM stdin;
AC_ACCOUNT	Public Accountant	4200	9000
AC_MGR	Accounting Manager	8200	16000
AD_ASST	Administration Assistant	3000	6000
AD_PRES	President	20000	40000
AD_VP	Administration Vice President	15000	30000
IT_PROG	Programmer	4000	10000
MK_MAN	Marketing Manager	9000	15000
MK_REP	Marketing Representative	4000	9000
SA_MAN	Sales Manager	10000	20000
SA_REP	Sales Representative	6000	12000
ST_CLERK	Stock Clerk	2000	5000
ST_MAN	Stock Manager	5500	8500
\.


--
-- Name: departament_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE IF EXISTS ONLY departaments
    ADD CONSTRAINT departament_pk PRIMARY KEY (id_departament);


--
-- Name: empleats_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE IF EXISTS ONLY empleats
    ADD CONSTRAINT empleats_pk PRIMARY KEY (id_empleat);


--
-- Name: historial_treballs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE IF EXISTS ONLY historial_treballs
    ADD CONSTRAINT historial_treballs_pk PRIMARY KEY (id_empleat, id_treball);


--
-- Name: localitzacions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE IF EXISTS ONLY localitzacions
    ADD CONSTRAINT localitzacions_pk PRIMARY KEY (id_localitzacio);


--
-- Name: paisos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE IF EXISTS ONLY paisos
    ADD CONSTRAINT paisos_pk PRIMARY KEY (id_pais);


--
-- Name: regions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE IF EXISTS ONLY regions
    ADD CONSTRAINT regions_pk PRIMARY KEY (id_regio);


--
-- Name: treballs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE IF EXISTS ONLY treballs
    ADD CONSTRAINT treballs_pk PRIMARY KEY (id_treball);



--
-- Name: departaments_cap_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE IF EXISTS ONLY departaments
    ADD CONSTRAINT departaments_cap_fk FOREIGN KEY (id_cap) REFERENCES empleats(id_empleat);


--
-- Name: departaments_localitzacions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE IF EXISTS ONLY departaments
    ADD CONSTRAINT departaments_localitzacions_fk FOREIGN KEY (id_localitzacio) REFERENCES localitzacions(id_localitzacio);


--
-- Name: empleats_treballs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE IF EXISTS ONLY empleats
    ADD CONSTRAINT empleats_treballs_fk FOREIGN KEY (id_treball) REFERENCES treballs(id_treball);


--
-- Name: historial_treballs_departaments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE IF EXISTS ONLY historial_treballs
    ADD CONSTRAINT historial_treballs_departaments_fk FOREIGN KEY (id_departament) REFERENCES departaments(id_departament);


--
-- Name: historial_treballs_treballs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE IF EXISTS ONLY historial_treballs
    ADD CONSTRAINT historial_treballs_treballs_fk FOREIGN KEY (id_treball) REFERENCES treballs(id_treball);


--
-- Name: localitzacions_paisos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE IF EXISTS ONLY localitzacions
    ADD CONSTRAINT localitzacions_paisos_fk FOREIGN KEY (id_pais) REFERENCES paisos(id_pais);


--
-- Name: paisos_regions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE IF EXISTS ONLY paisos
    ADD CONSTRAINT paisos_regions_fk FOREIGN KEY (id_regio) REFERENCES regions(id_regio);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--