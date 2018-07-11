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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    name character varying,
    teacher_id bigint,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: high_flyer; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.high_flyer AS
SELECT
    NULL::bigint AS id,
    NULL::character varying AS name,
    NULL::character varying AS email,
    NULL::timestamp without time zone AS created_at,
    NULL::timestamp without time zone AS updated_at;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: student_courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student_courses (
    id bigint NOT NULL,
    student_id bigint,
    course_id bigint,
    teacher_id bigint,
    score integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: student_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.student_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: student_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.student_courses_id_seq OWNED BY public.student_courses.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: teacher_ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teacher_ratings (
    id bigint NOT NULL,
    student_id bigint,
    teacher_id bigint,
    rating integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: teacher_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teacher_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teacher_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teacher_ratings_id_seq OWNED BY public.teacher_ratings.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: student_courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_courses ALTER COLUMN id SET DEFAULT nextval('public.student_courses_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: teacher_ratings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_ratings ALTER COLUMN id SET DEFAULT nextval('public.teacher_ratings_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: student_courses student_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT student_courses_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teacher_ratings teacher_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_ratings
    ADD CONSTRAINT teacher_ratings_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: index_courses_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_teacher_id ON public.courses USING btree (teacher_id);


--
-- Name: index_student_courses_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_student_courses_on_course_id ON public.student_courses USING btree (course_id);


--
-- Name: index_student_courses_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_student_courses_on_student_id ON public.student_courses USING btree (student_id);


--
-- Name: index_student_courses_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_student_courses_on_teacher_id ON public.student_courses USING btree (teacher_id);


--
-- Name: index_teacher_ratings_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacher_ratings_on_student_id ON public.teacher_ratings USING btree (student_id);


--
-- Name: index_teacher_ratings_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_teacher_ratings_on_teacher_id ON public.teacher_ratings USING btree (teacher_id);


--
-- Name: high_flyer _RETURN; Type: RULE; Schema: public; Owner: -
--

CREATE OR REPLACE VIEW public.high_flyer AS
 SELECT students.id,
    students.name,
    students.email,
    students.created_at,
    students.updated_at
   FROM ((((public.students
     JOIN public.student_courses ON ((student_courses.student_id = students.id)))
     JOIN public.student_courses student_courses_students_join ON ((student_courses_students_join.student_id = students.id)))
     JOIN public.teachers ON ((teachers.id = student_courses_students_join.teacher_id)))
     JOIN public.teacher_ratings ON ((teacher_ratings.teacher_id = teachers.id)))
  WHERE (student_courses.score >= 80)
  GROUP BY students.id, student_courses.id
 HAVING (avg(teacher_ratings.rating) >= (1)::numeric)
  ORDER BY student_courses.score DESC;


--
-- Name: teacher_ratings fk_rails_117820796f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_ratings
    ADD CONSTRAINT fk_rails_117820796f FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: student_courses fk_rails_7aa9878805; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT fk_rails_7aa9878805 FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: courses fk_rails_a68eff6aff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_rails_a68eff6aff FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: student_courses fk_rails_aab11897f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT fk_rails_aab11897f1 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: teacher_ratings fk_rails_c21266d3fc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teacher_ratings
    ADD CONSTRAINT fk_rails_c21266d3fc FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: student_courses fk_rails_fee459e6de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT fk_rails_fee459e6de FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180704053551'),
('20180704132452'),
('20180704132626'),
('20180704132722'),
('20180704134228'),
('20180710202300');


