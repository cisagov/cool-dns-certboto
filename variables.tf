# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "certificates_bucket_name" {
  type        = string
  description = "The name to use for the S3 bucket that will store the certboto-docker certificates."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "certificatesbucketfullaccess_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where certboto-docker certificates are stored."
  default     = "Allows full access to the S3 bucket where certboto-docker certificates are stored."
}

variable "certificatesbucketfullaccess_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where certboto-docker certificates are stored."
  default     = "CertificatesBucketFullAccess"
}

variable "certificatesbucketreadonly_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows read-only access to the S3 bucket where certboto-docker certificates are stored."
  default     = "Allows read-only access to the S3 bucket where certboto-docker certificates are stored."
}

variable "certificatesbucketreadonly_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the S3 bucket where certboto-docker certificates are stored."
  default     = "CertificatesBucketReadOnly"
}

variable "provisionaccount_role_name" {
  type        = string
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the DNS account."
  default     = "ProvisionAccount"
}

variable "provisioncertificatereadroles_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) with the ability to create IAM roles that can read selected certificates in the certificates bucket in the DNS account."
  default     = "Allows provisioning of IAM roles that can read selected certificates in the certificates bucket in the DNS account."
}

variable "provisioncertificatereadroles_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) with the ability to provision IAM roles that can read selected certificates in the certificates bucket in the DNS account."
  default     = "ProvisionCertificateReadRoles"
}

variable "provisioncertificatesbucket_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored."
  default     = "Allows provisioning of the S3 bucket where certboto-docker certificates are stored."
}

variable "provisioncertificatesbucket_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored."
  default     = "ProvisionCertificatesBucket"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources provisioned."
  default     = {}
}
