variable "location" {
    description = "Região aonde os recursos serão criados"
    type = string
    default = "brazilsouth"
  
}

variable "resource_group_name" {
    description = "Nome do grupo de recursos"
    type = string
    default = "terraform-docker"
  
}

variable "address_space" {
    description = "Espaço da rede virtual"
    type = list(string)
    default = [ "192.168.0.0/16" ]

}

variable "subnet_prefix" {
    description = "Prefixo de enredeço da sub-rede"
    type = list(string)
    default = [ "192.168.1.0/24" ]
  
}

variable "network_security_group_name" {
    description = "Nome do grupo de Segurança"
    type = string
    default = "SG - Terraform"
  
}