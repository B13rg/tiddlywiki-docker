# TiddliWiki 5 Docker image

Run TiddlyWiki 5 via Docker.

Forked from
[m0wer/tiddlywiki-docker](https://github.com/m0wer/tiddlywiki-docker)
forked from
[djmaze/tiddlywiki-docker](https://github.com/djmaze/tiddlywiki-docker).

The Docker image is available at [ghcr.io/b13rg/tiddlywiki-docker - GHCR](https://github.com/users/B13rg/packages/container/package/tiddlywiki-docker.


## Prerequisites

* Docker + Compose

## Quickstart

See `docker-compoase` file: [compose](./compose.yml)

---

```bash
docker run -d -p 8277:8277 ghcr.io/b13rg/tiddlywiki
```

Now TiddlyWiki should be running on
[http://localhost:8277](http://localhost:8277).

## Persistence

The container can use a docker volume to save the wiki data which is stored in `var/lob/tiddlywiki`.

```bash
docker run -d -p 8277:8277 -v $(pwd)/.tiddlywiki:/var/lib/tiddlywiki ghcr.io/b13rg/tiddlywiki
```

In this example, the folder `$(pwd)/.tiddlywiki` is used for the data.

## Configuration

The following environment variables can be used to configure the container:

|ENV var|Description|Default|
|---|---|---|
|TW_VERSION|TiddlyWiki version|`5.2.7`|
|USERNAME|Username for authentication, enables auth if set|``|
|PASSWORD|Password for authentication|`wiki`|
|DEBUG_LEVEL|Debug level|`none`|
|PATH_PREFIX|URL path prefix - [docs](https://tiddlywiki.com/static/Using%2520a%2520custom%2520path%2520prefix%2520with%2520the%2520client-server%2520edition.html)|``|
|PLUGINS|List of plugins - [docs](https://tiddlywiki.com/static/Using%2520TiddlyWiki%2520on%2520Node.js.html)|``|
|NODE_MEM|Limit Node.js memory (in MB)|``|
|NODEJS_V8_ARGS|List of Node.js V8 arguments|``|
|EXTRAOPTIONS|Extra options for tiddlywiki command|``|

