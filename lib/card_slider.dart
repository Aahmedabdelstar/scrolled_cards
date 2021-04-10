import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  /// determine length of List
  final List<Color> cardsColors;

  /// contain details for every widget
  final List<Text> cardSubtitles;

  /// contain Title for every widget
  final List<Text> cardTitles;

  /// contain Icon for every widget
  final List<Widget> cardIcons;

  /// Height of Cards
  final double cardHeight;

  /// Width of Cards
  final double cardWidth;

  /// space between card and sub title
  final double subTitleMargin;

  CardSlider(
      {@required this.cardsColors,
      this.cardTitles,
      this.cardSubtitles,
      this.cardIcons,
      this.cardHeight,
      this.cardWidth,
      this.subTitleMargin})
      : assert(cardsColors.length !=null),
        assert(cardsColors.length == cardSubtitles.length),
        assert(cardsColors.length == cardTitles.length),
        assert(cardsColors.length == cardIcons.length);

  @override
  _CardSliderState createState() => new _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  PageController controller;
  int currentPage = 1;

  /// [start] animates to second card at the very first time
  bool start = true;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      //initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {

    // At first time of build, this block will be executed.
    if (start == true) {
      Future.delayed(const Duration(milliseconds: 20), () {
        setState(() {
          start = false;
          controller.animateToPage(1,
              duration: Duration(milliseconds: 1), curve: Curves.bounceIn);
        });
      });
    }

    return Scaffold(
      body: Container(
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          controller: controller,
          itemBuilder: builder,
          itemCount: widget.cardsColors.length,
          reverse: true,
        ),
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Center(
              child: new SizedBox(
                height: Curves.easeOut.transform(value) * widget.cardHeight,
                width: Curves.easeOut.transform(value) * widget.cardWidth,
                child: child,
              ),
            ),
            SizedBox(
              height: widget.subTitleMargin,
            ),
            widget.cardSubtitles[index],
          ],
        );
      },
      child: new Container(
        //height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: widget.cardsColors[index],
            borderRadius: BorderRadius.all(Radius.circular(16))),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.cardIcons[index],
            widget.cardTitles[index],
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
