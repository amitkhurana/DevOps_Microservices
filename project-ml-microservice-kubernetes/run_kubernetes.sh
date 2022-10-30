
# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=amitkhurana/udacity-ml-msapi

# Step 2
# Run the Docker Hub container with kubernetes
rpod=$(kubectl get pod udacity-ml-msapi 2> /dev/null;echo $?)
if [ "_$rpod" == "_1" ] ; then
        kubectl run udacity-ml-msapi \
        --image=$dockerpath \
        --image-pull-policy="Always" \
        --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "secretkey"}]}}'
fi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-ml-msapi 8080:80
