/*
 Navicat Premium Data Transfer

 Source Server         : Heroku
 Source Server Type    : PostgreSQL
 Source Server Version : 120004
 Source Host           : ---
 Source Catalog        : ---
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120004
 File Encoding         : 1254

*/


-- ----------------------------
-- Sequence structure for departman_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "departman_id_seq";
CREATE SEQUENCE "departman_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for izin_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "izin_id_seq";
CREATE SEQUENCE "izin_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personel_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "personel_id_seq";
CREATE SEQUENCE "personel_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for departman
-- ----------------------------
DROP TABLE IF EXISTS "departman";
CREATE TABLE "departman" (
  "id" int4 NOT NULL DEFAULT nextval('departman_id_seq'::regclass),
  "adi" varchar(255) COLLATE "pg_catalog"."default",
  "amir_id" int4
)
;

-- ----------------------------
-- Records of departman
-- ----------------------------
BEGIN;
INSERT INTO "departman" VALUES (1, 'Bilgi Ýþlem Dairesi', 2);
INSERT INTO "departman" VALUES (4, 'Ýmar ve Planlama Dairesi', 4);
INSERT INTO "departman" VALUES (3, 'Teknik Ýþler Dairesi', 7);
COMMIT;

-- ----------------------------
-- Table structure for izin
-- ----------------------------
DROP TABLE IF EXISTS "izin";
CREATE TABLE "izin" (
  "id" int4 NOT NULL DEFAULT nextval('izin_id_seq'::regclass),
  "gerekce" varchar(255) COLLATE "pg_catalog"."default",
  "izin_baslangic_tarihi" date,
  "izin_bitis_tarihi" date,
  "onay" varchar(255) COLLATE "pg_catalog"."default",
  "onaylanma_tarihi" date,
  "onaylayan_amir_id" int4,
  "personel_id" int4
)
;

-- ----------------------------
-- Records of izin
-- ----------------------------
BEGIN;
INSERT INTO "izin" VALUES (1, 'Hastahaneye gitmek için', '2020-09-14', '2020-09-21', 'e', '2020-09-14', 2, 3);
INSERT INTO "izin" VALUES (2, 'Yýllýk Ýzin', '2020-09-28', '2020-10-06', 'e', '2020-09-14', 2, 3);
INSERT INTO "izin" VALUES (3, 'Yýllýk Ýzin', '2020-10-10', '2020-10-14', 'h', '2020-09-14', 2, 3);
INSERT INTO "izin" VALUES (4, 'Yýllýk Ýzin', '2020-10-14', '2020-10-20', 'b', NULL, 2, 3);
COMMIT;

