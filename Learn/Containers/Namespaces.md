# Namespaces
> A namespace wraps a global system resource in an abstraction that makes it appear to the processes within the namespace that they have their own isolated instance of the global resource.

Namespaces are a feature of the Linux kernel that allows system resources to be isolated for different groups of processes.

Starting with kernel version 5.6, there are 8 types of namespaces:

- cgroup
- ipc
- net
- mnt
- pid
- time
- uts
- user

# Types 

## cgroup
Hides the identity of the control group hierarchy and virtaulize the view of a process's cgroups.
Each group has its own set of cgroup root directories.
Exist since Linux 4.6.

Isolates:
- cgroup root
- directory

## ipc
Inter-process Comunication
Isolates certain IPC resources. This prevents processes in different IPC namespace from interact with each other using common IPC identifiers.
Each IPC namespace has its own set of System V IPC identifiers and its own POSIX message queue filesystem. IPC namespaces are only visibles for other processes in the same namespace. 

Isolates:
- System V
- IPC, POSIX
- Messages
- Queues
 
## net
Network namespaces  virtaulize the network stack. Each network namespace has his own set of IP addresses, its own routing table, socket listing conection, firewall rules and other network-related resources.
Provide isolation of the system resources associated with networking like:
- Network
- Devices
- Stacks
- ports, etc

Is possible create a Virtual Network device pair to create tunnels between network namespaces, and can be used to create bridge to a physical network device in another namespace. 

## mnt
Mount Namespace provide a isolation of the list of mounts seen by the processes in each namespace instance.
A new mount namespace is create using clone() or unshre() system call fith the flag CLONE_NEWNS.

Isolates:
- Mount points

## pid
Allow containers to provide functionality such as suspending/resuming the set of processes in the container and migrating the container to a new host while the processes inside the container maintain the same PIDs. When the PID namespace terminates, the kernel terminates all of the processes in the namespace via SIGKILL signal.
Isolates:
- Process IDs

## time
Virtualize the values of two system clocks
Isolates:
- Boot clocks
- monotic clocks

## uts
Isolates:
- Hostname
- NIS domain

## user
Isolates:
- Users
- Groups

# Namespaces API
## clone()
## setns()
## unshare()
## ioctl()




# References
* https://man7.org/linux/man-pages/man7/namespaces.7.html
* https://man7.org/linux/man-pages/man7/cgroup_namespaces.7.html
* https://man7.org/linux/man-pages/man7/ipc_namespaces.7.html
* https://man7.org/linux/man-pages/man7/pid_namespaces.7.html
* https://en.wikipedia.org/wiki/Linux_namespaces
