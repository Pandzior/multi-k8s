echo "Building docker images..."
docker build -t pandzior/multi-client:latest -t pandzior/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t pandzior/multi-server:latest -t pandzior/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t pandzior/multi-worker:latest -t pandzior/multi-worker:$SHA -f ./worker/Dockerfile ./worker
echo "Docker images are built!"

echo "Pushing docker images to docker hub..."
docker push pandzior/multi-client:latest
docker push pandzior/multi-server:latest
docker push pandzior/multi-worker:latest

docker push pandzior/multi-client:$SHA
docker push pandzior/multi-server:$SHA
docker push pandzior/multi-worker:$SHA
echo "Docker images are pushed to docker hub!"

echo "Applying k8s configs..."
#kubectl apply -f k8s
echo "K8s config is applied!"

echo "Setting k8s deployments images..."
#kubectl set image deployments/client-deployment client=pandzior/multi-client:$SHA
#kubectl set image deployments/server-deployment server=pandzior/multi-server:$SHA
#kubectl set image deployments/worker-deployment worker=pandzior/multi-worker:$SHA
echo "K8s deployments images are set!"