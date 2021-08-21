--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10 (Debian 11.10-0+deb10u1)
-- Dumped by pg_dump version 11.10 (Debian 11.10-0+deb10u1)

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

DROP INDEX pro.p_work_idx;
DROP INDEX pro.p_visible_idx;
DROP INDEX pro.p_town_idx;
DROP INDEX pro.p_status_idx;
DROP INDEX pro.p_signature_idx;
DROP INDEX pro.p_sex_idx;
DROP INDEX pro.p_reallastpostdate_idx;
DROP INDEX pro.p_realcreationdate_idx;
DROP INDEX pro.p_realbirthdate_idx;
DROP INDEX pro.p_quote_idx;
DROP INDEX pro.p_pseudal_idx;
DROP INDEX pro.p_postsurl_idx;
DROP INDEX pro.p_nbtransactionjv_idx;
DROP INDEX pro.p_nbtransactionav_idx;
DROP INDEX pro.p_nbsmileys_idx;
DROP INDEX pro.p_nbposts_idx;
DROP INDEX pro.p_lastpostdate_idx;
DROP INDEX pro.p_httpstatus_idx;
DROP INDEX pro.p_httpheader_type_idx;
DROP INDEX pro.p_httpheader_status_idx;
DROP INDEX pro.p_httpheader_server_idx;
DROP INDEX pro.p_httpheader_pragma_idx;
DROP INDEX pro.p_httpheader_length_idx;
DROP INDEX pro.p_httpheader_http_idx;
DROP INDEX pro.p_httpheader_gidx;
DROP INDEX pro.p_httpheader_expires_idx;
DROP INDEX pro.p_httpheader_date_idx;
DROP INDEX pro.p_httpheader_connection_idx;
DROP INDEX pro.p_httpheader_cache_idx;
DROP INDEX pro.p_hobby_idx;
DROP INDEX pro.p_exists_idx;
DROP INDEX pro.p_email_idx;
DROP INDEX pro.p_date_idx;
DROP INDEX pro.p_creationdate_idx;
DROP INDEX pro.p_birthdate_idx;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_transactionjvurl_ukey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_transactionavurl_ukey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_profileurl_ukey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_pmurl_ukey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_pkey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_contacturl_ukey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_configurl_ukey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_colorsurl_ukey;
ALTER TABLE ONLY pro.p DROP CONSTRAINT p_avatarurl_ukey;
DROP TABLE pro.p;
DROP SCHEMA pro;
--
-- Name: pro; Type: SCHEMA; Schema: -; Owner: matmatah
--

CREATE SCHEMA pro;


ALTER SCHEMA pro OWNER TO matmatah;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: p; Type: TABLE; Schema: pro; Owner: matmatah
--

CREATE TABLE pro.p (
    id integer NOT NULL,
    profileurl character varying(50) NOT NULL,
    date timestamp with time zone NOT NULL,
    httpstatus smallint NOT NULL,
    httpheader jsonb NOT NULL,
    "exists" boolean DEFAULT false NOT NULL,
    pseudal character varying(50) DEFAULT NULL::character varying,
    visible boolean DEFAULT false NOT NULL,
    email character varying(250) DEFAULT NULL::character varying,
    birthdate timestamp with time zone,
    realbirthdate character varying(50) DEFAULT NULL::character varying,
    sex character varying(50) DEFAULT NULL::character varying,
    town character varying(250) DEFAULT NULL::character varying,
    work character varying(250) DEFAULT NULL::character varying,
    hobby character varying(250) DEFAULT NULL::character varying,
    status character varying(250) DEFAULT NULL::character varying,
    nbposts integer DEFAULT 0 NOT NULL,
    creationdate timestamp with time zone,
    realcreationdate character varying(50) DEFAULT NULL::character varying,
    lastpostdate timestamp with time zone,
    reallastpostdate character varying(50) DEFAULT NULL::character varying,
    quote character varying(250) DEFAULT NULL::character varying,
    signature character varying(1000) DEFAULT NULL::character varying,
    configurl character varying(250) DEFAULT NULL::character varying,
    colorsurl character varying(250) DEFAULT NULL::character varying,
    nbtransactionjv smallint DEFAULT 0 NOT NULL,
    transactionjvurl character varying(250) DEFAULT NULL::character varying,
    nbtransactionav smallint DEFAULT 0 NOT NULL,
    transactionavurl character varying(250) DEFAULT NULL::character varying,
    pmurl character varying(250) DEFAULT NULL::character varying,
    postsurl character varying(250) DEFAULT NULL::character varying,
    contacturl character varying(250) DEFAULT NULL::character varying,
    avatarurl character varying(250) DEFAULT NULL::character varying,
    smiley01 character varying(50) DEFAULT NULL::character varying,
    smiley01url character varying(250) DEFAULT NULL::character varying,
    smiley02 character varying(50) DEFAULT NULL::character varying,
    smiley02url character varying(250) DEFAULT NULL::character varying,
    smiley03 character varying(50) DEFAULT NULL::character varying,
    smiley03url character varying(250) DEFAULT NULL::character varying,
    smiley04 character varying(50) DEFAULT NULL::character varying,
    smiley04url character varying(250) DEFAULT NULL::character varying,
    smiley05 character varying(50) DEFAULT NULL::character varying,
    smiley05url character varying(250) DEFAULT NULL::character varying,
    smiley06 character varying(50) DEFAULT NULL::character varying,
    smiley06url character varying(250) DEFAULT NULL::character varying,
    smiley07 character varying(50) DEFAULT NULL::character varying,
    smiley07url character varying(250) DEFAULT NULL::character varying,
    smiley08 character varying(50) DEFAULT NULL::character varying,
    smiley08url character varying(250) DEFAULT NULL::character varying,
    smiley09 character varying(50) DEFAULT NULL::character varying,
    smiley09url character varying(250) DEFAULT NULL::character varying,
    smiley10 character varying(50) DEFAULT NULL::character varying,
    smiley10url character varying(250) DEFAULT NULL::character varying,
    smiley11 character varying(50) DEFAULT NULL::character varying,
    smiley11url character varying(250) DEFAULT NULL::character varying,
    nbsmileys smallint DEFAULT 0 NOT NULL
);


