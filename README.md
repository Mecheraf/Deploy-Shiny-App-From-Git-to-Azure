# Clone a private Repo and deploy shiny R app on Azure
The PS1 file will provide everything's needed to deploy a Shiny R app on the Azure's Cloud.
The dockerfile will clone your project thanks to a Personal Access Token, create a container with the minimum required for a Shiny R App and push the container to Azure.

# Warnings
- For a security measure, I would suggest to create a Personal Access Token with the minimum required.
- If you want to use this code for your company's project, do not write your personal access token directly in your code. 
You can use docker args when you build your image instead, grab a Env Variable or an Azure Key Vault's password for exemple. :grin:

Inspired by [@JoeT531](https://github.com/TBDSolutions/deploy_shiny_app_to_the_cloud)'s work.