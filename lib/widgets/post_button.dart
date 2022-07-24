// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;
  final Color iconColor;
  final Color textColor;
  const PostButton(
      {Key? key,
      required this.icon,
      required this.label,
      this.textColor = Colors.black,
      required this.onPressed,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
