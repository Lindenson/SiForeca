--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE editor;
ALTER ROLE editor WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:2rz4sIelBh26HO2sZU+X4w==$Qqjho9oH9e7jcaekCO+qJwxe1xN2Ygr7GK6OWEaZog0=:jAUi+hbC8vGZBKN9YEmgu9kt66AhpX0LBpdj+kWa2sY=';
CREATE ROLE observer;
ALTER ROLE observer WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:7C4EIItqy1iQ5pNyHBOBsg==$5+UW7Q6grH15TsdP2YIOnmRk7OJor/dVk8CofwVHCWY=:Wj5ccltNsAi9sVZSNKdtzQDrQcvda/pz1pajIuEmdTA=';
CREATE ROLE scientist;
ALTER ROLE scientist WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:FKhl5MWWgu+SqFyV5IN7yg==$RPPcDEE9zZdikFWh2YfAMWsIJBUfiMaOQLnwzLBGCv8=:HSsqqwEq/2gzVcJjP22Lq1FbyM3obciwHv7/no+Ut1E=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorities (
    username character varying(50) NOT NULL,
    authority character varying(50) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- Name: authorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorities_id_seq OWNER TO postgres;

--
-- Name: authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authorities_id_seq OWNED BY public.authorities.id;


--
-- Name: restoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restoken (
    id integer NOT NULL,
    token character varying,
    username character varying,
    expiredate timestamp without time zone NOT NULL,
    password character varying
);


ALTER TABLE public.restoken OWNER TO postgres;

--
-- Name: restoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoken_id_seq OWNER TO postgres;

--
-- Name: restoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restoken_id_seq OWNED BY public.restoken.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    enabled integer DEFAULT 1 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: authorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities ALTER COLUMN id SET DEFAULT nextval('public.authorities_id_seq'::regclass);


--
-- Name: restoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restoken ALTER COLUMN id SET DEFAULT nextval('public.restoken_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorities (username, authority, id) FROM stdin;
prox@i.ua	ROLE_ADMIN	1
\.


--
-- Data for Name: restoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restoken (id, token, username, expiredate, password) FROM stdin;
66	f220da73-22d5-4c14-88ec-27a1e9df5ea9	delishki@ukr.net	2022-03-21 17:20:32.452639	$2a$10$63KwoSo0mMsk9YHTCa8bauVJGFwgRsDFhhvnUrVOdWZuFumusaL8u
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, password, enabled, id) FROM stdin;
prox@i.ua	$2a$10$jxTz/pe8F15LTUNri527LunvWrSEJcWCIDhbygW3AsCxJ1.9oa87i	1	1
\.


--
-- Name: authorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authorities_id_seq', 131, true);


--
-- Name: restoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restoken_id_seq', 67, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 135, true);


--
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (id);


--
-- Name: restoken restoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restoken
    ADD CONSTRAINT restoken_pkey PRIMARY KEY (id);


--
-- Name: restoken restoken_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restoken
    ADD CONSTRAINT restoken_username_key UNIQUE (username);


--
-- Name: users un_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT un_username UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: authorities fk_users_auth; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT fk_users_auth FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

--
-- Database "rowdata" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: rowdata; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE rowdata WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE rowdata OWNER TO postgres;

\connect rowdata

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
-- Name: formats; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.formats AS ENUM (
    'PDF',
    'JSON',
    'CSV',
    'XLSX'
);


ALTER TYPE public.formats OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.activity OWNER TO postgres;

--
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorities (
    username character varying(50) NOT NULL,
    authority character varying(50) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- Name: authorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorities_id_seq OWNER TO postgres;

--
-- Name: authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authorities_id_seq OWNED BY public.authorities.id;


--
-- Name: base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.base OWNER TO postgres;

--
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: grossbuch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grossbuch (
    id integer NOT NULL,
    date date NOT NULL,
    data real NOT NULL,
    unit character varying(10) NOT NULL,
    period character varying(10) NOT NULL,
    branch character varying,
    country character varying,
    activity character varying,
    source character varying,
    sector character varying,
    indicator character varying,
    industry character varying,
    base character varying,
    wbname character varying(40)
);


ALTER TABLE public.grossbuch OWNER TO postgres;

--
-- Name: indicator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicator (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.indicator OWNER TO postgres;

--
-- Name: industry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.industry (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.industry OWNER TO postgres;

--
-- Name: period; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.period (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    days interval NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.period OWNER TO postgres;

--
-- Name: restoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restoken (
    id integer NOT NULL,
    token character varying,
    username character varying,
    expiredate timestamp without time zone NOT NULL,
    password character varying
);


ALTER TABLE public.restoken OWNER TO postgres;

--
-- Name: restoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restoken_id_seq OWNER TO postgres;

--
-- Name: restoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restoken_id_seq OWNED BY public.restoken.id;


--
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sector (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.sector OWNER TO postgres;

--
-- Name: seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq OWNER TO postgres;

--
-- Name: source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    url character varying NOT NULL,
    format public.formats NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.source OWNER TO postgres;

--
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    ename character varying NOT NULL,
    uname character varying,
    rname character varying
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    enabled integer DEFAULT 1 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wbnames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wbnames (
    id integer NOT NULL,
    wbcode character varying(40) NOT NULL,
    topic character varying,
    name character varying
);


ALTER TABLE public.wbnames OWNER TO postgres;

--
-- Name: authorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities ALTER COLUMN id SET DEFAULT nextval('public.authorities_id_seq'::regclass);


--
-- Name: restoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restoken ALTER COLUMN id SET DEFAULT nextval('public.restoken_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity (id, code, ename, uname, rname) FROM stdin;
1	AAFF	Agriculture, forestry and fishing	Сільське, лісове та рибне господарство	Сельское, лесное и рыбное хозяйство
2	AMQ	Mining and quarrying	Добувна промисловість і розроблення кар'єрів	Добывающая промышленность и разработка карьеров
3	AMF	Manufacturing	Переробна промисловість	Перерабатывающая промышленность
4	AEG	Electricity, gas, steam and air conditioning supply	Постачання електроенергії, газу, пари та кондиційованого повітря	Поставка электроэнергии, газа, пара и кондиционированного воздуха
5	AWS	Water supply; sewerage,waste management and remediation activities	Водопостачання; каналізація, поводження з відходами	Водоснабжение; канализация, обращение с отходами
6	AIT	Industry total 	Промисловість всього	Промышленность всего
7	ACST	Construction	Будівництво	Строительство
8	AWRT	Wholesale and retail trade; repair of motor vehicles and motorcycles	Оптова та роздрібна торгівля; ремонт автотранспортних засобів і мотоциклів	Оптовая и розничная торговля; ремонт автотранспортных средств и мотоциклов
9	ATS	Transportation and storage	Транспорт, складське господарство, поштова та кур'єрська діяльність	Транспорт, складское хозяйство, почтовая и курьерская деятельность
10	AAFSA	Accommodation and food service activities	Тимчасове розміщування й організація харчування	Временное размещение и организация питания
11	AIC	Information and communication	Інформація та телекомунікації	Информация и телекоммуникации
12	AFIA	Financial and insurance activities	Фінансова та страхова діяльність	Финансовая и страховая деятельность
13	AREA	Real estate activities	Операції з нерухомим майном	Операции с недвижимым имуществом
14	APSTA	Professional, scientific and technical activities	Професійна, наукова та технічна діяльність	Профессиональная, научная и техническая деятельность
15	AASSA	Administrative and support service activities	Діяльність у сфері адміністративного та допоміжного обслуговування	Деятельность в сфере административного и вспомогательного обслуживания
16	AEE	Education	Освіта	Образование
17	AHHSW	Human health and social work activities	Охорона здоров'я та надання соціальної допомоги	Здравоохранение и оказание социальной помощи
18	AAER	Arts, entertainment and recreation	Мистецтво, спорт, розваги та відпочинок	Искусство, спорт, развлечения и отдых
19	AOSA	Other service activities	Надання інших видів послуг	Предоставление других видов услуг
20	ANA	National accounts	Національні рахунки	Национальные счета
21	APP	Prices	Ціни	Цены
22	AFP	Factors of production	Фактори виробництва	Факторы производства
23	ALM	Labour market	Ринок праці	Рынок труда
\.


--
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorities (username, authority, id) FROM stdin;
prox@i.ua	ROLE_ADMIN	1
\.


--
-- Data for Name: base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base (id, code, ename, uname, rname) FROM stdin;
1	BSS	Statistics	Статистика	Статистика
2	BLMS	Long-term model statistics	Статистика довгострокової моделі	Статистика долгосрочной модели
3	BSMS	Short-term model statistics	Статистика короткострокової моделі	Статистика краткосрочной модели
4	BHCMS	Human capital model statistics	Статистика моделі людського капіталу	Статистика модели человеческого капитала
5	BEMS	Eco model statistics	Статистика еко моделі	Статистика эко модели
\.


--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (id, code, ename, uname, rname) FROM stdin;
1	BAGR	Agriculture	Сільське господарство	Сельское хозяйство
2	BFL	Forestry and logging	Лісове господарство та лісозаготівлі	Лесное хозяйство и лесозаготовки
3	BFA	Fishing and aquaculture	Рибне господарство	Рыбное хозяйство
4	BMCL	Mining of coal and lignite	Добування кам'яного та бурого вугілля	Добыча каменного и бурого угля
5	BEPG	Extraction of crude petroleum and natural gas	Добування сирої нафти та природного газу	Добыча сырой нефти и природного газа
6	BNO	No branch	Без галузі	Без отрасли
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, code, ename, uname, rname) FROM stdin;
1	CHN	China	Китай	Китай
2	USA	United States	США	США
3	JPN	Japan	Японія	Япония
4	DEU	Germany	Німеччина	Германия
5	PRK	Dem. People's Rep. Korea	Північна Корея	Северная Корея
6	IND	India	Індія	Индия
7	ITA	Italy	Італія	Италия
8	FRA	France	Франція	Франция
9	GBR	United Kingdom	Великобританія	Великобритания
10	MEX	Mexico	Мексика	Мексика
11	UKR	Ukraine	Україна	Украина
12	WLD	World	Світ	Мир
13	EUU	European Union	Європейський Союз	Европейський Союз
\.


--
-- Data for Name: grossbuch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grossbuch (id, date, data, unit, period, branch, country, activity, source, sector, indicator, industry, base, wbname) FROM stdin;
226	2015-12-31	138.9	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
227	2016-12-31	117.1	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
228	2017-12-31	122.1	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
229	2018-12-31	115.4	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
230	2019-12-31	108.2	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
231	2020-12-31	110.3	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
232	2010-12-31	1.053e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
233	2011-12-31	1.109e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
234	2012-12-31	1.027e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
235	2013-12-31	1.061e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
236	2014-12-31	1.571e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
237	2015-12-31	2.423e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
238	2016-12-31	2.829e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
239	2017-12-31	3e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
240	2018-12-31	3.214e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
241	2019-12-31	2.895e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
242	2020-12-31	3.079e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
243	2021-12-31	3.231e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IEURR	INI	BLMS	\N
244	2010-12-31	7.93e-06	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
245	2011-12-31	7.97e-06	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
246	2012-12-31	7.99e-06	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
247	2013-12-31	7.99e-06	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
248	2014-12-31	1.189e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
249	2015-12-31	2.184e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
250	2016-12-31	2.555e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
251	2017-12-31	2.66e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
252	2018-12-31	2.72e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
253	2019-12-31	2.584e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
254	2020-12-31	2.696e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
255	2021-12-31	2.729e-05	UMG	PDD	BNO	UKR	APP	SNBU	SMS	IUSDR	INI	BLMS	\N
256	2010-12-31	106.8	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
257	2011-12-31	118.8	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
258	2012-12-31	111.5	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
259	2013-12-31	109.5	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
260	2014-12-31	106.3	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
261	2015-12-31	95.1	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
262	2016-12-31	97.8	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
263	2017-12-31	100.8	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
264	2018-12-31	94.2	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
265	2019-12-31	95.6	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
266	2020-12-31	99.2	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
267	2021-12-31	125.1	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
268	2022-12-31	145.5	UPP	PYEAR	BNO	WLD	APP	SFAO	SMS	IFPI	INI	BLMS	\N
269	2010-12-31	146.11427	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
270	2011-12-31	182.47261	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
271	2012-12-31	174.41837	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
272	2013-12-31	168.79182	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
273	2014-12-31	159.12312	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
274	2015-12-31	108.279015	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
275	2016-12-31	100	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
276	2017-12-31	113.545494	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
277	2018-12-31	128.19426	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
278	2019-12-31	117.57464	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
279	2020-12-31	105.91062	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
280	2021-12-31	161.83011	UPP	PYEAR	BNO	WLD	APP	SIMF	SMS	IRMPI	INI	BLMS	\N
281	2010-12-31	2078.1626	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
282	2011-12-31	2112.205	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
283	2012-12-31	2193.586	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
284	2013-12-31	2202.475	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
285	2014-12-31	2255.5784	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
286	2015-12-31	2353.5283	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
287	2016-12-31	2329.0266	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
288	2017-12-31	2336.2317	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
289	2018-12-31	2384.0576	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
290	2019-12-31	2431.813	UEUR	PMM	BNO	EUU	ALM	SES	SMS	IME	INI	BLMS	\N
291	2010-12-31	20.873	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
292	2011-12-31	22.437	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
293	2012-12-31	21.716	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
294	2013-12-31	18.489	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
295	2014-12-31	13.396	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
296	2015-12-31	15.933	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
297	2016-12-31	21.724	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
298	2017-12-31	20.749	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
299	2018-12-31	18.587	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
300	2019-12-31	12.595	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
301	2020-12-31	6.591	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
302	2021-12-31	13.675	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
303	2022-12-31	15.911	UPP	PYEAR	BNO	UKR	AFP	STCD	SMS	ITIGDP	INI	BLMS	\N
304	2010-12-31	1	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
305	2011-12-31	1.0771248	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
306	2012-12-31	1.0749646	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
307	2013-12-31	1.0771235	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
308	2014-12-31	1.0764141	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
309	2015-12-31	0.9902945	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
310	2016-12-31	0.9798683	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
311	2017-12-31	1.0097437	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
312	2018-12-31	1.0417929	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
313	2019-12-31	1.0324107	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
314	2020-12-31	1.0358536	UPP	PYEAR	BNO	WLD	ANA	SED	SMS	IDGDP	INI	BLMS	\N
1	2010-12-31	82948	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
2	2011-12-31	109961	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
3	2012-12-31	113245	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
4	2013-12-31	131727	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
5	2014-12-31	161145	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
6	2015-12-31	239806	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
7	2016-12-31	279701	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
8	2017-12-31	303949	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
9	2018-12-31	360757	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
10	2019-12-31	356795	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
11	2020-12-31	393077	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	IVA	INI	BLMS	\N
12	2010-12-31	113388	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
13	2011-12-31	118019	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
14	2012-12-31	137640	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
15	2013-12-31	156013	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
16	2014-12-31	171392	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
17	2015-12-31	210169	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
18	2016-12-31	270467	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
19	2017-12-31	341622	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
20	2018-12-31	407146	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
21	2019-12-31	469383	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
22	2020-12-31	540463	UMG	PDD	BNO	UKR	AAFF	SUS	SMP	IVFA	INI	BLMS	\N
23	2010-12-31	10458	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
24	2011-12-31	16422	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
25	2012-12-31	19140	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
26	2013-12-31	18578	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
27	2014-12-31	18507	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
28	2015-12-31	29620	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
29	2016-12-31	50048	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
30	2017-12-31	63476	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
31	2018-12-31	65253	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
32	2019-12-31	58486	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
33	2020-12-31	49733	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICITA	INI	BLMS	\N
34	2010-12-31	3115.6	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
35	2011-12-31	3410.3	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
36	2012-12-31	3308.5	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
37	2013-12-31	3389	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
38	2014-12-31	3091.4	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
39	2015-12-31	2870.6	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
40	2016-12-31	2866.5	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
41	2017-12-31	2860.7	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
42	2018-12-31	2937.6	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
43	2019-12-31	3010.4	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
44	2020-12-31	2721.2	UTP	PDD	BNO	UKR	AAFF	SUS	SMP	IEP	INI	BLMS	\N
45	2010-12-31	0.001467	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
46	2011-12-31	0.001852	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
47	2012-12-31	0.002094	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
48	2013-12-31	0.002344	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
49	2014-12-31	0.002556	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
50	2015-12-31	0.003309	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
51	2016-12-31	0.004195	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
52	2017-12-31	0.006057	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
53	2018-12-31	0.007557	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
54	2019-12-31	0.008856	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
55	2020-12-31	0.009757	UMG	PMM	BNO	UKR	AAFF	SUS	SMP	IAMWE	INI	BLMS	\N
56	2010-12-31	15.118	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
57	2011-12-31	118.816	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
58	2012-12-31	19.249	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
59	2013-12-31	15.31	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
60	2014-12-31	24.459	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
61	2015-12-31	25.564	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
62	2016-12-31	36.92	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
63	2017-12-31	50.951	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
64	2018-12-31	58.127	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
65	2019-12-31	39.2	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
66	2020-12-31	44.1	UMG	PYEAR	BNO	UKR	AAFF	SUS	SMP	ICISP	INI	BLMS	\N
67	2010-12-31	63831	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
68	2011-12-31	85694	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
69	2012-12-31	82528	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
70	2013-12-31	82287	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
71	2014-12-31	79120	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
72	2015-12-31	95141	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
73	2016-12-31	131650	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
74	2017-12-31	177170	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
75	2018-12-31	214260	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
76	2019-12-31	222352	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
77	2020-12-31	193120	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	IVA	III	BLMS	\N
78	2010-12-31	141164	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
79	2011-12-31	204255	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
80	2012-12-31	231128	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
81	2013-12-31	309757	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
82	2014-12-31	362722	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
83	2015-12-31	379055	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
84	2016-12-31	410018	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
85	2017-12-31	422959	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
86	2018-12-31	411806	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
87	2019-12-31	429722	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
88	2020-12-31	509923	UMG	PDD	BNO	UKR	AMQ	SUS	SMP	IVFA	III	BLMS	\N
89	2010-12-31	9650	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
90	2011-12-31	17346	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
91	2012-12-31	31347	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
92	2013-12-31	23205	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
93	2014-12-31	18585	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
94	2015-12-31	17216	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
95	2016-12-31	22138	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
96	2017-12-31	33142	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
97	2018-12-31	52540	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
98	2019-12-31	67793	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
99	2020-12-31	50445	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICITA	III	BLMS	\N
100	2010-12-31	507.6	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
101	2011-12-31	488.2	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
102	2012-12-31	483.2	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
103	2013-12-31	474.7	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
104	2014-12-31	316.4	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
105	2015-12-31	302.3	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
106	2016-12-31	288.1	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
107	2017-12-31	265.2	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
108	2018-12-31	234.2	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
109	2019-12-31	230.3	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
110	2020-12-31	220.8	UTP	PDD	BNO	UKR	AMQ	SUS	SMP	INEBE	III	BLMS	\N
111	2010-12-31	0.00357	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
112	2011-12-31	0.004417	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
113	2012-12-31	0.004923	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
114	2013-12-31	0.005289	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
115	2014-12-31	0.005445	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
116	2015-12-31	0.006164	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
117	2016-12-31	0.007426	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
118	2017-12-31	0.009704	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
119	2018-12-31	0.012452	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
120	2019-12-31	0.01563	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
121	2020-12-31	0.016763	UMG	PMM	BNO	UKR	AMQ	SUS	SMP	IAMWE	III	BLMS	\N
122	2010-12-31	97	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
123	2011-12-31	18	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
124	2012-12-31	42	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
125	2013-12-31	91	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
126	2014-12-31	37	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
127	2015-12-31	48	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
128	2016-12-31	155	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
129	2017-12-31	1322	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
130	2018-12-31	415	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
131	2019-12-31	310	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
132	2020-12-31	115	UMG	PYEAR	BNO	UKR	AMQ	SUS	SMP	ICISP	III	BLMS	\N
133	2010-12-31	146749	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
134	2011-12-31	158738	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
135	2012-12-31	178442	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
136	2013-12-31	169633	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
137	2014-12-31	194050	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
138	2015-12-31	236692	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
139	2016-12-31	291471	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
140	2017-12-31	359867	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
141	2018-12-31	411467	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
142	2019-12-31	430228	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
143	2020-12-31	426483	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	IVA	III	BLMS	\N
144	2010-12-31	705712	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
145	2011-12-31	644566	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
146	2012-12-31	677880	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
147	2013-12-31	599980	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
148	2014-12-31	756277	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
149	2015-12-31	1.656971e+06	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
150	2016-12-31	1.792101e+06	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
151	2017-12-31	1.16823e+06	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
152	2018-12-31	1.257573e+06	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
153	2019-12-31	1.150463e+06	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
154	2020-12-31	1.630237e+06	UMG	PDD	BNO	UKR	AMF	SUS	SPS	IVFA	III	BLMS	\N
155	2010-12-31	28626	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
156	2011-12-31	41462	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
157	2012-12-31	46102	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
158	2013-12-31	43629	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
159	2014-12-31	41738	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
160	2015-12-31	46113	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
161	2016-12-31	58332	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
162	2017-12-31	73358	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
163	2018-12-31	100075	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
164	2019-12-31	103954	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
165	2020-12-31	82675	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICITA	III	BLMS	\N
166	2010-12-31	2176.8	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
167	2011-12-31	2135.8	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
168	2012-12-31	2140.7	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
169	2013-12-31	2049.6	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
170	2014-12-31	1793.4	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
171	2015-12-31	1642.1	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
172	2016-12-31	1600.2	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
173	2017-12-31	1623.5	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
174	2018-12-31	1652.2	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
175	2019-12-31	1606.4	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
176	2020-12-31	1541.3	UTP	PDD	BNO	UKR	AMF	SUS	SPS	INEBE	III	BLMS	\N
177	2010-12-31	0.002288	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
178	2011-12-31	0.002771	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
179	2012-12-31	0.003097	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
180	2013-12-31	0.003311	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
181	2014-12-31	0.00357	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
182	2015-12-31	0.004477	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
183	2016-12-31	0.005543	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
184	2017-12-31	0.007299	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
185	2018-12-31	0.009196	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
186	2019-12-31	0.011011	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
187	2020-12-31	0.011493	UMG	PMM	BNO	UKR	AMF	SUS	SPS	IAMWE	III	BLMS	\N
188	2010-12-31	175	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
189	2011-12-31	280	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
190	2012-12-31	220	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
191	2013-12-31	235	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
192	2014-12-31	182	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
193	2015-12-31	500	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
194	2016-12-31	426	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
195	2017-12-31	533	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
196	2018-12-31	612	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
197	2019-12-31	654	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
198	2020-12-31	754	UMG	PYEAR	BNO	UKR	AMF	SUS	SPS	ICISP	III	BLMS	\N
199	2010-12-31	32130.2	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
200	2011-12-31	32137	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
201	2012-12-31	31993.3	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
202	2013-12-31	31846.8	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
203	2014-12-31	31606.4	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
204	2015-12-31	29634.7	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
205	2016-12-31	29327.7	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
206	2017-12-31	29011.9	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
207	2018-12-31	28719	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
208	2019-12-31	28468	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
209	2020-12-31	28199.5	UTP	PDD	BNO	UKR	ALM	SUS	SMS	IWP	INI	BLMS	\N
210	2010-12-31	1.082569e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
211	2011-12-31	1.302079e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
212	2012-12-31	1.408889e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
213	2013-12-31	1.4652e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
214	2014-12-31	1.5869e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
215	2015-12-31	1.9885e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
216	2016-12-31	2.3854e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
217	2017-12-31	2.9839e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
218	2018-12-31	3.5606e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
219	2019-12-31	1.1055e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
220	2020-12-31	4.194102e+06	UMG	PYEAR	BNO	UKR	ANA	SUS	SMS	IGDP	INI	BLMS	\N
221	2010-12-31	113.7	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
222	2011-12-31	114.2	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
223	2012-12-31	107.8	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
224	2013-12-31	104.3	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
225	2014-12-31	115.9	UPP	PYEAR	BNO	UKR	ANA	SUS	SMS	IDGDP	INI	BLMS	\N
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicator (id, code, ename, uname, rname) FROM stdin;
1	IVA	Value added	Додана вартість	Добавленная стоимость
2	IVFA	Value of the fixed assets	Вартість основних засобів 	Стоимость основных средств
3	ICITA	Capital investment in tangible assets	Капітальні інвестиції у матеріальні активи 	Капитальные инвестиции в материальные активы
4	IEP	Employed population aged 15-70	Зайняте населення у віці 15-70 років 	Занятое население в возрасте 15-70 лет
5	IAMWE	Average monthly wage of full-time employees (per full-time employee)	Середньомісячна заробітна плата штатних працівників (на одного штатного працівника) 	Среднемесячная заработная плата штатных работников (на одного штатного работника)
6	ICISP	Capital investment in the software purchase	Капітальні інвестиції у придбання програмного забезпечення 	Капитальные инвестиции в приобретение программного обеспечения
7	INEBE	Number of employees in business entities 	Кількість зайнятих працівників у суб’єктів господарювання 	Количество занятых работников у субъектов хозяйствования
8	IWP	Working population aged 15-64	Працездатне населення 15-64 роки	Трудоспособное население 15-64 года
9	IGDP	GDP 	ВВП	ВВП
10	IDGDP	GDP deflator index, % to the previous year	Індекс-дефлятор ВВП, % до порер. року	Индекс-дефлятор ВВП, % к предыд. году
11	IEURR	Euro average exchange rate	Середній курс грн. за євро	Средний курс грн. за евро
12	IUSDR	US dollar average exchange rate 	Середній курс грн. за долар США	Средний курс грн. за доллар США
13	IFPI	Food price index 	Індекс продовольчих цін	Индекс продовольственных цен
14	IRMPI	Raw material price index 	Індекс цін на сировину	Индекс цен на сырье
15	ITIGDP	Total investment, % of GDP	Загальний обсяг інвестицій, % до ВВП	Общий объем инвестиций, % к ВВП
16	IME	Mean earnings	Середня заробітна плата	Средняя заработная плата
17	IGDPG	GDP growth (annual %)	Зростання ВВП	Рост ВВП
\.


--
-- Data for Name: industry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industry (id, code, ename, uname, rname) FROM stdin;
1	III	Industry	Промисловість	Промышленность
2	INI	Not Industry	Не промисловість	Не промышленность
\.


--
-- Data for Name: period; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.period (id, code, days, ename, uname, rname) FROM stdin;
1	PYEAR	00:06:05	year before the date	рік до вказаної дати	год до указаной даты
2	PDD	00:00:01	off the date	на вказану дату	на указанную дату
3	PMM	00:00:31	month	місяць	месяц
4	PQQ	00:01:30	quarter	квартал	квартал
5	PHE	00:03:00	half a year	півріччя	полугодие
\.


--
-- Data for Name: restoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restoken (id, token, username, expiredate, password) FROM stdin;
66	f220da73-22d5-4c14-88ec-27a1e9df5ea9	delishki@ukr.net	2022-03-21 17:20:32.452639	$2a$10$63KwoSo0mMsk9YHTCa8bauVJGFwgRsDFhhvnUrVOdWZuFumusaL8u
\.


--
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sector (id, code, ename, uname, rname) FROM stdin;
1	SMP	Raw material production sector	Сектор виробництва сировини 	Сектор производства сырья
2	SPS	Processing sector	Переробний сектор	Перерабатывающий сектор
3	SMS	Macrostatistics	Макростатистика	Макростатистика
4	SOS	Other sectors	Інші сектори	Другие секторы
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (id, code, url, format, ename, uname, rname) FROM stdin;
1	SWB	https://databank.worldbank.org/source/world-development-indicators	XLSX	Worldbank	Світовий банк	Мировой банк
2	SUS	http://www.ukrstat.gov.ua/operativ/oper_new.html	XLSX	Ukrstat	Держстат України	Госстат Украины
3	SES	https://ec.europa.eu/eurostat/databrowser/view/earn_ses_monthly/default/table?lang=en	XLSX	Eurostat	Євростат	Евростат
4	SNBU	https://bank.gov.ua/ua/markets/exchangerate-chart	XLSX	NBU	НБУ	НБУ
5	SED	no data	XLSX	Estimated data	Розрахункові дані	Расчетные данные
6	SFAO	https://www.fao.org/worldfoodsituation/foodpricesindex/ru/	XLSX	FAO	ФАО	ФАО
7	SIMF	https://data.imf.org/?sk=471DDDF8-D8A7-499A-81BA-5B332C01F8B9	XLSX	IMF	МВФ	МВФ
8	STCD	https://tcdata360.worldbank.org/indicators/inv.all.pct?country=UKR&indicator=345&viz=line_chart&years=1980,2026	XLSX	TCdata360	TCdata360	TCdata360
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unit (id, code, ename, uname, rname) FROM stdin;
1	UM2	square meter	квадратний метр	квадратный метр
2	UHA	hectare	гектар	гектар
3	UMG	mln UAH	млн грн	млн грн
4	UTP	thsd. of people	тис. осіб	тыс. человек
5	UPP	%	%	%
6	UEUR	EUR	євро	евро
7	UUSD	US$	дол США	долл США
8	UCUSD	current US$	поточний дол США	текущий долл США
9	UCOUSD	constant 2015 US$	постійний дол США (2015)	постоянный долл США (2015)
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, password, enabled, id) FROM stdin;
prox@i.ua	$2a$10$jxTz/pe8F15LTUNri527LunvWrSEJcWCIDhbygW3AsCxJ1.9oa87i	1	1
\.


--
-- Data for Name: wbnames; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wbnames (id, wbcode, topic, name) FROM stdin;
1	AG.AGR.TRAC.NO	Environment: Agricultural production	"Agricultural machinery
2	AG.CON.FERT.PT.ZS	Environment: Agricultural production	Fertilizer consumption (% of fertilizer production)
3	AG.CON.FERT.ZS	Environment: Agricultural production	Fertilizer consumption (kilograms per hectare of arable land)
4	AG.LND.AGRI.K2	Environment: Land use	Agricultural land (sq. km)
5	AG.LND.AGRI.ZS	Environment: Land use	Agricultural land (% of land area)
6	AG.LND.ARBL.HA	Environment: Land use	Arable land (hectares)
7	AG.LND.ARBL.HA.PC	Environment: Land use	Arable land (hectares per person)
8	AG.LND.ARBL.ZS	Environment: Land use	Arable land (% of land area)
9	AG.LND.CREL.HA	Environment: Agricultural production	Land under cereal production (hectares)
10	AG.LND.CROP.ZS	Environment: Land use	Permanent cropland (% of land area)
11	AG.LND.EL5M.RU.K2	Environment: Land use	Rural land area where elevation is below 5 meters (sq. km)
12	AG.LND.EL5M.RU.ZS	Environment: Land use	Rural land area where elevation is below 5 meters (% of total land area)
13	AG.LND.EL5M.UR.K2	Environment: Land use	Urban land area where elevation is below 5 meters (sq. km)
14	AG.LND.EL5M.UR.ZS	Environment: Land use	Urban land area where elevation is below 5 meters (% of total land area)
15	AG.LND.EL5M.ZS	Environment: Land use	Land area where elevation is below 5 meters (% of total land area)
16	AG.LND.FRST.K2	Environment: Land use	Forest area (sq. km)
17	AG.LND.FRST.ZS	Environment: Land use	Forest area (% of land area)
18	AG.LND.IRIG.AG.ZS	Environment: Land use	Agricultural irrigated land (% of total agricultural land)
19	AG.LND.PRCP.MM	Environment: Land use	Average precipitation in depth (mm per year)
20	AG.LND.TOTL.K2	Environment: Land use	Land area (sq. km)
21	AG.LND.TOTL.RU.K2	Environment: Land use	Rural land area (sq. km)
22	AG.LND.TOTL.UR.K2	Environment: Land use	Urban land area (sq. km)
23	AG.LND.TRAC.ZS	Environment: Agricultural production	"Agricultural machinery
24	AG.PRD.CREL.MT	Environment: Agricultural production	Cereal production (metric tons)
25	AG.PRD.CROP.XD	Environment: Agricultural production	Crop production index (2014-2016 = 100)
26	AG.PRD.FOOD.XD	Environment: Agricultural production	Food production index (2014-2016 = 100)
27	AG.PRD.LVSK.XD	Environment: Agricultural production	Livestock production index (2014-2016 = 100)
28	AG.SRF.TOTL.K2	Environment: Land use	Surface area (sq. km)
29	AG.YLD.CREL.KG	Environment: Agricultural production	Cereal yield (kg per hectare)
30	BG.GSR.NFSV.GD.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
31	BM.GSR.CMCP.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
32	BM.GSR.FCTY.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
33	BM.GSR.GNFS.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
34	BM.GSR.INSF.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
35	BM.GSR.MRCH.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
36	BM.GSR.NFSV.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
37	BM.GSR.ROYL.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
38	BM.GSR.TOTL.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
39	BM.GSR.TRAN.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
40	BM.GSR.TRVL.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
41	BM.KLT.DINV.CD.WD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Foreign direct investment
42	BM.KLT.DINV.WD.GD.ZS	Economic Policy & Debt: Balance of payments: Capital & financial account	"Foreign direct investment
43	BM.TRF.PRVT.CD	Economic Policy & Debt: Balance of payments: Current account: Transfers	"Secondary income
44	BM.TRF.PWKR.CD.DT	Economic Policy & Debt: Balance of payments: Current account: Transfers	"Personal remittances
45	BN.CAB.XOKA.CD	Economic Policy & Debt: Balance of payments: Current account: Balances	"Current account balance (BoP
46	BN.CAB.XOKA.GD.ZS	Economic Policy & Debt: Balance of payments: Current account: Balances	Current account balance (% of GDP)
47	BN.FIN.TOTL.CD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Net financial account (BoP
48	BN.GSR.FCTY.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
49	BN.GSR.GNFS.CD	Economic Policy & Debt: Balance of payments: Current account: Balances	"Net trade in goods and services (BoP
50	BN.GSR.MRCH.CD	Economic Policy & Debt: Balance of payments: Current account: Balances	"Net trade in goods (BoP
51	BN.KAC.EOMS.CD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Net errors and omissions (BoP
52	BN.KLT.DINV.CD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Foreign direct investment
53	BN.KLT.PTXL.CD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Portfolio Investment
54	BN.RES.INCL.CD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Reserves and related items (BoP
55	BN.TRF.CURR.CD	Economic Policy & Debt: Balance of payments: Current account: Transfers	"Net secondary income (BoP
56	BN.TRF.KOGT.CD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Net capital account (BoP
57	BX.GRT.EXTA.CD.WD	Economic Policy & Debt: Balance of payments: Reserves & other items	"Grants
58	BX.GRT.TECH.CD.WD	Economic Policy & Debt: Balance of payments: Reserves & other items	"Technical cooperation grants (BoP
59	BX.GSR.CCIS.CD	Infrastructure: Communications	"ICT service exports (BoP
60	BX.GSR.CCIS.ZS	Infrastructure: Communications	"ICT service exports (% of service exports
61	BX.GSR.CMCP.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
62	BX.GSR.FCTY.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
63	BX.GSR.GNFS.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
64	BX.GSR.INSF.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
65	BX.GSR.MRCH.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
66	BX.GSR.NFSV.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
67	BX.GSR.ROYL.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
68	BX.GSR.TOTL.CD	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
69	BX.GSR.TRAN.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
70	BX.GSR.TRVL.ZS	"Economic Policy & Debt: Balance of payments: Current account: Goods	 services & income"
71	BX.KLT.DINV.CD.WD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Foreign direct investment
72	BX.KLT.DINV.WD.GD.ZS	Economic Policy & Debt: Balance of payments: Capital & financial account	"Foreign direct investment
73	BX.PEF.TOTL.CD.WD	Economic Policy & Debt: Balance of payments: Capital & financial account	"Portfolio equity
74	BX.TRF.CURR.CD	Economic Policy & Debt: Balance of payments: Current account: Transfers	"Secondary income receipts (BoP
75	BX.TRF.PWKR.CD	Economic Policy & Debt: Balance of payments: Current account: Transfers	"Personal transfers
76	BX.TRF.PWKR.CD.DT	Economic Policy & Debt: Balance of payments: Current account: Transfers	"Personal remittances
77	BX.TRF.PWKR.DT.GD.ZS	Economic Policy & Debt: Balance of payments: Current account: Transfers	"Personal remittances
78	CM.MKT.INDX.ZG	Financial Sector: Capital markets	S&P Global Equity Indices (annual % change)
79	CM.MKT.LCAP.CD	Financial Sector: Capital markets	Market capitalization of listed domestic companies (current US$)
80	CM.MKT.LCAP.GD.ZS	Financial Sector: Capital markets	Market capitalization of listed domestic companies (% of GDP)
81	CM.MKT.LDOM.NO	Financial Sector: Capital markets	"Listed domestic companies
82	CM.MKT.TRAD.CD	Financial Sector: Capital markets	"Stocks traded
83	CM.MKT.TRAD.GD.ZS	Financial Sector: Capital markets	"Stocks traded
84	CM.MKT.TRNR	Financial Sector: Capital markets	"Stocks traded
85	DC.DAC.AUSL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
86	DC.DAC.AUTL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
87	DC.DAC.BELL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
88	DC.DAC.CANL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
89	DC.DAC.CECL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
90	DC.DAC.CHEL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
91	DC.DAC.CZEL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
92	DC.DAC.DEUL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
93	DC.DAC.DNKL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
94	DC.DAC.ESPL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
95	DC.DAC.FINL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
96	DC.DAC.FRAL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
97	DC.DAC.GBRL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
98	DC.DAC.GRCL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
99	DC.DAC.HUNL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
100	DC.DAC.IRLL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
101	DC.DAC.ISLL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
102	DC.DAC.ITAL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
103	DC.DAC.JPNL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
104	DC.DAC.KORL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
105	DC.DAC.LUXL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
106	DC.DAC.NLDL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
107	DC.DAC.NORL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
108	DC.DAC.NZLL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
109	DC.DAC.POLL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
110	DC.DAC.PRTL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
111	DC.DAC.SVKL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
112	DC.DAC.SVNL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
113	DC.DAC.SWEL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
114	DC.DAC.TOTL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
115	DC.DAC.USAL.CD	Economic Policy & Debt: Official development assistance	"Net bilateral aid flows from DAC donors
116	DC.ODA.TLDC.CD	Economic Policy & Debt: Official development assistance	"Net ODA provided
117	DC.ODA.TLDC.GN.ZS	Economic Policy & Debt: Official development assistance	Net ODA provided to the least developed countries (% of GNI)
118	DC.ODA.TOTL.CD	Economic Policy & Debt: Official development assistance	"Net ODA provided
119	DC.ODA.TOTL.GN.ZS	Economic Policy & Debt: Official development assistance	"Net ODA provided
120	DC.ODA.TOTL.KD	Economic Policy & Debt: Official development assistance	"Net ODA provided
121	DT.DOD.DECT.CD	Economic Policy & Debt: External debt: Debt outstanding	"External debt stocks
122	DT.DOD.DECT.GN.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	External debt stocks (% of GNI)
123	DT.DOD.DIMF.CD	Economic Policy & Debt: External debt: Debt outstanding	"Use of IMF credit (DOD
124	DT.DOD.DLXF.CD	Economic Policy & Debt: External debt: Debt outstanding	"External debt stocks
125	DT.DOD.DPNG.CD	Economic Policy & Debt: External debt: Debt outstanding	"External debt stocks
126	DT.DOD.DPPG.CD	Economic Policy & Debt: External debt: Debt outstanding	"External debt stocks
127	DT.DOD.DSTC.CD	Economic Policy & Debt: External debt: Debt outstanding	"External debt stocks
128	DT.DOD.DSTC.IR.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	Short-term debt (% of total reserves)
129	DT.DOD.DSTC.XP.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	"Short-term debt (% of exports of goods
130	DT.DOD.DSTC.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	Short-term debt (% of total external debt)
131	DT.DOD.MIBR.CD	Economic Policy & Debt: External debt: Debt outstanding	"PPG
132	DT.DOD.MIDA.CD	Economic Policy & Debt: External debt: Debt outstanding	"PPG
133	DT.DOD.MWBG.CD	Economic Policy & Debt: External debt: Debt outstanding	"IBRD loans and IDA credits (DOD
134	DT.DOD.PVLX.CD	Economic Policy & Debt: External debt: Debt outstanding	Present value of external debt (current US$)
135	DT.DOD.PVLX.EX.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	"Present value of external debt (% of exports of goods
136	DT.DOD.PVLX.GN.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	Present value of external debt (% of GNI)
137	DT.NFL.BLAT.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
138	DT.NFL.BOND.CD	Economic Policy & Debt: External debt: Net flows	"Portfolio investment
139	DT.NFL.DPNG.CD	Economic Policy & Debt: External debt: Net flows	"Net flows on external debt
140	DT.NFL.FAOG.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
141	DT.NFL.IAEA.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
142	DT.NFL.IFAD.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
143	DT.NFL.ILOG.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
144	DT.NFL.IMFC.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
145	DT.NFL.IMFN.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
146	DT.NFL.MIBR.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
147	DT.NFL.MIDA.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
148	DT.NFL.MLAT.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
149	DT.NFL.MOTH.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
150	DT.NFL.NIFC.CD	Economic Policy & Debt: External debt: Net flows	"IFC
151	DT.NFL.OFFT.CD	Economic Policy & Debt: External debt: Net flows	"PPG
152	DT.NFL.PBND.CD	Economic Policy & Debt: External debt: Net flows	"PPG
153	DT.NFL.PCBK.CD	Economic Policy & Debt: External debt: Net flows	"PPG
154	DT.NFL.PCBO.CD	Economic Policy & Debt: External debt: Net flows	"Commercial banks and other lending (PPG + PNG) (NFL
155	DT.NFL.PNGB.CD	Economic Policy & Debt: External debt: Net flows	"PNG
156	DT.NFL.PNGC.CD	Economic Policy & Debt: External debt: Net flows	"PNG
157	DT.NFL.PROP.CD	Economic Policy & Debt: External debt: Net flows	"PPG
158	DT.NFL.PRVT.CD	Economic Policy & Debt: External debt: Net flows	"PPG
159	DT.NFL.RDBC.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
160	DT.NFL.RDBN.CD	Economic Policy & Debt: External debt: Net flows	"Net financial flows
161	DT.NFL.UNAI.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
162	DT.NFL.UNCF.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
163	DT.NFL.UNCR.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
164	DT.NFL.UNDP.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
165	DT.NFL.UNEC.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
166	DT.NFL.UNEP.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
167	DT.NFL.UNFP.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
168	DT.NFL.UNID.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
169	DT.NFL.UNPB.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
170	DT.NFL.UNRW.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
171	DT.NFL.UNTA.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
172	DT.NFL.UNWT.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
173	DT.NFL.WFPG.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
174	DT.NFL.WHOL.CD	Economic Policy & Debt: Official development assistance	"Net official flows from UN agencies
175	DT.ODA.ALLD.CD	Economic Policy & Debt: Official development assistance	Net official development assistance and official aid received (current US$)
176	DT.ODA.ALLD.KD	Economic Policy & Debt: Official development assistance	Net official development assistance and official aid received (constant 2018 US$)
177	DT.ODA.OATL.CD	Economic Policy & Debt: Official development assistance	Net official aid received (current US$)
178	DT.ODA.OATL.KD	Economic Policy & Debt: Official development assistance	Net official aid received (constant 2018 US$)
179	DT.ODA.ODAT.CD	Economic Policy & Debt: Official development assistance	Net official development assistance received (current US$)
180	DT.ODA.ODAT.GI.ZS	Economic Policy & Debt: Official development assistance	Net ODA received (% of gross capital formation)
181	DT.ODA.ODAT.GN.ZS	Economic Policy & Debt: Official development assistance	Net ODA received (% of GNI)
182	DT.ODA.ODAT.KD	Economic Policy & Debt: Official development assistance	Net official development assistance received (constant 2018 US$)
183	DT.ODA.ODAT.MP.ZS	Economic Policy & Debt: Official development assistance	"Net ODA received (% of imports of goods
184	DT.ODA.ODAT.PC.ZS	Economic Policy & Debt: Official development assistance	Net ODA received per capita (current US$)
185	DT.ODA.ODAT.XP.ZS	Economic Policy & Debt: Official development assistance	Net ODA received (% of central government expense)
186	DT.TDS.DECT.CD	Economic Policy & Debt: External debt: Debt service	"Debt service on external debt
187	DT.TDS.DECT.EX.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	"Total debt service (% of exports of goods
188	DT.TDS.DECT.GN.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	Total debt service (% of GNI)
189	DT.TDS.DIMF.CD	Economic Policy & Debt: External debt: Debt service	"IMF repurchases and charges (TDS
190	DT.TDS.DPPF.XP.ZS	Economic Policy & Debt: External debt: Debt service	Debt service to exports (%)
191	DT.TDS.DPPG.CD	Economic Policy & Debt: External debt: Debt service	"Debt service on external debt
192	DT.TDS.DPPG.GN.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	Public and publicly guaranteed debt service (% of GNI)
193	DT.TDS.DPPG.XP.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	"Public and publicly guaranteed debt service (% of exports of goods
194	DT.TDS.MLAT.CD	Economic Policy & Debt: External debt: Debt service	"Multilateral debt service (TDS
195	DT.TDS.MLAT.PG.ZS	Economic Policy & Debt: External debt: Debt ratios & other items	Multilateral debt service (% of public and publicly guaranteed debt service)
196	EG.CFT.ACCS.RU.ZS	Environment: Energy production & use	"Access to clean fuels and technologies for cooking
197	EG.CFT.ACCS.UR.ZS	Environment: Energy production & use	"Access to clean fuels and technologies for cooking
198	EG.CFT.ACCS.ZS	Environment: Energy production & use	Access to clean fuels and technologies for cooking  (% of population)
199	EG.EGY.PRIM.PP.KD	Environment: Energy production & use	Energy intensity level of primary energy (MJ/$2017 PPP GDP)
200	EG.ELC.ACCS.RU.ZS	Environment: Energy production & use	"Access to electricity
201	EG.ELC.ACCS.UR.ZS	Environment: Energy production & use	"Access to electricity
202	EG.ELC.ACCS.ZS	Environment: Energy production & use	Access to electricity (% of population)
203	EG.ELC.COAL.ZS	Environment: Energy production & use	Electricity production from coal sources (% of total)
204	EG.ELC.FOSL.ZS	Environment: Energy production & use	"Electricity production from oil
205	EG.ELC.HYRO.ZS	Environment: Energy production & use	Electricity production from hydroelectric sources (% of total)
206	EG.ELC.LOSS.ZS	Environment: Energy production & use	Electric power transmission and distribution losses (% of output)
207	EG.ELC.NGAS.ZS	Environment: Energy production & use	Electricity production from natural gas sources (% of total)
208	EG.ELC.NUCL.ZS	Environment: Energy production & use	Electricity production from nuclear sources (% of total)
209	EG.ELC.PETR.ZS	Environment: Energy production & use	Electricity production from oil sources (% of total)
210	EG.ELC.RNEW.ZS	Environment: Energy production & use	Renewable electricity output (% of total electricity output)
211	EG.ELC.RNWX.KH	Environment: Energy production & use	"Electricity production from renewable sources
212	EG.ELC.RNWX.ZS	Environment: Energy production & use	"Electricity production from renewable sources
213	EG.FEC.RNEW.ZS	Environment: Energy production & use	Renewable energy consumption (% of total final energy consumption)
214	EG.GDP.PUSE.KO.PP	Environment: Energy production & use	GDP per unit of energy use (PPP $ per kg of oil equivalent)
215	EG.GDP.PUSE.KO.PP.KD	Environment: Energy production & use	GDP per unit of energy use (constant 2017 PPP $ per kg of oil equivalent)
216	EG.IMP.CONS.ZS	Environment: Energy production & use	"Energy imports
217	EG.USE.COMM.CL.ZS	Environment: Energy production & use	Alternative and nuclear energy (% of total energy use)
218	EG.USE.COMM.FO.ZS	Environment: Energy production & use	Fossil fuel energy consumption (% of total)
219	EG.USE.COMM.GD.PP.KD	Environment: Energy production & use	"Energy use (kg of oil equivalent) per $1
220	EG.USE.CRNW.ZS	Environment: Energy production & use	Combustible renewables and waste (% of total energy)
221	EG.USE.ELEC.KH.PC	Environment: Energy production & use	Electric power consumption (kWh per capita)
222	EG.USE.PCAP.KG.OE	Environment: Energy production & use	Energy use (kg of oil equivalent per capita)
223	EN.ATM.CO2E.EG.ZS	Environment: Emissions	CO2 intensity (kg per kg of oil equivalent energy use)
224	EN.ATM.CO2E.GF.KT	Environment: Emissions	CO2 emissions from gaseous fuel consumption (kt)
225	EN.ATM.CO2E.GF.ZS	Environment: Emissions	CO2 emissions from gaseous fuel consumption (% of total)
226	EN.ATM.CO2E.KD.GD	Environment: Emissions	CO2 emissions (kg per 2015 US$ of GDP)
227	EN.ATM.CO2E.KT	Environment: Emissions	Total CO2 emissions (thousand metric tons of CO2 excluding Land-Use Change and Forestry)
228	EN.ATM.CO2E.LF.KT	Environment: Emissions	CO2 emissions from liquid fuel consumption (kt)
229	EN.ATM.CO2E.LF.ZS	Environment: Emissions	CO2 emissions from liquid fuel consumption (% of total)
230	EN.ATM.CO2E.PC	Environment: Emissions	CO2 emissions (metric tons per capita)
231	EN.ATM.CO2E.PP.GD	Environment: Emissions	CO2 emissions (kg per PPP $ of GDP)
232	EN.ATM.CO2E.PP.GD.KD	Environment: Emissions	CO2 emissions (kg per 2017 PPP $ of GDP)
233	EN.ATM.CO2E.SF.KT	Environment: Emissions	CO2 emissions from solid fuel consumption (kt)
234	EN.ATM.CO2E.SF.ZS	Environment: Emissions	CO2 emissions from solid fuel consumption (% of total)
235	EN.ATM.GHGO.KT.CE	Environment: Emissions	"Other greenhouse gas emissions
236	EN.ATM.GHGO.ZG	Environment: Emissions	Other greenhouse gas emissions (% change from 1990)
237	EN.ATM.GHGT.KT.CE	Environment: Emissions	Total greenhouse gas emissions (thousand metric tons of CO2 equivalent excluding Land-Use Change and Forestry)
238	EN.ATM.GHGT.ZG	Environment: Emissions	Total greenhouse gas emissions (% change from 1990)
239	EN.ATM.HFCG.KT.CE	Environment: Emissions	HFC gas emissions (thousand metric tons of CO2 equivalent)
240	EN.ATM.METH.AG.KT.CE	Environment: Emissions	Agricultural methane emissions (thousand metric tons of CO2 equivalent)
241	EN.ATM.METH.AG.ZS	Environment: Emissions	Agricultural methane emissions (% of total)
242	EN.ATM.METH.EG.KT.CE	Environment: Emissions	Methane emissions in energy sector (thousand metric tons of CO2 equivalent)
243	EN.ATM.METH.EG.ZS	Environment: Emissions	Energy related methane emissions (% of total)
244	EN.ATM.METH.KT.CE	Environment: Emissions	Total methane emissions (thousand metric tons of CO2 equivalent excluding Land-Use Change and Forestry)
245	EN.ATM.METH.ZG	Environment: Emissions	Methane emissions (% change from 1990)
246	EN.ATM.NOXE.AG.KT.CE	Environment: Emissions	Agricultural nitrous oxide emissions (thousand metric tons of CO2 equivalent)
247	EN.ATM.NOXE.AG.ZS	Environment: Emissions	Agricultural nitrous oxide emissions (% of total)
248	EN.ATM.NOXE.EG.KT.CE	Environment: Emissions	Nitrous oxide emissions in energy sector (thousand metric tons of CO2 equivalent)
249	EN.ATM.NOXE.EG.ZS	Environment: Emissions	Nitrous oxide emissions in energy sector (% of total)
250	EN.ATM.NOXE.KT.CE	Environment: Emissions	Total nitrous oxide emissions (thousand metric tons of CO2 equivalent excluding Land-Use Change and Forestry)
251	EN.ATM.NOXE.ZG	Environment: Emissions	Nitrous oxide emissions (% change from 1990)
252	EN.ATM.PFCG.KT.CE	Environment: Emissions	PFC gas emissions (thousand metric tons of CO2 equivalent)
253	EN.ATM.PM25.MC.M3	Environment: Emissions	"PM2.5 air pollution
254	EN.ATM.PM25.MC.T1.ZS	Environment: Emissions	"PM2.5 pollution
255	EN.ATM.PM25.MC.T2.ZS	Environment: Emissions	"PM2.5 pollution
256	EN.ATM.PM25.MC.T3.ZS	Environment: Emissions	"PM2.5 pollution
257	EN.ATM.PM25.MC.ZS	Environment: Emissions	"PM2.5 air pollution
258	EN.ATM.SF6G.KT.CE	Environment: Emissions	SF6 gas emissions (thousand metric tons of CO2 equivalent)
259	EN.BIR.THRD.NO	Environment: Biodiversity & protected areas	"Bird species
260	EN.CLC.DRSK.XQ	Environment: Land use	Disaster risk reduction progress score (1-5 scale; 5=best)
261	EN.CLC.GHGR.MT.CE	Environment: Emissions	GHG net emissions/removals by LUCF (Mt of CO2 equivalent)
262	EN.CLC.MDAT.ZS	Environment: Land use	"Droughts
263	EN.CO2.BLDG.ZS	Environment: Emissions	CO2 emissions from residential buildings and commercial and public services (% of total fuel combustion)
264	EN.CO2.ETOT.ZS	Environment: Emissions	"CO2 emissions from electricity and heat production
265	EN.CO2.MANF.ZS	Environment: Emissions	CO2 emissions from manufacturing industries and construction (% of total fuel combustion)
266	EN.CO2.OTHX.ZS	Environment: Emissions	"CO2 emissions from other sectors
267	EN.CO2.TRAN.ZS	Environment: Emissions	CO2 emissions from transport (% of total fuel combustion)
268	EN.FSH.THRD.NO	Environment: Biodiversity & protected areas	"Fish species
269	EN.HPT.THRD.NO	Environment: Biodiversity & protected areas	"Plant species (higher)
270	EN.MAM.THRD.NO	Environment: Biodiversity & protected areas	"Mammal species
271	EN.POP.DNST	Environment: Density & urbanization	Population density (people per sq. km of land area)
272	EN.POP.EL5M.RU.ZS	Environment: Land use	Rural population living in areas where elevation is below 5 meters (% of total population)
273	EN.POP.EL5M.UR.ZS	Environment: Land use	Urban population living in areas where elevation is below 5 meters (% of total population)
274	EN.POP.EL5M.ZS	Environment: Land use	Population living in areas where elevation is below 5 meters (% of total population)
275	EN.POP.SLUM.UR.ZS	Environment: Density & urbanization	Population living in slums (% of urban population)
276	EN.URB.LCTY	Environment: Density & urbanization	Population in largest city
277	EN.URB.LCTY.UR.ZS	Environment: Density & urbanization	Population in the largest city (% of urban population)
278	EN.URB.MCTY	Environment: Density & urbanization	Population in urban agglomerations of more than 1 million
279	EN.URB.MCTY.TL.ZS	Environment: Density & urbanization	Population in urban agglomerations of more than 1 million (% of total population)
280	EP.PMP.DESL.CD	Infrastructure: Transportation	Pump price for diesel fuel (US$ per liter)
281	EP.PMP.SGAS.CD	Infrastructure: Transportation	Pump price for gasoline (US$ per liter)
282	ER.FSH.AQUA.MT	Environment: Agricultural production	Aquaculture production (metric tons)
283	ER.FSH.CAPT.MT	Environment: Agricultural production	Capture fisheries production (metric tons)
284	ER.FSH.PROD.MT	Environment: Agricultural production	Total fisheries production (metric tons)
285	ER.GDP.FWTL.M3.KD	Environment: Freshwater	"Water productivity
286	ER.H2O.FWAG.ZS	Environment: Freshwater	"Annual freshwater withdrawals
287	ER.H2O.FWDM.ZS	Environment: Freshwater	"Annual freshwater withdrawals
288	ER.H2O.FWIN.ZS	Environment: Freshwater	"Annual freshwater withdrawals
289	ER.H2O.FWST.ZS	Environment: Freshwater	Level of water stress: freshwater withdrawal as a proportion of available freshwater resources
290	ER.H2O.FWTL.K3	Environment: Freshwater	"Annual freshwater withdrawals
291	ER.H2O.FWTL.ZS	Environment: Freshwater	"Annual freshwater withdrawals
292	ER.H2O.INTR.K3	Environment: Freshwater	"Renewable internal freshwater resources
293	ER.H2O.INTR.PC	Environment: Freshwater	Renewable internal freshwater resources per capita (cubic meters)
294	ER.LND.PTLD.ZS	Environment: Biodiversity & protected areas	Terrestrial protected areas (% of total land area)
295	ER.MRN.PTMR.ZS	Environment: Biodiversity & protected areas	Marine protected areas (% of territorial waters)
296	ER.PTD.TOTL.ZS	Environment: Biodiversity & protected areas	Terrestrial and marine protected areas (% of total territorial area)
297	FB.AST.NPER.ZS	Financial Sector: Assets	Bank nonperforming loans to total gross loans (%)
298	FB.ATM.TOTL.P5	Financial Sector: Access	"Automated teller machines (ATMs) (per 100
299	FB.BNK.CAPA.ZS	Financial Sector: Assets	Bank capital to assets ratio (%)
300	FB.CBK.BRCH.P5	Financial Sector: Access	"Commercial bank branches (per 100
301	FB.CBK.BRWR.P3	Financial Sector: Access	"Borrowers from commercial banks (per 1
302	FB.CBK.DPTR.P3	Financial Sector: Access	"Depositors with commercial banks (per 1
303	FD.AST.PRVT.GD.ZS	Financial Sector: Assets	Domestic credit to private sector by banks (% of GDP)
304	FD.RES.LIQU.AS.ZS	Financial Sector: Assets	Bank liquid reserves to bank assets ratio (%)
305	FI.RES.TOTL.CD	Economic Policy & Debt: Balance of payments: Reserves & other items	"Total reserves (includes gold
306	FI.RES.TOTL.DT.ZS	Economic Policy & Debt: Balance of payments: Reserves & other items	Total reserves (% of total external debt)
307	FI.RES.TOTL.MO	Economic Policy & Debt: Balance of payments: Reserves & other items	Total reserves in months of imports
308	FI.RES.XGLD.CD	Economic Policy & Debt: Balance of payments: Reserves & other items	Total reserves minus gold (current US$)
309	FM.AST.CGOV.ZG.M3	Financial Sector: Assets	Claims on central government (annual growth as % of broad money)
310	FM.AST.DOMO.ZG.M3	Financial Sector: Assets	Claims on other sectors of the domestic economy (annual growth as % of broad money)
311	FM.AST.DOMS.CN	Financial Sector: Assets	Net domestic credit (current LCU)
312	FM.AST.NFRG.CN	Financial Sector: Assets	Net foreign assets (current LCU)
313	FM.AST.PRVT.GD.ZS	Financial Sector: Assets	Monetary Sector credit to private sector (% GDP)
314	FM.AST.PRVT.ZG.M3	Financial Sector: Assets	Claims on private sector (annual growth as % of broad money)
315	FM.LBL.BMNY.CN	Financial Sector: Monetary holdings (liabilities)	Broad money (current LCU)
316	FM.LBL.BMNY.GD.ZS	Financial Sector: Monetary holdings (liabilities)	Broad money (% of GDP)
317	FM.LBL.BMNY.IR.ZS	Financial Sector: Monetary holdings (liabilities)	Broad money to total reserves ratio
318	FM.LBL.BMNY.ZG	Financial Sector: Monetary holdings (liabilities)	Broad money growth (annual %)
319	FP.CPI.TOTL	Financial Sector: Exchange rates & prices	Consumer price index (2010 = 100)
320	FP.CPI.TOTL.ZG	Financial Sector: Exchange rates & prices	"Inflation
321	FP.WPI.TOTL	Financial Sector: Exchange rates & prices	Wholesale price index (2010 = 100)
322	FR.INR.DPST	Financial Sector: Interest rates	Deposit interest rate (%)
323	FR.INR.LEND	Financial Sector: Interest rates	Lending interest rate (%)
324	FR.INR.LNDP	Financial Sector: Interest rates	"Interest rate spread (lending rate minus deposit rate
325	FR.INR.RINR	Financial Sector: Interest rates	Real interest rate (%)
326	FR.INR.RISK	Financial Sector: Interest rates	"Risk premium on lending (lending rate minus treasury bill rate
327	FS.AST.CGOV.GD.ZS	Financial Sector: Assets	"Claims on central government
328	FS.AST.DOMO.GD.ZS	Financial Sector: Assets	Claims on other sectors of the domestic economy (% of GDP)
329	FS.AST.DOMS.GD.ZS	Financial Sector: Assets	Domestic credit provided by financial sector (% of GDP)
330	FS.AST.PRVT.GD.ZS	Financial Sector: Assets	Domestic credit to private sector (% of GDP)
331	FX.OWN.TOTL.40.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
332	FX.OWN.TOTL.60.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
333	FX.OWN.TOTL.FE.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
334	FX.OWN.TOTL.MA.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
335	FX.OWN.TOTL.OL.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
336	FX.OWN.TOTL.PL.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
337	FX.OWN.TOTL.SO.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
338	FX.OWN.TOTL.YG.ZS	Financial Sector: Access	"Account ownership at a financial institution or with a mobile-money-service provider
339	FX.OWN.TOTL.ZS	Financial Sector: Access	Account ownership at a financial institution or with a mobile-money-service provider (% of population ages 15+)
340	GB.XPD.RSDV.GD.ZS	Infrastructure: Technology	Research and development expenditure (% of GDP)
341	GC.AST.TOTL.CN	Public Sector: Government finance: Deficit & financing	Net acquisition of financial assets (current LCU)
342	GC.AST.TOTL.GD.ZS	Public Sector: Government finance: Deficit & financing	Net acquisition of financial assets (% of GDP)
343	GC.DOD.TOTL.CN	Public Sector: Government finance: Deficit & financing	"Central government debt
344	GC.DOD.TOTL.GD.ZS	Public Sector: Government finance: Deficit & financing	"Central government debt
345	GC.LBL.TOTL.CN	Public Sector: Government finance: Deficit & financing	"Net incurrence of liabilities
346	GC.LBL.TOTL.GD.ZS	Public Sector: Government finance: Deficit & financing	"Net incurrence of liabilities
347	GC.NFN.TOTL.CN	Public Sector: Government finance: Deficit & financing	Net investment in nonfinancial assets (current LCU)
348	GC.NFN.TOTL.GD.ZS	Public Sector: Government finance: Deficit & financing	Net investment in nonfinancial assets (% of GDP)
349	GC.NLD.TOTL.CN	Public Sector: Government finance: Deficit & financing	Net lending (+) / net borrowing (-) (current LCU)
350	GC.NLD.TOTL.GD.ZS	Public Sector: Government finance: Deficit & financing	Net lending (+) / net borrowing (-) (% of GDP)
351	GC.REV.GOTR.CN	Public Sector: Government finance: Revenue	Grants and other revenue (current LCU)
352	GC.REV.GOTR.ZS	Public Sector: Government finance: Revenue	Grants and other revenue (% of revenue)
353	GC.REV.SOCL.CN	Public Sector: Government finance: Revenue	Social contributions (current LCU)
354	GC.REV.SOCL.ZS	Public Sector: Government finance: Revenue	Social contributions (% of revenue)
355	GC.REV.XGRT.CN	Public Sector: Government finance: Revenue	"Revenue
356	GC.REV.XGRT.GD.ZS	Public Sector: Government finance: Revenue	"Revenue
357	GC.TAX.EXPT.CN	Public Sector: Government finance: Revenue	Taxes on exports (current LCU)
358	GC.TAX.EXPT.ZS	Public Sector: Government finance: Revenue	Taxes on exports (% of tax revenue)
359	GC.TAX.GSRV.CN	Public Sector: Government finance: Revenue	Taxes on goods and services (current LCU)
360	GC.TAX.GSRV.RV.ZS	Public Sector: Government finance: Revenue	Taxes on goods and services (% of revenue)
361	GC.TAX.GSRV.VA.ZS	Public Sector: Government finance: Revenue	Taxes on goods and services (% value added of industry and services)
362	GC.TAX.IMPT.CN	Public Sector: Government finance: Revenue	Customs and other import duties (current LCU)
363	GC.TAX.IMPT.ZS	Public Sector: Government finance: Revenue	Customs and other import duties (% of tax revenue)
364	GC.TAX.INTT.CN	Public Sector: Government finance: Revenue	Taxes on international trade (current LCU)
365	GC.TAX.INTT.RV.ZS	Public Sector: Government finance: Revenue	Taxes on international trade (% of revenue)
366	GC.TAX.OTHR.CN	Public Sector: Government finance: Revenue	Other taxes (current LCU)
367	GC.TAX.OTHR.RV.ZS	Public Sector: Government finance: Revenue	Other taxes (% of revenue)
368	GC.TAX.TOTL.CN	Public Sector: Government finance: Revenue	Tax revenue (current LCU)
369	GC.TAX.TOTL.GD.ZS	Public Sector: Government finance: Revenue	Tax revenue (% of GDP)
370	GC.TAX.YPKG.CN	Public Sector: Government finance: Revenue	"Taxes on income
371	GC.TAX.YPKG.RV.ZS	Public Sector: Government finance: Revenue	"Taxes on income
372	GC.TAX.YPKG.ZS	Public Sector: Government finance: Revenue	"Taxes on income
373	GC.XPN.COMP.CN	Public Sector: Government finance: Expense	Compensation of employees (current LCU)
374	GC.XPN.COMP.ZS	Public Sector: Government finance: Expense	Compensation of employees (% of expense)
375	GC.XPN.GSRV.CN	Public Sector: Government finance: Expense	Goods and services expense (current LCU)
376	GC.XPN.GSRV.ZS	Public Sector: Government finance: Expense	Goods and services expense (% of expense)
377	GC.XPN.INTP.CN	Public Sector: Government finance: Expense	Interest payments (current LCU)
378	GC.XPN.INTP.RV.ZS	Public Sector: Government finance: Expense	Interest payments (% of revenue)
379	GC.XPN.INTP.ZS	Public Sector: Government finance: Expense	Interest payments (% of expense)
380	GC.XPN.OTHR.CN	Public Sector: Government finance: Expense	Other expense (current LCU)
381	GC.XPN.OTHR.ZS	Public Sector: Government finance: Expense	Other expense (% of expense)
382	GC.XPN.TOTL.CN	Public Sector: Government finance: Expense	Expense (current LCU)
383	GC.XPN.TOTL.GD.ZS	Public Sector: Government finance: Expense	Expense (% of GDP)
384	GC.XPN.TRFT.CN	Public Sector: Government finance: Expense	Subsidies and other transfers (current LCU)
385	GC.XPN.TRFT.ZS	Public Sector: Government finance: Expense	Subsidies and other transfers (% of expense)
386	GF.XPD.BUDG.ZS	Public Sector: Government finance	Primary government expenditures as a proportion of original approved budget (%)
387	HD.HCI.OVRL	Public Sector: Policy & institutions	Human capital index (HCI) (scale 0-1)
388	HD.HCI.OVRL.FE	Public Sector: Policy & institutions	"Human capital index (HCI)
389	HD.HCI.OVRL.LB	Public Sector: Policy & institutions	"Human capital index (HCI)
390	HD.HCI.OVRL.LB.FE	Public Sector: Policy & institutions	"Human capital index (HCI)
391	HD.HCI.OVRL.LB.MA	Public Sector: Policy & institutions	"Human capital index (HCI)
392	HD.HCI.OVRL.MA	Public Sector: Policy & institutions	"Human capital index (HCI)
393	HD.HCI.OVRL.UB	Public Sector: Policy & institutions	"Human capital index (HCI)
394	HD.HCI.OVRL.UB.FE	Public Sector: Policy & institutions	"Human capital index (HCI)
395	HD.HCI.OVRL.UB.MA	Public Sector: Policy & institutions	"Human capital index (HCI)
396	IC.BUS.DFRN.XQ	Private Sector & Trade: Business environment	Ease of doing business score (0 = lowest performance to 100 = best performance)
397	IC.BUS.DISC.XQ	Private Sector & Trade: Business environment	Business extent of disclosure index (0=less disclosure to 10=more disclosure)
398	IC.BUS.EASE.XQ	Private Sector & Trade: Business environment	Ease of doing business rank (1=most business-friendly regulations)
399	IC.BUS.NDNS.ZS	Private Sector & Trade: Business environment	"New business density (new registrations per 1
400	IC.BUS.NREG	Private Sector & Trade: Business environment	New businesses registered (number)
401	IC.CRD.INFO.XQ	Private Sector & Trade: Business environment	Depth of credit information index (0=low to 8=high)
402	IC.CRD.PRVT.ZS	Private Sector & Trade: Business environment	Private credit bureau coverage (% of adults)
403	IC.CRD.PUBL.ZS	Private Sector & Trade: Business environment	Public credit registry coverage (% of adults)
404	IC.CUS.DURS.EX	Private Sector & Trade: Business environment	Average time to clear exports through customs (days)
405	IC.ELC.DURS	Private Sector & Trade: Business environment	Time to obtain an electrical connection (days)
406	IC.ELC.OUTG	Private Sector & Trade: Business environment	Power outages in firms in a typical month (number)
407	IC.ELC.OUTG.ZS	Private Sector & Trade: Business environment	Firms experiencing electrical outages (% of firms)
408	IC.ELC.TIME	Private Sector & Trade: Business environment	Time required to get electricity (days)
409	IC.EXP.CSBC.CD	Private Sector & Trade: Trade facilitation	"Cost to export
410	IC.EXP.CSDC.CD	Private Sector & Trade: Trade facilitation	"Cost to export
411	IC.EXP.TMBC	Private Sector & Trade: Trade facilitation	"Time to export
412	IC.EXP.TMDC	Private Sector & Trade: Trade facilitation	"Time to export
413	IC.FRM.BKWC.ZS	Private Sector & Trade: Business environment	Firms using banks to finance working capital (% of firms)
414	IC.FRM.BNKS.ZS	Private Sector & Trade: Business environment	Firms using banks to finance investment (% of firms)
415	IC.FRM.BRIB.ZS	Private Sector & Trade: Business environment	Bribery incidence (% of firms experiencing at least one bribe payment request)
416	IC.FRM.CMPU.ZS	Private Sector & Trade: Business environment	Firms competing against unregistered firms (% of firms)
417	IC.FRM.CORR.ZS	Private Sector & Trade: Business environment	Informal payments to public officials (% of firms)
418	IC.FRM.CRIM.ZS	Private Sector & Trade: Business environment	Losses due to theft and vandalism (% of annual sales of affected firms)
419	IC.FRM.DURS	Private Sector & Trade: Business environment	Time required to obtain an operating license (days)
420	IC.FRM.FEMM.ZS	Private Sector & Trade: Business environment	Firms with female top manager (% of firms)
421	IC.FRM.FEMO.ZS	Private Sector & Trade: Business environment	Firms with female participation in ownership (% of firms)
422	IC.FRM.FREG.ZS	Private Sector & Trade: Business environment	Firms formally registered when operations started (% of firms)
423	IC.FRM.INFM.ZS	Private Sector & Trade: Business environment	Firms that do not report all sales for tax purposes (% of firms)
424	IC.FRM.METG.ZS	Private Sector & Trade: Business environment	Firms visited or required meetings with tax officials (% of firms)
425	IC.FRM.OUTG.ZS	Private Sector & Trade: Business environment	Value lost due to electrical outages (% of sales for affected firms)
426	IC.FRM.RSDV.ZS	Private Sector & Trade: Business environment	Firms that spend on R&D (% of firms)
427	IC.FRM.THEV.ZS	Private Sector & Trade: Business environment	Firms experiencing losses due to theft and vandalism (% of firms)
428	IC.FRM.TRNG.ZS	Private Sector & Trade: Business environment	Firms offering formal training (% of firms)
429	IC.GOV.DURS.ZS	Private Sector & Trade: Business environment	Time spent dealing with the requirements of government regulations (% of senior management time)
430	IC.IMP.CSBC.CD	Private Sector & Trade: Trade facilitation	"Cost to import
431	IC.IMP.CSDC.CD	Private Sector & Trade: Trade facilitation	"Cost to import
432	IC.IMP.TMBC	Private Sector & Trade: Trade facilitation	"Time to import
433	IC.IMP.TMDC	Private Sector & Trade: Trade facilitation	"Time to import
434	IC.ISV.DURS	Private Sector & Trade: Business environment	Time to resolve insolvency (years)
435	IC.LGL.CRED.XQ	Private Sector & Trade: Business environment	Strength of legal rights index (0=weak to 12=strong)
436	IC.LGL.DURS	Private Sector & Trade: Business environment	Time required to enforce a contract (days)
437	IC.PRP.DURS	Private Sector & Trade: Business environment	Time required to register property (days)
438	IC.PRP.PROC	Private Sector & Trade: Business environment	Procedures to register property (number)
439	IC.REG.COST.PC.FE.ZS	Private Sector & Trade: Business environment	"Cost of business start-up procedures
440	IC.REG.COST.PC.MA.ZS	Private Sector & Trade: Business environment	"Cost of business start-up procedures
441	IC.REG.COST.PC.ZS	Private Sector & Trade: Business environment	Cost of business start-up procedures (% of GNI per capita)
442	IC.REG.DURS	Private Sector & Trade: Business environment	Time required to start a business (days)
443	IC.REG.DURS.FE	Private Sector & Trade: Business environment	"Time required to start a business
444	IC.REG.DURS.MA	Private Sector & Trade: Business environment	"Time required to start a business
445	IC.REG.PROC	Private Sector & Trade: Business environment	Start-up procedures to register a business (number)
446	IC.REG.PROC.FE	Private Sector & Trade: Business environment	"Start-up procedures to register a business
447	IC.REG.PROC.MA	Private Sector & Trade: Business environment	"Start-up procedures to register a business
448	IC.TAX.DURS	Private Sector & Trade: Business environment	Time to prepare and pay taxes (hours)
449	IC.TAX.GIFT.ZS	Private Sector & Trade: Business environment	Firms expected to give gifts in meetings with tax officials (% of firms)
450	IC.TAX.LABR.CP.ZS	Private Sector & Trade: Business environment	Labor tax and contributions (% of commercial profits)
451	IC.TAX.METG	Private Sector & Trade: Business environment	Number of visits or required meetings with tax officials (average for affected firms)
452	IC.TAX.OTHR.CP.ZS	Private Sector & Trade: Business environment	Other taxes payable by businesses (% of commercial profits)
453	IC.TAX.PAYM	Private Sector & Trade: Business environment	Tax payments (number)
454	IC.TAX.PRFT.CP.ZS	Private Sector & Trade: Business environment	Profit tax (% of commercial profits)
455	IC.TAX.TOTL.CP.ZS	Private Sector & Trade: Business environment	Total tax and contribution rate (% of profit)
456	IC.WRH.DURS	Private Sector & Trade: Business environment	Time required to build a warehouse (days)
457	IC.WRH.PROC	Private Sector & Trade: Business environment	Procedures to build a warehouse (number)
458	IE.PPI.ENGY.CD	Private Sector & Trade: Private infrastructure investment	Investment in energy with private participation (current US$)
459	IE.PPI.ICTI.CD	Private Sector & Trade: Private infrastructure investment	Investment in ICT with private participation (current US$)
460	IE.PPI.TRAN.CD	Private Sector & Trade: Private infrastructure investment	Investment in transport with private participation (current US$)
461	IE.PPI.WATR.CD	Private Sector & Trade: Private infrastructure investment	Investment in water and sanitation with private participation (current US$)
462	IE.PPN.ENGY.CD	Private Sector & Trade: Private infrastructure investment	Public private partnerships investment in energy (current US$)
463	IE.PPN.ICTI.CD	Private Sector & Trade: Private infrastructure investment	Public private partnerships investment in ICT (current US$)
464	IE.PPN.TRAN.CD	Private Sector & Trade: Private infrastructure investment	Public private partnerships investment in transport (current US$)
465	IE.PPN.WATR.CD	Private Sector & Trade: Private infrastructure investment	Public private partnerships investment in water and sanitation (current US$)
466	IP.IDS.NRCT	Infrastructure: Technology	"Industrial design applications
467	IP.IDS.RSCT	Infrastructure: Technology	"Industrial design applications
468	IP.JRN.ARTC.SC	Infrastructure: Technology	Scientific and technical journal articles
469	IP.PAT.NRES	Infrastructure: Technology	"Patent applications
470	IP.PAT.RESD	Infrastructure: Technology	"Patent applications
471	IP.TMK.NRCT	Infrastructure: Technology	"Trademark applications
472	IP.TMK.NRES	Infrastructure: Technology	"Trademark applications
473	IP.TMK.RESD	Infrastructure: Technology	"Trademark applications
474	IP.TMK.RSCT	Infrastructure: Technology	"Trademark applications
475	IP.TMK.TOTL	Infrastructure: Technology	"Trademark applications
476	IQ.CPA.BREG.XQ	Public Sector: Policy & institutions	CPIA business regulatory environment rating (1=low to 6=high)
477	IQ.CPA.DEBT.XQ	Public Sector: Policy & institutions	CPIA debt policy rating (1=low to 6=high)
478	IQ.CPA.ECON.XQ	Public Sector: Policy & institutions	CPIA economic management cluster average (1=low to 6=high)
479	IQ.CPA.ENVR.XQ	Public Sector: Policy & institutions	CPIA policy and institutions for environmental sustainability rating (1=low to 6=high)
480	IQ.CPA.FINQ.XQ	Public Sector: Policy & institutions	CPIA quality of budgetary and financial management rating (1=low to 6=high)
481	IQ.CPA.FINS.XQ	Public Sector: Policy & institutions	CPIA financial sector rating (1=low to 6=high)
482	IQ.CPA.FISP.XQ	Public Sector: Policy & institutions	CPIA fiscal policy rating (1=low to 6=high)
483	IQ.CPA.GNDR.XQ	Public Sector: Policy & institutions	CPIA gender equality rating (1=low to 6=high)
484	IQ.CPA.HRES.XQ	Public Sector: Policy & institutions	CPIA building human resources rating (1=low to 6=high)
485	IQ.CPA.IRAI.XQ	Public Sector: Policy & institutions	IDA resource allocation index (1=low to 6=high)
486	IQ.CPA.MACR.XQ	Public Sector: Policy & institutions	CPIA macroeconomic management rating (1=low to 6=high)
487	IQ.CPA.PADM.XQ	Public Sector: Policy & institutions	CPIA quality of public administration rating (1=low to 6=high)
488	IQ.CPA.PRES.XQ	Public Sector: Policy & institutions	CPIA equity of public resource use rating (1=low to 6=high)
489	IQ.CPA.PROP.XQ	Public Sector: Policy & institutions	CPIA property rights and rule-based governance rating (1=low to 6=high)
490	IQ.CPA.PROT.XQ	Public Sector: Policy & institutions	CPIA social protection rating (1=low to 6=high)
491	IQ.CPA.PUBS.XQ	Public Sector: Policy & institutions	CPIA public sector management and institutions cluster average (1=low to 6=high)
492	IQ.CPA.REVN.XQ	Public Sector: Policy & institutions	CPIA efficiency of revenue mobilization rating (1=low to 6=high)
493	IQ.CPA.SOCI.XQ	Public Sector: Policy & institutions	CPIA policies for social inclusion/equity cluster average (1=low to 6=high)
494	IQ.CPA.STRC.XQ	Public Sector: Policy & institutions	CPIA structural policies cluster average (1=low to 6=high)
495	IQ.CPA.TRAD.XQ	Public Sector: Policy & institutions	CPIA trade rating (1=low to 6=high)
496	IQ.CPA.TRAN.XQ	Public Sector: Policy & institutions	"CPIA transparency
497	IQ.SCI.MTHD	Public Sector: Policy & institutions	Methodology assessment of statistical capacity (scale 0 - 100)
498	IQ.SCI.OVRL	Public Sector: Policy & institutions	Statistical Capacity Score (Overall Average) (scale 0 - 100)
499	IQ.SCI.PRDC	Public Sector: Policy & institutions	Periodicity and timeliness assessment of statistical capacity (scale 0 - 100)
500	IQ.SCI.SRCE	Public Sector: Policy & institutions	Source data assessment of statistical capacity (scale 0 - 100)
501	IQ.SPI.OVRL	Public Sector: Policy & institutions	Statistical performance indicators (SPI): Overall score (scale 0-100)
502	IQ.SPI.PIL1	Public Sector: Policy & institutions	Statistical performance indicators (SPI): Pillar 1 data use score (scale 0-100)
503	IQ.SPI.PIL2	Public Sector: Policy & institutions	Statistical performance indicators (SPI): Pillar 2 data services score (scale 0-100)
504	IQ.SPI.PIL3	Public Sector: Policy & institutions	Statistical performance indicators (SPI): Pillar 3 data products score  (scale 0-100)
505	IQ.SPI.PIL4	Public Sector: Policy & institutions	Statistical performance indicators (SPI): Pillar 4 data sources score (scale 0-100)
506	IQ.SPI.PIL5	Public Sector: Policy & institutions	Statistical performance indicators (SPI): Pillar 5 data infrastructure score (scale 0-100)
507	IS.AIR.DPRT	Infrastructure: Transportation	"Air transport
508	IS.AIR.GOOD.MT.K1	Infrastructure: Transportation	"Air transport
509	IS.AIR.PSGR	Infrastructure: Transportation	"Air transport
510	IS.RRS.GOOD.MT.K6	Infrastructure: Transportation	"Railways
511	IS.RRS.PASG.KM	Infrastructure: Transportation	"Railways
512	IS.RRS.TOTL.KM	Infrastructure: Transportation	Rail lines (total route-km)
513	IS.SHP.GCNW.XQ	Infrastructure: Transportation	Liner shipping connectivity index (maximum value in 2004 = 100)
514	IS.SHP.GOOD.TU	Infrastructure: Transportation	Container port traffic (TEU: 20 foot equivalent units)
515	IT.CEL.SETS	Infrastructure: Communications	Mobile cellular subscriptions
516	IT.CEL.SETS.P2	Infrastructure: Communications	Mobile cellular subscriptions (per 100 people)
517	IT.MLT.MAIN	Infrastructure: Communications	Fixed telephone subscriptions
518	IT.MLT.MAIN.P2	Infrastructure: Communications	Fixed telephone subscriptions (per 100 people)
519	IT.NET.BBND	Infrastructure: Communications	Fixed broadband subscriptions
520	IT.NET.BBND.P2	Infrastructure: Communications	Fixed broadband subscriptions (per 100 people)
521	IT.NET.SECR	Infrastructure: Communications	Secure Internet servers
522	IT.NET.SECR.P6	Infrastructure: Communications	Secure Internet servers (per 1 million people)
523	IT.NET.USER.ZS	Infrastructure: Communications	Individuals using the Internet (% of population)
524	LP.EXP.DURS.MD	Private Sector & Trade: Trade facilitation	"Lead time to export
525	LP.IMP.DURS.MD	Private Sector & Trade: Trade facilitation	"Lead time to import
526	LP.LPI.CUST.XQ	Private Sector & Trade: Trade facilitation	Logistics performance index: Efficiency of customs clearance process (1=low to 5=high)
527	LP.LPI.INFR.XQ	Private Sector & Trade: Trade facilitation	Logistics performance index: Quality of trade and transport-related infrastructure (1=low to 5=high)
528	LP.LPI.ITRN.XQ	Private Sector & Trade: Trade facilitation	Logistics performance index: Ease of arranging competitively priced shipments (1=low to 5=high)
529	LP.LPI.LOGS.XQ	Private Sector & Trade: Trade facilitation	Logistics performance index: Competence and quality of logistics services (1=low to 5=high)
530	LP.LPI.OVRL.XQ	Private Sector & Trade: Trade facilitation	Logistics performance index: Overall (1=low to 5=high)
531	LP.LPI.TIME.XQ	Private Sector & Trade: Trade facilitation	Logistics performance index: Frequency with which shipments reach consignee within scheduled or expected time (1=low to 5=high)
532	LP.LPI.TRAC.XQ	Private Sector & Trade: Trade facilitation	Logistics performance index: Ability to track and trace consignments (1=low to 5=high)
533	MS.MIL.MPRT.KD	Public Sector: Defense & arms trade	Arms imports (SIPRI trend indicator values)
534	MS.MIL.TOTL.P1	Public Sector: Defense & arms trade	"Armed forces personnel
535	MS.MIL.TOTL.TF.ZS	Public Sector: Defense & arms trade	Armed forces personnel (% of total labor force)
536	MS.MIL.XPND.CD	Public Sector: Defense & arms trade	Military expenditure (current USD)
537	MS.MIL.XPND.CN	Public Sector: Defense & arms trade	Military expenditure (current LCU)
538	MS.MIL.XPND.GD.ZS	Public Sector: Defense & arms trade	Military expenditure (% of GDP)
539	MS.MIL.XPND.ZS	Public Sector: Defense & arms trade	Military expenditure (% of general government expenditure)
540	MS.MIL.XPRT.KD	Public Sector: Defense & arms trade	Arms exports (SIPRI trend indicator values)
541	NE.CON.GOVT.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	General government final consumption expenditure (current US$)
542	NE.CON.GOVT.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	General government final consumption expenditure (current LCU)
543	NE.CON.GOVT.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	General government final consumption expenditure (constant 2015 US$)
544	NE.CON.GOVT.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	General government final consumption expenditure (annual % growth)
545	NE.CON.GOVT.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	General government final consumption expenditure (constant LCU)
546	NE.CON.GOVT.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	General government final consumption expenditure (% of GDP)
547	NE.CON.PRVT.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Household and NPISHs Final consumption expenditure (current US$)
548	NE.CON.PRVT.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Household and NPISHs Final consumption expenditure (current LCU)
549	NE.CON.PRVT.CN.AD	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Households and NPISHs final consumption expenditure: linked series (current LCU)
550	NE.CON.PRVT.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Households and NPISHs Final consumption expenditure (constant 2015 US$)
551	NE.CON.PRVT.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	Household and NPISHs Final consumption expenditure (annual % growth)
552	NE.CON.PRVT.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Household and NPISHs Final consumption expenditure (constant LCU)
553	NE.CON.PRVT.PC.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Households and NPISHs final consumption expenditure per capita (constant 2015 US$)
554	NE.CON.PRVT.PC.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	Household final consumption expenditure per capita growth (annual %)
555	NE.CON.PRVT.PP.CD	Economic Policy & Debt: Purchasing power parity	"Households and NPISHs Final consumption expenditure
556	NE.CON.PRVT.PP.KD	Economic Policy & Debt: Purchasing power parity	"Households and NPISHs Final consumption expenditure
557	NE.CON.PRVT.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Households and NPISHs final consumption expenditure (% of GDP)
558	NE.CON.TOTL.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Final consumption expenditure (current US$)
559	NE.CON.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Final consumption expenditure (current LCU)
560	NE.CON.TOTL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Final consumption expenditure (constant 2015 US$)
561	NE.CON.TOTL.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	Final consumption expenditure (annual % growth)
562	NE.CON.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Final consumption expenditure (constant LCU)
563	NE.CON.TOTL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Final consumption expenditure (% of GDP)
564	NE.DAB.DEFL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Gross national expenditure deflator (base year varies by country)
565	NE.DAB.TOTL.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Gross national expenditure (current US$)
566	NE.DAB.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Gross national expenditure (current LCU)
567	NE.DAB.TOTL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Gross national expenditure (constant 2015 US$)
568	NE.DAB.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Gross national expenditure (constant LCU)
569	NE.DAB.TOTL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Gross national expenditure (% of GDP)
570	NE.EXP.GNFS.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Exports of goods and services (current US$)
571	NE.EXP.GNFS.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Exports of goods and services (current LCU)
572	NE.EXP.GNFS.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Exports of goods and services (constant 2015 US$)
573	NE.EXP.GNFS.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	Exports of goods and services (annual % growth)
574	NE.EXP.GNFS.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Exports of goods and services (constant LCU)
575	NE.EXP.GNFS.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Exports of goods and services (% of GDP)
576	NE.GDI.FPRV.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	"Gross fixed capital formation
577	NE.GDI.FPRV.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	"Gross fixed capital formation
578	NE.GDI.FTOT.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Gross fixed capital formation (current US$)
579	NE.GDI.FTOT.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Gross fixed capital formation (current LCU)
784	SE.PRE.TCAQ.MA.ZS	Education: Inputs	"Trained teachers in preprimary education
580	NE.GDI.FTOT.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Gross fixed capital formation (constant 2015 US$)
581	NE.GDI.FTOT.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	Gross fixed capital formation (annual % growth)
582	NE.GDI.FTOT.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Gross fixed capital formation (constant LCU)
583	NE.GDI.FTOT.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Gross fixed capital formation (% of GDP)
584	NE.GDI.STKB.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Changes in inventories (current US$)
585	NE.GDI.STKB.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Changes in inventories (current LCU)
586	NE.GDI.STKB.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Changes in inventories (constant LCU)
587	NE.GDI.TOTL.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Gross capital formation (current US$)
588	NE.GDI.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Gross capital formation (current LCU)
589	NE.GDI.TOTL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Gross capital formation (constant 2015 US$)
590	NE.GDI.TOTL.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	Gross capital formation (annual % growth)
591	NE.GDI.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Gross capital formation (constant LCU)
592	NE.GDI.TOTL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Gross capital formation (% of GDP)
593	NE.IMP.GNFS.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	Imports of goods and services (current US$)
594	NE.IMP.GNFS.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Imports of goods and services (current LCU)
595	NE.IMP.GNFS.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Expenditure on GDP	Imports of goods and services (constant 2015 US$)
596	NE.IMP.GNFS.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	Imports of goods and services (annual % growth)
597	NE.IMP.GNFS.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Imports of goods and services (constant LCU)
598	NE.IMP.GNFS.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Imports of goods and services (% of GDP)
599	NE.RSB.GNFS.CD	Economic Policy & Debt: National accounts: US$ at current prices: Expenditure on GDP	External balance on goods and services (current US$)
600	NE.RSB.GNFS.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	External balance on goods and services (current LCU)
601	NE.RSB.GNFS.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	External balance on goods and services (constant LCU)
602	NE.RSB.GNFS.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	External balance on goods and services (% of GDP)
603	NE.TRD.GNFS.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Trade (% of GDP)
604	NV.AGR.EMPL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Value added	"Agriculture
605	NV.AGR.TOTL.CD	Economic Policy & Debt: National accounts: US$ at current prices: Value added	"Agriculture
606	NV.AGR.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Value added	"Agriculture
607	NV.AGR.TOTL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Value added	"Agriculture
608	NV.AGR.TOTL.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	"Agriculture
609	NV.AGR.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Value added	"Agriculture
610	NV.AGR.TOTL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	"Agriculture
611	NV.FSM.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Value added	Financial intermediary services indirectly Measured (FISIM) (current LCU)
612	NV.FSM.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Value added	Financial intermediary services indirectly Measured (FISIM) (constant LCU)
613	NV.IND.EMPL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Value added	"Industry (including construction)
614	NV.IND.MANF.CD	Economic Policy & Debt: National accounts: US$ at current prices: Value added	"Manufacturing
615	NV.IND.MANF.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Value added	"Manufacturing
616	NV.IND.MANF.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Value added	"Manufacturing
617	NV.IND.MANF.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	"Manufacturing
618	NV.IND.MANF.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Value added	"Manufacturing
619	NV.IND.MANF.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	"Manufacturing
620	NV.IND.TOTL.CD	Economic Policy & Debt: National accounts: US$ at current prices: Value added	"Industry (including construction)
621	NV.IND.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Value added	"Industry (including construction)
622	NV.IND.TOTL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Value added	"Industry (including construction)
623	NV.IND.TOTL.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	"Industry (including construction)
624	NV.IND.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Value added	"Industry (including construction)
625	NV.IND.TOTL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	"Industry (including construction)
626	NV.MNF.CHEM.ZS.UN	Economic Policy & Debt: National accounts: Shares of GDP & other	Chemicals (% of value added in manufacturing)
627	NV.MNF.FBTO.ZS.UN	Economic Policy & Debt: National accounts: Shares of GDP & other	"Food
628	NV.MNF.MTRN.ZS.UN	Economic Policy & Debt: National accounts: Shares of GDP & other	Machinery and transport equipment (% of value added in manufacturing)
629	NV.MNF.OTHR.ZS.UN	Economic Policy & Debt: National accounts: Shares of GDP & other	Other manufacturing (% of value added in manufacturing)
630	NV.MNF.TECH.ZS.UN	Economic Policy & Debt: National accounts: Shares of GDP & other	Medium and high-tech manufacturing value added (% manufacturing value added)
631	NV.MNF.TXTL.ZS.UN	Economic Policy & Debt: National accounts: Shares of GDP & other	Textiles and clothing (% of value added in manufacturing)
632	NV.SRV.EMPL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Value added	"Services
633	NV.SRV.TOTL.CD	Economic Policy & Debt: National accounts: US$ at current prices: Value added	"Services
634	NV.SRV.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Value added	"Services
635	NV.SRV.TOTL.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Value added	"Services
636	NV.SRV.TOTL.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	"Services
637	NV.SRV.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Value added	"Services
638	NV.SRV.TOTL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	"Services
639	NY.ADJ.AEDU.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: education expenditure (current US$)
640	NY.ADJ.AEDU.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: education expenditure (% of GNI)
641	NY.ADJ.DCO2.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: carbon dioxide damage (current US$)
642	NY.ADJ.DCO2.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: carbon dioxide damage (% of GNI)
643	NY.ADJ.DFOR.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: net forest depletion (current US$)
644	NY.ADJ.DFOR.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: net forest depletion (% of GNI)
645	NY.ADJ.DKAP.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: consumption of fixed capital (current US$)
646	NY.ADJ.DKAP.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: consumption of fixed capital (% of GNI)
647	NY.ADJ.DMIN.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: mineral depletion (current US$)
648	NY.ADJ.DMIN.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: mineral depletion (% of GNI)
649	NY.ADJ.DNGY.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: energy depletion (current US$)
650	NY.ADJ.DNGY.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: energy depletion (% of GNI)
651	NY.ADJ.DPEM.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: particulate emission damage (current US$)
652	NY.ADJ.DPEM.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: particulate emission damage (% of GNI)
653	NY.ADJ.DRES.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: natural resources depletion (% of GNI)
654	NY.ADJ.ICTR.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: gross savings (% of GNI)
655	NY.ADJ.NNAT.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: net national savings (current US$)
656	NY.ADJ.NNAT.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted savings: net national savings (% of GNI)
657	NY.ADJ.NNTY.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted net national income (current US$)
658	NY.ADJ.NNTY.KD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted net national income (constant 2015 US$)
659	NY.ADJ.NNTY.KD.ZG	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted net national income (annual % growth)
660	NY.ADJ.NNTY.PC.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted net national income per capita (current US$)
661	NY.ADJ.NNTY.PC.KD	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted net national income per capita (constant 2015 US$)
662	NY.ADJ.NNTY.PC.KD.ZG	Economic Policy & Debt: National accounts: Adjusted savings & income	Adjusted net national income per capita (annual % growth)
663	NY.ADJ.SVNG.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	"Adjusted net savings
664	NY.ADJ.SVNG.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	"Adjusted net savings
665	NY.ADJ.SVNX.CD	Economic Policy & Debt: National accounts: Adjusted savings & income	"Adjusted net savings
666	NY.ADJ.SVNX.GN.ZS	Economic Policy & Debt: National accounts: Adjusted savings & income	"Adjusted net savings
667	NY.EXP.CAPM.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Other items	Exports as a capacity to import (constant LCU)
668	NY.GDP.COAL.RT.ZS	Environment: Natural resources contribution to GDP	Coal rents (% of GDP)
669	NY.GDP.DEFL.KD.ZG	Financial Sector: Exchange rates & prices	"Inflation
670	NY.GDP.DEFL.KD.ZG.AD	Financial Sector: Exchange rates & prices	"Inflation
671	NY.GDP.DEFL.ZS	Financial Sector: Exchange rates & prices	GDP deflator (base year varies by country)
672	NY.GDP.DEFL.ZS.AD	Financial Sector: Exchange rates & prices	GDP deflator: linked series (base year varies by country)
673	NY.GDP.DISC.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	Discrepancy in expenditure estimate of GDP (current LCU)
674	NY.GDP.DISC.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Expenditure on GDP	Discrepancy in expenditure estimate of GDP (constant LCU)
675	NY.GDP.FCST.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	Gross value added at basic prices (GVA) (current US$)
676	NY.GDP.FCST.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	Gross value added at basic prices (GVA) (current LCU)
677	NY.GDP.FCST.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Aggregate indicators	Gross value added at basic prices (GVA) (constant 2015 US$)
678	NY.GDP.FCST.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	Gross value added at basic prices (GVA) (constant LCU)
679	NY.GDP.FRST.RT.ZS	Environment: Natural resources contribution to GDP	Forest rents (% of GDP)
680	NY.GDP.MINR.RT.ZS	Environment: Natural resources contribution to GDP	Mineral rents (% of GDP)
681	NY.GDP.MKTP.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	GDP (current US$)
682	NY.GDP.MKTP.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	GDP (current LCU)
683	NY.GDP.MKTP.CN.AD	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	GDP: linked series (current LCU)
684	NY.GDP.MKTP.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Aggregate indicators	GDP (constant 2015 US$)
685	NY.GDP.MKTP.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	GDP growth (annual %)
686	NY.GDP.MKTP.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	GDP (constant LCU)
687	NY.GDP.MKTP.PP.CD	Economic Policy & Debt: Purchasing power parity	"GDP
688	NY.GDP.MKTP.PP.KD	Economic Policy & Debt: Purchasing power parity	"GDP
689	NY.GDP.NGAS.RT.ZS	Environment: Natural resources contribution to GDP	Natural gas rents (% of GDP)
690	NY.GDP.PCAP.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	GDP per capita (current US$)
691	NY.GDP.PCAP.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	GDP per capita (current LCU)
692	NY.GDP.PCAP.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Aggregate indicators	GDP per capita (constant 2015 US$)
693	NY.GDP.PCAP.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	GDP per capita growth (annual %)
694	NY.GDP.PCAP.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	GDP per capita (constant LCU)
695	NY.GDP.PCAP.PP.CD	Economic Policy & Debt: Purchasing power parity	"GDP per capita
696	NY.GDP.PCAP.PP.KD	Economic Policy & Debt: Purchasing power parity	"GDP per capita
697	NY.GDP.PETR.RT.ZS	Environment: Natural resources contribution to GDP	Oil rents (% of GDP)
698	NY.GDP.TOTL.RT.ZS	Environment: Natural resources contribution to GDP	Total natural resources rents (% of GDP)
699	NY.GDS.TOTL.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	Gross domestic savings (current US$)
700	NY.GDS.TOTL.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	Gross domestic savings (current LCU)
701	NY.GDS.TOTL.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Gross domestic savings (% of GDP)
702	NY.GDY.TOTL.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Other items	Gross domestic income (constant LCU)
703	NY.GNP.ATLS.CD	Economic Policy & Debt: National accounts: Atlas GNI & GNI per capita	"GNI
704	NY.GNP.MKTP.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	GNI (current US$)
705	NY.GNP.MKTP.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	GNI (current LCU)
706	NY.GNP.MKTP.CN.AD	Economic Policy & Debt: National accounts: Local currency at current prices: Expenditure on GDP	GNI: linked series (current LCU)
707	NY.GNP.MKTP.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Aggregate indicators	GNI (constant 2015 US$)
708	NY.GNP.MKTP.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	GNI growth (annual %)
709	NY.GNP.MKTP.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	GNI (constant LCU)
710	NY.GNP.MKTP.PP.CD	Economic Policy & Debt: Purchasing power parity	"GNI
711	NY.GNP.MKTP.PP.KD	Economic Policy & Debt: Purchasing power parity	"GNI
712	NY.GNP.PCAP.CD	Economic Policy & Debt: National accounts: Atlas GNI & GNI per capita	"GNI per capita
713	NY.GNP.PCAP.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	GNI per capita (current LCU)
714	NY.GNP.PCAP.KD	Economic Policy & Debt: National accounts: US$ at constant 2015 prices: Aggregate indicators	GNI per capita (constant 2015 US$)
715	NY.GNP.PCAP.KD.ZG	Economic Policy & Debt: National accounts: Growth rates	GNI per capita growth (annual %)
716	NY.GNP.PCAP.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	GNI per capita (constant LCU)
717	NY.GNP.PCAP.PP.CD	Economic Policy & Debt: Purchasing power parity	"GNI per capita
718	NY.GNP.PCAP.PP.KD	Economic Policy & Debt: Purchasing power parity	"GNI per capita
719	NY.GNS.ICTR.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	Gross savings (current US$)
720	NY.GNS.ICTR.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	Gross savings (current LCU)
721	NY.GNS.ICTR.GN.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Gross savings (% of GNI)
722	NY.GNS.ICTR.ZS	Economic Policy & Debt: National accounts: Shares of GDP & other	Gross savings (% of GDP)
723	NY.GSR.NFCY.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	Net primary income (Net income from abroad) (current US$)
724	NY.GSR.NFCY.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	Net primary income (Net income from abroad) (current LCU)
725	NY.GSR.NFCY.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	Net primary income (Net income from abroad) (constant LCU)
726	NY.TAX.NIND.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	Taxes less subsidies on products (current US$)
727	NY.TAX.NIND.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	Taxes less subsidies on products (current LCU)
728	NY.TAX.NIND.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	Taxes less subsidies on products (constant LCU)
785	SE.PRE.TCAQ.ZS	Education: Inputs	Trained teachers in preprimary education (% of total teachers)
729	NY.TRF.NCTR.CD	Economic Policy & Debt: National accounts: US$ at current prices: Aggregate indicators	Net secondary income (Net current transfers from abroad) (current US$)
730	NY.TRF.NCTR.CN	Economic Policy & Debt: National accounts: Local currency at current prices: Aggregate indicators	Net secondary income (Net current transfers from abroad) (current LCU)
731	NY.TRF.NCTR.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Aggregate indicators	Net secondary income (Net current transfers from abroad) (constant LCU)
732	NY.TTF.GNFS.KN	Economic Policy & Debt: National accounts: Local currency at constant prices: Other items	Terms of trade adjustment (constant LCU)
733	PA.NUS.ATLS	Financial Sector: Exchange rates & prices	DEC alternative conversion factor (LCU per US$)
734	PA.NUS.FCRF	Financial Sector: Exchange rates & prices	"Official exchange rate (LCU per US$
735	PA.NUS.PPP	Economic Policy & Debt: Purchasing power parity	"PPP conversion factor
736	PA.NUS.PPPC.RF	Economic Policy & Debt: Purchasing power parity	Price level ratio of PPP conversion factor (GDP) to market exchange rate
737	PA.NUS.PRVT.PP	Economic Policy & Debt: Purchasing power parity	"PPP conversion factor
738	per_allsp.adq_pop_tot	Social Protection & Labor: Performance	Adequacy of social protection and labor programs (% of total welfare of beneficiary households)
739	per_allsp.ben_q1_tot	Social Protection & Labor: Performance	Benefit incidence of social protection and labor programs to poorest quintile (% of total SPL benefits)
740	per_allsp.cov_pop_tot	Social Protection & Labor: Performance	Coverage of social protection and labor programs (% of population)
741	per_lm_alllm.adq_pop_tot	Social Protection & Labor: Performance	Adequacy of unemployment benefits and ALMP (% of total welfare of beneficiary households)
742	per_lm_alllm.ben_q1_tot	Social Protection & Labor: Performance	Benefit incidence of unemployment benefits and ALMP to poorest quintile (% of total U/ALMP benefits)
743	per_lm_alllm.cov_pop_tot	Social Protection & Labor: Performance	Coverage of unemployment benefits and ALMP (% of population)
744	per_lm_alllm.cov_q1_tot	Social Protection & Labor: Performance	Coverage of unemployment benefits and ALMP in poorest quintile (% of population)
745	per_lm_alllm.cov_q2_tot	Social Protection & Labor: Performance	Coverage of unemployment benefits and ALMP in 2nd quintile (% of population)
746	per_lm_alllm.cov_q3_tot	Social Protection & Labor: Performance	Coverage of unemployment benefits and ALMP in 3rd quintile (% of population)
747	per_lm_alllm.cov_q4_tot	Social Protection & Labor: Performance	Coverage of unemployment benefits and ALMP in 4th quintile (% of population)
748	per_lm_alllm.cov_q5_tot	Social Protection & Labor: Performance	Coverage of unemployment benefits and ALMP in richest quintile (% of population)
749	per_sa_allsa.adq_pop_tot	Social Protection & Labor: Performance	Adequacy of social safety net programs (% of total welfare of beneficiary households)
750	per_sa_allsa.ben_q1_tot	Social Protection & Labor: Performance	Benefit incidence of social safety net programs to poorest quintile (% of total safety net benefits)
751	per_sa_allsa.cov_pop_tot	Social Protection & Labor: Performance	Coverage of social safety net programs (% of population)
752	per_sa_allsa.cov_q1_tot	Social Protection & Labor: Performance	Coverage of social safety net programs in poorest quintile (% of population)
753	per_sa_allsa.cov_q2_tot	Social Protection & Labor: Performance	Coverage of social safety net programs in 2nd quintile (% of population)
754	per_sa_allsa.cov_q3_tot	Social Protection & Labor: Performance	Coverage of social safety net programs in 3rd quintile (% of population)
755	per_sa_allsa.cov_q4_tot	Social Protection & Labor: Performance	Coverage of social safety net programs in 4th quintile (% of population)
756	per_sa_allsa.cov_q5_tot	Social Protection & Labor: Performance	Coverage of social safety net programs in richest quintile (% of population)
757	per_si_allsi.adq_pop_tot	Social Protection & Labor: Performance	Adequacy of social insurance programs (% of total welfare of beneficiary households)
758	per_si_allsi.ben_q1_tot	Social Protection & Labor: Performance	Benefit incidence of social insurance programs to poorest quintile (% of total social insurance benefits)
759	per_si_allsi.cov_pop_tot	Social Protection & Labor: Performance	Coverage of social insurance programs (% of population)
760	per_si_allsi.cov_q1_tot	Social Protection & Labor: Performance	Coverage of social insurance programs in poorest quintile (% of population)
761	per_si_allsi.cov_q2_tot	Social Protection & Labor: Performance	Coverage of social insurance programs in 2nd quintile (% of population)
762	per_si_allsi.cov_q3_tot	Social Protection & Labor: Performance	Coverage of social insurance programs in 3rd quintile (% of population)
763	per_si_allsi.cov_q4_tot	Social Protection & Labor: Performance	Coverage of social insurance programs in 4th quintile (% of population)
764	per_si_allsi.cov_q5_tot	Social Protection & Labor: Performance	Coverage of social insurance programs in richest quintile (% of population)
765	PX.REX.REER	Financial Sector: Exchange rates & prices	Real effective exchange rate index (2010 = 100)
766	SE.ADT.1524.LT.FE.ZS	Education: Outcomes	"Literacy rate
767	SE.ADT.1524.LT.FM.ZS	Education: Outcomes	"Literacy rate
768	SE.ADT.1524.LT.MA.ZS	Education: Outcomes	"Literacy rate
769	SE.ADT.1524.LT.ZS	Education: Outcomes	"Literacy rate
770	SE.ADT.LITR.FE.ZS	Education: Outcomes	"Literacy rate
771	SE.ADT.LITR.MA.ZS	Education: Outcomes	"Literacy rate
772	SE.ADT.LITR.ZS	Education: Outcomes	"Literacy rate
773	SE.COM.DURS	Education: Outcomes	"Compulsory education
774	SE.ENR.PRIM.FM.ZS	Education: Participation	"School enrollment
775	SE.ENR.PRSC.FM.ZS	Education: Participation	"School enrollment
776	SE.ENR.SECO.FM.ZS	Education: Participation	"School enrollment
777	SE.ENR.TERT.FM.ZS	Education: Participation	"School enrollment
778	SE.PRE.DURS	Education: Inputs	"Preprimary education
779	SE.PRE.ENRL.TC.ZS	Education: Inputs	"Pupil-teacher ratio
780	SE.PRE.ENRR	Education: Participation	"School enrollment
781	SE.PRE.ENRR.FE	Education: Participation	"School enrollment
782	SE.PRE.ENRR.MA	Education: Participation	"School enrollment
783	SE.PRE.TCAQ.FE.ZS	Education: Inputs	"Trained teachers in preprimary education
786	SE.PRM.AGES	Education: Inputs	Primary school starting age (years)
787	SE.PRM.CMPT.FE.ZS	Education: Outcomes	"Primary completion rate
788	SE.PRM.CMPT.MA.ZS	Education: Outcomes	"Primary completion rate
789	SE.PRM.CMPT.ZS	Education: Outcomes	"Primary completion rate
790	SE.PRM.CUAT.FE.ZS	Education: Outcomes	"Educational attainment
791	SE.PRM.CUAT.MA.ZS	Education: Outcomes	"Educational attainment
792	SE.PRM.CUAT.ZS	Education: Outcomes	"Educational attainment
793	SE.PRM.DURS	Education: Outcomes	"Primary education
794	SE.PRM.ENRL	Education: Participation	"Primary education
795	SE.PRM.ENRL.FE.ZS	Education: Participation	"Primary education
796	SE.PRM.ENRL.TC.ZS	Education: Inputs	"Pupil-teacher ratio
797	SE.PRM.ENRR	Education: Participation	"School enrollment
798	SE.PRM.ENRR.FE	Education: Participation	"School enrollment
799	SE.PRM.ENRR.MA	Education: Participation	"School enrollment
800	SE.PRM.GINT.FE.ZS	Education: Efficiency	"Gross intake ratio in first grade of primary education
801	SE.PRM.GINT.MA.ZS	Education: Efficiency	"Gross intake ratio in first grade of primary education
802	SE.PRM.GINT.ZS	Education: Efficiency	"Gross intake ratio in first grade of primary education
803	SE.PRM.NENR	Education: Participation	"School enrollment
804	SE.PRM.NENR.FE	Education: Participation	"School enrollment
805	SE.PRM.NENR.MA	Education: Participation	"School enrollment
806	SE.PRM.NINT.FE.ZS	Education: Efficiency	"Net intake rate in grade 1
807	SE.PRM.NINT.MA.ZS	Education: Efficiency	"Net intake rate in grade 1
808	SE.PRM.NINT.ZS	Education: Efficiency	Net intake rate in grade 1 (% of official school-age population)
809	SE.PRM.OENR.FE.ZS	Education: Efficiency	"Over-age students
810	SE.PRM.OENR.MA.ZS	Education: Efficiency	"Over-age students
811	SE.PRM.OENR.ZS	Education: Efficiency	"Over-age students
812	SE.PRM.PRIV.ZS	Education: Participation	"School enrollment
813	SE.PRM.PRS5.FE.ZS	Education: Efficiency	"Persistence to grade 5
814	SE.PRM.PRS5.MA.ZS	Education: Efficiency	"Persistence to grade 5
815	SE.PRM.PRS5.ZS	Education: Efficiency	"Persistence to grade 5
816	SE.PRM.PRSL.FE.ZS	Education: Efficiency	"Persistence to last grade of primary
817	SE.PRM.PRSL.MA.ZS	Education: Efficiency	"Persistence to last grade of primary
818	SE.PRM.PRSL.ZS	Education: Efficiency	"Persistence to last grade of primary
819	SE.PRM.REPT.FE.ZS	Education: Efficiency	"Repeaters
820	SE.PRM.REPT.MA.ZS	Education: Efficiency	"Repeaters
821	SE.PRM.REPT.ZS	Education: Efficiency	"Repeaters
822	SE.PRM.TCAQ.FE.ZS	Education: Inputs	"Trained teachers in primary education
823	SE.PRM.TCAQ.MA.ZS	Education: Inputs	"Trained teachers in primary education
824	SE.PRM.TCAQ.ZS	Education: Inputs	Trained teachers in primary education (% of total teachers)
825	SE.PRM.TCHR	Education: Inputs	"Primary education
826	SE.PRM.TCHR.FE.ZS	Education: Inputs	"Primary education
827	SE.PRM.TENR	Education: Participation	"Adjusted net enrollment rate
828	SE.PRM.TENR.FE	Education: Participation	"Adjusted net enrollment rate
829	SE.PRM.TENR.MA	Education: Participation	"Adjusted net enrollment rate
830	SE.PRM.UNER	Education: Participation	"Children out of school
831	SE.PRM.UNER.FE	Education: Participation	"Children out of school
832	SE.PRM.UNER.FE.ZS	Education: Participation	"Children out of school
833	SE.PRM.UNER.MA	Education: Participation	"Children out of school
834	SE.PRM.UNER.MA.ZS	Education: Participation	"Children out of school
835	SE.PRM.UNER.ZS	Education: Participation	Children out of school (% of primary school age)
836	SE.SEC.AGES	Education: Inputs	Lower secondary school starting age (years)
837	SE.SEC.CMPT.LO.FE.ZS	Education: Outcomes	"Lower secondary completion rate
838	SE.SEC.CMPT.LO.MA.ZS	Education: Outcomes	"Lower secondary completion rate
839	SE.SEC.CMPT.LO.ZS	Education: Outcomes	"Lower secondary completion rate
840	SE.SEC.CUAT.LO.FE.ZS	Education: Outcomes	"Educational attainment
841	SE.SEC.CUAT.LO.MA.ZS	Education: Outcomes	"Educational attainment
842	SE.SEC.CUAT.LO.ZS	Education: Outcomes	"Educational attainment
843	SE.SEC.CUAT.PO.FE.ZS	Education: Outcomes	"Educational attainment
844	SE.SEC.CUAT.PO.MA.ZS	Education: Outcomes	"Educational attainment
845	SE.SEC.CUAT.PO.ZS	Education: Outcomes	"Educational attainment
846	SE.SEC.CUAT.UP.FE.ZS	Education: Outcomes	"Educational attainment
847	SE.SEC.CUAT.UP.MA.ZS	Education: Outcomes	"Educational attainment
848	SE.SEC.CUAT.UP.ZS	Education: Outcomes	"Educational attainment
849	SE.SEC.DURS	Education: Outcomes	"Secondary education
850	SE.SEC.ENRL	Education: Participation	"Secondary education
851	SE.SEC.ENRL.FE.ZS	Education: Participation	"Secondary education
852	SE.SEC.ENRL.GC	Education: Participation	"Secondary education
853	SE.SEC.ENRL.GC.FE.ZS	Education: Participation	"Secondary education
854	SE.SEC.ENRL.LO.TC.ZS	Education: Inputs	"Pupil-teacher ratio
855	SE.SEC.ENRL.TC.ZS	Education: Inputs	"Pupil-teacher ratio
856	SE.SEC.ENRL.UP.TC.ZS	Education: Inputs	"Pupil-teacher ratio
857	SE.SEC.ENRL.VO	Education: Participation	"Secondary education
858	SE.SEC.ENRL.VO.FE.ZS	Education: Participation	"Secondary education
859	SE.SEC.ENRR	Education: Participation	"School enrollment
860	SE.SEC.ENRR.FE	Education: Participation	"School enrollment
861	SE.SEC.ENRR.MA	Education: Participation	"School enrollment
862	SE.SEC.NENR	Education: Participation	"School enrollment
863	SE.SEC.NENR.FE	Education: Participation	"School enrollment
864	SE.SEC.NENR.MA	Education: Participation	"School enrollment
865	SE.SEC.PRIV.ZS	Education: Participation	"School enrollment
866	SE.SEC.PROG.FE.ZS	Education: Efficiency	"Progression to secondary school
867	SE.SEC.PROG.MA.ZS	Education: Efficiency	"Progression to secondary school
868	SE.SEC.PROG.ZS	Education: Efficiency	Progression to secondary school (%)
869	SE.SEC.TCAQ.FE.ZS	Education: Inputs	"Trained teachers in secondary education
870	SE.SEC.TCAQ.LO.FE.ZS	Education: Inputs	"Trained teachers in lower secondary education
871	SE.SEC.TCAQ.LO.MA.ZS	Education: Inputs	"Trained teachers in lower secondary education
872	SE.SEC.TCAQ.LO.ZS	Education: Inputs	Trained teachers in lower secondary education (% of total teachers)
873	SE.SEC.TCAQ.MA.ZS	Education: Inputs	"Trained teachers in secondary education
874	SE.SEC.TCAQ.UP.FE.ZS	Education: Inputs	"Trained teachers in upper secondary education
875	SE.SEC.TCAQ.UP.MA.ZS	Education: Inputs	"Trained teachers in upper secondary education
876	SE.SEC.TCAQ.UP.ZS	Education: Inputs	Trained teachers in upper secondary education (% of total teachers)
877	SE.SEC.TCAQ.ZS	Education: Inputs	Trained teachers in secondary education (% of total teachers)
878	SE.SEC.TCHR	Education: Inputs	"Secondary education
879	SE.SEC.TCHR.FE	Education: Inputs	"Secondary education
880	SE.SEC.TCHR.FE.ZS	Education: Inputs	"Secondary education
881	SE.SEC.UNER.LO.FE.ZS	Education: Participation	"Adolescents out of school
882	SE.SEC.UNER.LO.MA.ZS	Education: Participation	"Adolescents out of school
883	SE.SEC.UNER.LO.ZS	Education: Participation	Adolescents out of school (% of lower secondary school age)
884	SE.TER.CUAT.BA.FE.ZS	Education: Outcomes	"Educational attainment
886	SE.TER.CUAT.BA.ZS	Education: Outcomes	"Educational attainment
891	SE.TER.CUAT.MS.MA.ZS	Education: Outcomes	"Educational attainment
893	SE.TER.CUAT.ST.FE.ZS	Education: Outcomes	"Educational attainment
894	SE.TER.CUAT.ST.MA.ZS	Education: Outcomes	"Educational attainment
895	SE.TER.CUAT.ST.ZS	Education: Outcomes	"Educational attainment
896	SE.TER.ENRL.TC.ZS	Education: Inputs	"Pupil-teacher ratio
897	SE.TER.ENRR	Education: Participation	"School enrollment
898	SE.TER.ENRR.FE	Education: Participation	"School enrollment
899	SE.TER.ENRR.MA	Education: Participation	"School enrollment
900	SE.TER.TCHR.FE.ZS	Education: Inputs	"Tertiary education
901	SE.XPD.CPRM.ZS	Education: Inputs	"Current education expenditure
902	SE.XPD.CSEC.ZS	Education: Inputs	"Current education expenditure
903	SE.XPD.CTER.ZS	Education: Inputs	"Current education expenditure
904	SE.XPD.CTOT.ZS	Education: Inputs	"Current education expenditure
905	SE.XPD.PRIM.PC.ZS	Education: Inputs	"Government expenditure per student
906	SE.XPD.PRIM.ZS	Education: Inputs	Expenditure on primary education (% of government expenditure on education)
907	SE.XPD.SECO.PC.ZS	Education: Inputs	"Government expenditure per student
908	SE.XPD.SECO.ZS	Education: Inputs	Expenditure on secondary education (% of government expenditure on education)
909	SE.XPD.TERT.PC.ZS	Education: Inputs	"Government expenditure per student
910	SE.XPD.TERT.ZS	Education: Inputs	Expenditure on tertiary education (% of government expenditure on education)
911	SE.XPD.TOTL.GB.ZS	Education: Inputs	"Government expenditure on education
912	SE.XPD.TOTL.GD.ZS	Education: Inputs	"Government expenditure on education
913	SG.DMK.ALLD.FN.ZS	Gender: Public life & decision making	"Women participating in the three decisions (own health care
914	SG.DMK.SRCR.FN.ZS	Gender: Public life & decision making	"Women making their own informed decisions regarding sexual relations
915	SG.GEN.PARL.ZS	Gender: Public life & decision making	Proportion of seats held by women in national parliaments (%)
916	SG.LAW.INDX	Gender: Public life & decision making	Women Business and the Law Index Score (scale 1-100)
917	SG.TIM.UWRK.FE	Gender: Participation & access	"Proportion of time spent on unpaid domestic and care work
918	SG.TIM.UWRK.MA	Gender: Participation & access	"Proportion of time spent on unpaid domestic and care work
919	SG.VAW.1549.ZS	Gender: Health	Proportion of women subjected to physical and/or sexual violence in the last 12 months (% of ever-partnered women ages 15-49)
920	SG.VAW.ARGU.ZS	Gender: Health	Women who believe a husband is justified in beating his wife when she argues with him (%)
921	SG.VAW.BURN.ZS	Gender: Health	Women who believe a husband is justified in beating his wife when she burns the food (%)
922	SG.VAW.GOES.ZS	Gender: Health	Women who believe a husband is justified in beating his wife when she goes out without telling him (%)
923	SG.VAW.NEGL.ZS	Gender: Health	Women who believe a husband is justified in beating his wife when she neglects the children (%)
924	SG.VAW.REAS.ZS	Gender: Health	Women who believe a husband is justified in beating his wife (any of five reasons) (%)
925	SG.VAW.REFU.ZS	Gender: Health	Women who believe a husband is justified in beating his wife when she refuses sex with him (%)
926	SH.ALC.PCAP.FE.LI	Health: Risk factors	"Total alcohol consumption per capita
927	SH.ALC.PCAP.LI	Health: Risk factors	"Total alcohol consumption per capita (liters of pure alcohol
928	SH.ALC.PCAP.MA.LI	Health: Risk factors	"Total alcohol consumption per capita
929	SH.ANM.ALLW.ZS	Health: Nutrition	Prevalence of anemia among women of reproductive age (% of women ages 15-49)
930	SH.ANM.CHLD.ZS	Health: Nutrition	Prevalence of anemia among children (% of children ages 6-59 months)
931	SH.ANM.NPRG.ZS	Health: Nutrition	Prevalence of anemia among non-pregnant women (% of women ages 15-49)
932	SH.CON.1524.FE.ZS	Health: Disease prevention	"Condom use
933	SH.CON.1524.MA.ZS	Health: Disease prevention	"Condom use
934	SH.DTH.0509	Health: Mortality	Number of deaths ages 5-9 years
935	SH.DTH.1014	Health: Mortality	Number of deaths ages 10-14 years
936	SH.DTH.1519	Health: Mortality	Number of deaths ages 15-19 years
937	SH.DTH.2024	Health: Mortality	Number of deaths ages 20-24 years
938	SH.DTH.COMM.ZS	Health: Risk factors	"Cause of death
939	SH.DTH.IMRT	Health: Mortality	Number of infant deaths
940	SH.DTH.INJR.ZS	Health: Risk factors	"Cause of death
941	SH.DTH.MORT	Health: Mortality	Number of under-five deaths
942	SH.DTH.NCOM.ZS	Health: Risk factors	"Cause of death
943	SH.DTH.NMRT	Health: Mortality	Number of neonatal deaths
944	SH.DYN.0509	Health: Mortality	"Probability of dying among children ages 5-9 years (per 1
945	SH.DYN.1014	Health: Mortality	"Probability of dying among adolescents ages 10-14 years (per 1
946	SH.DYN.1519	Health: Mortality	"Probability of dying among adolescents ages 15-19 years (per 1
947	SH.DYN.2024	Health: Mortality	"Probability of dying among youth ages 20-24 years (per 1
948	SH.DYN.AIDS.FE.ZS	Health: Risk factors	\N
\.


--
-- Name: authorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authorities_id_seq', 131, true);


--
-- Name: restoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restoken_id_seq', 67, true);


--
-- Name: seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq', 37184, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 135, true);


--
-- Name: activity activity_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pk_1 PRIMARY KEY (id);


--
-- Name: activity activity_un_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_un_1 UNIQUE (code);


--
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (id);


--
-- Name: base base_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pk_1 PRIMARY KEY (id);


--
-- Name: base base_un_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_un_1 UNIQUE (code);


--
-- Name: branch branch_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pk PRIMARY KEY (id);


--
-- Name: branch branch_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_un UNIQUE (code);


--
-- Name: country country_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pk_1 PRIMARY KEY (id);


--
-- Name: country country_un_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_un_1 UNIQUE (code);


--
-- Name: grossbuch grossbuch_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_pk PRIMARY KEY (id);


--
-- Name: indicator indicator_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_pk_1 PRIMARY KEY (id);


--
-- Name: indicator indicator_un_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_un_1 UNIQUE (code);


--
-- Name: industry industry_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry
    ADD CONSTRAINT industry_pk_1 PRIMARY KEY (id);


--
-- Name: industry industry_un_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industry
    ADD CONSTRAINT industry_un_1 UNIQUE (code);


--
-- Name: period period_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT period_pk PRIMARY KEY (id);


--
-- Name: period period_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.period
    ADD CONSTRAINT period_un UNIQUE (code);


--
-- Name: restoken restoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restoken
    ADD CONSTRAINT restoken_pkey PRIMARY KEY (id);


--
-- Name: restoken restoken_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restoken
    ADD CONSTRAINT restoken_username_key UNIQUE (username);


--
-- Name: sector sector_pk_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_pk_1 PRIMARY KEY (id);


--
-- Name: sector sector_un_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_un_1 UNIQUE (code);


--
-- Name: source sourse_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT sourse_pk PRIMARY KEY (id);


--
-- Name: source sourse_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT sourse_un UNIQUE (code);


--
-- Name: users un_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT un_username UNIQUE (username);


--
-- Name: unit unit_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pk PRIMARY KEY (id);


--
-- Name: unit unit_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_un UNIQUE (code);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wbnames wbnames_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wbnames
    ADD CONSTRAINT wbnames_pk PRIMARY KEY (id);


--
-- Name: wbnames wbnames_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wbnames
    ADD CONSTRAINT wbnames_un UNIQUE (wbcode);


--
-- Name: authorities fk_users_auth; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT fk_users_auth FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: grossbuch grossbuch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk FOREIGN KEY (unit) REFERENCES public.unit(code);


--
-- Name: grossbuch grossbuch_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_1 FOREIGN KEY (source) REFERENCES public.source(code);


--
-- Name: grossbuch grossbuch_fk_10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_10 FOREIGN KEY (wbname) REFERENCES public.wbnames(wbcode);


--
-- Name: grossbuch grossbuch_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_2 FOREIGN KEY (sector) REFERENCES public.sector(code);


--
-- Name: grossbuch grossbuch_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_3 FOREIGN KEY (period) REFERENCES public.period(code);


--
-- Name: grossbuch grossbuch_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_4 FOREIGN KEY (industry) REFERENCES public.industry(code);


--
-- Name: grossbuch grossbuch_fk_5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_5 FOREIGN KEY (indicator) REFERENCES public.indicator(code);


--
-- Name: grossbuch grossbuch_fk_6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_6 FOREIGN KEY (base) REFERENCES public.base(code);


--
-- Name: grossbuch grossbuch_fk_7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_7 FOREIGN KEY (activity) REFERENCES public.activity(code);


--
-- Name: grossbuch grossbuch_fk_8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_8 FOREIGN KEY (branch) REFERENCES public.branch(code);


--
-- Name: grossbuch grossbuch_fk_9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grossbuch
    ADD CONSTRAINT grossbuch_fk_9 FOREIGN KEY (country) REFERENCES public.country(code);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO scientist;
GRANT USAGE ON SCHEMA public TO observer;
GRANT USAGE ON SCHEMA public TO editor;


--
-- Name: TABLE activity; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.activity TO observer;
GRANT SELECT ON TABLE public.activity TO editor;
GRANT ALL ON TABLE public.activity TO scientist;


--
-- Name: TABLE base; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.base TO observer;
GRANT SELECT ON TABLE public.base TO editor;
GRANT ALL ON TABLE public.base TO scientist;


--
-- Name: TABLE branch; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.branch TO observer;
GRANT SELECT ON TABLE public.branch TO editor;
GRANT ALL ON TABLE public.branch TO scientist;


--
-- Name: TABLE country; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.country TO observer;
GRANT SELECT ON TABLE public.country TO editor;
GRANT ALL ON TABLE public.country TO scientist;


--
-- Name: TABLE grossbuch; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.grossbuch TO observer;
GRANT ALL ON TABLE public.grossbuch TO editor;
GRANT ALL ON TABLE public.grossbuch TO scientist;


--
-- Name: TABLE indicator; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.indicator TO observer;
GRANT SELECT ON TABLE public.indicator TO editor;
GRANT ALL ON TABLE public.indicator TO scientist;


--
-- Name: TABLE industry; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.industry TO observer;
GRANT SELECT ON TABLE public.industry TO editor;
GRANT ALL ON TABLE public.industry TO scientist;


--
-- Name: TABLE period; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.period TO observer;
GRANT SELECT ON TABLE public.period TO editor;
GRANT ALL ON TABLE public.period TO scientist;


--
-- Name: TABLE sector; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.sector TO observer;
GRANT SELECT ON TABLE public.sector TO editor;
GRANT ALL ON TABLE public.sector TO scientist;


--
-- Name: TABLE source; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.source TO observer;
GRANT SELECT ON TABLE public.source TO editor;
GRANT ALL ON TABLE public.source TO scientist;


--
-- Name: TABLE unit; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.unit TO observer;
GRANT SELECT ON TABLE public.unit TO editor;
GRANT ALL ON TABLE public.unit TO scientist;


--
-- Name: TABLE wbnames; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.wbnames TO scientist;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

