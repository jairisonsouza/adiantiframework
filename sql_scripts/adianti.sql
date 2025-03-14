--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Debian 16.6-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-02-03 16:36:06

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
-- TOC entry 3663 (class 1262 OID 16384)
-- Name: adianti; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE adianti WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE adianti OWNER TO postgres;

\connect adianti

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
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

-- COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16514)
-- Name: system_document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_document (
    id integer NOT NULL,
    system_user_id integer,
    title character varying(256),
    description text,
    submission_date date,
    archive_date date,
    filename character varying(512),
    in_trash character(1),
    system_folder_id integer,
    content text,
    content_type character varying(100)
);


ALTER TABLE public.system_document OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16546)
-- Name: system_document_bookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_document_bookmark (
    id integer NOT NULL,
    system_user_id integer,
    system_document_id integer
);


ALTER TABLE public.system_document_bookmark OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16536)
-- Name: system_document_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_document_group (
    id integer NOT NULL,
    document_id integer,
    system_group_id integer
);


ALTER TABLE public.system_document_group OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16526)
-- Name: system_document_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_document_user (
    id integer NOT NULL,
    document_id integer,
    system_user_id integer
);


ALTER TABLE public.system_document_user OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16484)
-- Name: system_folder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_folder (
    id integer NOT NULL,
    system_user_id integer,
    created_at character varying(20),
    name character varying(256) NOT NULL,
    in_trash character(1),
    system_folder_parent_id integer
);


ALTER TABLE public.system_folder OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16556)
-- Name: system_folder_bookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_folder_bookmark (
    id integer NOT NULL,
    system_user_id integer,
    system_folder_id integer
);


ALTER TABLE public.system_folder_bookmark OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16504)
-- Name: system_folder_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_folder_group (
    id integer NOT NULL,
    system_folder_id integer,
    system_group_id integer
);


ALTER TABLE public.system_folder_group OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16494)
-- Name: system_folder_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_folder_user (
    id integer NOT NULL,
    system_folder_id integer,
    system_user_id integer
);


ALTER TABLE public.system_folder_user OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16687)
-- Name: system_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_group (
    id integer NOT NULL,
    name character varying(256)
);


ALTER TABLE public.system_group OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16780)
-- Name: system_group_program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_group_program (
    id integer NOT NULL,
    system_group_id integer,
    system_program_id integer
);


ALTER TABLE public.system_group_program OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16467)
-- Name: system_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_message (
    id integer NOT NULL,
    system_user_id integer,
    system_user_to_id integer,
    subject character varying(256),
    message text,
    dt_message character varying(20),
    checked character(1),
    removed character(1),
    viewed character(1),
    attachments text
);


ALTER TABLE public.system_message OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16474)
-- Name: system_message_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_message_tag (
    id integer NOT NULL,
    system_message_id integer NOT NULL,
    tag character varying(256) NOT NULL
);


ALTER TABLE public.system_message_tag OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16460)
-- Name: system_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_notification (
    id integer NOT NULL,
    system_user_id integer,
    system_user_to_id integer,
    subject character varying(256),
    message text,
    dt_message character varying(20),
    action_url text,
    action_label character varying(256),
    icon character varying(100),
    checked character(1)
);


ALTER TABLE public.system_notification OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16566)
-- Name: system_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_post (
    id integer NOT NULL,
    system_user_id integer,
    title character varying(256) NOT NULL,
    content text NOT NULL,
    created_at character varying(20),
    updated_at character varying(20),
    updated_by integer,
    active character(1) DEFAULT 'Y'::bpchar NOT NULL
);


ALTER TABLE public.system_post OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16594)
-- Name: system_post_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_post_comment (
    id integer NOT NULL,
    comment text NOT NULL,
    system_user_id integer NOT NULL,
    system_post_id integer NOT NULL,
    created_at character varying(20)
);


ALTER TABLE public.system_post_comment OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16606)
-- Name: system_post_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_post_like (
    id integer NOT NULL,
    system_user_id integer,
    system_post_id integer NOT NULL,
    created_at character varying(20)
);


ALTER TABLE public.system_post_like OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16574)
-- Name: system_post_share_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_post_share_group (
    id integer NOT NULL,
    system_group_id integer,
    system_post_id integer NOT NULL
);


ALTER TABLE public.system_post_share_group OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16584)
-- Name: system_post_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_post_tag (
    id integer NOT NULL,
    system_post_id integer NOT NULL,
    tag character varying(256) NOT NULL
);


ALTER TABLE public.system_post_tag OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16713)
-- Name: system_preference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_preference (
    id character varying(256),
    value text
);


ALTER TABLE public.system_preference OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16692)
-- Name: system_program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_program (
    id integer NOT NULL,
    name character varying(256),
    controller character varying(256)
);


ALTER TABLE public.system_program OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16820)
-- Name: system_program_method_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_program_method_role (
    id integer NOT NULL,
    system_program_id integer,
    system_role_id integer,
    method_name character varying(256)
);


