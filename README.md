# cool-dns-certboto #

[![GitHub Build Status](https://github.com/cisagov/cool-dns-certboto/workflows/build/badge.svg)](https://github.com/cisagov/cool-dns-certboto/actions)

Terraform code to create some roles related to the creation of and
access to a
[cisagov/certboto-docker](https://github.com/cisagov/certboto-docker)
bucket for SSL certificates in the COOL DNS account.

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| aws_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | string | `us-east-1` | no |
| certificates_bucket_name | The name to use for the S3 bucket that will store the certboto-docker certificates. | string | | yes |
| certificatesbucketfullaccess_role_description | The description to associate with the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where certboto-docker certificates are stored. | string | `Allows full access to the S3 bucket where certboto-docker certificates are stored.` | no |
| certificatesbucketfullaccess_role_name | The name to assign the IAM role (as well as the corresponding policy) that allows full access the S3 bucket where certboto-docker certificates are stored. | string | `CertificatesBucketFullAccess` | no |
| certificatesbucketreadonly_role_description | The description to associate with the IAM role (as well as the corresponding policy) that allows read-only access to the S3 bucket where certboto-docker certificates are stored. | string | `Allows read-only access to the S3 bucket where certboto-docker certificates are stored.` | no |
| certificatesbucketreadonly_role_name | The name to assign the IAM role (as well as the corresponding policy) that allows read-only access the S3 bucket where certboto-docker certificates are stored. | string | `CertificatesBucketReadOnly` | no |
| provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the DNS account. | string | `ProvisionAccount` | no |
| provisioncertificatereadroles_role_description | The description to associate with the IAM role (as well as the corresponding policy) with the ability to create IAM roles that can read selected certificates in the certificates bucket in the DNS account. | string | `Allows provisioning of IAM roles that can read selected certificates in the certificates bucket in the DNS account.` | no |
| provisioncertificatereadroles_role_name | The name to assign the IAM role (as well as the corresponding policy) with the ability to provision IAM roles that can read selected certificates in the certificates bucket in the DNS account. | string | `ProvisionCertificateReadRoles` | no |
| provisioncertificatesbucket_policy_description | The description to associate with the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored. | string | `Allows provisioning of the S3 bucket where certboto-docker certificates are stored.` | no |
| provisioncertificatesbucket_policy_name | The name to assign the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored. | string | `ProvisionCertificatesBucket` | no |
| tags | Tags to apply to all AWS resources provisioned. | map(string) | `{}` | no |
| users_account_id | The ID of the users account. | string | | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| certificates_bucket | The S3 bucket where certboto-docker certificates will be stored. |
| certificatesbucketfullaccess_role | The IAM role that allows full access to the certboto-docker certificates bucket in the DNS account. |
| certificatesbucketreadonly_role | The IAM role that allows read-only access to the certboto-docker certificates bucket in the DNS account. |
| provisioncertificatereadroles_role | The IAM role with the ability to provision IAM roles that can read selected certificates in the certificates bucket in the DNS account. |
| provisioncertificatesbucket_policy | The IAM policy that allows provisioning of the certboto-docker certificates bucket in the DNS account. |

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
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
