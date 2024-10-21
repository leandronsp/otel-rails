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

Provisioning:

```bash
$ make production.k8s.create
```

Deploy:

```bash
$ make build.release
$ make push.release
$ make production.k8s.deploy
```

Destroy:

```bash
$ make production.k8s.destroy
```
