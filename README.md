# Terraform GCP Cloud SQL

A reference project to provision a Google Cloud Platform Cloud SQL database with public IP address

## Pre-requisites

- You have installed [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli):

```bash
terraform -help # prints Terraform options
```

## Deploy

```bash
gcloud auth application-default login # authenticate with GCP
cd deploy # change to deploy directory
terraform init # initialises Terraform
terraform apply # deploys GCP stack
terraform destroy # destroys GCP stack
```

## Connect to Cloud SQL

- Connect to Cloud SQL using `psql`:

```bash
psql postgresql://app-user:<PASSWORD>@<CLOUD-SQL-IP>:5432/ecommerce
psql postgresql://app-user:<PASSWORD>@<CLOUD-SQL-IP>:5432/ecommerce -f sql/seed.sql # create seed data
```

- Connect to Cloud SQL using [Cloud SQL Auth proxy](https://cloud.google.com/sql/docs/mysql/connect-instance-auth-proxy):

```bash
# cd <location-to-cloud-sql-proxy>
./cloud-sql-proxy <INSTANCE_CONNECTION_NAME>
psql -h localhost -d ecommerce -U app
```

- Connect to Cloud SQL using _and_ automatic IAM database authentication:

```bash
# cd <location-to-cloud-sql-proxy>
./cloud-sql-proxy <INSTANCE_CONNECTION_NAME> -i -c <LOCATION-TO-DB-USER-SERVICE-ACCOUNT-JSON>
psql "dbname=ecommerce host=127.0.0.1 user=db-iam-user@<project-id>.iam"
```

## Create a table

```
CREATE TABLE users(
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE orders(
    id SERIAL NOT NULL PRIMARY KEY,
    user_id INT NOT NULL references users(id)
);
```

## Connect to loca PostgreSQL

```bash
psql postgresql://db_user:password@localhost:5432/ecommerce
psql postgresql://db_user:password@localhost:5432/ecommerce -f sql/seed.sql # create seed data
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

If you find this project helpful, please give a :star: or even better buy me a coffee :coffee: :point_down: because I'm a caffeine addict :sweat_smile:

<a href="https://www.buymeacoffee.com/matlau" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## License

[MIT](https://choosealicense.com/licenses/mit/)
