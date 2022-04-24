sudo rm -rf /etc/yum.repos.d/fedora.repo
sudo rm -rf /etc/yum.repos.d/fedora-cisco-openh264.repo
sudo rpm-ostree install xe-guest-utilities-latest
sudo rpm-ostree ex module enable cri-o:1.22
sudo rpm-ostree install cri-o
sudo rpm-ostree install crictl
sudo systemctl restart

sudo systemctl enable --now xe-linux-distribution
sudo modprobe overlay
sudo modprobe br_netfilter
sudo cat <<EOF > /etc/modules-load.d/crio-net.conf
overlay
br_netfilter
EOF

sudo cat <<EOF > /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system

# Set SELinux to permissive mode
setenforce 0

# Make setting persistent
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

/etc/crio/crio.conf
[crio.runtime]
conmon_cgroup="pod"
cgroup_manager="cgroupfs"


sudo systemctl enable --now crio
systemd/system/k0sworker.service:ExecStart=/var/usrlocal/bin/k0s worker --token-file=/etc/k0s/k0stoken 
systemd/system/k0sworker.service:ExecStart=/var/usrlocal/bin/k0s worker --cri-socket remote:unix:///var/run/crio/crio.sock --token-file=/etc/k0s/k0stoken 
systemctl daemon-reload


'''
network_dir = "/etc/cni/net.d"
plugin_dirs = "/usr/libexec/cni/"
      
'''