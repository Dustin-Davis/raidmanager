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
    "raidId" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "raidName" TEXT NOT NULL,
    "roles" TEXT NOT NULL,
    "gameId" INTEGER NOT NULL,
    "numOfPeople" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "raids_pk" PRIMARY KEY ("raidId")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "raid" ADD CONSTRAINT "raid_fk0" FOREIGN KEY ("gameId") REFERENCES "game"("gameId")
