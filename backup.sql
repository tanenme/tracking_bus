--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: bus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bus (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    is_aktif boolean NOT NULL,
    id_pengemudi integer,
    no_plat character varying(255) NOT NULL
);


ALTER TABLE public.bus OWNER TO postgres;

--
-- Name: bus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bus_id_seq OWNER TO postgres;

--
-- Name: bus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bus_id_seq OWNED BY public.bus.id;


--
-- Name: halte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.halte (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    lat double precision NOT NULL,
    long double precision NOT NULL,
    alamat character varying(255) NOT NULL
);


ALTER TABLE public.halte OWNER TO postgres;

--
-- Name: halte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.halte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.halte_id_seq OWNER TO postgres;

--
-- Name: halte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.halte_id_seq OWNED BY public.halte.id;


--
-- Name: jadwal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jadwal (
    id integer NOT NULL,
    id_halte integer NOT NULL,
    id_bus integer NOT NULL,
    jadwal_datang character(255) NOT NULL
);


ALTER TABLE public.jadwal OWNER TO postgres;

--
-- Name: jadwal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jadwal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jadwal_id_seq OWNER TO postgres;

--
-- Name: jadwal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jadwal_id_seq OWNED BY public.jadwal.id;


--
-- Name: pengemudi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengemudi (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255)
);


ALTER TABLE public.pengemudi OWNER TO postgres;

--
-- Name: pengemudi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengemudi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pengemudi_id_seq OWNER TO postgres;

--
-- Name: pengemudi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengemudi_id_seq OWNED BY public.pengemudi.id;


--
-- Name: bus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus ALTER COLUMN id SET DEFAULT nextval('public.bus_id_seq'::regclass);


--
-- Name: halte id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.halte ALTER COLUMN id SET DEFAULT nextval('public.halte_id_seq'::regclass);


--
-- Name: jadwal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jadwal ALTER COLUMN id SET DEFAULT nextval('public.jadwal_id_seq'::regclass);


--
-- Name: pengemudi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengemudi ALTER COLUMN id SET DEFAULT nextval('public.pengemudi_id_seq'::regclass);


--
-- Data for Name: bus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bus (id, nama, lat, long, is_aktif, id_pengemudi, no_plat) FROM stdin;
5	Satria 2	-7.9410487	112.6612078	t	2	AG 23123 XYZ
6	Satria 3	-7.81517	111.9897	f	2	AG 6654 XYZ
4	Satria 1	-7.8055592	112.0003417	t	2	AG 6622 XYZ
\.


