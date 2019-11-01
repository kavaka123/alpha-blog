FROM ruby:2.5.1

COPY . /application

ENV RAILS_ENV production\
    BUNDLER_VERSION=2.0.2

WORKDIR /application

RUN gem update --system &&\
    gem install bundler:2.0.2 &&\
    export BUNDLER_VERSION=2.0.2 &&\
    bundle install --deployment --without production test && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt install -y nodejs

ENTRYPOINT ['./entrypoint.sh']


