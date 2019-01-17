# Nexus Book Builder #

Build the nexus-book from github


```sh
docker build -t nexus/book .

# with proxy
docker build --build-arg HTTP_PROXY=http://10.0.2.2:3128 -t nexus/book .
```
