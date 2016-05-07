FROM ruby:2.2.5

RUN apt-get update && apt-get -y install git build-essential
RUN gem install bundler

RUN cd ~ && git clone https://github.com/meganemura/ruboty-line_bot.git
RUN cd ~/ruboty-line_bot && git fetch && git checkout -b deploy 5e7f776c7a2a0f17df605022c1e8c914f51929e7
RUN cd ~/ruboty-line_bot && bundle install -j4

EXPOSE 80

CMD ["bundle" "exec" "~/ruboty-line_bot/bin/ruboty"]
