FROM ruby:3.0.0

RUN apt-get update && \
        apt-get -qq -y install netcat-openbsd curl && \
        curl -sL https://deb.nodesource.com/setup_14.x | bash - &&\
        apt-get install -y nodejs

WORKDIR /www

COPY . .

RUN npm i -g yarn

RUN gem install bundler && bundle install

EXPOSE 3000

CMD bash start.sh