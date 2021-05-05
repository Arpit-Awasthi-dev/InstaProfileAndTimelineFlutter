import 'dart:io';

import 'package:digiassignment/utility/Utility.dart';
import 'package:digiassignment/utility/media_query.dart';
import 'package:digiassignment/utility/theme_styles.dart';
import 'package:flutter/material.dart';

class UserImage extends StatefulWidget {
  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {

  File userImg;

  _getUserImage(bool camera) async {
    try {
      closeBottomSheet(context);
      File image = await cameraOrGallery(camera);

      if(image == null){
        return;
      }

      setState(() {
        userImg = image;
      });
    }catch(e){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ClassMediaQuery.blockSizeVertical * 9,
      width: ClassMediaQuery.blockSizeVertical * 9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          image: userImg == null ? AssetImage('images/dummy_pic_user.png') : FileImage(userImg),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            (ClassMediaQuery.blockSizeVertical * 10) / 2,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 1,
            bottom: 1,
            child: InkWell(
              onTap: (){
                _bottomSheetImage(context);
              },
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: primaryColor,
                  shape: BoxShape.circle
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _bottomSheetImage(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('CAMERA'),
                onTap: () {
                  _getUserImage(true);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('GALLERY'),
                onTap: () {
                  _getUserImage(false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
