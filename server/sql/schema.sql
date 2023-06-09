-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "game" (
    "gameId" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "gameName" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "games_pk" PRIMARY KEY ("gameId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "raid" (
    "raid_Id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "raid_Name" TEXT NOT NULL,
    "roles" TEXT NOT NULL,
    "game_Id" INTEGER NOT NULL,
    "num_Of_People" TEXT NOT NULL,
    "created_At" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "raids_pk" PRIMARY KEY ("raid_Id")
);

ALTER TABLE "raid" ADD CONSTRAINT "raid_fk0" FOREIGN KEY ("game_Id") REFERENCES "game"("game_Id")
