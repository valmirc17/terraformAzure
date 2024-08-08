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

variable "address_space" {
    description = "Espaço da rede virtual"
    type = list(string)
    default = [ "10.0.0.0/16" ]

}

variable "subnet_prefix" {
    description = "Prefixo de enredeço da sub-rede"
    type = list(string)
    default = [ "10.0.1.0/24" ]
  
}