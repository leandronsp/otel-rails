## Deploy using Docker

Provisioning:

```bash
$ make production.create_network
$ make production.run_db
```

Deploy:

```bash
$ make build.release
$ make production.deploy
```

## Deploy using Kubernetes

TODO
