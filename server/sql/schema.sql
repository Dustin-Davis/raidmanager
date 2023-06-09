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
    "raid_Instance_Id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "raid_Id" INTEGER NOT NULL,
    "user_Id" INTEGER NOT NULL,
    "run_Time" TIME NOT NULL,
    "raid_Leader" TEXT NOT NULL,
    "selected_Roles" TEXT NOT NULL,
    "created_At" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "raidInstance_pk" PRIMARY KEY ("raid_Instance_Id")
);

ALTER TABLE "raidInstance" ADD CONSTRAINT "raidInstance_fk0" FOREIGN KEY ("raid_Id") REFERENCES "raid"("raid_Id")
