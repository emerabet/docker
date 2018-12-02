FROM ruby:2.5

RUN apt-get update && apt-get install nodejs -y
RUN gem install rails

ONBUILD COPY app /opt/app
ONBUILD WORKDIR /opt/app/
ONBUILD RUN bundle install
ONBUILD RUN bin/rails db:migrate
ONBUILD RUN bin/rails db:seed
