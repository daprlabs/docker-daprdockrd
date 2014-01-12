FROM stackbrew/ubuntu:saucy
# Install dependencies and clean up.
RUN apt-get update && apt-get install -y gcc libsqlite3-dev libdevmapper-dev golang git mercurial supervisor nginx && apt-get -y clean all
# Install daprdockrd and clean up.
RUN mkdir /build && mkdir /daprdockr && export GOPATH=/build && go get -v github.com/ReubenBond/daprdockr && go build -v -o /daprdockr/daprdockrd github.com/ReubenBond/daprdockr/daprdockrd && rm -rf /build && touch /tmp/daprdockrd.std{out,err}

ADD supervisord.conf /etc/supervisord.conf

VOLUME ["/host/docker", "/host/proc"]
EXPOSE 80 433 53
CMD tail -f /tmp/daprdockrd.std{out,err} & /usr/bin/supervisord -c /etc/supervisord.conf

# Example usage: 
# docker run -v /var/run:/host/docker -v /proc:/host/proc -e ETCD_HOSTS="http://192.168.1.10:5001,http://192.168.1.10:5002,http://192.168.1.10:5003" -p 80:80 -p 433:433 -p 53:53 daprlabs/daprdockr