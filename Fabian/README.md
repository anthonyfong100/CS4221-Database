# Fabian Pascal Experiment

This folder is structured in the following format:
- Assets
  - Contains instruction PDF of exercise manual
- Migrations
  - Utility sql scripts to create and populate db
- answers.sql
  - Answers to the Fabian Pascal project

### Quickstart

To ease the setting up, docker coupled with Makefile is used to set-up the repo. From `<path-to-CS4221repo/Fabian>` run the following commands.
~~~
// Launch docker containers
make start

// Stop docker containers (persist db data)
make stop

// Stop docker containers and remove db data (persist db data)
make clean

// Connect psql instance
make connect
~~~

Feel free to connect the docker container using PgAdmin or other Db tools.