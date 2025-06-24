class ShoppingModel {
  final String? id;
  final String name;
  final String description;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShoppingModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  ShoppingModel copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ShoppingModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
    map['description'] = description;
    map['price'] = price;
    map['created_at'] = createdAt.toIso8601String();
    map['updated_at'] = updatedAt.toIso8601String();

    return map;
  }

  factory ShoppingModel.fromMap(Map<String, dynamic> map) {
    return ShoppingModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }
}
