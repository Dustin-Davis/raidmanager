-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "game" (
    "gameId" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "gameName" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "games_pk" PRIMARY KEY ("gameId")
);

CREATE TABLE "raidInstance" (
    "raidInstanceId" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "raidId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "runTime" TIME NOT NULL,
    "raidLeader" TEXT NOT NULL,
    "selectedRoles" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "raidInstance_pk" PRIMARY KEY ("raidInstanceId")
);

ALTER TABLE "raidInstance" ADD CONSTRAINT "raidInstance_fk0" FOREIGN KEY ("raidId") REFERENCES "raid"("raidId")
