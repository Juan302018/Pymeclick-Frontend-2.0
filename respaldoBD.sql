--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13
-- Dumped by pg_dump version 12.3

-- Started on 2020-10-26 02:56:57

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

--
-- TOC entry 197 (class 1259 OID 16396)
-- Name: calificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calificacion (
    id_calificacion integer NOT NULL,
    comentario character varying(50),
    imagen character varying(255),
    puntaje double precision NOT NULL
);


ALTER TABLE public.calificacion OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: calificacion_id_calificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calificacion_id_calificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calificacion_id_calificacion_seq OWNER TO postgres;

--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 196
-- Name: calificacion_id_calificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificacion_id_calificacion_seq OWNED BY public.calificacion.id_calificacion;


--
-- TOC entry 199 (class 1259 OID 16404)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(70) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16402)
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 198
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- TOC entry 201 (class 1259 OID 16412)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudad (
    id_ciudad integer NOT NULL,
    nombre character varying(70) NOT NULL
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16410)
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudad_id_ciudad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_id_ciudad_seq OWNER TO postgres;

--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 200
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudad_id_ciudad_seq OWNED BY public.ciudad.id_ciudad;


--
-- TOC entry 203 (class 1259 OID 16423)
-- Name: comuna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comuna (
    id_comuna integer NOT NULL,
    nombre_comuna character varying(70) NOT NULL,
    id_ciudad integer
);


ALTER TABLE public.comuna OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16421)
-- Name: comuna_id_comuna_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comuna_id_comuna_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comuna_id_comuna_seq OWNER TO postgres;

--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 202
-- Name: comuna_id_comuna_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comuna_id_comuna_seq OWNED BY public.comuna.id_comuna;


--
-- TOC entry 205 (class 1259 OID 16431)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    descripcion character varying(150) NOT NULL,
    direccion character varying(150) NOT NULL,
    email character varying(100),
    logo character varying(255),
    nombre character varying(70) NOT NULL,
    telefono character varying(12) NOT NULL,
    id_calificacion integer,
    id_ciudad integer,
    id_comuna integer,
    id_categoria integer
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16429)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_id_empresa_seq OWNER TO postgres;

--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 204
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;


--
-- TOC entry 219 (class 1259 OID 16513)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16445)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    icono character varying(20),
    nombre character varying(20),
    url character varying(50)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16443)
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_menu_seq OWNER TO postgres;

--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 206
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;


--
-- TOC entry 208 (class 1259 OID 16451)
-- Name: menu_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_rol (
    id_menu integer NOT NULL,
    id_rol integer NOT NULL
);


ALTER TABLE public.menu_rol OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16454)
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_token (
    token_id character varying(256) NOT NULL,
    authentication bytea NOT NULL,
    authentication_id character varying(256) NOT NULL,
    client_id character varying(256) NOT NULL,
    refresh_token character varying(256),
    token bytea NOT NULL,
    user_name character varying(256) NOT NULL
);


ALTER TABLE public.oauth_access_token OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16470)
-- Name: producto_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_servicio (
    id_prod_serv integer NOT NULL,
    descripcion_prod_serv character varying(150) NOT NULL,
    imagen character varying(255),
    nombre_prod_serv character varying(70) NOT NULL,
    precio double precision NOT NULL,
    id_categoria integer,
    id_empresa integer
);


ALTER TABLE public.producto_servicio OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16468)
-- Name: producto_servicio_id_prod_serv_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_servicio_id_prod_serv_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_servicio_id_prod_serv_seq OWNER TO postgres;

--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 210
-- Name: producto_servicio_id_prod_serv_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_servicio_id_prod_serv_seq OWNED BY public.producto_servicio.id_prod_serv;


--
-- TOC entry 213 (class 1259 OID 16478)
-- Name: reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reset_token (
    id integer NOT NULL,
    expiracion timestamp without time zone NOT NULL,
    token character varying(255) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.reset_token OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16476)
-- Name: reset_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reset_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reset_token_id_seq OWNER TO postgres;

--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 212
-- Name: reset_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reset_token_id_seq OWNED BY public.reset_token.id;


--
-- TOC entry 215 (class 1259 OID 16486)
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    descripcion character varying(255),
    nombre character varying(255)
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16484)
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_rol_seq OWNER TO postgres;

--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 214
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;


