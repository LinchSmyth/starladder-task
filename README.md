# StarLadder Task

This repo contains my interview task for StarLadder. 
It's written using Rails as backend framework and Vue.js as frontend framework via webpacker gem.

## Installation instructions

```
# clone the repo
git clone https://github.com/LinchSmyth/starladder-task/
cd ./starladder-task  

# install all required gems
bundle install

# install all front-end libraries (requires node.js > 6.0.0)
./bin/yarn

# create database.yml and fill it with all required credentials
cp ./config/example.database.yml ./config/database.yml

# create all tables/columns and seed DB
rails db:setup

# in different consoles/tabs run commands (or you can use Foreman gem)
(1) rails s
(2) ./bin/webpack-dev-server
```

After all you can go to the `http:127.0.0.1:3000` in your browser. 
**DO NOT** use the `localhost:3000` URL since starladder's oauth won't work.
