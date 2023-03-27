# bullseye-ruby
Repository meant for storing Dockerfiles for a Bullseye Container running Ruby

# Usage

You can utilize the built and hosted images of these Dockerfiles on Dockerhub at 

- Rbenv -> https://hub.docker.com/repository/docker/trechubet/bullseye-rbenv-2.3.0/general
- RVM -> https://hub.docker.com/repository/docker/trechubet/bullseye-rvm-2.3.0/general

by putting them in your dockerfile as the base image like:

```Dockerfile
FROM trechubet/bullseye-rvm-2.3.0
```

and

```Dockerfile
FROM trechubet/bullseye-rbenv-2.3.0
```
