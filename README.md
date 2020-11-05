# Delicious Recipes
A simple project that consumes Contentful API to fetch and render entries (recipes).

## Running the project
To run the project, first clone this repository. Then copy `.env.example` file to `.env` and fill in the required environment variables. Then install the dependencies using:
```
$ bundle install
```
Ok you're ready to go. Now you just need to run the server:
```
$ bundle exec rackup
```

## Running tests:
You can run the test suit using RSpec command:
```
$ bundle exec rspec .
```
## Further information
This repo utilizes the `/entries` endpoint both for fetching a single entry and also list of entries, because in the `/entry` endpoint, you don't have the `includes` section in the response and you need to send extra requests to get the relationships.

It uses `representable` gem from the `trailblazer` framework to parse JSON responses into Ruby objects and also `dry-rb` tools to create a simple service object wrapper.
