# azure-stack-cli-docker
Azure CLI connected to Azure Stack Integrated System Docker Image.


## Docker build

```bash
docker build . -t tkeydll/azure-stack-cli:2.0.75 \
--build-arg endpoint_resource_manager=https://management.<FQDN> \
--build-arg suffix_storage_account=<FQDN> \
--build-arg suffix_keyvault_dns=.vault.<FQDN> \
--build-arg api_version=<your api version> \
--build-arg http_proxy=http://<proxy server>:<port> \
--build-arg https_proxy=https://<proxy server>:<port>
```
