-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "game" (
    "gameId" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "gameName" TEXT NOT NULL,
    "gameImage" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "games_pk" PRIMARY KEY ("gameId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "user" (
    "user_Id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "user_Name" TEXT NOT NULL,
    "display_Name" TEXT NOT NULL,
    "google_Auth" TEXT NOT NULL,
    "profile_Image" TEXT NOT NULL,
    "created_At" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "user_pk" PRIMARY KEY ("userId")
);
