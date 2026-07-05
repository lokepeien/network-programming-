# Network Programming Assignment — SECR3253

Automation project combining **Ansible** (network device configuration) and
**Docker** (Linux system information collection).

## Project Structure

```
inventory.ini                       Ansible inventory for the CSR1000v router
ansible.cfg                         Ansible configuration
playbooks/
  configure_device.yml              Configures IP address, user account,
                                     banner, interface description, static route
  retrieve_device_info.yml          Retrieves device info (show version,
                                     show ip interface brief, show running-config)
output/
  device_info.txt                   Saved output from retrieve_device_info.yml
docker-sysinfo/
  Dockerfile                        Alpine-based image for Linux system info
  sysinfo.sh                        Script collecting hostname, date, CPU,
                                     memory, disk, logged-in users, top 5 processes
```

## Part 1: Device Configuration (Ansible)

Target device: Cisco CSR1000v (IOS-XE), reachable over SSH.

Run:
```
ansible-playbook playbooks/configure_device.yml
ansible-playbook playbooks/retrieve_device_info.yml
```

`configure_device.yml` performs:
- IP address configuration (Loopback100 interface, to avoid disrupting the
  management interface used for SSH connectivity)
- User account creation
- Banner message configuration
- Interface description configuration
- Static route configuration

`retrieve_device_info.yml` runs `show version`, `show ip interface brief`,
and `show running-config`, saving the combined output to `output/device_info.txt`.

## Part 2: Linux System Information (Docker)

Build and run:
```
cd docker-sysinfo
docker build -t sysinfo:latest .
docker run --rm sysinfo:latest
```

The script reports: hostname, current date/time, CPU information, memory
usage, disk usage, logged-in users, and the top 5 processes by CPU usage.

Note: "Logged-in users" will normally be empty when run in a fresh container,
since the container has its own isolated session namespace with no login
sessions of its own — this is expected container behavior, not a script error.

## Requirements

- Ansible with the `cisco.ios` collection
- Docker
- Network access to the target router
