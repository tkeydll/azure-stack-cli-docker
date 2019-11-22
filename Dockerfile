FROM mcr.microsoft.com/azure-cli:2.0.76

# Parameters
ARG ca_cert_file=./root.pem
ARG environment_name=AzureStackUser
ARG endpoint_resource_manager=https://management.local.azurestack.external
ARG suffix_storage_account=local.azurestack.external
ARG suffix_keyvault_dns=.vault.local.azurestack.external
ARG endpoint_vm_image_alias_doc=https://raw.githubusercontent.com/Azure/azure-rest-api-specs/master/arm-compute/quickstart-templates/aliases.json
ARG api_version=2019-03-01-hybrid

# Add cacert.
WORKDIR /root/azure-cli
COPY ${ca_cert_file} .
RUN cat ${ca_cert_file} >> /usr/local/lib/python3.6/site-packages/certifi/cacert.pem

RUN export AZURE_CLI_DISABLE_CONNECTION_VERIFICATION=1 && \
    export ADAL_PYTHON_SSL_NO_VERIFY=1

# Register azure cli
RUN az cloud register -n ${environment_name} \
    --endpoint-resource-manager ${endpoint_resource_manager} \
    --suffix-storage-endpoint ${suffix_storage_account} \
    --suffix-keyvault-dns ${suffix_keyvault_dns} \
    --endpoint-vm-image-alias-doc ${endpoint_vm_image_alias_doc}

# Change to Azure Stack User
RUN az cloud set -n ${environment_name}
RUN az cloud update --profile ${api_version}

# Set proxy
ENV HTTP_PROXY ${http_proxy}
ENV HTTPS_PROXY ${https_proxy}