--
-- TOC entry 217 (class 1259 OID 16497)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    estado boolean NOT NULL,
    password character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16495)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 218 (class 1259 OID 16506)
-- Name: usuario_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_rol (
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL
);


ALTER TABLE public.usuario_rol OWNER TO postgres;

--
-- TOC entry 2742 (class 2604 OID 16399)
-- Name: calificacion id_calificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificacion ALTER COLUMN id_calificacion SET DEFAULT nextval('public.calificacion_id_calificacion_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 16407)
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 16415)
-- Name: ciudad id_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id_ciudad SET DEFAULT nextval('public.ciudad_id_ciudad_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 16426)
-- Name: comuna id_comuna; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comuna ALTER COLUMN id_comuna SET DEFAULT nextval('public.comuna_id_comuna_seq'::regclass);


--
-- TOC entry 2746 (class 2604 OID 16434)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 16448)
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 16473)
-- Name: producto_servicio id_prod_serv; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_servicio ALTER COLUMN id_prod_serv SET DEFAULT nextval('public.producto_servicio_id_prod_serv_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 16481)
-- Name: reset_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token ALTER COLUMN id SET DEFAULT nextval('public.reset_token_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 16489)
-- Name: rol id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 16500)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2912 (class 0 OID 16396)
-- Dependencies: 197
-- Data for Name: calificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificacion (id_calificacion, comentario, imagen, puntaje) FROM stdin;
1	muy bueno	imagen.jpg	4.5
2	excelente servicio	imagen2.jpg	5
3	servicio regular	imagen.jpg	4
\.


--
-- TOC entry 2914 (class 0 OID 16404)
-- Dependencies: 199
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id_categoria, nombre_categoria) FROM stdin;
3	almacen
4	minimarket
5	taller mecanico
6	ferreteria
7	importadora
\.


--
-- TOC entry 2916 (class 0 OID 16412)
-- Dependencies: 201
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudad (id_ciudad, nombre) FROM stdin;
1	santiago
\.


--
-- TOC entry 2918 (class 0 OID 16423)
-- Dependencies: 203
-- Data for Name: comuna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comuna (id_comuna, nombre_comuna, id_ciudad) FROM stdin;
1	pudahuel	\N
2	santiago centro	\N
3	providencia	\N
4	quilicura	\N
\.


--
-- TOC entry 2920 (class 0 OID 16431)
-- Dependencies: 205
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresa (id_empresa, descripcion, direccion, email, logo, nombre, telefono, id_calificacion, id_ciudad, id_comuna, id_categoria) FROM stdin;
3	abc company fabrica de etc	calle falsa 123	abccompany@gmail.com	logo.png	abc company	12345678	1	1	1	7
4	def company fabrica etc	calle falsa 567	defcompany@gmail.com	logo2.png	def company	12345678	2	1	2	7
28	ghi calle falsa	calle falsa 456	ghicompañy@informaciones.cl	logo3.png	ert company	12345678	1	1	3	7
32	ert  calle falsa	Teatinos 500	test@test.cl	logo3.png	ert company	98761234	2	1	1	7
33	ghi calle falsa	Teatinos 500	sonda@informaciones.cl	logo4.png	dan company	809753	2	1	1	7
\.


--
-- TOC entry 2922 (class 0 OID 16445)
-- Dependencies: 207
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, icono, nombre, url) FROM stdin;
\.


