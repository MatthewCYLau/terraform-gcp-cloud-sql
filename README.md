# GCP Cloud SQL

A reference project to provision a Google Cloud Platform Cloud SQL database with public IP address

## Pre-requisites

- You have installed [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli):

```bash
terraform -help # prints Terraform options
```

## Configurations

- Populate the variables in `terraform.tfvars`

```bash
project                = <GCP-PROJECT-ID>
# and other variables
```

- Create a secret on [Secret Manager](https://cloud.google.com/secret-manager) for Cloud SQL database password

## Deploy

```bash
gcloud auth application-default login # authenticate with GCP
cd deploy # change to deploy directory
terraform init # initialises Terraform
terraform apply # deploys GCP stack
terraform destroy # destroys GCP stack
```

## Connect to Cloud SQL

- Connect to Cloud SQL to view database tables:

```bash
psql postgresql://postgresql-database-user:<DB-PASSWORD>@<CLOUD-SQL-IP>:5432/react-serverless-gcp-database
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

If you find this project helpful, please give a :star: or even better buy me a coffee :coffee: :point_down: because I'm a caffeine addict :sweat_smile:

<a href="https://www.buymeacoffee.com/matlau" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## License

[MIT](https://choosealicense.com/licenses/mit/)
