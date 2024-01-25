# Demo 2 - IaC and NaverCloud

NaverCloud OpenTofu/Terrform provider: [docs](https://registry.terraform.io/providers/NaverCloudPlatform/ncloud/latest/docs) and [registry](https://github.com/opentofu/registry/tree/main/providers/n/NaverCloudPlatform).

## Initialization and download of the providers

```bash
tofu init
```

## Generate ACCESS_KEY and SECRET_KEY

Go to [ncloud.com/mypage/manage/authkey](https://www.ncloud.com/mypage/manage/authkey),

## Shift-left

### Plan

```bash
export NCLOUD_ACCESS_KEY=
export NCLOUD_SECRET_KEY=
export NCLOUD_REGION="KR"
   
# get the plan
tofu plan -input=false -out=tofu_plan.out
  
# export plan to json
tofu show -json tofu_plan.out > tofu_plan_out.json
```

### Policies with Conftest

Shift-left policies with policy-as-code, example with [conftest](https://www.conftest.dev/):

```bash
cat policy_mandatory_tags.rego

conftest test -p policy_mandatory_tags.rego tofu_plan_out.json
```

The best part, you can validate the changes before they happen early in the process!


### Existing tools

Shift-left security (more in this [blog post](https://spacelift.io/blog/integrating-security-tools-with-spacelift)):

- [tfsec](https://github.com/aquasecurity/tfsec):

```bash
tfsec
```

- [kics](https://docs.kics.io/):

```bash
docker run -v .:/tf checkmarx/kics:latest scan -p "/tf" -o "/tf/"
```

## Apply

```bash
tofu apply
```
