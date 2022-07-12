# lambda-api-ct

## Prerequisites

- Installation of terraform.
- Aws accout with credentials/roles

## Procedure

### Step 1 : Clone git Repository

```bash
git clone <repo-url>
```

### Step 2 : Run terraform init
```bash
terraform init
```

### Step 2 : Run terraform plan
```bash
terraform plan
```

### Step 2 : Finally, run terraform apply
```bash
terraform apply
```

Resource which will be created
- IAM Roles
- IAM POLICY
- Lambda function
- Api Gateway
- SNS topic
- Cloudtrail
- Evenrule

File/content upload using api gateway url

<img width="826" alt="image" src="https://user-images.githubusercontent.com/31353777/178599256-4eddb25b-fe07-4423-b8a8-99e7a6161244.png">


