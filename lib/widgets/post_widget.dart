import 'package:flutter/material.dart';
import 'package:facebook_clone/helps/colors.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';

class PostWidget extends StatelessWidget {
  final User currentUser;
  const PostWidget({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      color: facebookwhite,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvaterImage(image: currentUser.imageUrl),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                    hintStyle: TextStyle(
                      color: facebookgrey,
                    ),
                  ),
                ),
              )
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.2,
            color: facebookgrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PostButton(
                icon: Icons.video_camera_back,
                label: "Live",
                iconColor: Colors.red,
                onPressed: () {},
              ),
              PostButton(
                icon: Icons.photo_library,
                label: "Photo",
                iconColor: Colors.green,
                onPressed: () {},
              ),
              PostButton(
                icon: Icons.video_call,
                label: "Live",
                iconColor: Colors.indigo,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
