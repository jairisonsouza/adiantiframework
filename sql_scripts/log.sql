--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Debian 16.6-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-02-03 16:36:34

-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;

--
-- TOC entry 3416 (class 1262 OID 16385)
-- Name: log; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE log WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE log OWNER TO postgres;

\connect log

-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

-- CREATE SCHEMA public;


-- ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

-- COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16404)
-- Name: system_access_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_access_log (
    id integer NOT NULL,
    sessionid character varying(256),
    login character varying(256),
    login_time character varying(20),
    login_year character varying(4),
    login_month character varying(2),
    login_day character varying(2),
    logout_time character varying(20),
    impersonated character(1),
    access_ip character varying(45),
    impersonated_by character varying(200)
);


ALTER TABLE public.system_access_log OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16418)
-- Name: system_access_notification_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_access_notification_log (
    id integer NOT NULL,
    login character varying(256),
    email character varying(256),
    ip_address character varying(256),
    login_time character varying(256)
);


ALTER TABLE public.system_access_notification_log OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16390)
-- Name: system_change_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_change_log (
    id integer NOT NULL,
    logdate character varying(20),
    login character varying(256),
    tablename character varying(256),
    primarykey character varying(256),
    pkvalue character varying(256),
    operation character varying(256),
    columnname character varying(256),
    oldvalue text,
    newvalue text,
    access_ip character varying(256),
    transaction_id character varying(256),
    log_trace text,
    session_id character varying(256),
    class_name character varying(256),
    php_sapi character varying(256),
    log_year character varying(4),
    log_month character varying(2),
    log_day character varying(2)
);


ALTER TABLE public.system_change_log OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16411)
-- Name: system_request_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_request_log (
    id integer NOT NULL,
    endpoint text,
    logdate character varying(256),
    log_year character varying(4),
    log_month character varying(2),
    log_day character varying(2),
    session_id character varying(256),
    login character varying(256),
    access_ip character varying(256),
    class_name character varying(256),
    class_method character varying(256),
    http_host character varying(256),
    server_port character varying(256),
    request_uri text,
    request_method character varying(256),
    query_string text,
    request_headers text,
    request_body text,
    request_duration integer
);


ALTER TABLE public.system_request_log OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16425)
-- Name: system_schedule_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_schedule_log (
    id integer NOT NULL,
    logdate character varying(19),
    title character varying(256),
    class_name character varying(256),
    method character varying(256),
    status character varying(1),
    message text
);


ALTER TABLE public.system_schedule_log OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16397)
-- Name: system_sql_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_sql_log (
    id integer NOT NULL,
    logdate character varying(20),
    login character varying(256),
    database_name character varying(256),
    sql_command text,
    statement_type character varying(256),
    access_ip character varying(45),
    transaction_id character varying(256),
    log_trace text,
    session_id character varying(256),
    class_name character varying(256),
    php_sapi character varying(256),
    request_id character varying(256),
    log_year character varying(4),
    log_month character varying(2),
    log_day character varying(2)
);


ALTER TABLE public.system_sql_log OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 16404)
-- Dependencies: 217
-- Data for Name: system_access_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_access_log (id, sessionid, login, login_time, login_year, login_month, login_day, logout_time, impersonated, access_ip, impersonated_by) FROM stdin;
1	ldpi824cdujrco81tkclprrh0e	admin	2025-02-03 16:35:01	2025	02	03	\N	N	172.28.0.1	\N
\.


--
-- TOC entry 3409 (class 0 OID 16418)
-- Dependencies: 219
-- Data for Name: system_access_notification_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_access_notification_log (id, login, email, ip_address, login_time) FROM stdin;
\.


--
-- TOC entry 3405 (class 0 OID 16390)
-- Dependencies: 215
-- Data for Name: system_change_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_change_log (id, logdate, login, tablename, primarykey, pkvalue, operation, columnname, oldvalue, newvalue, access_ip, transaction_id, log_trace, session_id, class_name, php_sapi, log_year, log_month, log_day) FROM stdin;
\.


--
-- TOC entry 3408 (class 0 OID 16411)
-- Dependencies: 218
-- Data for Name: system_request_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_request_log (id, endpoint, logdate, log_year, log_month, log_day, session_id, login, access_ip, class_name, class_method, http_host, server_port, request_uri, request_method, query_string, request_headers, request_body, request_duration) FROM stdin;
\.


--
-- TOC entry 3410 (class 0 OID 16425)
-- Dependencies: 220
-- Data for Name: system_schedule_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_schedule_log (id, logdate, title, class_name, method, status, message) FROM stdin;
\.


--
-- TOC entry 3406 (class 0 OID 16397)
-- Dependencies: 216
-- Data for Name: system_sql_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_sql_log (id, logdate, login, database_name, sql_command, statement_type, access_ip, transaction_id, log_trace, session_id, class_name, php_sapi, request_id, log_year, log_month, log_day) FROM stdin;
\.


--
-- TOC entry 3245 (class 2606 OID 16410)
-- Name: system_access_log system_access_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_access_log
    ADD CONSTRAINT system_access_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 16424)
-- Name: system_access_notification_log system_access_notification_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_access_notification_log
    ADD CONSTRAINT system_access_notification_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 16396)
-- Name: system_change_log system_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_change_log
    ADD CONSTRAINT system_change_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16417)
