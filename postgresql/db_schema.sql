--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15 (Ubuntu 11.15-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.0

-- Started on 2022-03-01 08:57:42

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
-- TOC entry 220 (class 1259 OID 25798)
-- Name: alert_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert_type (
    id_alert integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.alert_type OWNER TO postgres;
--
-- TOC entry 196 (class 1259 OID 42686)
-- Name: area_points_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.area_points_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_points_seq OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 42688)
-- Name: area_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_points (
    id_point bigint DEFAULT nextval('public.area_points_seq'::regclass) NOT NULL,
    id_area_fk bigint NOT NULL,
    x double precision NOT NULL,
    y double precision NOT NULL
);


ALTER TABLE public.area_points OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 42692)
-- Name: areas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 42694)
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id_area bigint DEFAULT nextval('public.areas_seq'::regclass) NOT NULL,
    id_stage_fk bigint,
    name character varying(40) NOT NULL,
    x float,
    y float,
    h float,
    w float,
    square boolean
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 42698)
-- Name: prohibitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prohibitions (
    id_area_fk bigint NOT NULL,
    id_tag_fk bigint NOT NULL
);


ALTER TABLE public.prohibitions OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 42701)
-- Name: stages_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stages_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stages_seq OWNER TO postgres;


CREATE SEQUENCE public.users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_user_seq OWNER TO postgres;
--
-- TOC entry 202 (class 1259 OID 42703)
-- Name: stages; Type: TABLE; Schema: public; Owner: postgres
--
create table public.roles
(
    id   serial
        constraint user_role___fk
            primary key,
    role varchar(50)
);

alter table public.roles
    owner to postgres;

CREATE TABLE public.users (
    id_user bigint DEFAULT nextval('public.users_id_user_seq'::regclass) NOT NULL,
    name_ character varying(40) ,
    surname character varying(40) ,
    id_rol  integer
        constraint user_role___fk
            references public.roles,    pass character varying(100) NOT NULL,
    username character varying(40) UNIQUE NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;





CREATE TABLE public.stages (
    id_stage bigint DEFAULT nextval('public.stages_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    width double precision NOT NULL,
    height double precision NOT NULL,
    img_src character varying(100)
);


ALTER TABLE public.stages OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 42707)
-- Name: tag_pos; Type: TABLE; Schema: public; Owner: postgres
--
create table public.pos_origin
(
    id   serial
        constraint pos_origin_pk
            primary key,
    type varchar(50)
);

alter table public.pos_origin
    owner to postgres;

--
-- TOC entry 219 (class 1259 OID 25788)
-- Name: tag_alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag_alerts (
    id_tag_fk bigint NOT NULL,
    datetime timestamp with time zone NOT NULL,
    alert_type_fk integer NOT NULL,
    deleted boolean,
    stoped timestamp with time zone
);

ALTER TABLE public.tag_alerts OWNER TO postgres;

CREATE TABLE public.tag_pos (
    datetime timestamp(6) with time zone NOT NULL,
    x double precision NOT NULL,
    y double precision NOT NULL,
    z double precision NOT NULL,
    hpl double precision,
    id_tag_fk bigint NOT NULL,
    vpl double precision NOT NULL,
    msg_type  integer
    constraint tag_type___fk
        references public.pos_origin,
    tag_name character varying(100)
);


ALTER TABLE public.tag_pos OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 42710)
-- Name: tags_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 42712)
-- Name: tag_refs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag_refs (
    name character varying(40),
    img_src character varying(40),
    id_stage_fk bigint NOT NULL,
    tag character(20),
    id_tag bigint DEFAULT nextval('public.tags_seq'::regclass) NOT NULL,
    img_alert character varying(40),
    detention boolean
);


ALTER TABLE public.tag_refs OWNER TO postgres;

--
-- TOC entry 3221 (class 2606 OID 25804)
-- Name: alert_type alert_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_type
    ADD CONSTRAINT alert_type_pkey PRIMARY KEY (id_alert);


--
-- TOC entry 2796 (class 2606 OID 42717)
-- Name: area_points area_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_points
    ADD CONSTRAINT area_points_pkey PRIMARY KEY (id_point);


--
-- TOC entry 2798 (class 2606 OID 42719)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id_area);


--
-- TOC entry 2802 (class 2606 OID 42721)
-- Name: prohibitions prohibitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prohibitions
    ADD CONSTRAINT prohibitions_pkey PRIMARY KEY (id_tag_fk, id_area_fk);


--
-- TOC entry 2804 (class 2606 OID 42723)
-- Name: stages stages_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stages
    ADD CONSTRAINT stages_name_key UNIQUE (name);