--
-- TOC entry 2923 (class 0 OID 16451)
-- Dependencies: 208
-- Data for Name: menu_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_rol (id_menu, id_rol) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 16454)
-- Dependencies: 209
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_token (token_id, authentication, authentication_id, client_id, refresh_token, token, user_name) FROM stdin;
27ded817afb8973cef062a61c20b639c	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000007704000000007871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b72656469726563745572697400124c6a6176612f6c616e672f537472696e673b4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0011787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000f4c001172657175657374506172616d657465727371007e000e4c000573636f706571007e0011787074000c6d69746f6d65646963617070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e000e7870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000037708000000040000000274000a6772616e745f7479706574000870617373776f7264740008757365726e616d65740015636d656e64657a3137303540676d61696c2e636f6d78737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e0020770c000000103f40000000000000787371007e00173f40000000000000770800000010000000007870707371007e0020770c000000103f4000000000000174000e6d69746f7265636f757273656964787371007e0020770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000001fe0200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b000000007704000000007871007e002c737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e00173f400000000000067708000000080000000271007e001971007e001a71007e001b71007e001c780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000001fe0200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00114c000870617373776f726471007e000f4c0008757365726e616d6571007e000f7870010101017371007e001d737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f7200000000000001fe02000078707704000000007870740015636d656e64657a3137303540676d61696c2e636f6d	a6e45a40930f4ca25c6e5fdf2d923d60	mitomedicapp	\N	\\xaced0005737200436f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f4175746832416363657373546f6b656e0cb29e361b24face0200064c00156164646974696f6e616c496e666f726d6174696f6e74000f4c6a6176612f7574696c2f4d61703b4c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b4c000c72656672657368546f6b656e74003f4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f636f6d6d6f6e2f4f417574683252656672657368546f6b656e3b4c000573636f706574000f4c6a6176612f7574696c2f5365743b4c0009746f6b656e547970657400124c6a6176612f6c616e672f537472696e673b4c000576616c756571007e00057870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000001770800000002000000017400036a746974002439626636623439352d633362662d343031382d616439332d37613666383363353266323978007372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001755c8e9bf17870737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c0001637400164c6a6176612f7574696c2f436f6c6c656374696f6e3b7870737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f400000000000027400047265616474000577726974657874000662656172657274013c65794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c736962576c3062334a6c59323931636e4e6c61575169585377695a586877496a6f784e6a417a4e5463314e6a55784c434a316332567958323568625755694f694a6a625756755a4756364d5463774e55426e625746706243356a623230694c434a7164476b694f694935596d5932596a51354e53316a4d324a6d4c5451774d546774595751354d79303359545a6d4f444e6a4e544a6d4d6a6b694c434a6a62476c6c626e5266615751694f694a74615852766257566b61574e68634841694c434a7a593239775a53493657794a795a57466b4969776964334a70644755695858302e34557555774f737a64726c7861576e70783142772d4e447a6b2d47452d417a336e2d544b646e6a2d786967	cmendez1705@gmail.com
\.


--
-- TOC entry 2926 (class 0 OID 16470)
-- Dependencies: 211
-- Data for Name: producto_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto_servicio (id_prod_serv, descripcion_prod_serv, imagen, nombre_prod_serv, precio, id_categoria, id_empresa) FROM stdin;
13	la tablet	table.jpg	tablet	2000000	7	3
18	el pantalon	pantalon.png	pantalon	9990	\N	\N
19	Venta de suhis y delivery	sushi.png	Sushi	9990	\N	\N
20	Reparación de vehículos y venta de accesarios automotris.	ruedaVulc	Vulacanización	2000	\N	\N
21	destronillador para atornillar	destornillador.jpg	destornilladores	9990	\N	\N
22	bebida para tomar	bebida.jpg	bebida	9990	\N	\N
23	el  notebook	notebook.jpg	notebook	500000	\N	\N
24	el pantalon	pantalon.png	pantalon	9990	\N	\N
28	set completo de herramientas	set.pgn	set de herramientas	999999	\N	\N
29	set completo de herramientas	set.pgn	set de herramientas	999999	\N	\N
\.


--
-- TOC entry 2928 (class 0 OID 16478)
-- Dependencies: 213
-- Data for Name: reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reset_token (id, expiracion, token, id_usuario) FROM stdin;
\.


--
-- TOC entry 2930 (class 0 OID 16486)
-- Dependencies: 215
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol (id_rol, descripcion, nombre) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 16497)
-- Dependencies: 217
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, estado, password, username) FROM stdin;
1	t	$2a$10$oziCLh26VWkzTOzMwLuEZOMuKDKNM1T0IN575pwRSq/IQ0MgHgdFq	jfernandez816@hotmail.com
2	t	$2a$10$eZvkaM2JGkmuKX5uCo3LBeCa1cQ9HyoSsm20h/H.NsgETBG8gxl9O	cmendez1705@gmail.com
\.


--
-- TOC entry 2933 (class 0 OID 16506)
-- Dependencies: 218
-- Data for Name: usuario_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_rol (id_usuario, id_rol) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 196
-- Name: calificacion_id_calificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificacion_id_calificacion_seq', 3, true);


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 198
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 7, true);


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 200
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudad_id_ciudad_seq', 1, false);


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 202
-- Name: comuna_id_comuna_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comuna_id_comuna_seq', 1, false);


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 204
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 33, true);


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 219
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 206
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 1, false);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 210
-- Name: producto_servicio_id_prod_serv_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_servicio_id_prod_serv_seq', 29, true);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 212
-- Name: reset_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reset_token_id_seq', 1, false);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 214
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 1, false);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 2, true);


