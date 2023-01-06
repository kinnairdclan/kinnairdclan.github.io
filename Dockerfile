FROM ruby:2.7.7
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN gem update --system 3.4.2 > /dev/null #insanely verbose with all changelogs and no way to --quiet
RUN gem install bundler
VOLUME ["/srv/jekyll"]
WORKDIR /srv/jekyll
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0"]
