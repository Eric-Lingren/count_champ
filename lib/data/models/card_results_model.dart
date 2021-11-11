// Builds an object class to hold the card data
class CardResultsModel{
  final String code;
  final int value;
  final String name;
  final String suit;
  final String image;
  bool isHoleCard = false;

  CardResultsModel(
      {required this.code,
      required this.value,
      required this.name,
      required this.suit,
      required this.image, 
      isHoleCard});

  // Creates a facory to remap a json Results object to a new class object
  factory CardResultsModel.fromJson(Map<String, dynamic> parsedJson) {
    String code = parsedJson["code"].toString();
    String imagePath = 'assets/images/cards/card_faces/' + code + '.png';
    bool isHoleCard = false;

    return CardResultsModel(
        code: code,
        value: parsedJson["value"],
        name: parsedJson["name"].toString(),
        suit: parsedJson["suit"].toString(),
        image: imagePath,
        isHoleCard: isHoleCard
        );
  }
}