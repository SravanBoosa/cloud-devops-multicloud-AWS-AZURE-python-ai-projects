
# Dockerized Static Website

## 1. Project Overview

This project demonstrates how to containerize and serve a static HTML/CSS website using Docker and Nginx.

It is part of my hands-on Cloud and DevOps learning portfolio. The project covers Docker image creation, container deployment, port mapping, container access, and HTTP verification.

## 2. Objectives

- Build a custom Docker image using an Nginx base image.
- Serve static HTML and CSS files from an Nginx container.
- Understand Dockerfiles, image tags, and build contexts.
- Run and inspect a Docker container.
- Verify the website using `curl`.
- Use `.dockerignore` to exclude unnecessary and sensitive files from the build context.
- Track and publish project files using Git and GitHub.

## 3. Architecture

```text
Web Browser / Host
       |
       | http://localhost:8080
       |
       v
Host Port 8080
       |
       | Docker port mapping: 8080:80
       |
       v
Nginx Container (Port 80)
       |
       v
/usr/share/nginx/html/
       |
       +-- index.html
       |
       +-- css/style.css
```

## 4. Technologies Used

- Linux / Ubuntu WSL2
- Docker
- Dockerfile
- Nginx
- HTML5
- CSS3
- Git and GitHub

## 5. Project Structure

```text
01-dockerized-static-website/
├── README.md
├── Dockerfile
├── .dockerignore
├── index.html
└── css/
    └── style.css
```

## 6. Prerequisites

- Ubuntu on WSL2 or another Linux environment
- Docker Engine or a working Docker-compatible setup
- Git
- A web browser
- Basic Linux command-line knowledge

Verify Docker is available:

```bash
docker --version
docker info
```

## 7. Dockerfile

```dockerfile
FROM nginx:alpine

LABEL maintainer="Cloud DevOps Portfolio"
LABEL description="Dockerized static portfolio website"

COPY index.html /usr/share/nginx/html/index.html
COPY css/ /usr/share/nginx/html/css/

EXPOSE 80
```

### Dockerfile explanation

- `FROM nginx:alpine`: Uses the lightweight Nginx Alpine image as the base.
- `LABEL`: Adds descriptive metadata to the image.
- `COPY index.html`: Copies the website's HTML page into the Nginx web root.
- `COPY css/`: Copies the CSS directory into the container.
- `EXPOSE 80`: Documents the port on which the containerized web server listens. It does not publish the port on its own.

## 8. Build the Docker Image

Navigate to the project directory:

```bash
cd ~/cloud-devops-multicloud-AWS-AZURE-python-ai-projects/05-docker-containers/01-dockerized-static-website
```

Build the image:

```bash
docker build -t dockerized-static-website:v1 .
```

Verify the image:

```bash
docker images
docker image inspect dockerized-static-website:v1
docker history dockerized-static-website:v1
```

## 9. Run the Container

Check existing containers and port usage first:

```bash
docker ps
```

If host port `8080` is available, start the website:

```bash
docker run -d \
  --name static-site \
  -p 8080:80 \
  dockerized-static-website:v1
```

Verify the running container:

```bash
docker ps
docker logs static-site
docker port static-site
```

Open the website in a browser:

http://localhost:8080

## 10. Test the Website Using curl

### From the Ubuntu/WSL2 host

```bash
curl -I http://localhost:8080
curl -s http://localhost:8080 | head -20
curl -I http://localhost:8080/css/style.css
```

Expected result: the HTML and CSS requests should return an HTTP `200 OK` response.

### Access the container shell

```bash
docker exec -it static-site sh
```

Inside the container:

```sh
ls -l /usr/share/nginx/html/
ls -l /usr/share/nginx/html/css/
curl -I http://localhost
curl -s http://localhost | head -20
exit
```

Some minimal Nginx images may not include `curl`. If it is unavailable, test with `wget -S -O - http://localhost` or run the `curl` commands from the host.

## 11. Container Inspection and Lifecycle

Inspect container configuration:

```bash
docker inspect static-site
```

Check resource usage:

```bash
docker stats --no-stream static-site
```

Practice container lifecycle commands:

```bash
docker stop static-site
docker start static-site
docker restart static-site
```

After starting or restarting, verify the website again:

```bash
curl -I http://localhost:8080
```

## 12. Troubleshooting

### Container is not running

```bash
docker ps -a
docker logs static-site
```

### Port 8080 is already in use

Choose another available host port, such as `8081`:

```bash
docker run -d --name static-site \
  -p 8081:80 \
  dockerized-static-website:v1
```

Then visit `http://localhost:8081`.

### Website or CSS is not loading

```bash
docker exec -it static-site sh
ls -l /usr/share/nginx/html/
ls -l /usr/share/nginx/html/css/
exit
```

Check the container logs and confirm the file paths in the Dockerfile match the project structure.

### Container name already exists

```bash
docker ps -a
```

Inspect the existing container before deciding whether to reuse or remove it. Do not remove unrelated containers.

## 13. Docker Concepts Practised

- Docker images and containers
- Dockerfile instructions: `FROM`, `LABEL`, `COPY`, and `EXPOSE`
- Docker build context and `.dockerignore`
- Host-to-container port mapping
- Nginx web server
- Container shell access with `docker exec`
- Logs, inspection, and resource usage
- HTTP testing with `curl`
- Container start, stop, and restart operations
- Git version control and GitHub project publishing

## 14. Future Improvements

- Add a Docker Compose configuration.
- Practise read-only bind mounts for development.
- Add a custom error page and improve responsive styling.
- Automate image building with GitHub Actions.
- Add deployment to AWS or another cloud platform.

## 15. Learning Outcome

This project provides practical experience building a Docker image for a static website, serving the website through Nginx, validating HTTP responses, inspecting container behaviour, and documenting the work for a Cloud/DevOps portfolio.

---

**Project:** Dockerized Static Website  
**Category:** Docker and Containers  
**Portfolio:** Cloud, DevOps, Multicloud, Python and AI Projects

