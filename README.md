# YouTrack
[![](https://images.microbadger.com/badges/image/esycat/youtrack.svg)](https://microbadger.com/images/esycat/youtrack "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/esycat/youtrack.svg)](https://microbadger.com/images/esycat/youtrack "Get your own version badge on microbadger.com")

[YouTrack](https://jetbrains.com/youtrack/) is an issue tracking and project management tool from [JetBrains](https://jetbrains.com/).

Version `7.0`, build `27477` (released September 28, 2016).

The image based on [Ubuntu 16.04 LTS](https://registry.hub.docker.com/u/esycat/java/) with [Oracle Java 8](https://registry.hub.docker.com/u/esycat/java/).

## Usage

Pull the image, create a new container and start it:

```bash
docker pull esycat/youtrack
docker create --name youtrack -p 8080:8080 --restart=always esycat/youtrack
docker start youtrack
```
