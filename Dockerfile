FROM engineyard/kontainers:2.5-v1.0.0

# This will be needed by spree
RUN apt-get install -y imagemagick

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

ARG RAILS_ENV
# Copy the Gemfile and Gemfile.lock and bundle
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

RUN bundle exec rake db:migrate RAILS_ENV=development
RUN bundle exec rake db:seed

EXPOSE 3000

CMD ls
