| Construindo e Monitorando uma Aplicação do Zero |

Este projeto integra desenvolvimento, containerização, orquestração, automação e monitoramento, mostrando minha dedicação em me preparar para uma carreira em DevOps. 

📋 Visão Geral do Projeto:
Criei uma aplicação Python Flask, containerizei com Docker, implantei em um cluster Kubernetes local (Kind), gerenciei a infraestrutura com Terraform, automatizei o build com GitHub Actions e implementei monitoramento com Prometheus e Grafana. A aplicação responde "Hello, World!" e expõe métricas de requisições, visualizadas em dashboards. Como foi a primeira vez que lidei com Prometheus + Grafana, confesso que travei na última etapa do projeto e tive dificuldades em avançar.

Ferramentas Utilizadas:
Python (Flask): Backend da aplicação com endpoint de métricas.
Docker: Containerização para portabilidade e consistência.
Kubernetes (Kind): Orquestração da aplicação em um cluster local.
Terraform: Gerenciamento de infraestrutura como código (IaC).
GitHub Actions: Pipeline CI/CD para automação de build e push.
Prometheus: Coleta de métricas da aplicação.
Grafana: Visualização de métricas em dashboards interativos.

Desenvolvimento da Aplicação:
Criei uma API Flask em Python (app.py) com um endpoint / que retorna "Hello, World!" e um endpoint de métricas Prometheus em :8000.
Configurei dependências em requirements.txt (Flask e prometheus_client).
Testei localmente com python app.py.

Containerização com Docker:
Escrevi um Dockerfile para empacotar a aplicação em uma imagem (myapp:latest).
Construí a imagem com docker build -t myapp:latest ..
Testei localmente com docker run -p 5000:5000 -p 8000:8000 myapp:latest.

Criação do Cluster Kubernetes:
Configurei um cluster local com Kind usando kind create cluster --name mycluster.
Carreguei a imagem Docker no cluster com kind load docker-image myapp:latest --name mycluster.

Implantação com Terraform:
Criei main.tf para definir um deployment e serviço Kubernetes, expondo a aplicação via NodePort.
Inicializei e apliquei com terraform init e terraform apply.
Acessei a aplicação com kubectl port-forward service/myapp 5000:80.

Automação com GitHub Actions:
Configurei um pipeline CI/CD em ci.yml para build e push da imagem para o Docker Hub.
Adicionei segredos (DOCKER_USERNAME, DOCKER_PASSWORD) no GitHub.
Testei o pipeline com push para o repositório.

Monitoramento com Prometheus e Grafana:
Usei monitoring.tf com Helm para instalar Prometheus e Grafana no cluster.
Configurei o Prometheus para raspar métricas em myapp:8000.
Criei um dashboard no Grafana para visualizar a métrica request_count.

Post no Linkedin com capturas de tela: https://www.linkedin.com/feed/update/urn:li:activity:7352834129035509761/


Desafios Superados:
Depuração demorada: Passei horas travado, mas aprendi a usar ferramentas como kubectl logs e docker logs para diagnosticar problemas, reforçando minha resiliência.

hashtag#DevOps hashtag#Kubernetes hashtag#Docker hashtag#Terraform hashtag#Python hashtag#GitHubActions hashtag#Prometheus hashtag#Grafana
