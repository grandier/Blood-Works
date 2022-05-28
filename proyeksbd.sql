--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6
-- Dumped by pg_dump version 14.2

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
-- Name: account; Type: TABLE; Schema: public; Owner: kemas_sbd
--

CREATE TABLE public.account (
    user_id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    contact bigint NOT NULL
);


ALTER TABLE public.account OWNER TO kemas_sbd;

--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kemas_sbd
--

CREATE SEQUENCE public.account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_id_seq OWNER TO kemas_sbd;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kemas_sbd
--

ALTER SEQUENCE public.account_user_id_seq OWNED BY public.account.user_id;


--
-- Name: admin; Type: TABLE; Schema: public; Owner: kemas_sbd
--

CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    admin_name text NOT NULL,
    admin_email text NOT NULL,
    admin_password text NOT NULL,
    admin_contact bigint NOT NULL
);


ALTER TABLE public.admin OWNER TO kemas_sbd;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: kemas_sbd
--

CREATE SEQUENCE public.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_admin_id_seq OWNER TO kemas_sbd;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kemas_sbd
--

ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;


--
-- Name: blood_bank; Type: TABLE; Schema: public; Owner: kemas_sbd
--

CREATE TABLE public.blood_bank (
    bank_id integer NOT NULL,
    blood_name text NOT NULL,
    blood_type text NOT NULL,
    hospital_id integer
);


ALTER TABLE public.blood_bank OWNER TO kemas_sbd;

--
-- Name: blood_bank_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: kemas_sbd
--

CREATE SEQUENCE public.blood_bank_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blood_bank_bank_id_seq OWNER TO kemas_sbd;

--
-- Name: blood_bank_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kemas_sbd
--

ALTER SEQUENCE public.blood_bank_bank_id_seq OWNED BY public.blood_bank.bank_id;


--
-- Name: donatur; Type: TABLE; Schema: public; Owner: kemas_sbd
--

CREATE TABLE public.donatur (
    donor_id integer NOT NULL,
    donor_name text NOT NULL,
    donor_age integer NOT NULL,
    donor_contact bigint NOT NULL,
    donor_blood_type text NOT NULL,
    donor_current_disease text NOT NULL,
    hospital_id integer
);


ALTER TABLE public.donatur OWNER TO kemas_sbd;

--
-- Name: donatur_donor_id_seq; Type: SEQUENCE; Schema: public; Owner: kemas_sbd
--

CREATE SEQUENCE public.donatur_donor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donatur_donor_id_seq OWNER TO kemas_sbd;

--
-- Name: donatur_donor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kemas_sbd
--

ALTER SEQUENCE public.donatur_donor_id_seq OWNED BY public.donatur.donor_id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: kemas_sbd
--

CREATE TABLE public.patient (
    patient_id integer NOT NULL,
    patient_name text NOT NULL,
    patient_age integer NOT NULL,
    patient_contact bigint NOT NULL,
    patient_blood_type text NOT NULL,
    patient_current_disease text NOT NULL,
    hospital_id integer
);


ALTER TABLE public.patient OWNER TO kemas_sbd;

--
-- Name: patient_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: kemas_sbd
--

CREATE SEQUENCE public.patient_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_patient_id_seq OWNER TO kemas_sbd;

--
-- Name: patient_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kemas_sbd
--

ALTER SEQUENCE public.patient_patient_id_seq OWNED BY public.patient.patient_id;


--
-- Name: rumah_sakit; Type: TABLE; Schema: public; Owner: kemas_sbd
--

CREATE TABLE public.rumah_sakit (
    hospital_id integer NOT NULL,
    hospital_name text NOT NULL,
    hospital_address text NOT NULL,
    hospital_contact bigint NOT NULL
);


ALTER TABLE public.rumah_sakit OWNER TO kemas_sbd;

--
-- Name: rumah_sakit_hospital_id_seq; Type: SEQUENCE; Schema: public; Owner: kemas_sbd
--

CREATE SEQUENCE public.rumah_sakit_hospital_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rumah_sakit_hospital_id_seq OWNER TO kemas_sbd;

--
-- Name: rumah_sakit_hospital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kemas_sbd
--

ALTER SEQUENCE public.rumah_sakit_hospital_id_seq OWNED BY public.rumah_sakit.hospital_id;


--
-- Name: account user_id; Type: DEFAULT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.account ALTER COLUMN user_id SET DEFAULT nextval('public.account_user_id_seq'::regclass);


--
-- Name: admin admin_id; Type: DEFAULT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);


--
-- Name: blood_bank bank_id; Type: DEFAULT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.blood_bank ALTER COLUMN bank_id SET DEFAULT nextval('public.blood_bank_bank_id_seq'::regclass);


--
-- Name: donatur donor_id; Type: DEFAULT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.donatur ALTER COLUMN donor_id SET DEFAULT nextval('public.donatur_donor_id_seq'::regclass);


--
-- Name: patient patient_id; Type: DEFAULT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.patient ALTER COLUMN patient_id SET DEFAULT nextval('public.patient_patient_id_seq'::regclass);


