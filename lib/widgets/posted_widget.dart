import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook_clone/helps/colors.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';

class PostedWidget extends StatelessWidget {
  final User user;
  final Post post;
  const PostedWidget({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: facebookwhite,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvaterImage(
                  image: user.imageUrl,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              post.timeAgo,
                              style: const TextStyle(
                                color: facebookgrey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.public,
                              size: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  // iconSize: 20,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.caption,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          post.imageUrl != ""
              ? CachedNetworkImage(
                  imageUrl: post.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const SizedBox.shrink(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  // height: 10,
                  // width: 10,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: facebookblue,
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    size: 12,
                    color: facebookwhite,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      post.likes.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Text(
                  post.comments.toString() + " Comments",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  post.shares.toString() + " Shares",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Button Set
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PostButton(
                icon: MdiIcons.thumbUpOutline,
                label: "Like",
                onPressed: () {},
                iconColor: facebookgrey,
                textColor: facebookgrey,
              ),
              PostButton(
                icon: MdiIcons.commentOutline,
                label: "Comment",
                onPressed: () {},
                iconColor: facebookgrey,
                textColor: facebookgrey,
              ),
              PostButton(
                icon: MdiIcons.shareOutline,
                label: "Share",
                onPressed: () {},
                iconColor: facebookgrey,
                textColor: facebookgrey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
