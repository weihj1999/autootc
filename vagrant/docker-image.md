## download image from hub
docker save myimage:latest | gzip > myimage_latest.tar.gz

## load image to local
$ docker load < xxxx.tar.xz
