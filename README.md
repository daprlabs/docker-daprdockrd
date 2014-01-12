docker-daprdockrd
=================

Docker container hosting [daprdockr](https://github.com/ReubenBond/daprdockr)
This whole thing is very much a work in progress, but it works :)

## Example usage: 

```
# docker run -v /var/run:/host/docker -v /proc:/host/proc -e ETCD_HOSTS="http://192.168.1.10:5001,http://192.168.1.10:5002,http://192.168.1.10:5003" -p 80:80 -p 433:433 -p 53:53 daprlabs/daprdockr
```