-- ----------------------------
-- Table structure for person_roles
-- ----------------------------
DROP TABLE IF EXISTS "person_roles";
CREATE TABLE "person_roles" (
  "personel_email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "role_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of person_roles
-- ----------------------------
BEGIN;
INSERT INTO "person_roles" VALUES ('admin@gmail.com', 'ADMIN');
INSERT INTO "person_roles" VALUES ('personel@gmail.com', 'PERSONEL');
INSERT INTO "person_roles" VALUES ('neslihan@gmail.com', 'AMIR');
INSERT INTO "person_roles" VALUES ('hasan@gmail.com', 'PERSONEL');
INSERT INTO "person_roles" VALUES ('huseyin@gmail.com', 'PERSONEL');
INSERT INTO "person_roles" VALUES ('ebru@gmail.com', 'AMIR');
INSERT INTO "person_roles" VALUES ('amir@gmail.com', 'AMIR');
COMMIT;

-- ----------------------------
-- Table structure for personel
-- ----------------------------
DROP TABLE IF EXISTS "personel";
CREATE TABLE "personel" (
  "id" int4 NOT NULL DEFAULT nextval('personel_id_seq'::regclass),
  "ad" varchar(255) COLLATE "pg_catalog"."default",
  "dogum_tarihi" date,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "gorevi" varchar(255) COLLATE "pg_catalog"."default",
  "ise_baslama_tarihi" date,
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "soyad" varchar(255) COLLATE "pg_catalog"."default",
  "tc_kimlik_no" int8,
  "departman_id" int4
)
;

-- ----------------------------
-- Records of personel
-- ----------------------------
BEGIN;
INSERT INTO "personel" VALUES (1, 'Seçkin', '1994-11-14', 'admin@gmail.com', 'Yazýlým Uzmaný', '2015-06-01', '$2y$12$7LUr55sH5uL1JOv8zziG1ecAM8NIB5FzGzWms420z3IicZITaQcPi', 'SELEKOÐLU', 123456789, NULL);
INSERT INTO "personel" VALUES (2, 'Arif', '1990-11-14', 'amir@gmail.com', 'Yazýlým Uzmaný', '2019-06-01', '$2y$12$7LUr55sH5uL1JOv8zziG1ecAM8NIB5FzGzWms420z3IicZITaQcPi', 'AYDOÐDU', 123432147, 1);
INSERT INTO "personel" VALUES (4, 'Neslihan', '1990-01-01', 'neslihan@gmail.com', 'Ýnsan Kaynaklarý Uzmaný', '2015-01-01', '$2a$10$xlndas2KsvEQycOmDRXO0u4HAWDQDJ2DA0VBk8nwOxgcQxfms4dMK', 'KAPLAN', 987456321, 4);
INSERT INTO "personel" VALUES (5, 'Hasan', '1990-01-01', 'hasan@gmail.com', 'Uzman Yardýmcýsý', '2015-01-01', '$2a$10$7NqFAPh6YV4mtxEMTesTpOcMgScIwZgL/.YthqFaZrQXIgxpLL5Fm', 'ACAR', 654789321, 4);
INSERT INTO "personel" VALUES (6, 'Hüseyin', '1990-01-01', 'huseyin@gmail.com', 'Yardýmcý Per.', '2015-01-01', '$2a$10$837qHPG1NXHvqX35fOkSpOT/4Ze/4149Kh3cjUAjsbBRRhpn9haJO', 'Keskin', 123589647, 3);
INSERT INTO "personel" VALUES (3, 'Tuncer', '1994-11-14', 'personel@gmail.com', 'Jr. Yazýlým Müh.', '2019-08-31', '$2y$12$7LUr55sH5uL1JOv8zziG1ecAM8NIB5FzGzWms420z3IicZITaQcPi', 'ERGÝN', 123456987, 1);
INSERT INTO "personel" VALUES (7, 'Ebru', '1990-01-01', 'ebru@gmail.com', 'Yardýmcý Per.', '2015-01-01', '$2a$10$xV0yfNjfNE9DQLUXB.MQneMSTUhPOLN/yLCKRGlD8J0nkDdFkaXY2', 'Bilen', 654789312, 3);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "role";
CREATE TABLE "role" (
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO "role" VALUES ('ADMIN');
INSERT INTO "role" VALUES ('AMIR');
INSERT INTO "role" VALUES ('PERSONEL');
COMMIT;

-- ----------------------------
-- Table structure for role_personel
-- ----------------------------
DROP TABLE IF EXISTS "role_personel";
CREATE TABLE "role_personel" (
  "role_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "personel_id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for spring_session
-- ----------------------------
DROP TABLE IF EXISTS "spring_session";
CREATE TABLE "spring_session" (
  "primary_id" char(36) COLLATE "pg_catalog"."default" NOT NULL,
  "session_id" char(36) COLLATE "pg_catalog"."default" NOT NULL,
  "creation_time" int8 NOT NULL,
  "last_access_time" int8 NOT NULL,
  "max_inactive_interval" int4 NOT NULL,
  "expiry_time" int8 NOT NULL,
  "principal_name" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of spring_session
-- ----------------------------
BEGIN;
INSERT INTO "spring_session" VALUES ('f0a2910c-9b21-4fd5-8e56-a21cd80646fc', '64394547-7a8c-4ad0-baa1-0cb994496e28', 1600099914516, 1600099946144, 1800, 1600101746144, NULL);
COMMIT;

-- ----------------------------
-- Table structure for spring_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS "spring_session_attributes";
CREATE TABLE "spring_session_attributes" (
  "session_primary_id" char(36) COLLATE "pg_catalog"."default" NOT NULL,
  "attribute_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "attribute_bytes" bytea NOT NULL
)
;

-- ----------------------------
-- Records of spring_session_attributes
-- ----------------------------
BEGIN;
INSERT INTO "spring_session_attributes" VALUES ('f0a2910c-9b21-4fd5-8e56-a21cd80646fc', 'SPRING_SECURITY_LAST_EXCEPTION', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.authentication.BadCredentialsException&\\016N\\374d\\256\\030]\\002\\000\\000xr\\0009org.springframework.security.core.AuthenticationException\\034\\004Q0\\342\\013gT\\002\\000\\000xr\\000\\032java.lang.RuntimeException\\236_\\006G\\0124\\203\\345\\002\\000\\000xr\\000\\023java.lang.Exception\\320\\375\\037>\\032;\\034\\304\\002\\000\\000xr\\000\\023java.lang.Throwable\\325\\3065''9w\\270\\313\\003\\000\\004L\\000\\005causet\\000\\025Ljava/lang/Throwable;L\\000\\015detailMessaget\\000\\022Ljava/lang/String;[\\000\\012stackTracet\\000\\036[Ljava/lang/StackTraceElement;L\\000\\024suppressedExceptionst\\000\\020Ljava/util/List;xpq\\000~\\000\\011t\\000\\017Bad credentialsur\\000\\036[Ljava.lang.StackTraceElement;\\002F*<<\\375"9\\002\\000\\000xp\\000\\000\\0008sr\\000\\033java.lang.StackTraceElementa\\011\\305\\232&6\\335\\205\\002\\000\\010B\\000\\006formatI\\000\\012lineNumberL\\000\\017classLoaderNameq\\000~\\000\\006L\\000\\016declaringClassq\\000~\\000\\006L\\000\\010fileNameq\\000~\\000\\006L\\000\\012methodNameq\\000~\\000\\006L\\000\\012moduleNameq\\000~\\000\\006L\\000\\015moduleVersionq\\000~\\000\\006xp\\000\\000\\000\\000\\227pt\\000Yorg.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvidert\\000.AbstractUserDetailsAuthenticationProvider.javat\\000\\014authenticateppsq\\000~\\000\\015\\000\\000\\000\\000\\307pt\\000;org.springframework.security.authentication.ProviderManagert\\000\\024ProviderManager.javaq\\000~\\000\\021ppsq\\000~\\000\\015\\000\\000\\000\\000\\333pq\\000~\\000\\023q\\000~\\000\\024q\\000~\\000\\021ppsq\\000~\\000\\015\\000\\000\\000\\000_pt\\000Torg.springframework.security.web.authentication.UsernamePasswordAuthenticationFiltert\\000)UsernamePasswordAuthenticationFilter.javat\\000\\025attemptAuthenticationppsq\\000~\\000\\015\\000\\000\\000\\000\\324pt\\000Vorg.springframework.security.web.authentication.AbstractAuthenticationProcessingFiltert\\000+AbstractAuthenticationProcessingFilter.javat\\000\\010doFilterppsq\\000~\\000\\015\\000\\000\\000\\001Npt\\000Dorg.springframework.security.web.FilterChainProxy$VirtualFilterChaint\\000\\025FilterChainProxy.javaq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000tpt\\000Corg.springframework.security.web.authentication.logout.LogoutFiltert\\000\\021LogoutFilter.javaq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\001Npq\\000~\\000\\037q\\000~\\000 q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\\\pt\\000:org.springframework.security.web.header.HeaderWriterFiltert\\000\\027HeaderWriterFilter.javat\\000\\016doHeadersAfterppsq\\000~\\000\\015\\000\\000\\000\\000Mpq\\000~\\000&q\\000~\\000''t\\000\\020doFilterInternalppsq\\000~\\000\\015\\000\\000\\000\\000wpt\\0003org.springframework.web.filter.OncePerRequestFiltert\\000\\031OncePerRequestFilter.javaq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\001Npq\\000~\\000\\037q\\000~\\000 q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000ipt\\000Iorg.springframework.security.web.context.SecurityContextPersistenceFiltert\\000%SecurityContextPersistenceFilter.javaq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\001Npq\\000~\\000\\037q\\000~\\000 q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\0008pt\\000Worg.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFiltert\\000%WebAsyncManagerIntegrationFilter.javaq\\000~\\000*ppsq\\000~\\000\\015\\000\\000\\000\\000wpq\\000~\\000,q\\000~\\000-q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\001Npq\\000~\\000\\037q\\000~\\000 q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\327pt\\0001org.springframework.security.web.FilterChainProxyq\\000~\\000 q\\000~\\000*ppsq\\000~\\000\\015\\000\\000\\000\\000\\262pq\\000~\\0009q\\000~\\000 q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\001fpt\\0004org.springframework.web.filter.DelegatingFilterProxyt\\000\\032DelegatingFilterProxy.javat\\000\\016invokeDelegateppsq\\000~\\000\\015\\000\\000\\000\\001\\017pq\\000~\\000<q\\000~\\000=q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\301pt\\000/org.apache.catalina.core.ApplicationFilterChaint\\000\\033ApplicationFilterChain.javat\\000\\020internalDoFilterppsq\\000~\\000\\015\\000\\000\\000\\000\\246pq\\000~\\000Aq\\000~\\000Bq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000dpt\\0003org.springframework.web.filter.RequestContextFiltert\\000\\031RequestContextFilter.javaq\\000~\\000*ppsq\\000~\\000\\015\\000\\000\\000\\000wpq\\000~\\000,q\\000~\\000-q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\301pq\\000~\\000Aq\\000~\\000Bq\\000~\\000Cppsq\\000~\\000\\015\\000\\000\\000\\000\\246pq\\000~\\000Aq\\000~\\000Bq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000]pt\\0000org.springframework.web.filter.FormContentFiltert\\000\\026FormContentFilter.javaq\\000~\\000*ppsq\\000~\\000\\015\\000\\000\\000\\000wpq\\000~\\000,q\\000~\\000-q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\301pq\\000~\\000Aq\\000~\\000Bq\\000~\\000Cppsq\\000~\\000\\015\\000\\000\\000\\000\\246pq\\000~\\000Aq\\000~\\000Bq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\215pt\\000<org.springframework.session.web.http.SessionRepositoryFiltert\\000\\034SessionRepositoryFilter.javaq\\000~\\000*ppsq\\000~\\000\\015\\000\\000\\000\\000Rpt\\0009org.springframework.session.web.http.OncePerRequestFilterq\\000~\\000-q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\301pq\\000~\\000Aq\\000~\\000Bq\\000~\\000Cppsq\\000~\\000\\015\\000\\000\\000\\000\\246pq\\000~\\000Aq\\000~\\000Bq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\311pt\\0006org.springframework.web.filter.CharacterEncodingFiltert\\000\\034CharacterEncodingFilter.javaq\\000~\\000*ppsq\\000~\\000\\015\\000\\000\\000\\000wpq\\000~\\000,q\\000~\\000-q\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\301pq\\000~\\000Aq\\000~\\000Bq\\000~\\000Cppsq\\000~\\000\\015\\000\\000\\000\\000\\246pq\\000~\\000Aq\\000~\\000Bq\\000~\\000\\035ppsq\\000~\\000\\015\\000\\000\\000\\000\\312pt\\000-org.apache.catalina.core.StandardWrapperValvet\\000\\031StandardWrapperValve.javat\\000\\006invokeppsq\\000~\\000\\015\\000\\000\\000\\000`pt\\000-org.apache.catalina.core.StandardContextValvet\\000\\031StandardContextValve.javaq\\000~\\000appsq\\000~\\000\\015\\000\\000\\000\\002\\035pt\\0003org.apache.catalina.authenticator.AuthenticatorBaset\\000\\026AuthenticatorBase.javaq\\000~\\000appsq\\000~\\000\\015\\000\\000\\000\\000\\213pt\\000*org.apache.catalina.core.StandardHostValvet\\000\\026StandardHostValve.javaq\\000~\\000appsq\\000~\\000\\015\\000\\000\\000\\000\\\\pt\\000+org.apache.catalina.valves.ErrorReportValvet\\000\\025ErrorReportValve.javaq\\000~\\000appsq\\000~\\000\\015\\000\\000\\000\\000Jpt\\000,org.apache.catalina.core.StandardEngineValvet\\000\\030StandardEngineValve.javaq\\000~\\000appsq\\000~\\000\\015\\000\\000\\000\\002\\353pt\\000(org.apache.catalina.valves.RemoteIpValvet\\000\\022RemoteIpValve.javaq\\000~\\000appsq\\000~\\000\\015\\000\\000\\000\\001Wpt\\000+org.apache.catalina.connector.CoyoteAdaptert\\000\\022CoyoteAdapter.javat\\000\\007serviceppsq\\000~\\000\\015\\000\\000\\000\\001upt\\000(org.apache.coyote.http11.Http11Processort\\000\\024Http11Processor.javaq\\000~\\000wppsq\\000~\\000\\015\\000\\000\\000\\000Apt\\000(org.apache.coyote.AbstractProcessorLightt\\000\\033AbstractProcessorLight.javat\\000\\007processppsq\\000~\\000\\015\\000\\000\\000\\003dpt\\0004org.apache.coyote.AbstractProtocol$ConnectionHandlert\\000\\025AbstractProtocol.javaq\\000~\\000~ppsq\\000~\\000\\015\\000\\000\\000\\0065pt\\0006org.apache.tomcat.util.net.NioEndpoint$SocketProcessort\\000\\020NioEndpoint.javat\\000\\005doRunppsq\\000~\\000\\015\\000\\000\\000\\0001pt\\000.org.apache.tomcat.util.net.SocketProcessorBaset\\000\\030SocketProcessorBase.javat\\000\\003runppsq\\000~\\000\\015\\002\\000\\000\\004hpt\\000''java.util.concurrent.ThreadPoolExecutort\\000\\027ThreadPoolExecutor.javat\\000\\011runWorkert\\000\\011java.baset\\000\\00611.0.8sq\\000~\\000\\015\\002\\000\\000\\002tpt\\000.java.util.concurrent.ThreadPoolExecutor$Workerq\\000~\\000\\214q\\000~\\000\\211q\\000~\\000\\216q\\000~\\000\\217sq\\000~\\000\\015\\000\\000\\000\\000=pt\\000:org.apache.tomcat.util.threads.TaskThread$WrappingRunnablet\\000\\017TaskThread.javaq\\000~\\000\\211ppsq\\000~\\000\\015\\002\\000\\000\\003Bpt\\000\\020java.lang.Threadt\\000\\013Thread.javaq\\000~\\000\\211q\\000~\\000\\216q\\000~\\000\\217sr\\000\\037java.util.Collections$EmptyListz\\270\\027\\264<\\247\\236\\336\\002\\000\\000xpx');
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "departman_id_seq"
OWNED BY "departman"."id";
SELECT setval('"departman_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "izin_id_seq"
OWNED BY "izin"."id";
SELECT setval('"izin_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "personel_id_seq"
OWNED BY "personel"."id";
SELECT setval('"personel_id_seq"', 8, true);

-- ----------------------------
-- Primary Key structure for table departman
-- ----------------------------
ALTER TABLE "departman" ADD CONSTRAINT "departman_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table departman
-- ----------------------------
ALTER TABLE "departman" ADD CONSTRAINT "fktyxmirbles3240hfsivtc6h4" FOREIGN KEY ("amir_id") REFERENCES "personel" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Primary Key structure for table izin
-- ----------------------------
ALTER TABLE "izin" ADD CONSTRAINT "izin_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table izin
-- ----------------------------
ALTER TABLE "izin" ADD CONSTRAINT "fken8bk45r2u869vvf6g9getb89" FOREIGN KEY ("personel_id") REFERENCES "personel" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "izin" ADD CONSTRAINT "fks120vwcdja8nwjanqcg73yge8" FOREIGN KEY ("onaylayan_amir_id") REFERENCES "personel" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table person_roles
-- ----------------------------
ALTER TABLE "person_roles" ADD CONSTRAINT "fkr49vootfjbfo2oo17ha96rskt" FOREIGN KEY ("role_name") REFERENCES "role" ("name") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Uniques structure for table personel
-- ----------------------------
ALTER TABLE "personel" ADD CONSTRAINT "uk_9um768b1hihs42ydgu2aadkjr" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table personel
-- ----------------------------
ALTER TABLE "personel" ADD CONSTRAINT "personel_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table personel
-- ----------------------------
ALTER TABLE "personel" ADD CONSTRAINT "fk9qs91ttyw5moj2qjgpw8nupj0" FOREIGN KEY ("departman_id") REFERENCES "departman" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("name");

-- ----------------------------
-- Foreign Keys structure for table role_personel
-- ----------------------------
ALTER TABLE "role_personel" ADD CONSTRAINT "fk6jnb2woj8gkj6l3s6jamwkvnj" FOREIGN KEY ("personel_id") REFERENCES "personel" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "role_personel" ADD CONSTRAINT "fkj7t74pkijapo1qwnuokr358ph" FOREIGN KEY ("role_name") REFERENCES "role" ("name") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table spring_session
-- ----------------------------
CREATE UNIQUE INDEX "spring_session_ix1" ON "spring_session" USING btree (
  "session_id" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);
CREATE INDEX "spring_session_ix2" ON "spring_session" USING btree (
  "expiry_time" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "spring_session_ix3" ON "spring_session" USING btree (
  "principal_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table spring_session
-- ----------------------------
ALTER TABLE "spring_session" ADD CONSTRAINT "spring_session_pk" PRIMARY KEY ("primary_id");

-- ----------------------------
-- Primary Key structure for table spring_session_attributes
-- ----------------------------
ALTER TABLE "spring_session_attributes" ADD CONSTRAINT "spring_session_attributes_pk" PRIMARY KEY ("session_primary_id", "attribute_name");

-- ----------------------------
-- Foreign Keys structure for table spring_session_attributes
-- ----------------------------
ALTER TABLE "spring_session_attributes" ADD CONSTRAINT "spring_session_attributes_fk" FOREIGN KEY ("session_primary_id") REFERENCES "spring_session" ("primary_id") ON DELETE CASCADE ON UPDATE NO ACTION;
