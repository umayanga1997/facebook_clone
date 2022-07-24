import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:facebook_clone/helps/colors.dart';
import 'package:facebook_clone/helps/data.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/states/scrollsize.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController scrollcontroller = ScrollController();
  ScrollController horizontalScollController = ScrollController();

  int tabLength = 6;

  bool scrollOffset = false;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: tabLength, vsync: this, initialIndex: 0);

    _tabController.addListener(() {
      if (_tabController.index == 0) {
        scrollcontroller.jumpTo(0);
      } else {
        scrollcontroller.jumpTo(60);
      }
      // setState(() {});
    });

    horizontalScollController.addListener(() {
      context
          .read<ScrollSize>()
          .changescrollsize(horizontalScollController.offset);
      // print(horizontalScollController.offset);
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollcontroller.dispose();
    horizontalScollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLength,
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: selectedIndex ,
        //   onTap: (value) {

        //   },
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.call),
        //       label: 'Calls',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.camera),
        //       label: 'Camera',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.chat),
        //       label: 'Chats',
        //     ),
        //   ],
        // ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollcontroller,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: facebookwhite,
                pinned: true,
                floating: false,
                // snap: true,
                expandedHeight: 120,
                collapsedHeight: 60,
                actions: [
                  ActionButton(icon: Icons.search, onPressed: () {}),
                  ActionButton(
                      icon: MdiIcons.facebookMessenger, onPressed: () {}),
                ],
                bottom: PreferredSize(
                  child: SizedBox(
                    height: 60,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: facebookblue,
                      indicatorColor: facebookblue,
                      indicatorWeight: 3,
                      padding: const EdgeInsets.only(top: 5),
                      unselectedLabelColor: Colors.black.withOpacity(0.7),
                      // onTap: (value) {
                      //   if (value == 0) {
                      //     scrollcontroller.jumpTo(0);
                      //   } else {
                      //     scrollcontroller.jumpTo(60);
                      //   }
                      //   setState(() {});
                      // },
                      tabs: const [
                        Tab(
                          icon: Icon(
                            Icons.home,
                            size: 28,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.ondemand_video_sharp,
                            size: 28,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            MdiIcons.accountCircleOutline,
                            size: 28,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            MdiIcons.accountGroupOutline,
                            size: 28,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            MdiIcons.bellOutline,
                            size: 28,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.menu,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  preferredSize: const Size.fromHeight(0),
                ),
                title: const Text(
                  "Facebook",
                  style: TextStyle(
                    color: facebookblue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                  textAlign: TextAlign.start,
                ),
                // flexibleSpace: const FlexibleSpaceBar(
                //   title: Text(
                //     "Facebook",
                //     style: TextStyle(
                //       color: facebookblue,
                //       fontSize: 28,
                //       fontWeight: FontWeight.bold,
                //       letterSpacing: -1.2,
                //     ),
                //     textAlign: TextAlign.start,
                //   ),
                //   collapseMode: CollapseMode.none,
                //   // centerTitle: false,
                //   // titlePadding: EdgeInsets.all(0),
                //   // background: AppBar(),
                // ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                // controller: scrollcontroller,
                child: Column(
                  children: [
                    PostWidget(
                      currentUser: User(
                        name: currentUser.name,
                        imageUrl: currentUser.imageUrl,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Rooms(outlineUsers: onlineUsers),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 260,
                        color: facebookwhite,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Stack(
                              children: [
                                ListView.builder(
                                  controller: horizontalScollController,
                                  shrinkWrap: true,
                                  itemCount: stories.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: index == 0
                                          ? context
                                                      .watch<ScrollSize>()
                                                      .scrollsize <=
                                                  1
                                              ? StoryWidget(
                                                  image: currentUser.imageUrl,
                                                  userImageURl:
                                                      currentUser.imageUrl,
                                                  index: index,
                                                )
                                              : StoryWidget(
                                                  image: currentUser.imageUrl,
                                                  userImageURl:
                                                      currentUser.imageUrl,
                                                  index: index,
                                                  isEmpty: true,
                                                )
                                          : StoryWidget(
                                              image: stories[index].imageUrl,
                                              userImageURl:
                                                  stories[index].user.imageUrl,
                                            ),
                                    );
                                  },
                                ),
                                context.watch<ScrollSize>().scrollsize > 1
                                    ? Positioned(
                                        top: 0,
                                        bottom: 0,
                                        left: -10,
                                        child: Center(
                                          child: StoryWidget(
                                            image: currentUser.imageUrl,
                                            userImageURl: currentUser.imageUrl,
                                            index: 0,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            )),
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return PostedWidget(
                          user: posts[index].user,
                          post: posts[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                color: facebookwhite,
                child: const Text('data'),
              ),
              Container(
                color: facebookwhite,
                child: const Text('data'),
              ),
              Container(
                color: facebookwhite,
                child: const Text('data'),
              ),
              Container(
                color: facebookwhite,
                child: const Text('data'),
              ),
              Container(
                color: facebookwhite,
                child: const Text('data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
