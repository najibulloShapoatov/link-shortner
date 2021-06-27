/*
 Navicat Premium Data Transfer

 Source Server         : post
 Source Server Type    : PostgreSQL
 Source Server Version : 120001
 Source Host           : localhost:5432
 Source Catalog        : goodb
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120001
 File Encoding         : 65001

 Date: 02/09/2020 11:07:53
*/


-- ----------------------------
-- Sequence structure for goo_failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."goo_failed_jobs_id_seq";
CREATE SEQUENCE "public"."goo_failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for goo_links_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."goo_links_id_seq";
CREATE SEQUENCE "public"."goo_links_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for goo_migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."goo_migrations_id_seq";
CREATE SEQUENCE "public"."goo_migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for goo_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."goo_users_id_seq";
CREATE SEQUENCE "public"."goo_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for goo_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."goo_failed_jobs";
CREATE TABLE "public"."goo_failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('goo_failed_jobs_id_seq'::regclass),
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of goo_failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for goo_links
-- ----------------------------
DROP TABLE IF EXISTS "public"."goo_links";
CREATE TABLE "public"."goo_links" (
  "id" int8 NOT NULL DEFAULT nextval('goo_links_id_seq'::regclass),
  "origin" text COLLATE "pg_catalog"."default" NOT NULL,
  "alias" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of goo_links
-- ----------------------------

-- ----------------------------
-- Table structure for goo_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."goo_migrations";
CREATE TABLE "public"."goo_migrations" (
  "id" int4 NOT NULL DEFAULT nextval('goo_migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of goo_migrations
-- ----------------------------
INSERT INTO "public"."goo_migrations" VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO "public"."goo_migrations" VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO "public"."goo_migrations" VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO "public"."goo_migrations" VALUES (4, '2020_09_02_040249_create_links_table', 1);

-- ----------------------------
-- Table structure for goo_password_resets
-- ----------------------------
DROP TABLE IF EXISTS "public"."goo_password_resets";
CREATE TABLE "public"."goo_password_resets" (
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Records of goo_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for goo_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."goo_users";
CREATE TABLE "public"."goo_users" (
  "id" int8 NOT NULL DEFAULT nextval('goo_users_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email_verified_at" timestamp(0),
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of goo_users
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."goo_failed_jobs_id_seq"
OWNED BY "public"."goo_failed_jobs"."id";
SELECT setval('"public"."goo_failed_jobs_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."goo_links_id_seq"
OWNED BY "public"."goo_links"."id";
SELECT setval('"public"."goo_links_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."goo_migrations_id_seq"
OWNED BY "public"."goo_migrations"."id";
SELECT setval('"public"."goo_migrations_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."goo_users_id_seq"
OWNED BY "public"."goo_users"."id";
SELECT setval('"public"."goo_users_id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table goo_failed_jobs
-- ----------------------------
ALTER TABLE "public"."goo_failed_jobs" ADD CONSTRAINT "goo_failed_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table goo_links
-- ----------------------------
ALTER TABLE "public"."goo_links" ADD CONSTRAINT "goo_links_alias_unique" UNIQUE ("alias");

-- ----------------------------
-- Primary Key structure for table goo_links
-- ----------------------------
ALTER TABLE "public"."goo_links" ADD CONSTRAINT "goo_links_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table goo_migrations
-- ----------------------------
ALTER TABLE "public"."goo_migrations" ADD CONSTRAINT "goo_migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table goo_password_resets
-- ----------------------------
CREATE INDEX "goo_password_resets_email_index" ON "public"."goo_password_resets" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table goo_users
-- ----------------------------
ALTER TABLE "public"."goo_users" ADD CONSTRAINT "goo_users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table goo_users
-- ----------------------------
ALTER TABLE "public"."goo_users" ADD CONSTRAINT "goo_users_pkey" PRIMARY KEY ("id");
