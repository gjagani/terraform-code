https://msandbu.org/microsoft-premium-v2-ssd-csi-v2-and-aks-pvc-resizing/
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/expand-disks?tabs=ubuntu#expand-an-azure-managed-disk

az feature register --namespace Microsoft.Compute --name LiveResize
az feature show --namespace Microsoft.Compute --name LiveResize