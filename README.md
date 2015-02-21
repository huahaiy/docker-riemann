# docker-riemann

Running Riemann server in docker container. 

The config files are loaded from `/riemann`, which is exposed as a volume to be linked to a host directory. The log files are in `/var/log/riemann`, also exposed as a volume to be linked to the host. 
