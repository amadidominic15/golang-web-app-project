# Go Web Application

## testing the app locally 
This is a simple website written in Golang. It uses the `net/http` package to serve HTTP requests.

## Running the server

To run the server, execute the following command:

```bash
go run main.go
```

The server will start on port 8080. You can access it by navigating to `http://localhost:8080/home` in your web browser.

## Looks like this

![Website](static/images/golang-website.png)


## Apllying devops principle

the devops principles applied are as follws:
  - docker for containerization building and pushing the container to docker hub
  - kubernetes for container orchestration
  - helm for deploying the app with ingress nginx controller for load balancing
  - argocd for monitoring the repository
  - github actions for continuous integration and continuous delivery

After deploying the app, it can be accessed by navigating to `http://go-web-app.local` in your web browser



