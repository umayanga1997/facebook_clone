import 'package:flutter/material.dart';
import 'package:facebook_clone/helps/colors.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> outlineUsers;
  const Rooms({Key? key, required this.outlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 10),
      color: facebookwhite,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        itemCount: 1 + outlineUsers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                // vertical: 2,
              ),
              child: CreateRoomButton(),
            );
          }
          User user = outlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvaterImage(
              image: user.imageUrl,
            ),
          );
        },
      ),
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      borderSide: const BorderSide(
        color: facebookblue,
        width: 2,
      ),
      textColor: facebookblue,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                const LinearGradient(colors: [facebookblue, Colors.blue])
                    .createShader(bounds),
            child: const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "Create\nRoom",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
