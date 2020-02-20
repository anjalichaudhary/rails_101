# Dockerfile.rails

FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /rails101
WORKDIR /rails101
COPY Gemfile /rails101/Gemfile
COPY Gemfile.lock /rails101/Gemfile.lock
RUN bundle install
COPY . /rails101

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

# Start the main process.
CMD [ "rails", "server", "-b", "0.0.0.0"]

