FROM node:18-slim

LABEL building_block="node-chrome-headless"
LABEL version="1.0.0"

ARG chromedriverVersion=112.0.5615.49

# Update image and install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget curl unzip -y
RUN yarn global add npm

# Install Chromium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome*.deb -y
RUN export CHROME_BIN=/usr/bin/google-chrome
RUN sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" \
     --ignore-certificate-errors \
     --window-size=1920,1080 \
     --verbose  \
     --test-type \
     --shm-size=1gb \
     --no-sandbox \
     --disable-dev-shm-usage \
     --incognito \
     --disable-extensions \
     --disable-infobars\
     --headless/g' /opt/google/chrome/google-chrome

RUN useradd --create-home project
WORKDIR /home/project/
USER project

ENTRYPOINT bash
