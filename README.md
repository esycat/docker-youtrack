# YouTrack
[![](https://badge.imagelayers.io/esycat/youtrack:latest.svg)](https://imagelayers.io/?images=esycat/youtrack:latest 'Get your own badge on imagelayers.io')

[YouTrack](https://jetbrains.com/youtrack/) is an issue tracking and project management tool from [JetBrains](https://jetbrains.com/).

Version `6.5`, build `17057` (released March 17, 2016).

The image based on [Ubuntu 16.04 LTS](https://registry.hub.docker.com/u/esycat/java/) with [Oracle Java 8](https://registry.hub.docker.com/u/esycat/java/).

## Usage

Pull the image, create a new container and start it:

```bash
docker pull esycat/youtrack
docker create --name youtrack -p 8080:8080 --restart=always esycat/youtrack
docker start youtrack
```