ALTER TABLE public.system_program_method_role OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16706)
-- Name: system_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_role (
    id integer NOT NULL,
    name character varying(256),
    custom_code character varying(256)
);


ALTER TABLE public.system_role OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16645)
-- Name: system_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_schedule (
    id integer NOT NULL,
    schedule_type character(1),
    title character varying(256),
    class_name character varying(256),
    method character varying(256),
    monthday character(2),
    weekday character(1),
    hour character(2),
    minute character(2),
    active character(1)
);


ALTER TABLE public.system_schedule OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16699)
-- Name: system_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_unit (
    id integer NOT NULL,
    name character varying(256),
    connection_name character varying(256),
    custom_code character varying(256)
);


ALTER TABLE public.system_unit OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16750)
-- Name: system_user_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_user_group (
    id integer NOT NULL,
    system_user_id integer,
    system_group_id integer
);


ALTER TABLE public.system_user_group OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16810)
-- Name: system_user_old_password; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_user_old_password (
    id integer NOT NULL,
    system_user_id integer,
    password character varying(256),
    created_at character varying(20)
);


ALTER TABLE public.system_user_old_password OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16795)
-- Name: system_user_program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_user_program (
    id integer NOT NULL,
    system_user_id integer,
    system_program_id integer
);


ALTER TABLE public.system_user_program OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16765)
-- Name: system_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_user_role (
    id integer NOT NULL,
    system_user_id integer,
    system_role_id integer
);


ALTER TABLE public.system_user_role OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16735)
-- Name: system_user_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_user_unit (
    id integer NOT NULL,
    system_user_id integer,
    system_unit_id integer
);


ALTER TABLE public.system_user_unit OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16718)
-- Name: system_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_users (
    id integer NOT NULL,
    name character varying(256),
    login character varying(256),
    password character varying(256),
    email character varying(256),
    accepted_term_policy character(1),
    phone character varying(256),
    address character varying(256),
    function_name character varying(256),
    about text,
    accepted_term_policy_at character varying(20),
    accepted_term_policy_data text,
    frontpage_id integer,
    system_unit_id integer,
    active character(1),
    custom_code character varying(256),
    otp_secret character varying(256)
);


ALTER TABLE public.system_users OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16616)
-- Name: system_wiki_page; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_wiki_page (
    id integer NOT NULL,
    system_user_id integer,
    created_at character varying(20),
    updated_at character varying(20),
    title character varying(256) NOT NULL,
    description character varying(256),
    content text NOT NULL,
    active character(1) DEFAULT 'Y'::bpchar NOT NULL,
    searchable character(1) DEFAULT 'Y'::bpchar NOT NULL,
    updated_by integer
);


ALTER TABLE public.system_wiki_page OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16635)
-- Name: system_wiki_share_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_wiki_share_group (
    id integer NOT NULL,
    system_group_id integer,
    system_wiki_page_id integer NOT NULL
);


ALTER TABLE public.system_wiki_share_group OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16625)
-- Name: system_wiki_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_wiki_tag (
    id integer NOT NULL,
    system_wiki_page_id integer NOT NULL,
    tag character varying(256) NOT NULL
);


ALTER TABLE public.system_wiki_tag OWNER TO postgres;

--
-- TOC entry 3631 (class 0 OID 16514)
-- Dependencies: 221
-- Data for Name: system_document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_document (id, system_user_id, title, description, submission_date, archive_date, filename, in_trash, system_folder_id, content, content_type) FROM stdin;
\.


--
-- TOC entry 3634 (class 0 OID 16546)
-- Dependencies: 224
-- Data for Name: system_document_bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_document_bookmark (id, system_user_id, system_document_id) FROM stdin;
\.


--
-- TOC entry 3633 (class 0 OID 16536)
-- Dependencies: 223
-- Data for Name: system_document_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_document_group (id, document_id, system_group_id) FROM stdin;
\.


--
-- TOC entry 3632 (class 0 OID 16526)
-- Dependencies: 222
-- Data for Name: system_document_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_document_user (id, document_id, system_user_id) FROM stdin;
\.


--
-- TOC entry 3628 (class 0 OID 16484)
-- Dependencies: 218
-- Data for Name: system_folder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_folder (id, system_user_id, created_at, name, in_trash, system_folder_parent_id) FROM stdin;
\.


--
-- TOC entry 3635 (class 0 OID 16556)
-- Dependencies: 225
-- Data for Name: system_folder_bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_folder_bookmark (id, system_user_id, system_folder_id) FROM stdin;
\.


--
-- TOC entry 3630 (class 0 OID 16504)
-- Dependencies: 220
-- Data for Name: system_folder_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_folder_group (id, system_folder_id, system_group_id) FROM stdin;
\.


--
-- TOC entry 3629 (class 0 OID 16494)
-- Dependencies: 219
-- Data for Name: system_folder_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_folder_user (id, system_folder_id, system_user_id) FROM stdin;
\.


