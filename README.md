# TroubleLab
Kubernetes Lab

# Create VM
You can avoid this seccion if you prefer run it locally
## Dependencias
```bash
sudo apt install qemu-system-x86 qemu-utils cloud-image-utils
```
## Download Image
```bash
wget https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2 -O debian.qcow2
qemu-img resize debian.qcow2 20G
```

# Setup Lab
## Setup Docker & K3s
```bash
cd ./TroubleLab/K8Lab/scripts
chmod u+x ./DockerSetup.sh ./K3sSetup.sh
./DockerSetup.sh
./K3sSetup.sh
source ~/.bashrc
```

## Gitea
```bash
cd ../lab/gitea
docker compose up -d
```

Access to http://localhost:3000 and setup gitea with the wizard
Create Admin account

## Docker Image 
### Build Image
```
cd ../my-app
docker build -t localhost:5000/my-app:v1 .
```
### Push Image
```bash
docker push localhost:5000/my-app:v1
cd ../../k8s
kubectl apply -f ./deployment.yaml
```

## K8s
Create manifest