--
-- Data for Name: halte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.halte (id, nama, lat, long, alamat) FROM stdin;
1	Terminal tamanan	-7.828865	111.984321	Jln Gatot subroto no 10, Depan Terminal tamanan
2	halte campurejo	-7.827173	111.985232	Jln Campurejo no 25, Samping Pasar Campurejo
3	pemberhentian bus campurejo	-7.816647	111.989263	Jln Campurejo Raya km 3, Depan Toko Makmur
4	pemberhentian bus veteran	-7.811331	111.99198	Jln Veteran no 45, Depan Universitas Veteran
5	pemberhentian bus veteran 2	-7.811245	111.997347	Jln Veteran Timur no 12, Samping Mall Veteran
6	pemberhentian bus kawi	-7.808672	112.001889	Jln Gunung Kawi no 78, Depan Kantor Pos
7	pemberhentian bus ahmad dahlan	-7.803411	112.003425	Jln Ahmad Dahlan no 34, Depan Sekolah Dasar Dahlan
8	pemberhentian bus j.a suprapto	-7.807681	112.004613	Jln J.A Suprapto no 56, Samping Rumah Sakit Umum
9	pemberhentian bus sudanco supriadi	-7.812697	112.006034	Jln Sudanco Supriadi no 90, Depan Pasar Tradisional
10	halte diponegoro	-7.810881	112.009495	Jln Diponegoro no 123, Depan Taman Kota
11	halte diponegoro 2	-7.811404	112.013123	Jln Diponegoro Timur no 45, Samping Stasiun Kereta
12	halte hasanudin	-7.811707	112.015278	Jln Hasanudin no 67, Depan Masjid Agung
13	halte hasanudin 2	-7.812218	112.018717	Jln Hasanudin Selatan no 32, Samping Perpustakaan Kota
14	pemberhentian bus pemuda	-7.813877	112.020212	Jln Pemuda no 89, Depan Gedung Olahraga
15	pemberhentian bus joyoboyo	-7.816823	112.019652	Jln Joyoboyo no 54, Samping Taman Bermain
16	pemberhentian bus joyoboyo 2	-7.820701	112.018904	Jln Joyoboyo Selatan no 21, Depan Pusat Perbelanjaan
17	pemberhentian bus hoscokroaminoto	-7.822992	112.021967	Jln Hoscokroaminoto no 76, Samping Kantor Kelurahan
18	pemberhentian bus hoscokroaminoto 2	-7.823942	112.025691	Jln Hoscokroaminoto Timur no 43, Depan Sekolah Menengah
19	pemberhentian bus letjen suprapto	-7.819601	112.028609	Jln Letjen Suprapto no 112, Samping Taman Teknologi
20	halte banjaran	-7.817533	112.026812	Jln Banjaran no 65, Depan Pasar Banjaran
21	pemberhentian bus erlangga	-7.815885	112.021156	Jln Erlangga no 87, Samping Universitas Erlangga
22	halte hayam wuruk	-7.815464	112.019073	Jln Hayam Wuruk no 29, Depan Pusat Kuliner
23	peberhentian bus dhoho	-7.816812	112.013301	Jl. Stasiun, Balowerti, Kec. Kota
24	Pemberhentian bus patimura	-7.821642	112.016332	-
25	Pemberhentian bus kilisuci 1	-7.822976	112.018411	-
26	Pemberhentian bus kilisuci 2 	-7.825688	112.017953	-
27	Pemberhentian bus brigjen katamso 	-7.828473	112.013892	-
28	Pemberhentian bus brigjen katamso  2	-7.828235	112.012285	-
29	Pemberhentian bus bandar ngalim	-7.82705	112.005825	-
30	Pemberhentian bus wahid hasyim 1	-7.824564	112.005784	-
31	Pemberhentian bus KDP slamet 	-7.815316	112.005575	-
32	Pemberhentian bus veteran	-7.811084	112.00267	-
33	Pemberhentian bus wahid hasyim 2	-7.817665	112.005659	-
34	Pemberhentian bus penanggungan	-7.818719	111.999077	-
35	Pemberhentian bus semeru 	-7.827825	111.992465	-
36	Pemberhentian bus semeru 	-7.828293	111.984859	-
37	Pemberhentian bus penanggungan 2 	-7.818078	111.999287	-
\.


