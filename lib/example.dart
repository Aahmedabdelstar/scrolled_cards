import 'package:flutter/material.dart';
import 'card_slider.dart';
import 'constant/images.dart';
import 'general.dart';


class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  ///  list of cards colors.
  List<Color> cardsColors = [
    Color(General.getColorHexFromStr("#D8B72B")),
    Color(General.getColorHexFromStr("#88C741")),
    Color(General.getColorHexFromStr("#90B5F9")),
    Color(General.getColorHexFromStr("#00E8C8")),
    Color(General.getColorHexFromStr("#00722B")),
    Color(General.getColorHexFromStr("#00B4A3")),
    Color(General.getColorHexFromStr("#0088CC")),
  ];

  /// list of cards titles.
  List<Text> cardTitles = [
    General.buildTxt(txt: "Moments",color: Colors.white,isBold: true),
    General.buildTxt(txt: "Well being",color: Colors.white,isBold: true),
    General.buildTxt(txt: "Surveys",color: Colors.white,isBold: true),
    General.buildTxt(txt: "Offers",color: Colors.white,isBold: true),
    General.buildTxt(txt: "Our Values",color: Colors.white,isBold: true),
    General.buildTxt(txt: "E-Appreciate",color: Colors.white,isBold: true),
    General.buildTxt(txt: "Employee Guide",color: Colors.white,isBold: true),

  ];

  /// list of cards subtitles.
  List<Text> cardSubtitles = [
    General.buildTxt(txt: "Our happy moments at Etisalat",color: Colors.black,isBold: true),
    General.buildTxt(txt: "Our Gateway to Wellness",color: Colors.black,isBold: true),
    General.buildTxt(txt: "Fill your surveys",color: Colors.black,isBold: true),
    General.buildTxt(txt: "Our exclusive offers catalogue",color: Colors.black,isBold: true),
    General.buildTxt(txt: "Our Values",color: Colors.black,isBold: true),
    General.buildTxt(txt: "Here Recognition Happens",color: Colors.black,isBold: true),
    General.buildTxt(txt: "Employee Guide",color: Colors.black,isBold: true),

  ];

  //to add icons in widget list
  List<Widget> cardIcons = [
    Image.asset(Images.CAMERA),
    Image.asset(Images.SUN),
    Image.asset(Images.SURVEY),
    Image.asset(Images.OFFERS),
    Image.asset(Images.OUR_VALUES),
    Image.asset(Images.E_APPRECIATE),
    Image.asset(Images.GuIDE),
  ];



  @override
  Widget build(BuildContext context) {

    // Getting dimensions of screen
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CardSlider(
        cardHeight: screenHeight*0.4,
        cardWidth: screenWidth,
        subTitleMargin: screenHeight*.1,
        cardsColors: cardsColors,
        cardTitles: cardTitles,
        cardSubtitles: cardSubtitles,
        cardIcons: cardIcons,
      ),
    );
  }
}
