import 'dart:async';

import 'package:digiassignment/screens/home_screen/stateful/user_image.dart';
import 'package:digiassignment/utility/constants.dart';
import 'package:digiassignment/utility/theme_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInfo extends StatelessWidget {

  // value = 0 -> drawer close
  // value = 1 -> drawer open
  int drawerStreamData = 0;

  final StreamController<int> drawerController;
  UserInfo(this.drawerController);

  // this is implemented because on click drawer menu item
  // we need to change the [drawerStreamData]
  // as the drawer will be close but its value will be for open
  initStreamListener(){
    drawerController.stream.listen((event) {
      if(event != drawerStreamData){
        drawerStreamData = event;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initStreamListener();
    return root();
  }

  Widget root() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
          bottom: Radius.zero,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, -5), // changes position of shadow
          ),
        ],
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          userInfo(),
        ],
      ),
    );
  }

  Widget userInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bodyAppBar(),
          SizedBox(height: 10),
          userDetails(),
          SizedBox(height: 25),
          myPetSectionHeader(),
          SizedBox(height: 15),
          storiesList(4),
        ],
      ),
    );
  }

  Widget userDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userPersonalInfo(),
        userSocialInfo(),
      ],
    );
  }

  Widget userPersonalInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserImage(),
        SizedBox(height: 15),
        Text(
          'Deepti Priya',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 7),
        Text(
          'www.petowner.com',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 7),
        Text(
          'deepti@gmail.com',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget userSocialInfo() {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          socialInfo(),
          SizedBox(height: 15),
          btnEditProfile(),
        ],
      ),
    );
  }

  Widget socialInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        socialItem(20, 'Posts'),
        SizedBox(width: 10),
        socialItem(783, 'Followers'),
        SizedBox(width: 10),
        socialItem(129, 'Following'),
      ],
    );
  }

  Widget socialItem(int count, String item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$count',
          style: TextStyle(
            color: primaryColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$item',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget btnEditProfile() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
      ),
      child: Text(
        'Edit Profile',
        style: TextStyle(
          fontSize: 13,
          color: primaryColor,
        ),
      ),
    );
  }

  Widget myPetSectionHeader() {
    return Text(
      'My Pets',
      style: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget storiesList(int listLength) {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: listLength,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return listLength - 1 != index ? itemStory() : addStory();
        },
      ),
    );
  }

  Widget itemStory() {
    return Container(
      width: 60,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage('images/dummy_pic_user.png'),
            fit: BoxFit.fitHeight),
      ),
    );
  }

  Widget addStory() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        dashPattern: [10, 7],
        strokeWidth: 2,
        color: primaryColor,
        borderType: BorderType.Circle,
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 30,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  // ~~~~~~~~~~~~~~~~~ BODY APP BAR ~~~~~~~~~~~~~~~~~~~~

  Widget bodyAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            userName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        btnIcons(Icons.add_circle_rounded, () {}),
        SizedBox(width: 5),
        btnMessage(),
        SizedBox(width: 5),
        btnIcons(Icons.apps, () {
          drawerStreamData = drawerStreamData == 0?1:0;
          drawerController.add(drawerStreamData);
        }),
      ],
    );
  }

  Widget btnIcons(IconData icon, Function onClick) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Icon(
        icon,
        size: 30,
        color: primaryColor,
      ),
    );
  }

  Widget btnMessage() {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Icon(
              Icons.mail,
              size: 30,
              color: primaryColor,
            ),
            Positioned(
              right: 0,
              child: new Container(
                padding: EdgeInsets.all(1),
                decoration: new BoxDecoration(
                  color: Colors.deepOrangeAccent[100],
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: new Text(
                  '2',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
