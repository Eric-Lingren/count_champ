import 'package:count_champ/widgets/card_widget.dart';

class CardTemplate {
  String cardCode;
  int value;
  bool isHoleCard;

  CardTemplate({required this.cardCode, required this.value, required this.isHoleCard});

  getWidget() => CardWidget(cardCode: cardCode, isHoleCard: isHoleCard);
}