--
-- TOC entry 2806 (class 2606 OID 42725)
-- Name: stages stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id_stage);


--
-- TOC entry 3219 (class 2606 OID 25792)
-- Name: tag_alert tag_alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_alerts
    ADD CONSTRAINT tag_alert_pkey PRIMARY KEY (id_tag_fk, datetime, alert_type_fk);


--
-- TOC entry 2809 (class 2606 OID 102208)
-- Name: tag_pos tag_pos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_pos
    ADD CONSTRAINT tag_pos_pkey PRIMARY KEY (id_tag_fk, datetime);


--
-- TOC entry 2812 (class 2606 OID 42729)
-- Name: tag_refs tag_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_refs
    ADD CONSTRAINT tag_refs_pkey PRIMARY KEY (id_tag);


--
-- TOC entry 2799 (class 1259 OID 42730)
-- Name: fki_prohibitions_id_tag_fk_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_prohibitions_id_tag_fk_fkey ON public.prohibitions USING btree (id_area_fk);


--
-- TOC entry 2800 (class 1259 OID 42731)
-- Name: fki_prohibitions_tag_refs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_prohibitions_tag_refs_fk ON public.prohibitions USING btree (id_tag_fk);


--
-- TOC entry 2807 (class 1259 OID 42732)
-- Name: fki_tag_pos_tag_refs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_tag_pos_tag_refs_fk ON public.tag_pos USING btree (id_tag_fk);


--
-- TOC entry 2810 (class 1259 OID 42733)
-- Name: fki_tag_refs_stages_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_tag_refs_stages_fk ON public.tag_refs USING btree (id_stage_fk);


--
-- TOC entry 3229 (class 2606 OID 25805)
-- Name: tag_alert alert_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_alerts
    ADD CONSTRAINT alert_type_fk FOREIGN KEY (alert_type_fk) REFERENCES public.alert_type(id_alert);


--
-- TOC entry 2813 (class 2606 OID 42734)
-- Name: area_points area_points_id_area_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_points
    ADD CONSTRAINT area_points_id_area_fk_fkey FOREIGN KEY (id_area_fk) REFERENCES public.areas(id_area);


--
-- TOC entry 2814 (class 2606 OID 42739)
-- Name: areas areas_id_stage_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_id_stage_fk_fkey FOREIGN KEY (id_stage_fk) REFERENCES public.stages(id_stage);


--
-- TOC entry 3222 (class 2606 OID 25793)
-- Name: tag_alert id_tag_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_alerts
    ADD CONSTRAINT id_tag_fk FOREIGN KEY (id_tag_fk) REFERENCES public.tag_refs(id_tag);


--
-- TOC entry 2815 (class 2606 OID 42744)
-- Name: prohibitions prohibitions_id_area_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prohibitions
    ADD CONSTRAINT prohibitions_id_area_fk_fkey FOREIGN KEY (id_area_fk) REFERENCES public.areas(id_area);


--
-- TOC entry 2816 (class 2606 OID 42749)
-- Name: prohibitions prohibitions_tag_refs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prohibitions
    ADD CONSTRAINT prohibitions_tag_refs_fk FOREIGN KEY (id_tag_fk) REFERENCES public.tag_refs(id_tag);


--
-- TOC entry 2817 (class 2606 OID 42754)
-- Name: tag_pos tag_pos_tag_refs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_pos
    ADD CONSTRAINT tag_pos_tag_refs_fk FOREIGN KEY (id_tag_fk) REFERENCES public.tag_refs(id_tag);


--
-- TOC entry 2818 (class 2606 OID 42759)
-- Name: tag_refs tag_refs_stages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_refs
    ADD CONSTRAINT tag_refs_stages_fk FOREIGN KEY (id_stage_fk) REFERENCES public.stages(id_stage);


-- Completed on 2022-03-01 08:57:42

--
-- PostgreSQL database dump complete
--
INSERT INTO public.alert_type (id_alert, name) VALUES (108, 'buttonPressed');
INSERT INTO public.pos_origin (id, type) VALUES (1, 'drawed');
INSERT INTO public.pos_origin (id, type) VALUES (2, 'real');
INSERT INTO public.roles (id, role) VALUES (1, 'admin');
INSERT INTO public.roles (id, role) VALUES (2, 'user');
INSERT INTO public.users (id_user, name_, surname, id_rol, pass, username) VALUES (0, 'admin', 'admin', 1, '$2a$07$OdQTDZXWOCchxIbWUOr.jOuVpjnyFDMdsTgE/cYzLzshOo4I0l/lm', 'admin');
