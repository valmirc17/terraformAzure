variable "location" {
  description = "Localização onde os recursos serão criados"
  type        = string
  default     = "brazilsouth"

}

variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
  default     = "rg-terraform"

}
