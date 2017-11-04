CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "chapters" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "arabic_name" varchar NOT NULL, "latin_name" varchar NOT NULL, "city" varchar NOT NULL, "english_translation" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_chapters_on_latin_name" ON "chapters" ("latin_name");
CREATE UNIQUE INDEX "index_chapters_on_arabic_name" ON "chapters" ("arabic_name");
INSERT INTO "schema_migrations" (version) VALUES
('20171104085953'),
('20171104120320');


