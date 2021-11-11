import 'dart:convert';

import 'package:count_champ/data/models/card_results_model.dart';
import 'package:flutter/services.dart';

abstract class DeckRepository {
  Future<List> getDeckData();
}

class DeckRepositoryImpl implements DeckRepository {
  @override
  Future<List> getDeckData() async {
    print('here');
//     var response = await http.get(AppStrings.cricArticleUrl);
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       List<Articles> articles = ApiResultModel.fromJson(data).articles;
//       return articles;
//     } else {
//       throw Exception();
//     }
    final String response =
        await rootBundle.loadString('assets/data/cards_data.json');

    // Loops over the json string to create new instaces of card data objects in a new list using the class factory
    List cards = jsonDecode(response)['cards']
        .map((data) => CardResultsModel.fromJson(data))
        .toList();

    return cards;
  }
}

// readJson() async {
//   // Fetches the json file
//   final String response =
//       await rootBundle.loadString('assets/data/cards_data.json');

//   // Loops over the json string to create new instaces of card data objects in a new list using the class factory
//   List cards = jsonDecode(response)['cards']
//       .map((data) => CardDataTemplate.fromJson(data))
//       .toList();

//   return cards;
// }