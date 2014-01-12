docker-daprdockrd
=================

Docker container hosting [daprdockr](https://github.com/ReubenBond/daprdockr)
This whole thing is very much a work in progress, but it works :)

## Example usage: 

```
# HOST_IP=`/home/rbn/dev/go/daprdockrcmd -ip` docker run \
  -v /var/run:/host/docker \
  -v /proc:/host/proc \
  -e ETCD_HOSTS="http://${HOST_IP}:5001,http://${HOST_IP}:5002,http://${HOST_IP}:5003" \
  -e HOST_IP="${HOST_IP}" \
  -p 80:80 -p 433:433 -p 53:53 daprlabs/daprdockr
```
