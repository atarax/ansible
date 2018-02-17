#!/bin/sh 

# keep track on when we registered the runner the first time
CREATED=$(date)
HOST=$(hostname)

# foreach runner-token
for TOKEN in \
	$GITLAB_RUNNER_TOKEN `# platforms-dockers`
do
    gitlab-runner register \
        --name "platforms-specific ($HOST) $CREATED" \
        --registration-token ${TOKEN} \
        --docker-volumes /var/run/docker.sock:/var/run/docker.sock \
        --non-interactive \
        --url $GITLAB_RUNNER_URL \
        --executor docker \
        --docker-image docker:latest \
        --locked=false
done

# start the runner-service
gitlab-runner run
