# Laclede's LAN Counter-Strike 1.6 Freeplay Server in Docker

![Laclede's LAN Counter-Strike 1.6 Freeplay Server](https://raw.githubusercontent.com/LacledesLAN/gamesvr-goldsource-cstrike/master/.misc/banner-goldsource-cstrike.png?token=AMNjdjmpX7JyJzBwalo76VL137u6gBerks5bvqtmwA%3D%3D "Laclede's LAN Counter-Strike 1.6 Freeplay Server")

This repository is maintained by [Laclede's LAN](https://lacledeslan.com). Its contents are heavily tailored and tweaked for use at our charity LAN-Parties. For third-parties we recommend using this repo only as a reference example and then building your own using [gamesvr-goldsource](https://github.com/LacledesLAN/gamesvr-goldsource) as the base image for your customized server.

## Linux

[![linux/amd64](https://github.com/LacledesLAN/gamesvr-goldsource-cstrike/actions/workflows/build-linux-image.yml/badge.svg)](https://github.com/LacledesLAN/gamesvr-goldsource-cstrike/actions/workflows/build-linux-image.yml)

### Download

```shell
docker pull lacledeslan/gamesvr-goldsource-cstrike;
```

### Run Self Tests

The image includes a test script that can be used to verify its contents. No changes or pull-requests will be accepted to this repository if any tests fail.

```shell
docker run -it --rm lacledeslan/gamesvr-goldsource-cstrike ./ll-tests/gamesvr-goldsource-cstrike.sh;
```

### Run Interactive Server

```shell
docker run -it --net=host lacledeslan/gamesvr-goldsource-cstrike ./hlds_run -game cstrike +sv_lan 1 +map de_dust2 +maxplayers 16;
```

## Getting Started with Game Servers in Docker

[Docker](https://docs.docker.com/) is an open-source project that bundles applications into lightweight, portable, self-sufficient containers. For a crash course on running Dockerized game servers check out [Using Docker for Game Servers](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/DockerAndGameServers.md). For tips, tricks, and recommended tools for working with Laclede's LAN Dockerized game server repos see the guide for [Working with our Game Server Repos](https://github.com/LacledesLAN/README.1ST/blob/master/GameServers/WorkingWithOurRepos.md). You can also browse all of our other Dockerized game servers: [Laclede's LAN Game Servers Directory](https://github.com/LacledesLAN/README.1ST/tree/master/GameServers).
