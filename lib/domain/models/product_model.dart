class ProductModel {
  final String? id;
  final String shoppingId;
  final String name;
  final String? description;
  final String? barCode;
  final int prince;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    this.id,
    required this.shoppingId,
    required this.name,
    this.description,
    this.barCode,
    required this.prince,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  ProductModel copyWith({
    String? id,
    String? shoppingId,
    String? name,
    String? description,
    String? barCode,
    int? prince,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      shoppingId: shoppingId ?? this.shoppingId,
      name: name ?? this.name,
      description: description ?? this.description,
      barCode: barCode ?? this.barCode,
      prince: prince ?? this.prince,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
    }
    map['shopping_id'] = shoppingId;
    map['name'] = name;
    if (description != null) {
      map['description'] = description;
    }
    if (barCode != null) {
      map['bar_code'] = barCode;
    }
    map['prince'] = prince;
    map['created_at'] = createdAt.toIso8601String();
    map['updated_at'] = updatedAt.toIso8601String();

    return map;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      shoppingId: map['shopping_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String?,
      barCode: map['bar_code'] as String?,
      prince: map['prince'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }
}
