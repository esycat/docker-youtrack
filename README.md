# YouTrack

[YouTrack](https://jetbrains.com/youtrack/) is an issue tracking and project management tool from [JetBrains](https://jetbrains.com/).

Version `6.5`, build `16713` (released September 15, 2015).

The image based on [Ubuntu 14.04 LTS](https://registry.hub.docker.com/u/esycat/java/) with [Oracle Java 8](https://registry.hub.docker.com/u/esycat/java/).

## Usage

Pull the image, create a new container and start it:

```bash
docker pull esycat/youtrack
docker create --name youtrack -p 8080:8080 --restart=always esycat/youtrack
docker start youtrack
```
