import 'package:digiassignment/services/locator.dart';
import 'package:digiassignment/services/navigation_service.dart';
import 'package:digiassignment/utility/constants.dart';
import 'package:digiassignment/utility/theme_styles.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Function onItemClick;

  const MenuWidget({this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              userName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 30),
          sliderItem(Icons.add_circle, 'Insights'),
          InkWell(
            onTap: (){
              onItemClick();
              locator<NavigationService>().navigateWithBack(TrackOrderScreenRoute);
            },
            child: sliderItem(Icons.add_circle, 'My Orders'),
          ),
          sliderItem(Icons.add_circle, 'My Store'),
          sliderItem(Icons.add_circle, 'Account'),
          sliderItem(Icons.add_circle, 'Setting'),
          sliderItem(Icons.add_circle, 'Help'),
        ],
      ),
    );
  }

  Widget sliderItem(IconData icon, String menuItemName) {
    return Container(
      padding: EdgeInsets.only(left: 25, top: 7, bottom: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: primaryColor,
          ),
          SizedBox(width: 10),
          Text(
            menuItemName,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
          )
        ],
      ),
    );
  }
}
