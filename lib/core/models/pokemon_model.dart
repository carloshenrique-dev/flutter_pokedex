import 'dart:convert';
import 'package:flutter/material.dart';

class PokemonModel {
  final String name;
  final List<String> type;
  final int id;
  final String num;
  final String weight;
  final String height;
  final List nextEvolution;
  final List previousEvolution;

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
      nextEvolution: List.from(json['next_evolution'] ?? []),
      previousEvolution: List.from(json['prev_evolution'] ?? []),
      weight: json['weight'],
      height: json['height'],
    );
  }

  Color? get baseColor => color(type: type[0]);
  Color? getColor(String type) => color(type: type);
  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  PokemonModel({
    required this.name,
    required this.type,
    required this.id,
    required this.num,
    required this.weight,
    required this.height,
    required this.nextEvolution,
    required this.previousEvolution,
  });

  static Color? color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'id': id,
      'num': num,
      'weight': weight,
      'height': height,
      'nextEvolution': nextEvolution,
      'previousEvolution': previousEvolution,
    };
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
