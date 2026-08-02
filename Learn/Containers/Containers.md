# Containers
## What is a container
Los contenedores son conjuntos de uno o mas procesos aislados del resto del sistema. Se diferencia principalmente de una VM por compartir el kernel del sistema host lo que ahorra recursos.

Principal components:
- Kernel sharing
- Namespaces
- cgroups

## Kernel

Cuatro system calls manipulan directamente los namespaces
- clone
- unshare
- setns
- ioctl

## Namespaces
Exist 8 namespaces

- cgroups
- ipc
- net
- mnt
- pid
- time
- uts
- user

## cgroups
Limita el suso del hardware 

# Benefits
- Lightweight
- Portable
- Supportive of modern development and architecture


# References
* https://www.ibm.com/think/topics/containers
* https://www.ibm.com/think/topics/linux-containers
* https://en.wikipedia.org/wiki/Linux_namespaces
* https://www.redhat.com/en/topics/containers/whats-a-linux-container
