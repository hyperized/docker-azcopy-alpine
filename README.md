# [hyperized/azcopy](https://hub.docker.com/r/hyperized/azcopy/)

Sync current directory with Azure destination:

```bash
docker run -v ${PWD}:/tmp -it hyperized/azcopy sync /tmp "<destination>" --recursive=true
```