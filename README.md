# TroubleLab
Kubernetes laboratory.

>[!NOTE]
> The lab configurations are designed for easy interaction and are NOT suitable for production environments. 

## Architecture
- K3s:                        A Lightweight Kubernetes Distribution
- Gitea:                      For image registry 
- Prometheus and Grafana:     Monitoring
- Dummy JS Web App

## Requirements
Minimum requirements for the lab (excluding host consumption)
Storage:    20 GB
CPU:        2 cores
RAM:        4GB

# K8Lab/
The lab's core directory is divided into the `scripts`, `k8s/`, and `lab/` directories.

## scripts/
DockerSetup.sh: Automate docker installation and permissions assignment
K3sSetup.sh:    Install K3s, setup user-level config

## lab/
gitea/ : Directory where Gitea (self-hosted GitHub) and the registry are configured and managed using `docker-compose.yaml` to emulate ECR registries
monitoring/ : It contains the `docker-compose.yaml` file for deploying the `Grafana` and `Prometheus` monitoring applications, as well as the `prometheus.yaml` configuration file
my-app/ : Directory related to the Dummy app
          - `src/`:         A directory that contains the `index.js` file with the Dummy application
          - `package.json`: The file that manages the dependencies of the JS application 
          - `Dockerfile`:   Automate image creation

## k8s
Contents kubernetes manifest `deployment.yaml` para la ejecucion de kubectl

# VM/
Directory for running the lab within a virtual machine managed by QEMU

- meta-data:  Define VM identity
- user-data:  Define first boot
- setup.sh:   Automate image setup after configure
- run.sh:     Run Image with recommended resources


# Create VM
You can avoid this seccion if you prefer run it locally
## Dependencies 
```bash
sudo apt install qemu-system-x86 qemu-utils cloud-image-utils
```
## Configure
Add your ssh pub key to `user-data` on:
```
    ssh_authorized_keys:
      - ssh-ed25519 $SSH_VALUE $USER
```

## Download Image
Download image and build seed using `cloud-localds`
```bash
cd ./VM
./setup.sh
```
## Run VM
Run the VM with recommended resources and enabling port forwarding 
```bash
./run.sh
```

# Setup Lab

>[!NOTE]
> For an initial deployment, it is recommended that you start by manually setting up the entire project, using the contents of the repository files as a reference.

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
```

## K8s
Apply manifest
```bash
cd ../../k8s
kubectl apply -f ./deployment.yaml

```