--
-- Data for Name: jadwal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jadwal (id, id_halte, id_bus, jadwal_datang) FROM stdin;
554	1	4	07:30                                                                                                                                                                                                                                                          
555	1	4	09:07                                                                                                                                                                                                                                                          
556	1	4	17:00                                                                                                                                                                                                                                                          
557	1	4	18:41                                                                                                                                                                                                                                                          
558	1	5	08:00                                                                                                                                                                                                                                                          
559	1	5	09:39                                                                                                                                                                                                                                                          
560	1	5	17:30                                                                                                                                                                                                                                                          
561	1	5	19:11                                                                                                                                                                                                                                                          
562	1	6	08:30                                                                                                                                                                                                                                                          
563	1	6	10:05                                                                                                                                                                                                                                                          
564	1	6	18:00                                                                                                                                                                                                                                                          
565	1	6	19:41                                                                                                                                                                                                                                                          
566	2	4	07:31                                                                                                                                                                                                                                                          
567	2	4	09:08                                                                                                                                                                                                                                                          
568	2	4	17:01                                                                                                                                                                                                                                                          
569	2	4	18:41                                                                                                                                                                                                                                                          
570	2	5	08:01                                                                                                                                                                                                                                                          
571	2	5	09:40                                                                                                                                                                                                                                                          
572	2	5	17:31                                                                                                                                                                                                                                                          
573	2	5	19:10                                                                                                                                                                                                                                                          
574	2	6	08:31                                                                                                                                                                                                                                                          
575	2	6	10:06                                                                                                                                                                                                                                                          
576	2	6	18:01                                                                                                                                                                                                                                                          
577	2	6	19:40                                                                                                                                                                                                                                                          
578	3	4	07:35                                                                                                                                                                                                                                                          
579	3	4	09:12                                                                                                                                                                                                                                                          
580	3	4	17:05                                                                                                                                                                                                                                                          
581	3	4	18:45                                                                                                                                                                                                                                                          
582	3	5	08:05                                                                                                                                                                                                                                                          
583	3	5	09:44                                                                                                                                                                                                                                                          
584	3	5	17:35                                                                                                                                                                                                                                                          
585	3	5	19:14                                                                                                                                                                                                                                                          
586	3	6	08:35                                                                                                                                                                                                                                                          
587	3	6	10:10                                                                                                                                                                                                                                                          
588	3	6	18:05                                                                                                                                                                                                                                                          
589	3	6	19:44                                                                                                                                                                                                                                                          
590	4	4	07:37                                                                                                                                                                                                                                                          
591	4	4	09:14                                                                                                                                                                                                                                                          
592	4	4	17:09                                                                                                                                                                                                                                                          
593	4	4	18:49                                                                                                                                                                                                                                                          
594	4	5	08:09                                                                                                                                                                                                                                                          
595	4	5	09:46                                                                                                                                                                                                                                                          
596	4	5	17:39                                                                                                                                                                                                                                                          
597	4	5	19:18                                                                                                                                                                                                                                                          
598	4	6	08:38                                                                                                                                                                                                                                                          
599	4	6	10:12                                                                                                                                                                                                                                                          
600	4	6	18:09                                                                                                                                                                                                                                                          
601	4	6	19:48                                                                                                                                                                                                                                                          
602	5	4	07:40                                                                                                                                                                                                                                                          
603	5	4	09:17                                                                                                                                                                                                                                                          
604	5	4	17:12                                                                                                                                                                                                                                                          
605	5	4	18:52                                                                                                                                                                                                                                                          
606	5	5	08:11                                                                                                                                                                                                                                                          
607	5	5	09:49                                                                                                                                                                                                                                                          
608	5	5	17:42                                                                                                                                                                                                                                                          
609	5	5	19:21                                                                                                                                                                                                                                                          
610	5	6	08:41                                                                                                                                                                                                                                                          
611	5	6	10:15                                                                                                                                                                                                                                                          
612	5	6	18:12                                                                                                                                                                                                                                                          
613	5	6	19:51                                                                                                                                                                                                                                                          
614	6	4	07:44                                                                                                                                                                                                                                                          
615	6	4	09:21                                                                                                                                                                                                                                                          
616	6	4	17:15                                                                                                                                                                                                                                                          
617	6	4	18:55                                                                                                                                                                                                                                                          
618	6	5	08:13                                                                                                                                                                                                                                                          
619	6	5	09:53                                                                                                                                                                                                                                                          
620	6	5	17:45                                                                                                                                                                                                                                                          
621	6	5	19:24                                                                                                                                                                                                                                                          
622	6	6	08:43                                                                                                                                                                                                                                                          
623	6	6	10:19                                                                                                                                                                                                                                                          
624	6	6	18:15                                                                                                                                                                                                                                                          
625	6	6	19:54                                                                                                                                                                                                                                                          
626	7	4	07:48                                                                                                                                                                                                                                                          
627	7	4	09:25                                                                                                                                                                                                                                                          
628	7	4	17:18                                                                                                                                                                                                                                                          
629	7	4	18:58                                                                                                                                                                                                                                                          
630	7	5	08:18                                                                                                                                                                                                                                                          
631	7	5	09:57                                                                                                                                                                                                                                                          
632	7	5	17:48                                                                                                                                                                                                                                                          
633	7	5	19:27                                                                                                                                                                                                                                                          
634	7	6	08:46                                                                                                                                                                                                                                                          
635	7	6	10:23                                                                                                                                                                                                                                                          
636	7	6	18:18                                                                                                                                                                                                                                                          
637	7	6	19:57                                                                                                                                                                                                                                                          
638	8	4	07:50                                                                                                                                                                                                                                                          
639	8	4	09:27                                                                                                                                                                                                                                                          
640	8	4	17:21                                                                                                                                                                                                                                                          
641	8	4	19:01                                                                                                                                                                                                                                                          
642	8	5	08:20                                                                                                                                                                                                                                                          
643	8	5	09:59                                                                                                                                                                                                                                                          
644	8	5	17:51                                                                                                                                                                                                                                                          
645	8	5	19:30                                                                                                                                                                                                                                                          
646	8	6	08:49                                                                                                                                                                                                                                                          
647	8	6	10:25                                                                                                                                                                                                                                                          
648	8	6	18:21                                                                                                                                                                                                                                                          
649	8	6	20:00                                                                                                                                                                                                                                                          
650	9	4	07:52                                                                                                                                                                                                                                                          
651	9	4	09:29                                                                                                                                                                                                                                                          
652	9	4	17:23                                                                                                                                                                                                                                                          
653	9	4	19:03                                                                                                                                                                                                                                                          
654	9	5	08:23                                                                                                                                                                                                                                                          
655	9	5	10:01                                                                                                                                                                                                                                                          
656	9	5	17:53                                                                                                                                                                                                                                                          
657	9	5	19:32                                                                                                                                                                                                                                                          
658	9	6	08:50                                                                                                                                                                                                                                                          
659	9	6	10:27                                                                                                                                                                                                                                                          
660	9	6	18:23                                                                                                                                                                                                                                                          
661	9	6	20:02                                                                                                                                                                                                                                                          
662	10	4	07:55                                                                                                                                                                                                                                                          
663	10	4	09:32                                                                                                                                                                                                                                                          
664	10	4	17:25                                                                                                                                                                                                                                                          
665	10	4	19:05                                                                                                                                                                                                                                                          
666	10	5	08:25                                                                                                                                                                                                                                                          
667	10	5	10:04                                                                                                                                                                                                                                                          
668	10	5	17:55                                                                                                                                                                                                                                                          
669	10	5	19:34                                                                                                                                                                                                                                                          
670	10	6	08:53                                                                                                                                                                                                                                                          
671	10	6	10:30                                                                                                                                                                                                                                                          
672	10	6	18:25                                                                                                                                                                                                                                                          
673	10	6	20:04                                                                                                                                                                                                                                                          
674	11	4	07:56                                                                                                                                                                                                                                                          
675	11	4	09:33                                                                                                                                                                                                                                                          
676	11	4	17:27                                                                                                                                                                                                                                                          
677	11	4	19:07                                                                                                                                                                                                                                                          
678	11	5	08:27                                                                                                                                                                                                                                                          
679	11	5	10:05                                                                                                                                                                                                                                                          
680	11	5	17:57                                                                                                                                                                                                                                                          
681	11	5	19:36                                                                                                                                                                                                                                                          
682	11	6	08:54                                                                                                                                                                                                                                                          
683	11	6	10:31                                                                                                                                                                                                                                                          
684	11	6	18:27                                                                                                                                                                                                                                                          
685	11	6	20:06                                                                                                                                                                                                                                                          
686	12	4	07:59                                                                                                                                                                                                                                                          
687	12	4	09:36                                                                                                                                                                                                                                                          
688	12	4	17:29                                                                                                                                                                                                                                                          
689	12	4	19:09                                                                                                                                                                                                                                                          
690	12	5	08:29                                                                                                                                                                                                                                                          
691	12	5	10:08                                                                                                                                                                                                                                                          
692	12	5	17:59                                                                                                                                                                                                                                                          
693	12	5	19:38                                                                                                                                                                                                                                                          
694	12	6	08:56                                                                                                                                                                                                                                                          
695	12	6	10:34                                                                                                                                                                                                                                                          
696	12	6	18:29                                                                                                                                                                                                                                                          
697	12	6	20:08                                                                                                                                                                                                                                                          
698	13	4	08:00                                                                                                                                                                                                                                                          
699	13	4	09:37                                                                                                                                                                                                                                                          
700	13	4	17:31                                                                                                                                                                                                                                                          
701	13	4	19:11                                                                                                                                                                                                                                                          
702	13	5	08:32                                                                                                                                                                                                                                                          
703	13	5	10:09                                                                                                                                                                                                                                                          
704	13	5	18:01                                                                                                                                                                                                                                                          
705	13	5	19:40                                                                                                                                                                                                                                                          
706	13	6	08:57                                                                                                                                                                                                                                                          
707	13	6	10:35                                                                                                                                                                                                                                                          
708	13	6	18:31                                                                                                                                                                                                                                                          
709	13	6	20:10                                                                                                                                                                                                                                                          
710	14	4	08:02                                                                                                                                                                                                                                                          
711	14	4	09:39                                                                                                                                                                                                                                                          
712	14	4	17:33                                                                                                                                                                                                                                                          
713	14	4	19:13                                                                                                                                                                                                                                                          
714	14	5	08:34                                                                                                                                                                                                                                                          
715	14	5	10:11                                                                                                                                                                                                                                                          
716	14	5	18:03                                                                                                                                                                                                                                                          
717	14	5	19:42                                                                                                                                                                                                                                                          
718	14	6	08:59                                                                                                                                                                                                                                                          
719	14	6	10:37                                                                                                                                                                                                                                                          
720	14	6	18:33                                                                                                                                                                                                                                                          
721	14	6	20:12                                                                                                                                                                                                                                                          
722	15	4	08:04                                                                                                                                                                                                                                                          
723	15	4	09:41                                                                                                                                                                                                                                                          
724	15	4	17:35                                                                                                                                                                                                                                                          
725	15	4	19:15                                                                                                                                                                                                                                                          
726	15	5	08:35                                                                                                                                                                                                                                                          
727	15	5	10:13                                                                                                                                                                                                                                                          
728	15	5	18:05                                                                                                                                                                                                                                                          
729	15	5	19:44                                                                                                                                                                                                                                                          
730	15	6	09:01                                                                                                                                                                                                                                                          
731	15	6	10:39                                                                                                                                                                                                                                                          
732	15	6	18:35                                                                                                                                                                                                                                                          
733	15	6	20:14                                                                                                                                                                                                                                                          
734	16	4	08:06                                                                                                                                                                                                                                                          
735	16	4	09:43                                                                                                                                                                                                                                                          
736	16	4	17:37                                                                                                                                                                                                                                                          
737	16	4	19:17                                                                                                                                                                                                                                                          
738	16	5	08:37                                                                                                                                                                                                                                                          
739	16	5	10:15                                                                                                                                                                                                                                                          
740	16	5	18:07                                                                                                                                                                                                                                                          
741	16	5	19:46                                                                                                                                                                                                                                                          
742	16	6	09:03                                                                                                                                                                                                                                                          
743	16	6	10:41                                                                                                                                                                                                                                                          
744	16	6	18:37                                                                                                                                                                                                                                                          
745	16	6	20:16                                                                                                                                                                                                                                                          
746	17	4	08:09                                                                                                                                                                                                                                                          
747	17	4	09:46                                                                                                                                                                                                                                                          
748	17	4	17:40                                                                                                                                                                                                                                                          
749	17	4	19:20                                                                                                                                                                                                                                                          
750	17	5	08:40                                                                                                                                                                                                                                                          
751	17	5	10:18                                                                                                                                                                                                                                                          
752	17	5	18:10                                                                                                                                                                                                                                                          
753	17	5	19:49                                                                                                                                                                                                                                                          
754	17	6	09:06                                                                                                                                                                                                                                                          
755	17	6	10:44                                                                                                                                                                                                                                                          
756	17	6	18:40                                                                                                                                                                                                                                                          
757	17	6	20:19                                                                                                                                                                                                                                                          
758	18	4	08:11                                                                                                                                                                                                                                                          
759	18	4	09:48                                                                                                                                                                                                                                                          
760	18	4	17:42                                                                                                                                                                                                                                                          
761	18	4	19:22                                                                                                                                                                                                                                                          
762	18	5	08:44                                                                                                                                                                                                                                                          
763	18	5	10:20                                                                                                                                                                                                                                                          
764	18	5	18:12                                                                                                                                                                                                                                                          
765	18	5	19:51                                                                                                                                                                                                                                                          
766	18	6	09:09                                                                                                                                                                                                                                                          
767	18	6	10:46                                                                                                                                                                                                                                                          
768	18	6	18:42                                                                                                                                                                                                                                                          
769	18	6	20:21                                                                                                                                                                                                                                                          
770	19	4	08:14                                                                                                                                                                                                                                                          
771	19	4	09:51                                                                                                                                                                                                                                                          
772	19	4	17:45                                                                                                                                                                                                                                                          
773	19	4	19:25                                                                                                                                                                                                                                                          
774	19	5	08:47                                                                                                                                                                                                                                                          
775	19	5	10:23                                                                                                                                                                                                                                                          
776	19	5	18:15                                                                                                                                                                                                                                                          
777	19	5	19:54                                                                                                                                                                                                                                                          
778	19	6	09:11                                                                                                                                                                                                                                                          
779	19	6	10:49                                                                                                                                                                                                                                                          
780	19	6	18:45                                                                                                                                                                                                                                                          
781	19	6	20:24                                                                                                                                                                                                                                                          
782	20	4	08:16                                                                                                                                                                                                                                                          
783	20	4	09:53                                                                                                                                                                                                                                                          
784	20	4	17:47                                                                                                                                                                                                                                                          
785	20	4	19:27                                                                                                                                                                                                                                                          
786	20	5	08:50                                                                                                                                                                                                                                                          
787	20	5	10:25                                                                                                                                                                                                                                                          
788	20	5	18:17                                                                                                                                                                                                                                                          
789	20	5	19:56                                                                                                                                                                                                                                                          
790	20	6	09:13                                                                                                                                                                                                                                                          
791	20	6	10:51                                                                                                                                                                                                                                                          
792	20	6	18:47                                                                                                                                                                                                                                                          
793	20	6	20:26                                                                                                                                                                                                                                                          
794	21	4	08:18                                                                                                                                                                                                                                                          
795	21	4	09:55                                                                                                                                                                                                                                                          
796	21	4	17:50                                                                                                                                                                                                                                                          
797	21	4	19:30                                                                                                                                                                                                                                                          
798	21	5	08:53                                                                                                                                                                                                                                                          
799	21	5	10:27                                                                                                                                                                                                                                                          
800	21	5	18:20                                                                                                                                                                                                                                                          
801	21	5	19:59                                                                                                                                                                                                                                                          
802	21	6	09:15                                                                                                                                                                                                                                                          
803	21	6	10:53                                                                                                                                                                                                                                                          
804	21	6	18:50                                                                                                                                                                                                                                                          
805	21	6	20:29                                                                                                                                                                                                                                                          
806	22	4	08:20                                                                                                                                                                                                                                                          
807	22	4	09:57                                                                                                                                                                                                                                                          
808	22	4	17:51                                                                                                                                                                                                                                                          
809	22	4	19:31                                                                                                                                                                                                                                                          
810	22	5	08:55                                                                                                                                                                                                                                                          
811	22	5	10:29                                                                                                                                                                                                                                                          
812	22	5	18:21                                                                                                                                                                                                                                                          
813	22	5	20:00                                                                                                                                                                                                                                                          
814	22	6	09:17                                                                                                                                                                                                                                                          
815	22	6	10:55                                                                                                                                                                                                                                                          
816	22	6	18:51                                                                                                                                                                                                                                                          
817	22	6	20:30                                                                                                                                                                                                                                                          
\.


