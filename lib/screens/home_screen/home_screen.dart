import 'dart:async';

import 'package:digiassignment/screens/home_screen/stateless/user_info.dart';
import 'package:digiassignment/screens/home_screen/tab_bar.dart';
import 'package:digiassignment/utility/media_query.dart';
import 'package:digiassignment/utility/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {

  // This stream is implemented for clicks on drawer menu, on click menu items,
  // I have used plugin to implement drawer (time was less), as it needed custom
  // implementation. But the plugin does not have any thing to open or close
  // drawer on button click. Thus implemented this stream controller, which is passed in
  // [UserInfo] class and just stream is passed in the plugin added.
  /// PLEASE NOTE THAT THERE IS CHANGES DONE WITH THE PLUGIN. THUS DONT PUB CLEAN
  /// OTHERWISE THE CHANGES CAN BE ERASED AS ITS NOT PROVIDED BY PLUGIN
  final StreamController<int> drawerController = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    ClassMediaQuery(context);
    return Scaffold(
      appBar: appBar(context),
      body: root(),
    );
  }

  Widget root() {
    return SliderMenuContainer(
      hasAppBar: false,
      slideDirection: SlideDirection.RIGHT_TO_LEFT,
      sliderMenu: MenuWidget(
        onItemClick: () {
          // always close drawer here
          drawerController.add(0);
        },
      ),
      sliderMain: custom(),
      drawerStream: drawerController.stream,
    );
  }

  Widget custom() {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: defaultBackgroundColor(context),
              expandedHeight: 300,
              collapsedHeight: 300,
              flexibleSpace: UserInfo(drawerController),
            ),
            SliverPersistentHeader(
              delegate: SliverTabBar(
                TabBar(
                  isScrollable: false,
                  indicatorColor: primaryColor,
                  labelColor: primaryColor,
                  unselectedLabelColor: Colors.grey[800],
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    tabItem('Post'),
                    tabItem('Tags'),
                    tabItem('Saved'),
                  ],
                ),
              ),
              floating: true,
              pinned: true,
            ),
          ];
        },
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: [
              itemTabView(),
              itemTabView(),
              itemTabView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabItem(String item) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(item),
    );
  }

  Widget itemTabView() {
    return Container(
      margin: EdgeInsets.fromLTRB(10,10,10,0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        shrinkWrap: true,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  // ~~~~~~~~~~~~~~~ APP BAR ~~~~~~~~~~~~~~~

  Widget appBar(context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: defaultBackgroundColor(context),
      centerTitle: true,
      title: Card(
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 150,
          height: 40,
          margin: EdgeInsets.only(top: 10),
        ),
      ),
      actions: [
        profileBtn(),
        SizedBox(width: 5),
        bellIcon(),
        SizedBox(width: 15),
      ],
    );
  }

  Widget profileBtn() {
    return Container(
      width: 35,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: AssetImage('images/dummy_pic_user.png'))),
    );
  }

  Widget bellIcon() {
    return Container(
      width: 35,
      child: Icon(
        Icons.notifications,
        size: 30,
        color: primaryColor,
      ),
    );
  }

//~~~~~~~~~~~~~~~~~~~~ END ~~~~~~~~~~~~~~~~~~~



}