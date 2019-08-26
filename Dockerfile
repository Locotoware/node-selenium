# base image
FROM node:10.16.0

# install yarn
RUN npm i yarn

# Install JDK
RUN apt-get update && apt-get --assume-yes install default-jdk

# Download and install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i /app/google-chrome-stable_current_amd64.deb || apt --fix-broken --assume-yes install && dpkg -i /app/google-chrome-stable_current_amd64.deb

# Update the WebDriver
RUN webdriver-manager update
