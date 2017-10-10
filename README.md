# v0: Start

Get the code
```
git clone https://github.com/errordeveloper/prom-java-demo
cd prom-java-demo
cat README.md
```

> This demo requires a Kubernetes cluster with functional external load balancing, e.g. GKE. 
> You also need to have `kubectl`, `draft` and `helm` commands in your shell's search path.
> You can create a GKE cluster like this:
> ```
> gcloud container clusters create \
>   --project=<project_id> \
>   --zone="us-west1-a" \
>   --machine-type=n1-standard-4 \
>   --num-nodes=3 \
>   --scopes=default,storage-rw \
>   "weave-cloud-playground"
> gcloud container clusters get-credentials \
>   --project=<project_id> \
>   --zone="us-west1-a" \
>   "weave-cloud-playground"
> ```
> Please note that `storage-rw` scope is required for Draft to work nicely with GCR
> (the Docker image registry in google cloud).

Install Draft (macOS):
```
brew install kubernetes-helm
helm init
brew tap azure/draft
brew install draft
kubectl apply -f infra/draftd.yaml
```

Next, log into [Weave Cloud](https://cloud.weave.works) and follow installation instruction
to configure the agents. You can skip Weave Cloud Deploy setup instuctions at this point.

Now, checkout the first version of the app
```
git checkout -q v1-hello-world
cat README.md
```
