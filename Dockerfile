FROM buildpack-deps:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" | \
      tee --append /etc/apt/sources.list

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      nodejs \
      xvfb \
      openjdk-8-jre-headless

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome*.deb || apt-get install -f -y

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/google-chrome

RUN npm install -g jspm gulp karma

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
