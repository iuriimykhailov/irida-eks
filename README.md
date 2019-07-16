# irida-eks

#### Purpose of this project is the integration of IRIDA and Amazon EKS.
- Provides an environment with the tooling needed for work with EKS
- Provides a script to creates an EKS cluster and deploy IRIDA environment
- Provides a script to teardown the IRIDA environment and EKS cluster.

## Prerequisites:
- Bash
- Docker installed

## How to use:
1. You need to have an AWS account.
2. Create an access key (AWS Console steps):
 - Click on the account name
 - My Security Credentials
 - Access keys
 - Create New Access Keys (Button) 
 - Show access key
 - Copy Access Key Id and Secret Access Key to config.properties into corresponding key value.
3. Run ./env_setup.sh to build environment.
4. Run ./run-irida-aws-console.sh to enter the environment (ingore the error). Form here you can run “aws”, “eksctl” and “kubectl” commands. Following steps should be run from this environment.
5. Run create_cluster.sh . The process of cluster creation may take 5 to 20 minutes. As soon as this command is complete a 3-node K8s cluster will be deployed on to EC2 nodes.
6. Run deploy_app.sh. The last line of the output should the link to Irida instance. It may take like 5 minutes to resolve the DNS name.

- Use delete-cluster.sh to teardown the cluster. Please wait until it is done otherwise some piece of the cluster may not be removed and may cost you money. 
- Use “exit” command to exit the environment. 
