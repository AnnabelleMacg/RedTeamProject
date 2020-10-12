## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Diagrams/Red-Team-Topology.png)

![alt text](https://github.com/AnnabelleMacg/RedTeamProject/blob/main/Diagrams/Red-Team-Topology.png "Red-Team-Topology-Map")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML files may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to VMs on the network, as well as watch system metrics such as CPU usage; attempted SSH logins and sudo escalation failures.

The configuration details of each machine may be found below.

|----------|------------|------------|------------------|
| Jump Box | Gateway    | 10.0.0.5   | Linux            |
| DVWA 1   | Web Server | 10.0.0.4   | Linux            |
| DVWA 2   | Web Server | 10.0.0.8   | Linux            |        
| DVWA 3   | Web Server | 10.0.0.10  | Linux            |   
| Elk      | Monitoring | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 58.168.117.15

Machines within the network can only be accessed by each other. The DVWA 1, DVWA 2 and DVWA 4 VMS send traffic to the Elk server.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| JumpBox  | Yes                 | 58.168.117.15        |
| Elk      | No                  | 10.0.0.1-254         |
| DVWA 1   | No                  | 10.0.0.1-254         |
| DVWA 2   | No                  | 10.0.0.1-254         |
| DVWA 3   | No                  | 10.0.0.1-254         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because the same script that was used to configure this machine can be used to quickly configure additional machines.

The playbook implements the following tasks:
- Install docker 
- Install apt module 
- Install pip3
- Install pip module
- Download and launch a docker container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
(Images/DockerPs.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- DVWA 1 at 10.0.0.4
- DVWA 2 at 10.0.0.8
- DVWA 3 at 10.0.0.10

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat 
- Packetbeat

These Beats allow us to collect the following information from each machine:
- Filebeat: Filebeat detects changes to the filesystem. Specifically, we use it to collect Apache logs.
- Metricbeat: Metricbeat detects changes in system metrics, such as CPU usage. We use it to detect SSH login attempts, failed sudo escalations, and CPU/RAM statistics.
- Packetbeat: Packetbeat collects packets that pass through the NIC, similar to Wireshark. We use it to generate a trace of all activity that takes place on the network, in case later forensic analysis should be warranted.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to the Ansible Control Node
- Update the host file to include the webservers 
- Run the playbook, and navigate to Kibana to check that the installation worked as expected
