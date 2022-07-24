import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:facebook_clone/helps/colors.dart';
import 'package:facebook_clone/states/scrollsize.dart';
import 'circle_avater.dart';

class StoryWidget extends StatefulWidget {
  final String image;
  final String userImageURl;
  final int index;
  final bool isEmpty;
  const StoryWidget({
    Key? key,
    required this.image,
    required this.userImageURl,
    this.index = 1,
    this.isEmpty = false,
  }) : super(key: key);

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  final GlobalKey imgKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  bool scrollZero() {
    return widget.index == 0 && context.watch<ScrollSize>().scrollsize == 0;
  }

  bool scrollThanZero() {
    return widget.index == 0 && context.watch<ScrollSize>().scrollsize > 1;
  }

  double radious() {
    return context.watch<ScrollSize>().scrollsize > 70
        ? 70
        : context.watch<ScrollSize>().scrollsize;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: widget.index == 0 ? 8.0 : 0),
      child: widget.isEmpty
          ? SizedBox(
              height: double.maxFinite,
              width: size.width / 3 - 10,
            )
          : AnimatedOpacity(
              duration: const Duration(microseconds: 800),
              opacity: scrollThanZero() &&
                      context.watch<ScrollSize>().scrollsize < 70
                  ? 0.5
                  : 1,
              curve: Curves.bounceInOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                height: scrollZero() || widget.index != 0
                    ? double.maxFinite
                    : context.watch<ScrollSize>().scrollsize > 70
                        ? 70
                        : 240 - context.watch<ScrollSize>().scrollsize,
                width: scrollZero() || widget.index != 0
                    ? size.width / 3 - 10
                    : context.watch<ScrollSize>().scrollsize > 70
                        ? 70
                        : (size.width / 3 - 10) -
                            context.watch<ScrollSize>().scrollsize,
                decoration: scrollThanZero()
                    ? BoxDecoration(
                        color: facebookwhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(radious()),
                          bottomRight: Radius.circular(radious()),
                        ),
                        boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(0, 0),
                            )
                          ])
                    : const BoxDecoration(
                        color: facebookwhite,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(scrollThanZero() ? 8 : 0),
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    // alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          scrollZero() || widget.index != 0 ? 10 : radious(),
                        ),
                        child: Builder(builder: (cont) {
                          return CachedNetworkImage(
                            key: imgKey,
                            imageUrl: widget.image,
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: double.maxFinite,
                            fit: BoxFit.cover,
                          );
                        }),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: widget.index != 0
                            ? CircleAvaterImage(image: widget.userImageURl)
                            : AnimatedOpacity(
                                duration: const Duration(microseconds: 500),
                                opacity:
                                    context.watch<ScrollSize>().scrollsize > 10
                                        ? 0
                                        : 1,
                                curve: Curves.easeInOut,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: facebookwhite,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: facebookblue,
                                  ),
                                ),
                              ),
                      ),
                      widget.index == 0 &&
                              context.watch<ScrollSize>().scrollsize > 50
                          ? Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.green,
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
