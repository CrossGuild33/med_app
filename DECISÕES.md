
# 📑 Erros Encontrados, Decisões e Melhorias Propostas

## 🐞 Erros Encontrados

- **Necessidade de um valor:**
  Ao configurar o models da app "profissionais", houve um erro no `makemigrate`, pois nos campos exigidos não é aceito valores nulos. Para resolver pelo menos no início da fase de desenvolvimento, optei por um valor default "Não informado".

- **Conexão externa com banco AWS:**
  Ao utilizar meu IP na configuração do security group do banco AWS, bloqueei o acesso que não fosse local ao banco. Utilizei IP 0.0.0.0 padrão para possibilitar o acesso publico. Com isso resolvi o problema que estava havendo no `makemigrate`

- **Conexão com banco AWS RDS:**  
  Problema nas permissões do grupo de segurança (Security Group) bloqueando acessos externos. A solução foi ajustar as regras para liberar a porta 5432 para meu IP. Ainda assim, houve erro no `makemigrate` após a tentativa de implementação do banco na AWS.

- **Configuração do banco no Django:**  
  Inicialmente, as credenciais estavam expostas no `settings.py`. A solução foi implementar o uso de variáveis de ambiente com um arquivo `.env`, garantindo segurança das informações sensíveis.

- **Codificação de caracteres no PostgreSQL:**  
  Apareceu um erro `UnicodeDecodeError` na conexão, relacionado ao encoding. O problema foi resolvido ao garantir conexão com `SSL` e configuração correta de encoding no PostgreSQL.

## 🧠 Decisões Técnicas

- Adoção do **Django Rest Framework (DRF)** pela facilidade e robustez na construção de APIs RESTful.
- Uso do **PostgreSQL** como banco de dados, tanto localmente quanto na AWS RDS, por sua estabilidade, robustez e suporte a dados relacionais complexos.
- Containerização com **Docker**, garantindo ambientes replicáveis e facilitando o deploy.
- Pipeline de **CI/CD com GitHub Actions**, automatizando os processos de testes e deploy.
- Gerenciamento de variáveis sensíveis com o pacote **`python-dotenv`**.
- Definição de padrões de API com respostas em **JSON**, seguindo boas práticas REST.
- Na configuração do SecurityGroup na AWS, utilizei iP 0.0.0.0 para permitir o acesso público. 

## 🚀 Melhorias Propostas

- Implementar autenticação via **JWT Token**, tornando a API segura e pronta para produção.
- Desenvolver uma interface **frontend (React ou Next.js)** para consumo da API.
- Ampliar a cobertura de testes, incluindo **testes unitários e de integração**.
- Aplicar melhorias de segurança, como **rate limiting**, proteção contra brute force e **OAuth2**.
- Expandir a integração com a **API da Asaas**, incluindo funcionalidades de reembolso, cancelamento e relatórios financeiros.
- Implantar sistemas de **monitoramento e observabilidade**, como **Sentry, Prometheus e Grafana**, para detecção proativa de erros.
- Refatorar alguns endpoints para maior desacoplamento e escalabilidade futura.
- Na SecurityGroup da AWS utilizei um IP 0.0.0.0, há necessidade de usar opções mais seguras. 
