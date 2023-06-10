-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "game" (
    "game_id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "game_name" TEXT NOT NULL,
    "game_image" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "games_pk" PRIMARY KEY ("game_id")
);

CREATE TABLE "user" (
    "user_id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "user_name" TEXT NOT NULL,
    "display_name" TEXT NOT NULL,
    "google_auth" TEXT NOT NULL,
    "profile_image" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "user_pk" PRIMARY KEY ("user_id")
);
