# S3 Bucket and IAM Users Terraform Project

This Terraform project creates a private S3 bucket for storing images and sets up two IAM users with different access levels to the bucket.

## Project Structure

```
project-root/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── modules/
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── iam/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version 1.0.0 or newer)
- AWS CLI configured with appropriate credentials

## Configuration

1. Update the `variables.tf` file with your desired values:

    ```hcl
    variable "environment" {
        description = "Deployment environment (e.g., dev, staging, prod)"
        type        = string
        default     = "dev"
    }

    variable "bucket_name" {
        description = "Name of the S3 bucket"
        type        = string
    }
    ```

2. (Optional) Modify the `provider.tf` file if you need to change the AWS region:

```hcl
provider "aws" {
  region = "eu-south-1"  # Change this to your desired region
}
```

## Usage

1. Initialize the Terraform working directory:

   ``` bash
   terraform init
   ```

2. Review the planned changes:

   ``` bash
   terraform plan
   ```

3. Apply the changes:

    ``` bash
    terraform apply
    ```

4. When prompted, type `yes` to confirm the changes.

## Outputs

After applying the Terraform configuration, you'll see the following outputs:

- `write_user_access_key`: Access key for the write user (sensitive)
- `write_user_secret_key`: Secret key for the write user (sensitive)
- `read_user_access_key`: Access key for the read-only user (sensitive)
- `read_user_secret_key`: Secret key for the read-only user (sensitive)

To view sensitive outputs, use the following command:

``` bash
terraform output -json
```

## IAM Users

This project creates two IAM users:

1. **IASAI-write-worker**: Has full permissions to upload, modify, delete, and read all files in the S3 bucket.
2. **IASAI-read-worker**: Has read-only permissions for the S3 bucket.

## Cleaning Up

To remove all resources created by this Terraform configuration:

``` bash
terraform destroy
```

When prompted, type `yes` to confirm the deletion of resources.

## Security Considerations

- The IAM user credentials (access keys and secret keys) are marked as sensitive. Handle them securely and avoid committing them to version control.
- Consider using AWS Secrets Manager or another secure secret storage solution for managing the IAM user credentials in production environments.
- Regularly rotate the IAM user access keys as per your organization's security policies.

## Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request with your proposed changes.

## License

This project is licensed under the MIT License.
