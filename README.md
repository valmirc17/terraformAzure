# terraformAzure
## Implantando WordPress na Azure com Terraform

Como implantar um site WordPress na Azure usando o Terraform. A automação completa provisiona uma VM, instala o Docker, configura e executa containers separados para o WordPress e o banco de dados MySQL, e garante a retenção de dados durante upgrades do WordPress.

**Pré-requisitos:**

* Conta Azure com acesso ao CLI da Azure
* Conta GitHub
* Terraform instalado localmente
* Conhecimento básico de Terraform, Docker e WordPress

**Instruções:**

1. **Clone o Repositório:** Clone este repositório GitHub para sua máquina local.
2. **Configure as Variáveis:** Edite o arquivo `variables.tf` no diretório raiz do projeto e defina as variáveis de acordo com seu ambiente:
    * `resource_group_name`: Nome do grupo de recursos da Azure
    * `location`: Local da instância da VM da Azure
    * `admin_username`: Nome de usuário do administrador da VM
    * `admin_password`: Senha do administrador da VM
    * `network_security_group_name`: Nome do grupo de segurança da rede
3. **Inicialize o Terraform:** Abra um terminal no diretório raiz do projeto e execute os seguintes comandos:
    * `terraform init`: Inicializa o Terraform e baixa os provedores necessários
    * `terraform plan`: Gera um plano de execução que mostra as alterações que serão feitas
    * `terraform apply`: Aplica as alterações e provisiona os recursos na Azure
4. **Acesse o WordPress:** Aguarde a conclusão da aplicação do Terraform. O endereço IP da VM contendo o WordPress será exibido na saída do comando `terraform apply`. Acesse este endereço em um navegador web para visualizar o site WordPress.
5. **Destruição da Infraestrutura**: Se você não precisar mais da infraestrutura provisionada, você pode destruí-la usando o comando:
    * `terraform destroy`: Destrói todos os recursos criados pelo Terraform