# Create our kubernetes secret.

kubectl apply secret docker-registry dockercredentials --docker-server=https://index.docker.io/v1/ --docker-username=$DOCKER_USERNAME --docker-password=$DOCKER_PASSWORD --docker-email=$DOCKER_EMAIL