--
-- TOC entry 3645 (class 0 OID 16687)
-- Dependencies: 235
-- Data for Name: system_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_group (id, name) FROM stdin;
1	Template - Admin
2	Template - Users
3	Application - Programs
\.


--
-- TOC entry 3654 (class 0 OID 16780)
-- Dependencies: 244
-- Data for Name: system_group_program; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_group_program (id, system_group_id, system_program_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	2	29
30	2	30
31	2	31
32	2	32
33	2	33
34	2	34
35	2	35
36	2	36
37	2	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	2	46
47	2	47
48	2	48
49	2	49
50	2	50
51	2	51
52	2	52
53	2	53
54	2	54
55	2	55
56	2	56
57	2	57
58	2	58
59	2	59
60	2	60
61	2	61
62	2	62
63	2	63
64	2	64
\.


--
-- TOC entry 3626 (class 0 OID 16467)
-- Dependencies: 216
-- Data for Name: system_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_message (id, system_user_id, system_user_to_id, subject, message, dt_message, checked, removed, viewed, attachments) FROM stdin;
\.


--
-- TOC entry 3627 (class 0 OID 16474)
-- Dependencies: 217
-- Data for Name: system_message_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_message_tag (id, system_message_id, tag) FROM stdin;
\.


--
-- TOC entry 3625 (class 0 OID 16460)
-- Dependencies: 215
-- Data for Name: system_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_notification (id, system_user_id, system_user_to_id, subject, message, dt_message, action_url, action_label, icon, checked) FROM stdin;
\.


--
-- TOC entry 3636 (class 0 OID 16566)
-- Dependencies: 226
-- Data for Name: system_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_post (id, system_user_id, title, content, created_at, updated_at, updated_by, active) FROM stdin;
\.


--
-- TOC entry 3639 (class 0 OID 16594)
-- Dependencies: 229
-- Data for Name: system_post_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_post_comment (id, comment, system_user_id, system_post_id, created_at) FROM stdin;
\.


--
-- TOC entry 3640 (class 0 OID 16606)
-- Dependencies: 230
-- Data for Name: system_post_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_post_like (id, system_user_id, system_post_id, created_at) FROM stdin;
\.


--
-- TOC entry 3637 (class 0 OID 16574)
-- Dependencies: 227
-- Data for Name: system_post_share_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_post_share_group (id, system_group_id, system_post_id) FROM stdin;
\.


--
-- TOC entry 3638 (class 0 OID 16584)
-- Dependencies: 228
-- Data for Name: system_post_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_post_tag (id, system_post_id, tag) FROM stdin;
\.


--
-- TOC entry 3649 (class 0 OID 16713)
-- Dependencies: 239
-- Data for Name: system_preference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_preference (id, value) FROM stdin;
\.


--
-- TOC entry 3646 (class 0 OID 16692)
-- Dependencies: 236
-- Data for Name: system_program; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_program (id, name, controller) FROM stdin;
1	System Administration Dashboard	SystemAdministrationDashboard
2	System Program Form	SystemProgramForm
3	System Program List	SystemProgramList
4	System Group Form	SystemGroupForm
5	System Group List	SystemGroupList
6	System Unit Form	SystemUnitForm
7	System Unit List	SystemUnitList
8	System Role Form	SystemRoleForm
9	System Role List	SystemRoleList
10	System User Form	SystemUserForm
11	System User List	SystemUserList
12	System Preference form	SystemPreferenceForm
13	System Log Dashboard	SystemLogDashboard
14	System Access Log	SystemAccessLogList
15	System ChangeLog View	SystemChangeLogView
16	System Sql Log	SystemSqlLogList
17	System Request Log	SystemRequestLogList
18	System Request Log View	SystemRequestLogView
19	System PHP Error	SystemPHPErrorLogView
20	System Session vars	SystemSessionVarsView
21	System Database Browser	SystemDatabaseExplorer
22	System Table List	SystemTableList
23	System Data Browser	SystemDataBrowser
24	System SQL Panel	SystemSQLPanel
25	System Modules	SystemModulesCheckView
26	System files diff	SystemFilesDiff
27	System Information	SystemInformationView
28	System PHP Info	SystemPHPInfoView
29	Common Page	CommonPage
30	Welcome View	WelcomeView
31	Welcome dashboard	WelcomeDashboardView
32	System Profile View	SystemProfileView
33	System Profile Form	SystemProfileForm
34	System Notification List	SystemNotificationList
35	System Notification Form View	SystemNotificationFormView
36	System Support form	SystemSupportForm
37	System Profile 2FA Form	SystemProfile2FAForm
38	System Wiki list	SystemWikiList
39	System Wiki form	SystemWikiForm
40	System Wiki page picker	SystemWikiPagePicker
41	System Post list	SystemPostList
42	System Post form	SystemPostForm
43	System schedule list	SystemScheduleList
44	System schedule form	SystemScheduleForm
45	System schedule log	SystemScheduleLogList
46	System Message Form	SystemMessageForm
47	System Message List	SystemMessageList
48	System Message Form View	SystemMessageFormView
49	System Documents	SystemDriveList
50	System Folder form	SystemFolderForm
51	System Share folder	SystemFolderShareForm
52	System Share document	SystemDocumentShareForm
53	System Document properties	SystemDocumentFormWindow
54	System Folder properties	SystemFolderFormView
55	System Document upload	SystemDriveDocumentUploadForm
56	Post View list	SystemPostFeedView
57	Post Comment form	SystemPostCommentForm
58	Post Comment list	SystemPostCommentList
59	System Wiki search	SystemWikiSearchList
60	System Wiki view	SystemWikiView
61	System Message Tag form	SystemMessageTagForm
62	System Contacts list	SystemContactsList
63	Text document editor	SystemTextDocumentEditor
64	System document create form	SystemDriveDocumentCreateForm
\.


--
-- TOC entry 3657 (class 0 OID 16820)
-- Dependencies: 247
-- Data for Name: system_program_method_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_program_method_role (id, system_program_id, system_role_id, method_name) FROM stdin;
\.


--
-- TOC entry 3648 (class 0 OID 16706)
-- Dependencies: 238
-- Data for Name: system_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_role (id, name, custom_code) FROM stdin;
1	Role A	
2	Role B	
\.


--
-- TOC entry 3644 (class 0 OID 16645)
-- Dependencies: 234
-- Data for Name: system_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_schedule (id, schedule_type, title, class_name, method, monthday, weekday, hour, minute, active) FROM stdin;
\.


--
-- TOC entry 3647 (class 0 OID 16699)
-- Dependencies: 237
-- Data for Name: system_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_unit (id, name, connection_name, custom_code) FROM stdin;
1	Unit A	unit_a	\N
2	Unit B	unit_b	\N
\.


--
-- TOC entry 3652 (class 0 OID 16750)
-- Dependencies: 242
-- Data for Name: system_user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_user_group (id, system_user_id, system_group_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	2
\.


--
-- TOC entry 3656 (class 0 OID 16810)
-- Dependencies: 246
-- Data for Name: system_user_old_password; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_user_old_password (id, system_user_id, password, created_at) FROM stdin;
\.


--
-- TOC entry 3655 (class 0 OID 16795)
-- Dependencies: 245
-- Data for Name: system_user_program; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_user_program (id, system_user_id, system_program_id) FROM stdin;
\.


--
-- TOC entry 3653 (class 0 OID 16765)
-- Dependencies: 243
-- Data for Name: system_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_user_role (id, system_user_id, system_role_id) FROM stdin;
\.


--
-- TOC entry 3651 (class 0 OID 16735)
-- Dependencies: 241
-- Data for Name: system_user_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_user_unit (id, system_user_id, system_unit_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	2
\.


--
-- TOC entry 3650 (class 0 OID 16718)
-- Dependencies: 240
-- Data for Name: system_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_users (id, name, login, password, email, accepted_term_policy, phone, address, function_name, about, accepted_term_policy_at, accepted_term_policy_data, frontpage_id, system_unit_id, active, custom_code, otp_secret) FROM stdin;
1	Administrator	admin	$2y$10$xuR3XEc3J6tpv7myC9gPj.Ab5GacSeHSZoYUTYtOg.cEc22G.iBwa	admin@admin.net	Y	+123 456 789	Admin Street, 123	Administrator	I'm the administrator	\N	\N	30	\N	Y	\N	\N
2	User	user	$2y$10$MUYN29LOSHrCSGhrzvYG8O/PtAjbWvCubaUSTJGhVTJhm69WNFJs.	user@user.net	Y	+123 456 789	User Street, 123	End user	I'm the end user	\N	\N	30	\N	Y	\N	\N
\.


--
-- TOC entry 3641 (class 0 OID 16616)
-- Dependencies: 231
-- Data for Name: system_wiki_page; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_wiki_page (id, system_user_id, created_at, updated_at, title, description, content, active, searchable, updated_by) FROM stdin;
\.


--
-- TOC entry 3643 (class 0 OID 16635)
-- Dependencies: 233
-- Data for Name: system_wiki_share_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_wiki_share_group (id, system_group_id, system_wiki_page_id) FROM stdin;
\.


--
-- TOC entry 3642 (class 0 OID 16625)
-- Dependencies: 232
-- Data for Name: system_wiki_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_wiki_tag (id, system_wiki_page_id, tag) FROM stdin;
\.


--
-- TOC entry 3372 (class 2606 OID 16550)
-- Name: system_document_bookmark system_document_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document_bookmark
    ADD CONSTRAINT system_document_bookmark_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 16540)
-- Name: system_document_group system_document_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 16520)
-- Name: system_document system_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 16530)
-- Name: system_document_user system_document_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 16560)
-- Name: system_folder_bookmark system_folder_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder_bookmark
    ADD CONSTRAINT system_folder_bookmark_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 16508)
