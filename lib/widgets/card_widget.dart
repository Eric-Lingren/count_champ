import 'package:flutter/material.dart';



// Below is how we can pass data from a stafeul widget to a stateless widget:
class CardWidget extends StatelessWidget {
  final String cardCode;
  final String initImagePath = 'assets/images/cards/card_faces/';

  const CardWidget({Key? key, required this.cardCode}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/cards/card_faces/' + cardCode + '.png';

    return Image(
      image: AssetImage(imagePath),
      width: 175, // Need to make this dynamic based on screen size
    );
  }
}




// Below is how we can pass data from a stafeul widget to a stateful widget
// This was not auto updating the widget upon state change, but the data came in on init successfully


// // Instiantation of the class
// class CardWidget extends StatefulWidget {
//   final String cardCode; // The accepted value from the class construction

//   const CardWidget({Key? key, required this.cardCode}) : super(key: key);

//   @override
//   _CardWidgetState createState() => _CardWidgetState();
// }

// class _CardWidgetState extends State<CardWidget> {
//   // State variables
//   String initImagePath = 'assets/images/cards/card_faces/';
//   String imagePath = '';

//   // Construction of state
//   @override
//   void initState() {
//     imagePath = initImagePath + widget.cardCode + '.png';
//     super.initState();
//   }

//   // Rendering the widget
//   Widget build(BuildContext context) {
//     print(imagePath);
//     return Image(
//       image: AssetImage(imagePath),
//       width: 175, // Need to make this dynamic based on screen size
//     );
//   }
// }
