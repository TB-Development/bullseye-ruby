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

# Example

Build the Image

```bash
✗ docker build -t debian-rbenv-2.3.0 .

[+] Building 0.8s (5/5) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                    
 => => transferring dockerfile: 36B                                                                                                                      
 => [internal] load .dockerignore                                                                                                                         
 => => transferring context: 34B                                                                                                                         
 => [internal] load metadata for docker.io/trechubet/bullseye-rbenv-2.3.0:latest                                                                         
 => [1/1] FROM docker.io/trechubet/bullseye-rbenv-2.3.0                                                                                           
 => exporting to image                                                                                                                                   
 => => exporting layers                                                                                                                                   
 => => writing image sha256:6c26e69e4c950efc3be96f20eaeb6338fd50c6a52d833e7dc59716c53de069be                                                             
 => => naming to docker.io/library/debian-rbenv-2.3.0                                                                                                    
```

Run the image in a container

```bash
✗ docker run -itPd debian-rbenv-2.3.0
ccd508ac09758e2f850ec63f41e12437cc61f30261eb14e0cf09d11651e8dfbd
```

Access the OS in the container
```bash
✗ docker exec -it ccd508ac09758e2f850ec63f41e12437cc61f30261eb14e0cf09d11651e8dfbd bash;
root@8d473938e3e9:/# rbenv versions
  system
* 2.3.0 (set by //.ruby-version)
```