-- Name: system_folder_group system_folder_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder_group
    ADD CONSTRAINT system_folder_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 16488)
-- Name: system_folder system_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder
    ADD CONSTRAINT system_folder_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 16498)
-- Name: system_folder_user system_folder_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder_user
    ADD CONSTRAINT system_folder_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3409 (class 2606 OID 16691)
-- Name: system_group system_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_group
    ADD CONSTRAINT system_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3440 (class 2606 OID 16784)
-- Name: system_group_program system_group_program_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 16473)
-- Name: system_message system_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_message
    ADD CONSTRAINT system_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3343 (class 2606 OID 16478)
-- Name: system_message_tag system_message_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_message_tag
    ADD CONSTRAINT system_message_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 16466)
-- Name: system_notification system_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_notification
    ADD CONSTRAINT system_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3390 (class 2606 OID 16600)
-- Name: system_post_comment system_post_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_comment
    ADD CONSTRAINT system_post_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 16610)
-- Name: system_post_like system_post_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_like
    ADD CONSTRAINT system_post_like_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 16573)
-- Name: system_post system_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post
    ADD CONSTRAINT system_post_pkey PRIMARY KEY (id);


--
-- TOC entry 3383 (class 2606 OID 16578)
-- Name: system_post_share_group system_post_share_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_share_group
    ADD CONSTRAINT system_post_share_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 16588)
