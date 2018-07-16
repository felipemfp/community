FROM elixir:alpine

ENV APP_HOME /usr/src/app

ADD . ${APP_HOME}
WORKDIR ${APP_HOME}

RUN apk --no-cache add inotify-tools erlang-parsetools && \
  rm -rf /var/cache/apk/*

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mix deps.get

EXPOSE 4000

CMD ["mix", "phx.server"]
