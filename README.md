docker-daprdockrd
=================

Docker container hosting [daprdockr](https://github.com/ReubenBond/daprdockr)
This whole thing is very much a work in progress, but it works :)

## Example usage: 

The container needs to know the LAN IP of the container host - the IP which other container hosts use to contact it.
`daprdockrcmd` from the [daprdockr](https://github.com/ReubenBond/daprdockr) repo has a `-ip` switch which helps with this. It echos the IP of the interface which has the default gateway in its subnet.
`daprdockrcmd` can be obtained using `go get github.com/ReubenBond/daprdockr; go build github.com/ReubenBond/daprdockr/daprdockrcmd`

```
# HOST_IP=`./daprdockrcmd -ip` docker run \
  -v /var/run:/host/docker \
  -v /proc:/host/proc \
  -e ETCD_HOSTS="http://${HOST_IP}:5001,http://${HOST_IP}:5002,http://${HOST_IP}:5003" \
  -e HOST_IP="${HOST_IP}" \
  -p 80:80 -p 433:433 -p 53:53 daprlabs/daprdockr
```