-- Name: system_post_tag system_post_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_tag
    ADD CONSTRAINT system_post_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3451 (class 2606 OID 16824)
-- Name: system_program_method_role system_program_method_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_program_method_role
    ADD CONSTRAINT system_program_method_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 16698)
-- Name: system_program system_program_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_program
    ADD CONSTRAINT system_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3419 (class 2606 OID 16712)
-- Name: system_role system_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_role
    ADD CONSTRAINT system_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3406 (class 2606 OID 16651)
-- Name: system_schedule system_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_schedule
    ADD CONSTRAINT system_schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3416 (class 2606 OID 16705)
-- Name: system_unit system_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_unit
    ADD CONSTRAINT system_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3432 (class 2606 OID 16754)
-- Name: system_user_group system_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3447 (class 2606 OID 16814)
-- Name: system_user_old_password system_user_old_password_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_old_password
    ADD CONSTRAINT system_user_old_password_pkey PRIMARY KEY (id);


--
-- TOC entry 3444 (class 2606 OID 16799)
-- Name: system_user_program system_user_program_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_pkey PRIMARY KEY (id);


--
-- TOC entry 3436 (class 2606 OID 16769)
-- Name: system_user_role system_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_role
    ADD CONSTRAINT system_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3428 (class 2606 OID 16739)
-- Name: system_user_unit system_user_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 3424 (class 2606 OID 16724)
-- Name: system_users system_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_users
    ADD CONSTRAINT system_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 16624)
-- Name: system_wiki_page system_wiki_page_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_wiki_page
    ADD CONSTRAINT system_wiki_page_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 16639)
-- Name: system_wiki_share_group system_wiki_share_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_wiki_share_group
    ADD CONSTRAINT system_wiki_share_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 16629)
-- Name: system_wiki_tag system_wiki_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_wiki_tag
    ADD CONSTRAINT system_wiki_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3369 (class 1259 OID 16670)
-- Name: sys_document_bookmark_document_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_bookmark_document_idx ON public.system_document_bookmark USING btree (system_document_id);


--
-- TOC entry 3370 (class 1259 OID 16669)
-- Name: sys_document_bookmark_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_bookmark_user_idx ON public.system_document_bookmark USING btree (system_user_id);


--
-- TOC entry 3357 (class 1259 OID 16664)
-- Name: sys_document_folder_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_folder_idx ON public.system_document USING btree (system_folder_id);


--
-- TOC entry 3365 (class 1259 OID 16667)
-- Name: sys_document_group_document_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_group_document_idx ON public.system_document_group USING btree (document_id);


--
-- TOC entry 3366 (class 1259 OID 16668)
-- Name: sys_document_group_group_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_group_group_idx ON public.system_document_group USING btree (system_group_id);


--
-- TOC entry 3361 (class 1259 OID 16665)
-- Name: sys_document_user_document_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_user_document_idx ON public.system_document_user USING btree (document_id);


--
-- TOC entry 3358 (class 1259 OID 16663)
-- Name: sys_document_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_user_idx ON public.system_document USING btree (system_user_id);


--
-- TOC entry 3362 (class 1259 OID 16666)
-- Name: sys_document_user_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_document_user_user_idx ON public.system_document_user USING btree (system_user_id);


--
-- TOC entry 3373 (class 1259 OID 16672)
-- Name: sys_folder_bookmark_folder_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_bookmark_folder_idx ON public.system_folder_bookmark USING btree (system_folder_id);


--
-- TOC entry 3374 (class 1259 OID 16671)
-- Name: sys_folder_bookmark_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_bookmark_user_idx ON public.system_folder_bookmark USING btree (system_user_id);


--
-- TOC entry 3353 (class 1259 OID 16661)
-- Name: sys_folder_group_folder_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_group_folder_idx ON public.system_folder_group USING btree (system_folder_id);


