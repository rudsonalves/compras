class ProductModel {
  final int? id;
  final String name;
  final String? barCode;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    this.id,
    required this.name,
    this.barCode,
    required this.price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  ProductModel copyWith({
    int? id,
    String? name,
    String? barCode,
    int? price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      barCode: barCode ?? this.barCode,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    if (barCode != null) {
      map['bar_code'] = barCode;
    }
    map['price'] = price;
    map['created_at'] = createdAt.toIso8601String();
    map['updated_at'] = updatedAt.toIso8601String();

    return map;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      name: map['name'] as String,
      barCode: map['bar_code'] as String?,
      price: map['price'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }
}
