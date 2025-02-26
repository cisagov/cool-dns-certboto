# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "certificates_bucket_name" {
  description = "The name to use for the S3 bucket that will store the certboto-docker certificates."
  nullable    = false
  type        = string
}

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  nullable    = false
  type        = string
}

variable "certificatesbucketfullaccess_role_description" {
  default     = "Allows full access to the S3 bucket where certboto-docker certificates are stored."
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where certboto-docker certificates are stored."
  nullable    = false
  type        = string
}

variable "certificatesbucketfullaccess_role_name" {
  default     = "CertificatesBucketFullAccess"
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where certboto-docker certificates are stored."
  nullable    = false
  type        = string
}

variable "certificatesbucketreadonly_role_description" {
  default     = "Allows read-only access to the S3 bucket where certboto-docker certificates are stored."
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows read-only access to the S3 bucket where certboto-docker certificates are stored."
  nullable    = false
  type        = string
}

variable "certificatesbucketreadonly_role_name" {
  default     = "CertificatesBucketReadOnly"
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the S3 bucket where certboto-docker certificates are stored."
  nullable    = false
  type        = string
}

variable "provisionaccount_role_name" {
  default     = "ProvisionAccount"
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the DNS account."
  nullable    = false
  type        = string
}

variable "provisioncertificatereadroles_role_description" {
  default     = "Allows provisioning of IAM roles that can read selected certificates in the certificates bucket in the DNS account."
  description = "The description to associate with the IAM role (as well as the corresponding policy) with the ability to create IAM roles that can read selected certificates in the certificates bucket in the DNS account."
  nullable    = false
  type        = string
}

variable "provisioncertificatereadroles_role_name" {
  default     = "ProvisionCertificateReadRoles"
  description = "The name to assign the IAM role (as well as the corresponding policy) with the ability to provision IAM roles that can read selected certificates in the certificates bucket in the DNS account."
  nullable    = false
  type        = string
}

variable "provisioncertificatesbucket_policy_description" {
  default     = "Allows provisioning of the S3 bucket where certboto-docker certificates are stored."
  description = "The description to associate with the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored."
  nullable    = false
  type        = string
}

variable "provisioncertificatesbucket_policy_name" {
  default     = "ProvisionCertificatesBucket"
  description = "The name to assign the IAM policy that allows provisioning of the S3 bucket where certboto-docker certificates are stored."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