--
-- TOC entry 3354 (class 1259 OID 16662)
-- Name: sys_folder_group_group_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_group_group_idx ON public.system_folder_group USING btree (system_group_id);


--
-- TOC entry 3344 (class 1259 OID 16657)
-- Name: sys_folder_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_name_idx ON public.system_folder USING btree (name);


--
-- TOC entry 3345 (class 1259 OID 16658)
-- Name: sys_folder_parend_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_parend_id_idx ON public.system_folder USING btree (system_folder_parent_id);


--
-- TOC entry 3349 (class 1259 OID 16659)
-- Name: sys_folder_user_folder_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_user_folder_idx ON public.system_folder_user USING btree (system_folder_id);


--
-- TOC entry 3346 (class 1259 OID 16656)
-- Name: sys_folder_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_user_id_idx ON public.system_folder USING btree (system_user_id);


--
-- TOC entry 3350 (class 1259 OID 16660)
-- Name: sys_folder_user_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_folder_user_user_idx ON public.system_folder_user USING btree (system_user_id);


--
-- TOC entry 3407 (class 1259 OID 16843)
-- Name: sys_group_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_group_name_idx ON public.system_group USING btree (name);


--
-- TOC entry 3437 (class 1259 OID 16839)
-- Name: sys_group_program_group_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_group_program_group_idx ON public.system_group_program USING btree (system_group_id);


--
-- TOC entry 3438 (class 1259 OID 16838)
-- Name: sys_group_program_program_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_group_program_program_idx ON public.system_group_program USING btree (system_program_id);


--
-- TOC entry 3341 (class 1259 OID 16685)
-- Name: sys_message_tag_msg_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_message_tag_msg_idx ON public.system_message_tag USING btree (system_message_id);


--
-- TOC entry 3337 (class 1259 OID 16654)
-- Name: sys_message_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_message_user_id_idx ON public.system_message USING btree (system_user_id);


--
-- TOC entry 3338 (class 1259 OID 16655)
-- Name: sys_message_user_to_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_message_user_to_idx ON public.system_message USING btree (system_user_to_id);


--
-- TOC entry 3333 (class 1259 OID 16652)
-- Name: sys_notification_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_notification_user_id_idx ON public.system_notification USING btree (system_user_id);


--
-- TOC entry 3334 (class 1259 OID 16653)
-- Name: sys_notification_user_to_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_notification_user_to_idx ON public.system_notification USING btree (system_user_to_id);


--
-- TOC entry 3387 (class 1259 OID 16678)
-- Name: sys_post_comment_post_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_comment_post_idx ON public.system_post_comment USING btree (system_post_id);


--
-- TOC entry 3388 (class 1259 OID 16677)
-- Name: sys_post_comment_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_comment_user_idx ON public.system_post_comment USING btree (system_user_id);


--
-- TOC entry 3391 (class 1259 OID 16680)
-- Name: sys_post_like_post_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_like_post_idx ON public.system_post_like USING btree (system_post_id);


--
-- TOC entry 3392 (class 1259 OID 16679)
-- Name: sys_post_like_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_like_user_idx ON public.system_post_like USING btree (system_user_id);


--
-- TOC entry 3380 (class 1259 OID 16674)
-- Name: sys_post_share_group_group_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_share_group_group_idx ON public.system_post_share_group USING btree (system_group_id);


--
-- TOC entry 3381 (class 1259 OID 16675)
-- Name: sys_post_share_group_post_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_share_group_post_idx ON public.system_post_share_group USING btree (system_post_id);


--
-- TOC entry 3384 (class 1259 OID 16676)
-- Name: sys_post_tag_post_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_tag_post_idx ON public.system_post_tag USING btree (system_post_id);


--
-- TOC entry 3377 (class 1259 OID 16673)
-- Name: sys_post_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_post_user_idx ON public.system_post USING btree (system_user_id);


--
-- TOC entry 3420 (class 1259 OID 16848)
-- Name: sys_preference_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_preference_id_idx ON public.system_preference USING btree (id);


--
-- TOC entry 3410 (class 1259 OID 16845)
-- Name: sys_program_controller_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_program_controller_idx ON public.system_program USING btree (controller);


--
-- TOC entry 3448 (class 1259 OID 16854)
-- Name: sys_program_method_role_program_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_program_method_role_program_idx ON public.system_program_method_role USING btree (system_program_id);


--
-- TOC entry 3449 (class 1259 OID 16855)
-- Name: sys_program_method_role_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_program_method_role_role_idx ON public.system_program_method_role USING btree (system_role_id);


--
-- TOC entry 3411 (class 1259 OID 16844)
-- Name: sys_program_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_program_name_idx ON public.system_program USING btree (name);


--
-- TOC entry 3417 (class 1259 OID 16847)
-- Name: sys_role_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_role_name_idx ON public.system_role USING btree (name);


