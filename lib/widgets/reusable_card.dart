import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key,
      required this.colour,
      required this.cardChild,
      required this.height,
      required this.padding});

  final Color colour;
  final Widget cardChild;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: const EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      child: cardChild,
    );
  }
}
