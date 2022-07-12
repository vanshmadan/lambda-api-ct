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
- IAM Policy
- Lambda function
- Api Gateway
- SNS topic
- Cloudtrail
- Evenrule

File/content upload using api gateway url
<img width="852" alt="image" src="https://user-images.githubusercontent.com/31353777/178599479-e54302ac-a262-4ce9-a3ee-e4080ea7b901.png">

<img width="1278" alt="image" src="https://user-images.githubusercontent.com/31353777/178599562-419d5598-05f1-4dd8-ac4a-64557bdc21f9.png">



