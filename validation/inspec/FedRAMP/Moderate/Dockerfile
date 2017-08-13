FROM chef/inspec:latest
RUN apk add --no-cache ruby-dev build-base
COPY libraries/Gemfile libraries/
COPY libraries/Gemfile.lock libraries/
RUN cd libraries && \
    bundle install
COPY . .
