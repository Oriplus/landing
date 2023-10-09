FROM ruby:3.1.3-alpine

WORKDIR /landing

RUN apk add --update \
    build-base \
    sqlite-dev \
    git \
    tzdata \
    yarn \
    && rm -rf /var/cache/apk/*

COPY Gemfile* ./

RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000