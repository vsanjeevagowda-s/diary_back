FROM ruby:2.2.3
RUN apt-get update && apt-get install vim -y libpq-dev -y build-essential -y nodejs
RUN mkdir app 
WORKDIR /app
ADD Gemfile /app/Gemfile 
ADD Gemfile.lock /app/Gemfile.lock 
RUN gem install rails
RUN gem install bundler
RUN bundle install 
ADD . /app
EXPOSE 3000 
CMD rake db:create db:migrate && rails server -b 0.0.0.0