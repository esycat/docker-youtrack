# YouTrack

[YouTrack](https://jetbrains.com/youtrack/) is an issue tracking and project management tool from [JetBrains](https://jetbrains.com/).

YouTrack version: `6.0.12634` (released March 11, 2015)

The image based on [Ubuntu 14.04 LTS](https://registry.hub.docker.com/u/esycat/java/) with [Oracle Java 8](https://registry.hub.docker.com/u/esycat/java/).

## Usage

Pull the image, create a new container and start it:

```bash
docker pull esycat/youtrack
docker create --name youtrack -p 8080:8080 esycat/youtrack
docker start youtrack
```
