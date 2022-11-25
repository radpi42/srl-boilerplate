# Portainer and agent set up

Portainer

```bash
docker volume create portainer_data

docker run -d -p 9000:9000 -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

Portainer agent

```bash
docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:2.9.3
```

docker compose versions

portainer

```yaml
version: '3'

volumes:
  portainer-data:
    driver: local
    
services:
  app:
    container_name: portainer
    image: 'portainer/portainer-ce:latest'
    ports:
      - '9000:9000'
      - '9443:9443'
      - '8000:8000'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer-data:/data
```

portainer-agent

```yaml
version: '3'

networks:
  portainer-agent_default:
    driver: bridge
    # (Optional) When setting up in swarm mode replace with
    # driver: overlay

services:
  app:
    container_name: portainer-agent
    deploy:
      mode: global
    image: 'portainer/agent:latest'
    ports:
      - '9001:9001'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /var/lib/docker/volumes:/var/lib/docker/volumes
    networks:
      - portainer-agent_default
    restart: always
```
