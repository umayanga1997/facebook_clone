import 'package:flutter/material.dart';
import 'package:facebook_clone/helps/colors.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const ActionButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: IconButton(
        color: facebookblck,
        onPressed: () => onPressed,
        icon: Icon(icon),
        iconSize: 25,
      ),
    );
  }
}
