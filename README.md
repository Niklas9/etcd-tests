etcd-tests
==========

Just some random system tests for etcd, while I figure out if this is a good
data store for a project.

Setup
-----

The setup of a test cluster of etcd nodes in containers is based on the
instructions from this link -
https://coreos.com/blog/Running-etcd-in-Containers/.

Official CoreOS Docker images for etcd is located at their own Docker
repository Quay.io, and not DockerHub, so the etcd image needs to be pulled from
there:

$ docker login quay.io
$ docker pull coreos/etcd
