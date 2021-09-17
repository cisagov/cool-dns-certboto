# cool-dns-certboto #

[![GitHub Build Status](https://github.com/cisagov/cool-dns-certboto/workflows/build/badge.svg)](https://github.com/cisagov/cool-dns-certboto/actions)

Terraform code to create some roles related to the creation of and
access to a
[cisagov/certboto-docker](https://github.com/cisagov/certboto-docker)
bucket for SSL certificates in the COOL DNS account.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.14.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.dnsprovisionaccount | ~> 3.38 |
| aws.organizationsreadonly | ~> 3.38 |
| terraform | n/a |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_policy.certificatesbucketfullaccess_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.certificatesbucketreadonly_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.provisioncertificatereadroles_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.provisioncertificatesbucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.certificatesbucketfullaccess_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.certificatesbucketreadonly_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.provisioncertificatereadroles_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.certificatesbucketfullaccess_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.certificatesbucketreadonly_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.provisioncertificatereadroles_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.provisioncertificatesbucket_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.certificates](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.certificates](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.certificatesbucketfullaccess_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.certificatesbucketreadonly_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.provisioncertificatereadroles_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.provisioncertificatesbucket_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.cool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [terraform_remote_state.dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.master](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| certificates\_bucket\_name | The name to use for the S3 bucket that will store the certboto-docker certificates. | `string` | n/a | yes |
| certificatesbucketfullaccess\_role\_description | The description to associate with the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where certboto-docker certificates are stored. | `string` | `"Allows full access to the S3 bucket where certboto-docker certificates are stored."` | no |
| certificatesbucketfullaccess\_role\_name | The name to assign the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where certboto-docker certificates are stored. | `string` | `"CertificatesBucketFullAccess"` | no |
| certificatesbucketreadonly\_role\_description | The description to associate with the IAM role (as well as the corresponding policy) that allows read-only access to the S3 bucket where certboto-docker certificates are stored. | `string` | `"Allows read-only access to the S3 bucket where certboto-docker certificates are stored."` | no |
| certificatesbucketreadonly\_role\_name | The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the S3 bucket where certboto-docker certificates are stored. | `string` | `"CertificatesBucketReadOnly"` | no |
| provisionaccount\_role\_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the DNS account. | `string` | `"ProvisionAccount"` | no |
| provisioncertificatereadroles\_role\_description | The description to associate with the IAM role (as well as the corresponding policy) with the ability to create IAM roles that can read selected certificates in the certificates bucket in the DNS account. | `string` | `"Allows provisioning of IAM roles that can read selected certificates in the certificates bucket in the DNS account."` | no |
| provisioncertificatereadroles\_role\_name | The name to assign the IAM role (as well as the corresponding policy) with the ability to provision IAM roles that can read selected certificates in the certificates bucket in the DNS account. | `string` | `"ProvisionCertificateReadRoles"` | no |
| provisioncertificatesbucket\_policy\_description | The description to associate with the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored. | `string` | `"Allows provisioning of the S3 bucket where certboto-docker certificates are stored."` | no |
| provisioncertificatesbucket\_policy\_name | The name to assign the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored. | `string` | `"ProvisionCertificatesBucket"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| certificates\_bucket | The S3 bucket where certboto-docker certificates will be stored. |
| certificatesbucketfullaccess\_role | The IAM role that allows full access to the certboto-docker certificates bucket in the DNS account. |
| certificatesbucketreadonly\_role | The IAM role that allows read-only access to the certboto-docker certificates bucket in the DNS account. |
| provisioncertificatereadroles\_role | The IAM role with the ability to provision IAM roles that can read selected certificates in the certificates bucket in the DNS account. |
| provisioncertificatesbucket\_policy | The IAM policy that allows provisioning of the certboto-docker certificates bucket in the DNS account. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
