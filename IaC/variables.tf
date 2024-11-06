variable "bucket_name" {
  description = "Name for the bucket which stores the website"
  type        = string
  default = "cloud-resume-challenge-bucket-for-website"
}
variable "oac_name" {
  description = "OAC name of cloudfront cdn"
  type = string
  default = "cloud-resume-challenge-oac"
}