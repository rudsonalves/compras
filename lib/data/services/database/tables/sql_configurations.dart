class SqlConfigurations {
  SqlConfigurations._();

  static const String dbName = 'shopping.db';
  static const int dbVersion = 1;
  static const String enableForeignKeys = 'PRAGMA foreign_keys = ON';
}

const Map<String, List<String>> categories = {
  'Nenhuma': ['Nenhuma'],
  'Carnes': [
    'Carnes Vermelhas',
    'Aves',
    'Peixes e Frutos do Mar',
    'Suínos',
    'Embutidos',
    'Outros',
  ],
  'Frutas': [
    'Cítricas',
    'Tropicais',
    'Vermelhas',
    'Secas e Oleaginosas',
    'Polpa Congelada',
    'Outros',
  ],
  'Verduras e Legumes': [
    'Folhas e Hortaliças',
    'Raízes e Tubérculos',
    'Leguminosas',
    'Cogumelos',
    'Brotos e Germinados',
    'Outros',
  ],
  'Bebidas': [
    'Sucos',
    'Refrigerantes',
    'Água Mineral',
    'Bebidas Alcoólicas',
    'Café e Chás',
    'Outros',
  ],
  'Laticínios': [
    'Leites',
    'Queijos',
    'Iogurtes e Bebidas Lácteas',
    'Manteigas e Margarinas',
    'Cremes e Requeijões',
    'Outros',
  ],
  'Panificação e Cereais': [
    'Pães',
    'Biscoitos e Torradas',
    'Massas e Farinhas',
    'Cereais Matinais',
    'Grãos Integrais',
    'Outros',
  ],
  'Mercearia Geral': [
    'Conservas e Enlatados',
    'Condimentos e Temperos',
    'Óleos e Gorduras',
    'Doces e Sobremesas',
    'Snacks e Petiscos',
    'Outros',
  ],
  'Congelados': [
    'Pratos Prontos',
    'Vegetais Congelados',
    'Massas e Pizzas',
    'Sorvetes e Sobremesas Congeladas',
    'Carnes e Aves Congeladas',
    'Outros',
  ],
  'Higiene e Limpeza': [
    'Produtos de Higiene Pessoal',
    'Limpeza Doméstica',
    'Lavanderia',
    'Papelaria Doméstica',
    'Outros',
  ],
  'Cuidados Pet': [
    'Alimentos para Pets',
    'Higiene Pet',
    'Brinquedos e Acessórios',
    'Outros',
  ],
};
