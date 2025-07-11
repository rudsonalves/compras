# Introdução

**Compras** é um projeto criado a partir de uma demanda de minha querida ex-esposa Jeani Daniela Bortolini para simplificar o controle e o acompanhamento das compras dos usuários.

## Produto Mínimo Viável

Nesta primeira versão, o aplicativo irá focar em:

* Registrar os itens comprados e o valor total de cada compra.
* Monitorar variações de preço dos produtos ao longo do tempo.
* Exibir um histórico mensal de gastos e alterações de valores.

Para isso, a aplicação utilizará um banco de dados SQLite local, contendo uma lista genérica de produtos pré-cadastrados.

## Versão Final

Em versões posteriores, o sistema será ampliado para:

* Registrar as compras realizadas em um servidor remoto, com autenticação de usuários e gerenciamento de contas.
* Conectar-se a uma API externa para obter dados de produtos via código de barras.
* Permitir ao usuário criar, editar e gerenciar listas de compras.
* Gerar recomendações de melhores locais de compra com base em índices de preço e perfil de consumo.
* Calcular índices de inflação dos preços dos produtos ao longo do tempo.
* Cruzar dados de diferentes consumidores em diversas regiões para análises comparativas.
* Adicionar exportação de comprar para planilhas xml ou csv.