-- Name: system_request_log system_request_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_request_log
    ADD CONSTRAINT system_request_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 16431)
-- Name: system_schedule_log system_schedule_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_schedule_log
    ADD CONSTRAINT system_schedule_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 16403)
-- Name: system_sql_log system_sql_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_sql_log
    ADD CONSTRAINT system_sql_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 1259 OID 16449)
-- Name: sys_access_log_day_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_access_log_day_idx ON public.system_access_log USING btree (login_day);


--
-- TOC entry 3241 (class 1259 OID 16446)
-- Name: sys_access_log_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_access_log_login_idx ON public.system_access_log USING btree (login);


--
-- TOC entry 3242 (class 1259 OID 16448)
-- Name: sys_access_log_month_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_access_log_month_idx ON public.system_access_log USING btree (login_month);


--
-- TOC entry 3243 (class 1259 OID 16447)
-- Name: sys_access_log_year_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_access_log_year_idx ON public.system_access_log USING btree (login_year);


--
-- TOC entry 3255 (class 1259 OID 16457)
-- Name: sys_access_notification_log_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_access_notification_log_login_idx ON public.system_access_notification_log USING btree (login);


--
-- TOC entry 3222 (class 1259 OID 16437)
-- Name: sys_change_log_class_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_change_log_class_idx ON public.system_change_log USING btree (class_name);


--
-- TOC entry 3223 (class 1259 OID 16433)
-- Name: sys_change_log_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_change_log_date_idx ON public.system_change_log USING btree (logdate);


--
-- TOC entry 3224 (class 1259 OID 16436)
-- Name: sys_change_log_day_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_change_log_day_idx ON public.system_change_log USING btree (log_day);


--
-- TOC entry 3225 (class 1259 OID 16432)
-- Name: sys_change_log_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_change_log_login_idx ON public.system_change_log USING btree (login);


--
-- TOC entry 3226 (class 1259 OID 16435)
-- Name: sys_change_log_month_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_change_log_month_idx ON public.system_change_log USING btree (log_month);


--
-- TOC entry 3227 (class 1259 OID 16438)
-- Name: sys_change_log_table_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_change_log_table_idx ON public.system_change_log USING btree (tablename);


--
-- TOC entry 3228 (class 1259 OID 16434)
-- Name: sys_change_log_year_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_change_log_year_idx ON public.system_change_log USING btree (log_year);


--
-- TOC entry 3246 (class 1259 OID 16455)
-- Name: sys_request_log_class_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_request_log_class_idx ON public.system_request_log USING btree (class_name);


--
-- TOC entry 3247 (class 1259 OID 16451)
-- Name: sys_request_log_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_request_log_date_idx ON public.system_request_log USING btree (logdate);


--
-- TOC entry 3248 (class 1259 OID 16454)
-- Name: sys_request_log_day_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_request_log_day_idx ON public.system_request_log USING btree (log_day);


--
-- TOC entry 3249 (class 1259 OID 16450)
-- Name: sys_request_log_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_request_log_login_idx ON public.system_request_log USING btree (login);


--
-- TOC entry 3250 (class 1259 OID 16456)
-- Name: sys_request_log_method_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_request_log_method_idx ON public.system_request_log USING btree (class_method);


--
-- TOC entry 3251 (class 1259 OID 16453)
-- Name: sys_request_log_month_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_request_log_month_idx ON public.system_request_log USING btree (log_month);


--
-- TOC entry 3252 (class 1259 OID 16452)
-- Name: sys_request_log_year_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_request_log_year_idx ON public.system_request_log USING btree (log_year);


--
-- TOC entry 3258 (class 1259 OID 16458)
-- Name: sys_schedule_log_class_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_schedule_log_class_idx ON public.system_schedule_log USING btree (class_name);


--
-- TOC entry 3259 (class 1259 OID 16459)
-- Name: sys_schedule_log_method_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_schedule_log_method_idx ON public.system_schedule_log USING btree (method);


--
-- TOC entry 3231 (class 1259 OID 16442)
-- Name: sys_sql_log_class_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_sql_log_class_idx ON public.system_sql_log USING btree (class_name);


--
-- TOC entry 3232 (class 1259 OID 16441)
-- Name: sys_sql_log_database_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_sql_log_database_idx ON public.system_sql_log USING btree (database_name);


--
-- TOC entry 3233 (class 1259 OID 16440)
-- Name: sys_sql_log_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_sql_log_date_idx ON public.system_sql_log USING btree (logdate);


--
-- TOC entry 3234 (class 1259 OID 16445)
-- Name: sys_sql_log_day_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_sql_log_day_idx ON public.system_sql_log USING btree (log_day);


--
-- TOC entry 3235 (class 1259 OID 16439)
-- Name: sys_sql_log_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_sql_log_login_idx ON public.system_sql_log USING btree (login);


--
-- TOC entry 3236 (class 1259 OID 16444)
-- Name: sys_sql_log_month_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_sql_log_month_idx ON public.system_sql_log USING btree (log_month);


--
-- TOC entry 3237 (class 1259 OID 16443)
-- Name: sys_sql_log_year_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_sql_log_year_idx ON public.system_sql_log USING btree (log_year);


-- Completed on 2025-02-03 16:36:34

--
-- PostgreSQL database dump complete
--

