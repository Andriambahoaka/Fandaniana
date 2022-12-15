import 'package:flutter/cupertino.dart';

class Utility {
  static String getLinkImage(String imageName) => "images/$imageName.png";
}

class LoadImage extends StatelessWidget {
  LoadImage(this.imageName);

  String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utility.getLinkImage(imageName),
      width: 25.0,
      height: 40.0,
    );
  }
}
