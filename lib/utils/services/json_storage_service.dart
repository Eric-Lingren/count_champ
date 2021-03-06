import 'dart:convert';
import 'package:flutter/services.dart';

// Fetched json data on mount for all the deck data
readJson() async {
  // Fetches the json file
  final String response =
      await rootBundle.loadString('assets/data/cards_data.json');

  // Loops over the json string to create new instaces of card data objects in a new list using the class factory
  List cards = jsonDecode(response)['cards']
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
  final String image;
  bool isHoleCard = false;

  CardDataTemplate(
      {required this.code,
      required this.value,
      required this.name,
      required this.suit,
      required this.image, 
      isHoleCard});

  // Creates a facory to remap a json data object to a new class object
  factory CardDataTemplate.fromJson(Map<String, dynamic> parsedJson) {
    String code = parsedJson["code"].toString();
    String imagePath = 'assets/images/cards/card_faces/' + code + '.png';
    bool isHoleCard = false;

    return CardDataTemplate(
        code: code,
        value: parsedJson["value"],
        name: parsedJson["name"].toString(),
        suit: parsedJson["suit"].toString(),
        image: imagePath,
        isHoleCard: isHoleCard
        );
  }
}
