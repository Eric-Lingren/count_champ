import 'dart:convert';
import 'package:flutter/services.dart';

// Fetched json data on mount for all the deck data
readJson() async {
  // Fetches the json file
  final String response =
      await rootBundle.loadString('assets/data/cards_data.json');

  // Loops over the json string to create new instaces of card data objects in a new list using the class factory
  var cards = await jsonDecode(response)['cards']
      .map((data) => CardDataTemplate.fromJson(data))
      .toList();

  return cards;
}

// Builds an object class to hold the card data
class CardDataTemplate {
  final String code;
  final int value;
  final String name;
  final String suit;

  CardDataTemplate({
    required this.code,
    required this.value,
    required this.name,
    required this.suit
  });

  // Creates a facory to remap a json data object to a new class object
  factory CardDataTemplate.fromJson(Map<String, dynamic> parsedJson) {
    return CardDataTemplate(
      code: parsedJson["code"].toString(),
      value: parsedJson["value"],
      name: parsedJson["name"].toString(),
      suit: parsedJson["suit"].toString(),
    );
  }
}
