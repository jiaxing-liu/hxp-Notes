Un-register the system :

```
sudo subscription-manager remove --all
sudo subscription-manager unregister
sudo subscription-manager clean
```

Re-register the system :

```
sudo subscription-manager register
sudo subscription-manager refresh
```

Search for the Pool ID :

```
sudo subscription-manager list --available
```

Attach to subscription :

```
subscription-manager role --set="Red Hat Enterprise Linux Workstation"
subscription-manager service-level --set="Self-Support"
subscription-manager usage --set="Development/Test"
subscription-manager attach
```

Clean YUM and cache :

```
sudo dnf clean all
sudo rm -r /var/cache/dnf
```

Update the resources :

```
sudo dnf upgrade
```

Install epel

```
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
ARCH=$( /bin/arch )
subscription-manager repos --enable "codeready-builder-for-rhel-8-${ARCH}-rpms"
```
