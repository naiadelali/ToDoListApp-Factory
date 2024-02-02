# ToDoListApp - Estrutura do Projeto

O projeto ToDoListApp é estruturado seguindo uma abordagem modular, com foco na clareza, separação de responsabilidades e facilidade de manutenção. Cada módulo dentro do projeto é projetado para ser autossuficiente, contendo todas as dependências necessárias para sua execução, incluindo a lógica de negócios, acesso a dados, apresentação e injeção de dependência. Esta abordagem facilita a escalabilidade do projeto e a reutilização de módulos em diferentes partes do aplicativo ou em outros projetos.

## Estrutura de Pastas

A estrutura de pastas do módulo ToDo é dividida em três camadas principais, seguindo os princípios da Arquitetura Limpa (Clean Architecture): `Data`, `Domain` e `Presentation`. Além disso, a injeção de dependência é realizada dentro do próprio módulo, ao invés de ser centralizada em uma camada compartilhada (`Shared`). A seguir, detalhei cada parte da estrutura:

### Data
Responsável pelo acesso e manipulação dos dados. Inclui:
- **Datasource**: Define as fontes de dados (por exemplo, APIs, bancos de dados locais) e suas respectivas interfaces (`Protocols`).
- **Mappers**: Contém lógica para mapear dados entre as camadas `Data` e `Domain`.
- **Models**: Define os modelos de dados utilizados na camada `Data`.
- **Repositories**: Implementa os repositórios que consomem os `Datasources` e fornecem dados para a camada `Domain`.

### Domain
Contém a lógica de negócios do módulo. Inclui:
- **Entities**: Define as entidades do domínio, que são independentes das fontes de dados específicas.
- **Repositories**: Interfaces dos repositórios, definindo o contrato para o acesso a dados.
- **UseCases**: Lógica de negócios específica, que opera sobre os dados fornecidos pelos repositórios.

### Presentation
Responsável pela apresentação dos dados ao usuário. Inclui:
- **DI (Injeção de Dependência)**: Configuração das dependências necessárias para o módulo, garantindo a separação entre a criação de objetos e sua utilização.
- **Views e ViewModels**: Definem a interface do usuário e a lógica de apresentação.

## Injeção de Dependência no Módulo ToDo

Optamos por realizar a injeção de dependência dentro do próprio módulo ToDo por vários motivos:
- **Autonomia**: Cada módulo gerencia suas próprias dependências, tornando-o autônomo e facilmente reutilizável em diferentes contextos.
- **Encapsulamento**: Mantém as dependências do módulo internas, evitando acoplamentos desnecessários com o restante do aplicativo.
- **Flexibilidade**: Facilita a substituição ou modificação de dependências dentro do módulo sem afetar outros componentes do sistema.