--
-- TOC entry 3414 (class 1259 OID 16846)
-- Name: sys_unit_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_unit_name_idx ON public.system_unit USING btree (name);


--
-- TOC entry 3429 (class 1259 OID 16836)
-- Name: sys_user_group_group_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_group_group_idx ON public.system_user_group USING btree (system_group_id);


--
-- TOC entry 3430 (class 1259 OID 16837)
-- Name: sys_user_group_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_group_user_idx ON public.system_user_group USING btree (system_user_id);


--
-- TOC entry 3445 (class 1259 OID 16853)
-- Name: sys_user_old_password_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_old_password_user_idx ON public.system_user_old_password USING btree (system_user_id);


--
-- TOC entry 3421 (class 1259 OID 16835)
-- Name: sys_user_program_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_program_idx ON public.system_users USING btree (frontpage_id);


--
-- TOC entry 3441 (class 1259 OID 16840)
-- Name: sys_user_program_program_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_program_program_idx ON public.system_user_program USING btree (system_program_id);


--
-- TOC entry 3442 (class 1259 OID 16841)
-- Name: sys_user_program_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_program_user_idx ON public.system_user_program USING btree (system_user_id);


--
-- TOC entry 3433 (class 1259 OID 16852)
-- Name: sys_user_role_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_role_role_idx ON public.system_user_role USING btree (system_role_id);


--
-- TOC entry 3434 (class 1259 OID 16851)
-- Name: sys_user_role_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_role_user_idx ON public.system_user_role USING btree (system_user_id);


--
-- TOC entry 3425 (class 1259 OID 16850)
-- Name: sys_user_unit_unit_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_unit_unit_idx ON public.system_user_unit USING btree (system_unit_id);


--
-- TOC entry 3426 (class 1259 OID 16849)
-- Name: sys_user_unit_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_user_unit_user_idx ON public.system_user_unit USING btree (system_user_id);


--
-- TOC entry 3422 (class 1259 OID 16842)
-- Name: sys_users_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_users_name_idx ON public.system_users USING btree (name);


--
-- TOC entry 3395 (class 1259 OID 16681)
-- Name: sys_wiki_page_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_wiki_page_user_idx ON public.system_wiki_page USING btree (system_user_id);


--
-- TOC entry 3401 (class 1259 OID 16683)
-- Name: sys_wiki_share_group_group_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_wiki_share_group_group_idx ON public.system_wiki_share_group USING btree (system_group_id);


--
-- TOC entry 3402 (class 1259 OID 16684)
-- Name: sys_wiki_share_group_page_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_wiki_share_group_page_idx ON public.system_wiki_share_group USING btree (system_wiki_page_id);


--
-- TOC entry 3398 (class 1259 OID 16682)
-- Name: sys_wiki_tag_page_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sys_wiki_tag_page_idx ON public.system_wiki_tag USING btree (system_wiki_page_id);


