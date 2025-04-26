

# Terraform Azure Infrastructure Setup

This project uses Terraform to provision Azure infrastructure in a modular and environment-specific way.

## Directory Structure

```
.
├── README.md
├── prerequisite.sh
├── setup_tf.sh
└── terraform
    ├── commons             # Reusable module containing the common infrastructure
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── environments        # Environment-specific configurations (dev/test can be added similarly)
        └── production
            ├── main.tf
            ├── outputs.tf
            ├── providers.tf
            └── variables.tf
```

## Setup Instructions

### 1. Prerequisites

Before running Terraform commands, ensure you are authenticated with Azure:

```bash
source prerequisite.sh
```

This will export the required environment variables for Azure authentication:
- `ARM_CLIENT_ID`
- `ARM_CLIENT_SECRET`
- `ARM_SUBSCRIPTION_ID`
- `ARM_TENANT_ID`

> **Note**: Never commit the `prerequisite.sh` file with sensitive values to version control.

---

### 2. Setting up Backend Storage for Terraform State

Run the following script to create the Resource Group, Storage Account, and Blob Container for storing the remote Terraform state:

```bash
bash setup_tf.sh
```

This script creates:
- Resource Group: `mediqRG`
- Storage Account: `tf_sa`
- Container: `tfstate`

> **Note**: Update `setup_tf.sh` if you need to change the storage account settings or location.

---

### 3. Environment Variables for Sensitive Values

Sensitive Terraform variables (like Windows admin password) must be passed securely via environment variables:

```bash
export TF_VAR_windows_admin_password="your-secure-password"
export TF_VAR_windows_admin_user="your-username"
```

Terraform automatically picks up variables prefixed with `TF_VAR_`.

---

### 4. Initialize and Apply Terraform

Navigate to the environment directory you want to deploy (e.g., `production`):

```bash
cd terraform/environments/production
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

---

## Adding New Environments (e.g., dev, test)

To create a new environment like `dev` or `test`:
1. Copy the `production/` directory.
2. Update any environment-specific variables inside `variables.tf` and `main.tf`.
3. Set up a new state file key (optional) for each environment in `providers.tf`.

---

## Enhancements

✅ Planned:
- **GitHub Actions Pipeline**: Automate Terraform plan and apply with manual approval in PR workflow.

---

## Notes

- Azure authentication is **mandatory** before running any Terraform command.
- Terraform state is stored remotely in Azure Storage with state locking enabled to avoid conflicts.
- Modular structure allows easy scaling to multiple environments with minimum changes.

