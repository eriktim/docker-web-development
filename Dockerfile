FROM alpine

RUN apk update && \
    apk add yarn && \
    apk add openssh && \
    apk add chromium && \
    apk add udev && \
    apk add ttf-freefont && \
    rm -rf /var/cache/*

RUN yarn global add @angular/cli && \
    yarn cache clean

RUN ln -s /usr/bin/chromium-browser /usr/bin/google-chrome

ENV CHROME_BIN /usr/bin/chromium-browser
