I could not find an etcd image that build for both ARM and x86/x64 processors, so I created mine. 

## Build Arguments

> **Importante note**: The etcd used is from the official repo [etcd.io](https://github.com/etcd-io/etcd/releases), so the arguments must match wath they offer.


| Arg Name | Description | Example |
|---|---|---|
|ARCH| defines which architechute you want to build from. The values can be, but are not restrcited to am664 and arm64 | arm64 |
| ETCD_VER | Which etcd release will be installed | v3.5.1 |