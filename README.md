# Recursos essenciais AWS

Este projeto fornece os arquivos necessários para criação de um conjunto de recursos na AWS que podem ser utilizados para iniciação de um ambiente de produção de acordo com as melhores práticas e diretrizes da AWS.

A arquetetura inclue uma AWS VPC completa com subnets privadas e publicas, assim como as rotas padrões para acesso a internet por ambas as subnets através de IGW e NAT. Inclue também, duas EC2's com servidores web (Apache e Nginx) atrás de um ALB que faz o balanceamento de carga entre esses equipamentos.

![alt text](https://github.com/moiferrsan/terraform/blob/master/diagrama.jpg)

