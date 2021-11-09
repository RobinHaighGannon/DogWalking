CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "customers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "phone" varchar, "email" varchar, "address" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "postcode" varchar);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "pets" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "breed" varchar, "customer_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_96d52bdde0"
FOREIGN KEY ("customer_id")
  REFERENCES "customers" ("id")
);
CREATE INDEX "index_pets_on_customer_id" ON "pets" ("customer_id");
CREATE TABLE IF NOT EXISTS "bookings" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "date" varchar, "time" varchar, "pet_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_8b3223e2a8"
FOREIGN KEY ("pet_id")
  REFERENCES "pets" ("id")
);
CREATE INDEX "index_bookings_on_pet_id" ON "bookings" ("pet_id");
CREATE TABLE IF NOT EXISTS "services" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "price" float, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "password" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "newbookings" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "pet_id" integer DEFAULT NULL, "service_id" integer DEFAULT NULL, "date" date DEFAULT NULL, "time" time DEFAULT NULL, "paid" boolean DEFAULT NULL, "complete" boolean DEFAULT NULL, "service_name" varchar DEFAULT NULL, "price" float DEFAULT NULL, "service"  DEFAULT NULL, CONSTRAINT "fk_rails_b8e4d1c77c"
FOREIGN KEY ("pet_id")
  REFERENCES "pets" ("id")
, CONSTRAINT "fk_rails_36aa9ac715"
FOREIGN KEY ("service_id")
  REFERENCES "services" ("id")
);
INSERT INTO "schema_migrations" (version) VALUES
('20210924110407'),
('20210924143620'),
('20210928082154'),
('20210928131903'),
('20210930100530'),
('20210930101309'),
('20210930152707'),
('20211005082140'),
('20211005082702'),
('20211005083422'),
('20211005083922'),
('20211005100000'),
('20211005104432'),
('20211005104524'),
('20211005125938'),
('20211005130109'),
('20211007131819'),
('20211007144258'),
('20211008141408'),
('20211012140227'),
('20211012145201'),
('20211012155101'),
('20211014122927'),
('20211014143555'),
('20211015104125'),
('20211019115619'),
('20211019122810'),
('20211026081834'),
('20211026082229'),
('20211026145034'),
('20211028122302');


