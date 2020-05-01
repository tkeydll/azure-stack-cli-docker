# azure-stack-cli-docker
Azure CLI connected to Azure Stack Integrated System Docker Image.

This image will perform the following operation.

https://docs.microsoft.com/en-us/azure-stack/user/azure-stack-version-profiles-azurecli2?view=azs-1908


## Docker build

```bash
docker build . -t tkeydll/azure-stack-cli:2.4.0 \
--build-arg endpoint_resource_manager=https://management.<FQDN> \
--build-arg suffix_storage_account=<FQDN> \
--build-arg suffix_keyvault_dns=.vault.<FQDN> \
--build-arg api_version=<your_api_version>
```

### If you use under proxy

Add arguments in docker build.

```bash
--build-arg http_proxy=http://<proxy_server>:<port> \
--build-arg https_proxy=https://<proxy_server>:<port>
```

## Run container and Login AzureStack

```bash
> docker run -it tkeydll/azure-stack-cli:2.4.0
bash-4.4# az login
```
