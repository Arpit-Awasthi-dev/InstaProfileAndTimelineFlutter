import 'package:digiassignment/models/track_order/timeline_model.dart';
import 'package:digiassignment/utility/theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackOrderScreen extends StatefulWidget {
  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  List<TimeLineModel> list;

  _TrackOrderScreenState() {
    list = [
      TimeLineModel(
        icon: Icons.access_time,
        heading: 'Order Placed',
        body: 'We received your order',
        date: '30/04/2021',
        time: '10:36',
      ),
      TimeLineModel(
        icon: Icons.stream,
        heading: 'Order Processed',
        body: 'Order has been processed',
        date: '30/04/2021',
        time: '10:36',
      ),
      TimeLineModel(
        icon: Icons.ac_unit,
        heading: 'Ready to Ship',
        body: 'Your order is ready for shipping',
        date: '30/04/2021',
        time: '10:36',
      ),
      TimeLineModel(
        icon: Icons.account_balance_wallet,
        heading: 'Out For Delivery',
        body: 'Your order is dispatched',
        date: '30/04/2021',
        time: '10:36',
      ),
      TimeLineModel(
        icon: Icons.add_shopping_cart,
        heading: 'Delivered Successfully',
        body: 'Your order is delivered to the given address',
        date: '30/04/2021',
        time: '10:36',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: root(),
    );
  }

  Widget root() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 25),
          Text(
            'Order ID - 12345678',
            style: TextStyle(
                color: primaryColor, fontSize: 17, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
          orderTimeLine(),
          SizedBox(height: 25),
          Text(
            'Delivered Address',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_pin,
                  color: primaryColor,
                  size: 30,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'No. 2, KK Road, T Nagar\nChennai 600035',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderTimeLine() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return timeLineItem(index);
      },
    );
  }

  Widget timeLineItem(int index) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      isFirst: index == 0,
      isLast: index == list.length - 1,
      beforeLineStyle: LineStyle(
        color: Colors.grey.withOpacity(0.4),
        thickness: 2,
      ),
      startChild: startIcon(list[index].icon),
      indicatorStyle: IndicatorStyle(
        width: 40,
        height: 40,
        indicator: indicatorIcon(),
        drawGap: true,
      ),
      endChild: orderDetail(index),
    );
  }

  Widget startIcon(IconData icon) {
    return Icon(
      icon,
      color: primaryColor,
      size: 25,
    );
  }

  Widget indicatorIcon() {
    return Icon(
      Icons.radio_button_off,
      color: primaryColor,
    );
  }

  Widget orderDetail(int index) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 12, 5, 5),
                  child: Text(
                    list[index].heading,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 2),
                child: Text(
                  list[index].date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 12),
                  child: Text(
                    list[index].body,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 10, 0),
                child: Text(
                  list[index].time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
      backgroundColor: defaultBackgroundColor(context),
      centerTitle: true,
      title: Text(
        'Track Order',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
