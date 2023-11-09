\set ON_ERROR_STOP
\echo "EXECUTING DB INIT SCRIPT"

\c isgpostgres
CREATE EXTENSION IF NOT EXISTS timescaledb;

\c isgpostgres
GRANT ALL ON ALL TABLES IN SCHEMA public TO isgpgbouncerusr;
GRANT ALL ON SCHEMA public TO isgpgbouncerusr;