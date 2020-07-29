# Run inside gcloud shell to set kubectl secret

# Similar commands like in .travis.yml
gcloud config set project udemy-docker-complex
gcloud config set compute/zone asia-southeast2-a
gcloud container clusters get-credentials k8s-test

# Same like in ./k8s-secret.sh
kubectl create secret generic pgpassword --from-literal POSTGRES_PASSWORD=12345asdf

# See the "kubernetes engine > configuration" to confirm secret is there.
