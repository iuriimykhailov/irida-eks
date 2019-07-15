FROM python:2.7.16-stretch

RUN pip install awscli --upgrade --user && \
	mkdir /root/.aws && \
	mkdir /root/bin && \
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
	mv /tmp/eksctl /usr/local/bin && \
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/kubectl && \
	curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/aws-iam-authenticator && \
	chmod +x ./aws-iam-authenticator && \
	mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && \
	apt-get update -y && \
	apt-get install groff -y && \
	curl -sSL https://get.docker.com/ | sh

CMD $(aws ecr get-login --no-include-email --region us-west-2) \
			./root/scripts/reconnect_with_k8s.sh
	

ENV PATH="/root/bin:/root/.local/bin:/root/scripts:${PATH}"

COPY aws /root/.aws
COPY docker-images /root/docker-images
COPY scripts /root/scripts
COPY k8s /root/k8s
COPY scripts/reconnect_with_k8s.sh /root/.bashrc