ALTER TABLE pro.p OWNER TO matmatah;

--
-- Name: p p_avatarurl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_avatarurl_ukey UNIQUE (avatarurl);


--
-- Name: p p_colorsurl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_colorsurl_ukey UNIQUE (colorsurl);


--
-- Name: p p_configurl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_configurl_ukey UNIQUE (configurl);


--
-- Name: p p_contacturl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_contacturl_ukey UNIQUE (contacturl);


--
-- Name: p p_pkey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_pkey PRIMARY KEY (id);


--
-- Name: p p_pmurl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_pmurl_ukey UNIQUE (pmurl);


--
-- Name: p p_profileurl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_profileurl_ukey UNIQUE (profileurl);


--
-- Name: p p_transactionavurl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_transactionavurl_ukey UNIQUE (transactionavurl);


--
-- Name: p p_transactionjvurl_ukey; Type: CONSTRAINT; Schema: pro; Owner: matmatah
--

ALTER TABLE ONLY pro.p
    ADD CONSTRAINT p_transactionjvurl_ukey UNIQUE (transactionjvurl);


--
-- Name: p_birthdate_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_birthdate_idx ON pro.p USING btree (birthdate);


--
-- Name: p_creationdate_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_creationdate_idx ON pro.p USING btree (creationdate);


--
-- Name: p_date_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_date_idx ON pro.p USING btree (date);


--
-- Name: p_email_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_email_idx ON pro.p USING btree (email);


--
-- Name: p_exists_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_exists_idx ON pro.p USING btree ("exists");


--
-- Name: p_hobby_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_hobby_idx ON pro.p USING btree (hobby);


--
-- Name: p_httpheader_cache_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_cache_idx ON pro.p USING btree (((httpheader -> 'Cache-Control'::text)));


--
-- Name: p_httpheader_connection_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_connection_idx ON pro.p USING btree (((httpheader -> 'Connection'::text)));


--
-- Name: p_httpheader_date_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_date_idx ON pro.p USING btree (((httpheader -> 'Date'::text)));


--
-- Name: p_httpheader_expires_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_expires_idx ON pro.p USING btree (((httpheader -> 'Expires'::text)));


--
-- Name: p_httpheader_gidx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_gidx ON pro.p USING gin (httpheader);


--
-- Name: p_httpheader_http_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_http_idx ON pro.p USING btree (((httpheader -> 'http'::text)));


--
-- Name: p_httpheader_length_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_length_idx ON pro.p USING btree (((httpheader -> 'Content-Length'::text)));


--
-- Name: p_httpheader_pragma_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_pragma_idx ON pro.p USING btree (((httpheader -> 'Pragma'::text)));


--
-- Name: p_httpheader_server_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_server_idx ON pro.p USING btree (((httpheader -> 'Server'::text)));


--
-- Name: p_httpheader_status_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_status_idx ON pro.p USING btree (((httpheader -> 'Status'::text)));


--
-- Name: p_httpheader_type_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpheader_type_idx ON pro.p USING btree (((httpheader -> 'Content-Type'::text)));


--
-- Name: p_httpstatus_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_httpstatus_idx ON pro.p USING btree (httpstatus);


--
-- Name: p_lastpostdate_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_lastpostdate_idx ON pro.p USING btree (lastpostdate);


--
-- Name: p_nbposts_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_nbposts_idx ON pro.p USING btree (nbposts);


--
-- Name: p_nbsmileys_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_nbsmileys_idx ON pro.p USING btree (nbsmileys);


--
-- Name: p_nbtransactionav_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_nbtransactionav_idx ON pro.p USING btree (nbtransactionav);


--
-- Name: p_nbtransactionjv_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_nbtransactionjv_idx ON pro.p USING btree (nbtransactionjv);


--
-- Name: p_postsurl_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_postsurl_idx ON pro.p USING btree (postsurl);


--
-- Name: p_pseudal_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_pseudal_idx ON pro.p USING btree (pseudal);


--
-- Name: p_quote_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_quote_idx ON pro.p USING btree (quote);


--
-- Name: p_realbirthdate_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_realbirthdate_idx ON pro.p USING btree (realbirthdate);


--
-- Name: p_realcreationdate_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_realcreationdate_idx ON pro.p USING btree (realcreationdate);


--
-- Name: p_reallastpostdate_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_reallastpostdate_idx ON pro.p USING btree (reallastpostdate);


--
-- Name: p_sex_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_sex_idx ON pro.p USING btree (sex);


--
-- Name: p_signature_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_signature_idx ON pro.p USING btree (signature);


--
-- Name: p_status_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_status_idx ON pro.p USING btree (status);


--
-- Name: p_town_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_town_idx ON pro.p USING btree (town);


--
-- Name: p_visible_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_visible_idx ON pro.p USING btree (visible);


--
-- Name: p_work_idx; Type: INDEX; Schema: pro; Owner: matmatah
--

CREATE INDEX p_work_idx ON pro.p USING btree (work);


--
-- PostgreSQL database dump complete
--

