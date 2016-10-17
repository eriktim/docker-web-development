FROM maven:3.3.9-jdk-8

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      nodejs \
      build-essential \
      xvfb

RUN npm install -g jspm gulp karma typings

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome*.deb || apt-get install -f -y && \
    rm google-chrome-stable_current_amd64.deb && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/google-chrome

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
