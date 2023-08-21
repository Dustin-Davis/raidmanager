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

CREATE TABLE "raid_instance" (
    "raid_instance_id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "raid_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "run_time" TIME NOT NULL,
    "raid_leader" TEXT NOT NULL,
    "selected_roles" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "raid_instance_pk" PRIMARY KEY ("raid_instance_id")
);

ALTER TABLE "raid_instance" ADD CONSTRAINT "raid_instance_fk0" FOREIGN KEY ("raid_id") REFERENCES "raid"("raid_id")
ALTER TABLE "raid_instance" ADD CONSTRAINT "raid_instance_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("user_id")

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

CREATE TABLE "user" (
    "user_id" INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    "user_name" TEXT NOT NULL,
    "display_name" TEXT NOT NULL,
    "google_auth" TEXT NOT NULL,
    "profile_image" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "user_pk" PRIMARY KEY ("user_id")
);

CREATE TABLE "user_display" (
    "user_id" INTEGER NOT NULL,
    "game_id" INTEGER NOT NULL,
    "display_name" TEXT NOT NULL,
    "raid_roles" TEXT NOT NULL,
    "past_raids" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL default now(),
    CONSTRAINT "user_display_pk" PRIMARY KEY ("user_display_id")
);

ALTER TABLE "user_display" ADD CONSTRAINT "user_display_fk0" FOREIGN KEY ("game_id") REFERENCES "game"("game_id")
ALTER TABLE "user_display" ADD CONSTRAINT "user_display_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("user_id")
