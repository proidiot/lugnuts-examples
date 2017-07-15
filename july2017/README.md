July 2017 Bourne Shell Example
==============================

NOTE: All these commands are written in a way expected to be run from within
this directory.

# Example Bourne Shell Script

To see help on how to use the example Bourne shell script, just run:
```
./example.sh --help
```

# Dockerized Bourne Shell Script

To build the Docker image containing the Dockerized version, run:
```
docker build -t lugnutsjuly2017 .
```

To see help on how to use the Dockerized version of the shell script, just run:
```
docker run --rm lugnutsjuly2017 --help
```

To list the files in the root filesystem of the Docker container, just run:
```
docker run --rm lugnutsjuly2017 ls /
```

