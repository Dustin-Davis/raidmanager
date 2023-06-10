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
    "raid_id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "raid_name" TEXT NOT NULL,
    "roles" TEXT NOT NULL,
    "game_id" INTEGER NOT NULL,
    "num_of_people" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "raids_pk" PRIMARY KEY ("raid_id")
);

ALTER TABLE "raid" ADD CONSTRAINT "raid_fk0" FOREIGN KEY ("game_id") REFERENCES "game"("game_id")