--
-- Data for Name: pengemudi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengemudi (id, username, password) FROM stdin;
1	ronytan	$2b$10$re5IF.gH8IiY61oN0lxcl.V/7ZTB2QmEmm8qTKD1GoeAh7.49WX6C
2	ronytan1	$2b$10$Eyc2r51jDrr88AHz2U9ft.DLlIyRPP5i5Ltz8pGCIdaeyy8/CzSxy
\.


--
-- Name: bus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bus_id_seq', 6, true);


--
-- Name: halte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.halte_id_seq', 37, true);


--
-- Name: jadwal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jadwal_id_seq', 817, true);


--
-- Name: pengemudi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengemudi_id_seq', 2, true);


--
-- Name: bus bus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus
    ADD CONSTRAINT bus_pkey PRIMARY KEY (id);


--
-- Name: halte halte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.halte
    ADD CONSTRAINT halte_pkey PRIMARY KEY (id);


--
-- Name: jadwal jadwal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_pkey PRIMARY KEY (id);


--
-- Name: pengemudi pengemudi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengemudi
    ADD CONSTRAINT pengemudi_pkey PRIMARY KEY (id);


--
-- Name: bus bus_id_pengemudi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus
    ADD CONSTRAINT bus_id_pengemudi_fkey FOREIGN KEY (id_pengemudi) REFERENCES public.pengemudi(id);


--
-- Name: jadwal jadwal_id_bus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_id_bus_fkey FOREIGN KEY (id_bus) REFERENCES public.bus(id) ON UPDATE CASCADE;


--
-- Name: jadwal jadwal_id_halte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jadwal
    ADD CONSTRAINT jadwal_id_halte_fkey FOREIGN KEY (id_halte) REFERENCES public.halte(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

