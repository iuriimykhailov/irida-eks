

function prop {
    grep "${1}" config.properties | cut -d'=' -f2
}


docker run -it -v /var/run/docker.sock:/var/run/docker.sock \
	-e K8S_CLUSTER_NAME=$(prop 'k8s.cluster.name') \
	-e AWS_ACCESS_KEY_ID=$(prop 'aws.access.key.id') \
	-e AWS_SECRET_ACCESS_KEY=$(prop 'aws.secret.access.key') \
	irida-eks:latest /bin/bash
