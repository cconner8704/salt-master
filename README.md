# Saltstack Salt-Master on CentOS7

A Docker image which allows you to run salt-master service.

## Running the Container

You can easily run the container like so:

	docker run --rm -it cmconner156/salt-master

## Volumes

There are several volumes:

 * `/srv/salt` - your states, pillars etc.
 * `/etc/salt/master.d` - master configuration
 * `/etc/salt/pki` - salt-minion authentication keys
 * `/var/log/salt` - salts log directory
 * `/var/cache/salt` - job and minion data cache

### Sharing Local Folders

To share folders on your local system so you can have your own master
configuration, states, pillars etc use:

    docker run -d                                \
        -v /path/to/salt/conf:/etc/salt/master.d \
        -v /path/to/salt/roots:/srv/salt         \
        -v salt-master-logs:/var/log/salt        \
        -v salt-master-cache:/var/salt/cache     \
        -v salt-master-pki:/etc/salt/pki         \
        --name salt-master                       \
        cmconner156/salt-master

## Ports

The following ports are exposed:
 * `4505`
 * `4506`

## Running Salt Commands

Once installed run:

    $ CONTAINER_ID=$(docker run -d cmconner156/salt-master)
    $ docker exec -it $CONTAINER_ID bash
    $ root@CONTAINER_ID:~# salt-key -L
    $ root@CONTAINER_ID:~# salt '*' test.ping
    $ root@CONTAINER_ID:~# salt '*' grains.items
# Docker CentOS 7 Salt Master
