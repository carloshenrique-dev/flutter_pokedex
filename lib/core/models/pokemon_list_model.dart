import 'dart:convert';

class PokemonListModel {
  final String? name;
  final String? url;
  PokemonListModel({
    this.name,
    this.url,
  });

  PokemonListModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonListModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonListModel.fromMap(Map<String, dynamic> map) {
    return PokemonListModel(
      name: map['name'] ?? 'Error to catch pokémon name',
      url: map['url'] ?? 'Error to catch pokémon url',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListModel.fromJson(String source) =>
      PokemonListModel.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonListModel(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonListModel && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
