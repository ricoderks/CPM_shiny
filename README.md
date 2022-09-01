# CPM_shiny

My shiny server in docker.

# Build

Build the container with e.g.:

```
docker build --tag ricolumc/cpm_shiny:cpm_v0.6 . 
```

# Docker hub

To push everything to the docker hub repository, first login:

```
docker login -u <username>
```

Push it:

```
docker push ricolumc/cpm_shiny:cpm_v0.6
```

And logout:

```
docker logout
```

# Run 

Run the build container with;

```
docker run -d -p 3838:3838 -v /your/folder/with/apps:/srv/shiny-server -v /your/folder/for/logging:/var/log/shiny-server ricolumc/cpm_shiny:cpm_v0.6
```