--
-- TOC entry 3459 (class 2606 OID 16551)
-- Name: system_document_bookmark system_document_bookmark_system_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document_bookmark
    ADD CONSTRAINT system_document_bookmark_system_document_id_fkey FOREIGN KEY (system_document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3458 (class 2606 OID 16541)
-- Name: system_document_group system_document_group_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document_group
    ADD CONSTRAINT system_document_group_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3456 (class 2606 OID 16521)
-- Name: system_document system_document_system_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document
    ADD CONSTRAINT system_document_system_folder_id_fkey FOREIGN KEY (system_folder_id) REFERENCES public.system_folder(id);


--
-- TOC entry 3457 (class 2606 OID 16531)
-- Name: system_document_user system_document_user_document_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_document_user
    ADD CONSTRAINT system_document_user_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.system_document(id);


--
-- TOC entry 3460 (class 2606 OID 16561)
-- Name: system_folder_bookmark system_folder_bookmark_system_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder_bookmark
    ADD CONSTRAINT system_folder_bookmark_system_folder_id_fkey FOREIGN KEY (system_folder_id) REFERENCES public.system_folder(id);


--
-- TOC entry 3455 (class 2606 OID 16509)
-- Name: system_folder_group system_folder_group_system_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder_group
    ADD CONSTRAINT system_folder_group_system_folder_id_fkey FOREIGN KEY (system_folder_id) REFERENCES public.system_folder(id);


--
-- TOC entry 3453 (class 2606 OID 16489)
-- Name: system_folder system_folder_system_folder_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder
    ADD CONSTRAINT system_folder_system_folder_parent_id_fkey FOREIGN KEY (system_folder_parent_id) REFERENCES public.system_folder(id);


--
-- TOC entry 3454 (class 2606 OID 16499)
-- Name: system_folder_user system_folder_user_system_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_folder_user
    ADD CONSTRAINT system_folder_user_system_folder_id_fkey FOREIGN KEY (system_folder_id) REFERENCES public.system_folder(id);


--
-- TOC entry 3475 (class 2606 OID 16785)
-- Name: system_group_program system_group_program_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3476 (class 2606 OID 16790)
-- Name: system_group_program system_group_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_group_program
    ADD CONSTRAINT system_group_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3452 (class 2606 OID 16479)
-- Name: system_message_tag system_message_tag_system_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_message_tag
    ADD CONSTRAINT system_message_tag_system_message_id_fkey FOREIGN KEY (system_message_id) REFERENCES public.system_message(id);


--
-- TOC entry 3463 (class 2606 OID 16601)
-- Name: system_post_comment system_post_comment_system_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_comment
    ADD CONSTRAINT system_post_comment_system_post_id_fkey FOREIGN KEY (system_post_id) REFERENCES public.system_post(id);


--
-- TOC entry 3464 (class 2606 OID 16611)
-- Name: system_post_like system_post_like_system_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_like
    ADD CONSTRAINT system_post_like_system_post_id_fkey FOREIGN KEY (system_post_id) REFERENCES public.system_post(id);


--
-- TOC entry 3461 (class 2606 OID 16579)
-- Name: system_post_share_group system_post_share_group_system_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_share_group
    ADD CONSTRAINT system_post_share_group_system_post_id_fkey FOREIGN KEY (system_post_id) REFERENCES public.system_post(id);


--
-- TOC entry 3462 (class 2606 OID 16589)
-- Name: system_post_tag system_post_tag_system_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_post_tag
    ADD CONSTRAINT system_post_tag_system_post_id_fkey FOREIGN KEY (system_post_id) REFERENCES public.system_post(id);


--
-- TOC entry 3480 (class 2606 OID 16825)
-- Name: system_program_method_role system_program_method_role_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_program_method_role
    ADD CONSTRAINT system_program_method_role_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3481 (class 2606 OID 16830)
-- Name: system_program_method_role system_program_method_role_system_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_program_method_role
    ADD CONSTRAINT system_program_method_role_system_role_id_fkey FOREIGN KEY (system_role_id) REFERENCES public.system_role(id);


--
-- TOC entry 3471 (class 2606 OID 16760)
-- Name: system_user_group system_user_group_system_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_group_id_fkey FOREIGN KEY (system_group_id) REFERENCES public.system_group(id);


--
-- TOC entry 3472 (class 2606 OID 16755)
-- Name: system_user_group system_user_group_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_group
    ADD CONSTRAINT system_user_group_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_users(id);


--
-- TOC entry 3479 (class 2606 OID 16815)
-- Name: system_user_old_password system_user_old_password_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_old_password
    ADD CONSTRAINT system_user_old_password_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_users(id);


--
-- TOC entry 3477 (class 2606 OID 16805)
-- Name: system_user_program system_user_program_system_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_program_id_fkey FOREIGN KEY (system_program_id) REFERENCES public.system_program(id);


--
-- TOC entry 3478 (class 2606 OID 16800)
-- Name: system_user_program system_user_program_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_program
    ADD CONSTRAINT system_user_program_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_users(id);


--
-- TOC entry 3473 (class 2606 OID 16775)
-- Name: system_user_role system_user_role_system_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_role
    ADD CONSTRAINT system_user_role_system_role_id_fkey FOREIGN KEY (system_role_id) REFERENCES public.system_role(id);


--
-- TOC entry 3474 (class 2606 OID 16770)
-- Name: system_user_role system_user_role_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_role
    ADD CONSTRAINT system_user_role_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_users(id);


--
-- TOC entry 3469 (class 2606 OID 16745)
-- Name: system_user_unit system_user_unit_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3470 (class 2606 OID 16740)
-- Name: system_user_unit system_user_unit_system_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_user_unit
    ADD CONSTRAINT system_user_unit_system_user_id_fkey FOREIGN KEY (system_user_id) REFERENCES public.system_users(id);


--
-- TOC entry 3467 (class 2606 OID 16730)
-- Name: system_users system_users_frontpage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_users
    ADD CONSTRAINT system_users_frontpage_id_fkey FOREIGN KEY (frontpage_id) REFERENCES public.system_program(id);


--
-- TOC entry 3468 (class 2606 OID 16725)
-- Name: system_users system_users_system_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_users
    ADD CONSTRAINT system_users_system_unit_id_fkey FOREIGN KEY (system_unit_id) REFERENCES public.system_unit(id);


--
-- TOC entry 3466 (class 2606 OID 16640)
-- Name: system_wiki_share_group system_wiki_share_group_system_wiki_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_wiki_share_group
    ADD CONSTRAINT system_wiki_share_group_system_wiki_page_id_fkey FOREIGN KEY (system_wiki_page_id) REFERENCES public.system_wiki_page(id);


--
-- TOC entry 3465 (class 2606 OID 16630)
-- Name: system_wiki_tag system_wiki_tag_system_wiki_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_wiki_tag
    ADD CONSTRAINT system_wiki_tag_system_wiki_page_id_fkey FOREIGN KEY (system_wiki_page_id) REFERENCES public.system_wiki_page(id);


-- Completed on 2025-02-03 16:36:07

--
-- PostgreSQL database dump complete
--