--
-- TOC entry 2753 (class 2606 OID 16401)
-- Name: calificacion calificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_pkey PRIMARY KEY (id_calificacion);


--
-- TOC entry 2755 (class 2606 OID 16409)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 2757 (class 2606 OID 16417)
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);


--
-- TOC entry 2759 (class 2606 OID 16428)
-- Name: comuna comuna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT comuna_pkey PRIMARY KEY (id_comuna);


--
-- TOC entry 2761 (class 2606 OID 16439)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 2763 (class 2606 OID 16450)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- TOC entry 2765 (class 2606 OID 16461)
-- Name: oauth_access_token oauth_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_token
    ADD CONSTRAINT oauth_access_token_pkey PRIMARY KEY (token_id);


--
-- TOC entry 2767 (class 2606 OID 16475)
-- Name: producto_servicio producto_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_servicio
    ADD CONSTRAINT producto_servicio_pkey PRIMARY KEY (id_prod_serv);


--
-- TOC entry 2769 (class 2606 OID 16483)
-- Name: reset_token reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT reset_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 16494)
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 2775 (class 2606 OID 16512)
-- Name: usuario uk_863n1y3x0jalatoir4325ehal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_863n1y3x0jalatoir4325ehal UNIQUE (username);


--
-- TOC entry 2771 (class 2606 OID 16510)
-- Name: reset_token uk_shiutqgqq3m7hdrlmckbk4am6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT uk_shiutqgqq3m7hdrlmckbk4am6 UNIQUE (token);


--
-- TOC entry 2777 (class 2606 OID 16505)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2789 (class 2606 OID 16590)
-- Name: usuario_rol fk3ftpt75ebughsiy5g03b11akt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fk3ftpt75ebughsiy5g03b11akt FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 2784 (class 2606 OID 16555)
-- Name: menu_rol fk8uyjomykqlidw6whr5a9vx16d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT fk8uyjomykqlidw6whr5a9vx16d FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- TOC entry 2782 (class 2606 OID 16599)
-- Name: empresa fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- TOC entry 2778 (class 2606 OID 16619)
-- Name: comuna fk_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT fk_ciudad FOREIGN KEY (id_ciudad) REFERENCES public.ciudad(id_ciudad);


--
-- TOC entry 2779 (class 2606 OID 16525)
-- Name: empresa fk_empresa_calificacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk_empresa_calificacion FOREIGN KEY (id_calificacion) REFERENCES public.calificacion(id_calificacion);


--
-- TOC entry 2780 (class 2606 OID 16530)
-- Name: empresa fk_empresa_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk_empresa_ciudad FOREIGN KEY (id_ciudad) REFERENCES public.ciudad(id_ciudad);


--
-- TOC entry 2781 (class 2606 OID 16535)
-- Name: empresa fk_empresa_comuna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk_empresa_comuna FOREIGN KEY (id_comuna) REFERENCES public.comuna(id_comuna);


--
-- TOC entry 2785 (class 2606 OID 16624)
-- Name: producto_servicio fk_productoservicio_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_servicio
    ADD CONSTRAINT fk_productoservicio_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- TOC entry 2786 (class 2606 OID 16629)
-- Name: producto_servicio fk_productoservicio_empresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_servicio
    ADD CONSTRAINT fk_productoservicio_empresa FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 2783 (class 2606 OID 16550)
-- Name: menu_rol fkjtnyb2364scc8ojb7vwh2jflj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT fkjtnyb2364scc8ojb7vwh2jflj FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- TOC entry 2788 (class 2606 OID 16585)
-- Name: usuario_rol fkkxcv7htfnm9x1wkofnud0ewql; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fkkxcv7htfnm9x1wkofnud0ewql FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- TOC entry 2787 (class 2606 OID 16580)
-- Name: reset_token fkoc8cqwnb1m8ijoboimhcybrl4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT fkoc8cqwnb1m8ijoboimhcybrl4 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


-- Completed on 2020-10-26 02:56:57

--
-- PostgreSQL database dump complete
--

