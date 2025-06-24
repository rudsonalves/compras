# Registro de Compras - Arquitetura

- Cadastro de Compras de Mercado
- Cadastro de Itens de compras
- Associação do código de barras (ou QRCode) aos produtos para inserção rápida no carrinho
- Associação do produto ao carrinho
- Gerar relatório de variações de preços dos produtos entre as comprar

## Objetivo 

Um usuário necessita controlar suas compras registrando os itens comprados e o valor total da compra. Verificar as alterações nos preços dos produtos e de suas compras mensais.

## Cadastro das Compras

O usuário poderá cadastrar as compras em seu carrinho e verificar variações mensais de suas compras ao longo dos meses.

## Cadastro dos Itens de Compras

Os itens das compras podem ser cadastrados e ter seu preços comparados a compras anteriores.

# Arquitetura

O projeto vai ser desenvolvido com a arquitetura proposta pelo time do Flutter MVVM, em três camadas básicas:

- **Data Layer**: camada para os *repositories* e *services*. 
    - o *repository* é a fonte de verdade (*source of truth*) de dados, mantendo o cache e podendo ser reativo para mudanças nos dados armazenados. 
    - O *service* implementa uma abstração sobre tecnologia da base de dados.
- **Domain Layer**: camada para os *models* e *user-cases*.
    - Os *models* representam os dados que serão armazenados no banco de dados.
    - Os *user-cases* são implementados para:
        - regras de negócio complexas
        - acesso a mais de um *repository*
        - quando um *repository* precisa ser acessados por diversas uis, a fim de evitar duplicação de código.
- **UI Layer**: camada para as *views* e *view-models*.
    - As *views* representam as telas da aplicação.
    - Os *view-models* implementam a lógica de negócio das *views*, conectando as *views* aos *repositories*, ou aos *user-cases* nos casos declarados acima.


    ![MVVM](https://docs.flutter.dev/assets/images/docs/app-architecture/guide/feature-architecture-simplified-with-logic-layer.png)