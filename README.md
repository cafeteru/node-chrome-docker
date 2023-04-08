# Node with Chrome Headless

[![Docker Automated build](https://img.shields.io/docker/cloud/automated/cafeteru/node-chrome-headless.svg)](https://hub.docker.com/r/cafeteru/node-chrome-headless/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/cafeteru/node-chrome-headless.svg)](https://hub.docker.com/r/cafeteru/node-chrome-headless/)
[![Docker Image Size](https://img.shields.io/docker/image-size/cafeteru/node-chrome-headless/latest.svg)](https://hub.docker.com/r/cafeteru/node-chrome-headless/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cafeteru/node-chrome-headless.svg)](https://hub.docker.com/r/cafeteru/node-chrome-headless/)

This is a simple docker container for running karma unit tests with chrome headless.

## Versions

- Node: 18 (LTS - latest)
- Chrome: 112.0.5615.49

## Usage

Simply configure and run the test like every other day and run the tests. For example:

### karma.conf.js

```javascript
browsers: [
    'ChromeHeadlessNoSandbox',
],
customLaunchers: {
    ChromeHeadlessNoSandbox: {
        base: 'ChromeHeadless',
        flags: ['--no-sandbox'],
    },
},
```

To execute the tests, run the following command:

```bash
npm run test --browsers=ChromeHeadless
```

## Docker

- Create or update image

```shell
docker build -t node-chrome-headless .
```

- Create tag to publish image to Docker Hub

```shell
docker tag node-chrome-headless cafeteru/node-chrome-headless:latest
```

- Publish the image to Docker Hub

```shell
docker push cafeteru/node-chrome-headless:latest
```
