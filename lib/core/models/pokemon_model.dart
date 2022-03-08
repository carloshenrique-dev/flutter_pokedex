import 'dart:convert';

class PokemonModel {
  final String? name;
  final String? spriteUrl;
  PokemonModel({
    this.name,
    this.spriteUrl,
  });

  PokemonModel copyWith({
    String? name,
    String? spriteUrl,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      spriteUrl: spriteUrl ?? this.spriteUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'spriteUrl': spriteUrl,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'],
      spriteUrl: map['spriteUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) => PokemonModel.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonModel(name: $name, spriteUrl: $spriteUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PokemonModel &&
      other.name == name &&
      other.spriteUrl == spriteUrl;
  }

  @override
  int get hashCode => name.hashCode ^ spriteUrl.hashCode;
}
