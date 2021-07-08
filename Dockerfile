# base image
FROM node:10.16.3-buster

# install yarn
RUN npm i yarn

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install Angular cli
RUN yarn global add @angular/cli

# Install JDK
RUN apt-get update && apt-get --assume-yes install default-jre && npm install -g protractor

# Download and Install Chrome for unit testing and e2e purposes 79
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
&& sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
&& apt-get update && apt-get install -yq google-chrome-stable
 
# Add the latest ChromeDriver
RUN yarn add chromedriver

