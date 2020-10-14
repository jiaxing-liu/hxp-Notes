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
