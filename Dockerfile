# base image
FROM node:10.16.3-buster

# install yarn
RUN npm i yarn

# Install JDK
RUN apt-get update && apt-get --assume-yes install default-jre && npm install -g protractor

# Install Chromium for unit testing purposes
RUN apt-get update && apt-get install -y --no-install-recommends chromium
 
ENV CHROME_BIN=chromium

# Add the latest ChromeDriver
RUN yarn add chromedriver --chromedriver_version=76.0.3809.100

# Update the WebDriver
RUN webdriver-manager update --versions.chromium=76.0.3809.100
