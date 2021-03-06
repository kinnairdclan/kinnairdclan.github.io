FROM ruby:2.7.6
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

#ADD install.sh install.sh
#RUN sh install.sh && rm install.sh
RUN gem install jekyll bundler
VOLUME ["/srv/jekyll"]
WORKDIR /srv/jekyll
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

EXPOSE 4000

CMD ["jekyll", "serve", "-H", "0.0.0.0"]
