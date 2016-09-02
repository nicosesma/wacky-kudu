--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: authors; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE authors OWNER TO "JameStewartJr";

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: JameStewartJr
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_id_seq OWNER TO "JameStewartJr";

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JameStewartJr
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: availables; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE availables (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "borrowId" integer,
    "bookId" integer
);


ALTER TABLE availables OWNER TO "JameStewartJr";

--
-- Name: availables_id_seq; Type: SEQUENCE; Schema: public; Owner: JameStewartJr
--

CREATE SEQUENCE availables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE availables_id_seq OWNER TO "JameStewartJr";

--
-- Name: availables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JameStewartJr
--

ALTER SEQUENCE availables_id_seq OWNED BY availables.id;


--
-- Name: bookAuthors; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE "bookAuthors" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "authorId" integer NOT NULL,
    "bookId" integer NOT NULL
);


ALTER TABLE "bookAuthors" OWNER TO "JameStewartJr";

--
-- Name: bookGenres; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE "bookGenres" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "genreId" integer NOT NULL,
    "bookId" integer NOT NULL
);


ALTER TABLE "bookGenres" OWNER TO "JameStewartJr";

--
-- Name: books; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    cover character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE books OWNER TO "JameStewartJr";

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: JameStewartJr
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO "JameStewartJr";

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JameStewartJr
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: borrows; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE borrows (
    id integer NOT NULL,
    returned_on timestamp with time zone,
    returned boolean,
    due_date timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "availableId" integer,
    "userId" integer
);


ALTER TABLE borrows OWNER TO "JameStewartJr";

--
-- Name: borrows_id_seq; Type: SEQUENCE; Schema: public; Owner: JameStewartJr
--

CREATE SEQUENCE borrows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE borrows_id_seq OWNER TO "JameStewartJr";

--
-- Name: borrows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JameStewartJr
--

ALTER SEQUENCE borrows_id_seq OWNED BY borrows.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE genres (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE genres OWNER TO "JameStewartJr";

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: JameStewartJr
--

CREATE SEQUENCE genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_id_seq OWNER TO "JameStewartJr";

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JameStewartJr
--

ALTER SEQUENCE genres_id_seq OWNED BY genres.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: JameStewartJr
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE users OWNER TO "JameStewartJr";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: JameStewartJr
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "JameStewartJr";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JameStewartJr
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY availables ALTER COLUMN id SET DEFAULT nextval('availables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY borrows ALTER COLUMN id SET DEFAULT nextval('borrows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY genres ALTER COLUMN id SET DEFAULT nextval('genres_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY authors (id, name, "createdAt", "updatedAt") FROM stdin;
1	John Roberts	2015-12-12 00:00:00-08	2016-08-31 00:00:00-07
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JameStewartJr
--

SELECT pg_catalog.setval('authors_id_seq', 1, true);


--
-- Data for Name: availables; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY availables (id, "createdAt", "updatedAt", "borrowId", "bookId") FROM stdin;
\.


--
-- Name: availables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JameStewartJr
--

SELECT pg_catalog.setval('availables_id_seq', 1, false);


--
-- Data for Name: bookAuthors; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY "bookAuthors" ("createdAt", "updatedAt", "authorId", "bookId") FROM stdin;
2012-12-12 00:00:00-08	2016-08-31 00:00:00-07	1	1
2012-12-12 00:00:00-08	2012-12-12 00:00:00-08	1	12
\.


--
-- Data for Name: bookGenres; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY "bookGenres" ("createdAt", "updatedAt", "genreId", "bookId") FROM stdin;
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY books (id, title, description, cover, "createdAt", "updatedAt") FROM stdin;
2	Ugh	john@learnersguild.org	cover	2016-08-31 12:01:11.403-07	2016-08-31 12:01:11.403-07
4	Ugh	john@learnersguild.org	cover	2016-08-31 12:02:49.51-07	2016-08-31 12:02:49.51-07
5	Ugh	john@learnersguild.org	cover	2016-08-31 12:09:44.751-07	2016-08-31 12:09:44.751-07
11	book try	dscri here	adaf	2016-08-31 12:22:19.38-07	2016-08-31 12:22:19.38-07
12	book try	dscri here	adaf	2016-08-31 12:22:33.621-07	2016-08-31 12:22:33.621-07
13	abc	abcd	abcc	2016-08-31 12:25:09.153-07	2016-08-31 12:25:09.153-07
14	we have	temporary	success	2016-08-31 12:33:42.316-07	2016-08-31 12:33:42.316-07
15	Red Mars	Kim Stanley Robinson	https://images-na.ssl-images-amazon.com/images/I/71bINMUVSPL.jpg	2016-08-31 16:04:06.034-07	2016-09-01 08:56:56.012-07
6	This book	Needs	stuff	2016-08-31 12:12:32.12-07	2016-09-01 09:00:15.443-07
7	Book Title	Something descritpion	https://books.google.com/books/content/images/frontcover/VvSoyqPBPbMC?fife=w300-rw	2016-08-31 12:13:13.49-07	2016-09-01 09:06:16.891-07
9	34234	\N	cover here	2016-08-31 12:18:34.661-07	2016-08-31 12:18:34.661-07
3	ASDFADF			2016-08-31 12:02:00.71-07	2016-08-31 15:32:52.031-07
8	ADFAD	\N	\N	2016-08-31 12:13:36.002-07	2016-08-31 17:31:00.752-07
1	first echo book	this is a first attempt	terrible	2012-12-12 00:00:00-08	2016-09-01 10:36:24.909-07
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JameStewartJr
--

SELECT pg_catalog.setval('books_id_seq', 15, true);


--
-- Data for Name: borrows; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY borrows (id, returned_on, returned, due_date, "createdAt", "updatedAt", "availableId", "userId") FROM stdin;
\.


--
-- Name: borrows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JameStewartJr
--

SELECT pg_catalog.setval('borrows_id_seq', 1, false);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY genres (id, name, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JameStewartJr
--

SELECT pg_catalog.setval('genres_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: JameStewartJr
--

COPY users (id, username, email, password, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JameStewartJr
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: availables_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY availables
    ADD CONSTRAINT availables_pkey PRIMARY KEY (id);


--
-- Name: bookAuthors_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY "bookAuthors"
    ADD CONSTRAINT "bookAuthors_pkey" PRIMARY KEY ("authorId", "bookId");


--
-- Name: bookGenres_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY "bookGenres"
    ADD CONSTRAINT "bookGenres_pkey" PRIMARY KEY ("genreId", "bookId");


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: borrows_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY borrows
    ADD CONSTRAINT borrows_pkey PRIMARY KEY (id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: availables_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY availables
    ADD CONSTRAINT "availables_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: bookAuthors_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY "bookAuthors"
    ADD CONSTRAINT "bookAuthors_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES authors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bookAuthors_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY "bookAuthors"
    ADD CONSTRAINT "bookAuthors_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bookGenres_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY "bookGenres"
    ADD CONSTRAINT "bookGenres_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bookGenres_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY "bookGenres"
    ADD CONSTRAINT "bookGenres_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: borrows_availableId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY borrows
    ADD CONSTRAINT "borrows_availableId_fkey" FOREIGN KEY ("availableId") REFERENCES availables(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: borrows_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: JameStewartJr
--

ALTER TABLE ONLY borrows
    ADD CONSTRAINT "borrows_userId_fkey" FOREIGN KEY ("userId") REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: JameStewartJr
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "JameStewartJr";
GRANT ALL ON SCHEMA public TO "JameStewartJr";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

