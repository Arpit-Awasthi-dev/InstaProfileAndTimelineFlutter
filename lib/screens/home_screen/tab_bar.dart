import 'package:flutter/material.dart';

class SliverTabBar extends SliverPersistentHeaderDelegate {

  final TabBar tabBar;

  SliverTabBar(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(
      color: Colors.white,
        child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}