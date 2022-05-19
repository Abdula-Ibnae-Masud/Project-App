import 'package:flutter/material.dart';

class InputButton extends StatelessWidget {
  final double? fontSize;
  final AssetImage? image;
  final IconData? icon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;
  const InputButton({
    Key? key,
    this.fontSize = 20,
    this.image,
    this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor = Colors.white,
    this.textColor,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            image != null
                ? Image(
                    image: image!,
                    height: 70,
                  )
                : Container(),
            text != null
                ? Text(
                    text!,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
