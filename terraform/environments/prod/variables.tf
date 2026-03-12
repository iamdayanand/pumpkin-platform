variable "location" {
  description = "Azure region"
  type        = string
}


variable "tags" {
  description = "Common tags for resources"
  type        = map(string)

  default = {
    project = "pumpkin-platform"
    env     = "prod"
  }
}