--
-- Name: rumah_sakit hospital_id; Type: DEFAULT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.rumah_sakit ALTER COLUMN hospital_id SET DEFAULT nextval('public.rumah_sakit_hospital_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: kemas_sbd
--

COPY public.account (user_id, name, email, password, contact) FROM stdin;
1	Tes	Tes	$2b$10$I8.CxMZafOcgyiAnSOWSSu7.VpWvayNgGeO8YF9PIG38JBmmQZjEa	1234
2	Admin	Tabrakan	$2b$10$Dc4GA8e6bKwEh8kYXKypDucsy9oAXHRKxM29r8qmaI4oTSSBojsnO	1234
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: kemas_sbd
--

COPY public.admin (admin_id, admin_name, admin_email, admin_password, admin_contact) FROM stdin;
1	Admin	Admin	$2b$10$PbcsvV/ykFyLUDwEgo82C.n8JDhtZivIHR/OhIeeCya5zlGdHffF6	1234
5	sdadas	dasdas	$2b$10$hEqaR.UOq.qzI83dwFYt9uyNaqJ/p2B9nk6tzBpidSlHZKM6wdm8y	12312
6	sdadsa	dasdasd	$2b$10$edbjkXuOMYJLR9dDtITtS.UkT.Frim3Mp8fbVdRm9o6YH8EQM98pm	1234
10	Farhan	Farhan@gmail.com	$2b$10$e.Rx5nsD9hNU/aECJJx8MODxe6REBZUa8wiT6aFRkI3heN6Qe4rV2	1234
2	Hiyahiyahiya	20	$2b$10$KEInPEci95qVmNLa03pybuf1b1g.3OtvoAwuhY8PFsNNNBMdy03LK	12312312
3	Halo	Halo	$2b$10$ZEjEYufoou9cF1K/AVYCAeGjaUnlbboSGgQL6pDXWe1sAgkDA9J2m	123456
4	Nyoba	Nyoba	$2b$10$QC5PaWEF42q7XMrt06hkveNTaeMn5nrWvW39U42rI5lAmeAA/FE1a	123123
\.


--
-- Data for Name: blood_bank; Type: TABLE DATA; Schema: public; Owner: kemas_sbd
--

COPY public.blood_bank (bank_id, blood_name, blood_type, hospital_id) FROM stdin;
1	Kemas	AB Positive	8
2	Kemas	O Negative	3
3	Kemas	B Negative	3
\.


--
-- Data for Name: donatur; Type: TABLE DATA; Schema: public; Owner: kemas_sbd
--

COPY public.donatur (donor_id, donor_name, donor_age, donor_contact, donor_blood_type, donor_current_disease, hospital_id) FROM stdin;
1	Kemas	23	12345	AB Positive	adawdawdawdwad	8
2	Kemas	44	235612	O Negative	-	3
3	Kemas	34	1230897123789	B Negative	Nothing	3
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: kemas_sbd
--

COPY public.patient (patient_id, patient_name, patient_age, patient_contact, patient_blood_type, patient_current_disease, hospital_id) FROM stdin;
1	Sabet	12	12345	B Unknown	none	1
2	Andin	12	123123	A Negative	none	2
\.


--
-- Data for Name: rumah_sakit; Type: TABLE DATA; Schema: public; Owner: kemas_sbd
--

COPY public.rumah_sakit (hospital_id, hospital_name, hospital_address, hospital_contact) FROM stdin;
4	Premier	JL H Mean Hiya	121321312312
5	Premier	JL H Mean Hiya	121321312312
6	Premier	JL BOjo negoro	12323123
7	Tes	jl hiyahiyahiyahiya	32112312
8	nyoba	sdasdasdasd	12312312
9	nyoba	sdasdasdasd	12312312
10	Soekarno	JL pancasila	12331231
1	Mantap	NYOABBBBBBN	123213
2	Saih	sdasdasdasdasd	123123
3	Ghulam	adsdadawdwdadfhgyutwerfwfs	23123
\.


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kemas_sbd
--

SELECT pg_catalog.setval('public.account_user_id_seq', 3, true);


--
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kemas_sbd
--

SELECT pg_catalog.setval('public.admin_admin_id_seq', 10, true);


--
-- Name: blood_bank_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kemas_sbd
--

SELECT pg_catalog.setval('public.blood_bank_bank_id_seq', 3, true);


--
-- Name: donatur_donor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kemas_sbd
--

SELECT pg_catalog.setval('public.donatur_donor_id_seq', 3, true);


--
-- Name: patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kemas_sbd
--

SELECT pg_catalog.setval('public.patient_patient_id_seq', 2, true);


--
-- Name: rumah_sakit_hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kemas_sbd
--

SELECT pg_catalog.setval('public.rumah_sakit_hospital_id_seq', 10, true);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);


--
-- Name: blood_bank blood_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.blood_bank
    ADD CONSTRAINT blood_bank_pkey PRIMARY KEY (bank_id);


--
-- Name: donatur donatur_pkey; Type: CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.donatur
    ADD CONSTRAINT donatur_pkey PRIMARY KEY (donor_id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- Name: rumah_sakit rumah_sakit_pkey; Type: CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.rumah_sakit
    ADD CONSTRAINT rumah_sakit_pkey PRIMARY KEY (hospital_id);


--
-- Name: blood_bank blood_bank_hospital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.blood_bank
    ADD CONSTRAINT blood_bank_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.rumah_sakit(hospital_id);


--
-- Name: donatur donatur_hospital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.donatur
    ADD CONSTRAINT donatur_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.rumah_sakit(hospital_id);


--
-- Name: patient patient_hospital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kemas_sbd
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.rumah_sakit(hospital_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: azure_pg_admin
--

REVOKE ALL ON SCHEMA public FROM azuresu;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO azure_pg_admin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- PostgreSQL database dump complete
--

