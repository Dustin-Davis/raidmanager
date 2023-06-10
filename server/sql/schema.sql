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

CREATE TABLE "raid_instance" (
    "raid_instance_id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "raid_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "run_time" TIME NOT NULL,
    "raid_leader" TEXT NOT NULL,
    "selected_roles" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "raid_instance_pk" PRIMARY KEY ("raid_instance_Id")
);

ALTER TABLE "raid_instance" ADD CONSTRAINT "raid_instance_fk0" FOREIGN KEY ("raid_Id") REFERENCES "raid"("raid_Id")
