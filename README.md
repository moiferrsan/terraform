# Recursos essenciais AWS

Este projeto fornece os arquivos necessários para criação de um conjunto de recursos na AWS de acordo com as melhores práticas e diretrizes desse provedor.

A arquitetura inclui uma VPC completa com subnets privadas e públicas, assim como as rotas padrões para acesso a internet por ambas as subnets através de IGW e NAT. Inclue também, duas EC2's com servidores web (Apache e Nginx) que são acessados via ALB para o balanceamento de carga entre esses equipamentos.

![alt text](https://github.com/moiferrsan/terraform/blob/master/diagrama.jpg)

