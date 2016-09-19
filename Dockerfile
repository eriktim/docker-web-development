FROM open-jdk:8

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      nodejs \
      build-essential \
      xvfb

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome*.deb || apt-get install -f -y && \
    rm google-chrome-stable_current_amd64.deb

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/google-chrome

RUN npm install -g jspm gulp karma

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
