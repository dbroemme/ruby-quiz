FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler -v '2.1.4' && bundle install --jobs 20 --retry 5

COPY . /app

RUN bundle exec rake db:migrate RAILS_ENV=development
RUN bundle exec rake db:seed

EXPOSE 5000

CMD bundle exec puma -C config/puma.rb
