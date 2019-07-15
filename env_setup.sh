function prop {
    grep "${1}" config.properties | cut -d'=' -f2
}

mkdir -p aws
echo -e "[default]\nregion=$(prop 'aws.region')\noutput=json" > aws/config
echo -e "[default]\naws_access_key_id=$(prop 'aws.access.key.id')\naws_secret_access_key=$(prop 'aws.secret.access.key')" > aws/credentials

docker build . -t irida-eks:latest

rm -rf aws


