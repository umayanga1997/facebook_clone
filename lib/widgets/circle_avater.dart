import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/helps/colors.dart';

class CircleAvaterImage extends StatelessWidget {
  final String image;

  const CircleAvaterImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: facebookgrey,
          // radius: 20,
          backgroundImage: CachedNetworkImageProvider(
            image,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }
}
