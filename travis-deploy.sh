docker build -t gusdecool/udemy-docker-multi-client:latest -t gusdecool/udemy-docker-multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t gusdecool/udemy-docker-multi-server:latest -t gusdecool/udemy-docker-multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t gusdecool/udemy-docker-multi-worker:latest -t gusdecool/udemy-docker-multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push gusdecool/udemy-docker-multi-client:latest
docker push gusdecool/udemy-docker-multi-server:latest
docker push gusdecool/udemy-docker-multi-worker:latest

docker push gusdecool/udemy-docker-multi-client:$SHA
docker push gusdecool/udemy-docker-multi-server:$SHA
docker push gusdecool/udemy-docker-multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=gusdecool/udemy-docker-multi-client:$SHA
kubectl set image deployments/server-deployment server=gusdecool/udemy-docker-multi-server:$SHA
kubectl set image deployments/worker-deployment worker=gusdecool/udemy-docker-multi-worker:$SHA
