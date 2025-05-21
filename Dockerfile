# docker\app\Dockerfile
FROM ruby:3.4.4

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    pkg-config \
    libyaml-dev \
    libsqlite3-dev \
    nodejs \
    yarn \
    sqlite3

ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# libyaml.pc を手動作成する
RUN mkdir -p /usr/local/lib/pkgconfig && \
    echo "prefix=/usr/local\n\
exec_prefix=\${prefix}\n\
libdir=\${exec_prefix}/lib\n\
includedir=\${prefix}/include\n\
\n\
Name: libyaml\n\
Description: YAML 1.1 parser and emitter library\n\
Version: 0.2.5\n\
Cflags: -I\${includedir}\n\
Libs: -L\${libdir} -lyaml" \
    > /usr/local/lib/pkgconfig/libyaml.pc

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]