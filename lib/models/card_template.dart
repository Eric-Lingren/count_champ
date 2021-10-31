import 'package:count_champ/widgets/card_widget.dart';

class CardTemplate {
  String cardCode;

  CardTemplate({required this.cardCode});

  getWidget() => CardWidget(cardCode: cardCode);
}
