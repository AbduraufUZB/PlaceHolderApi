import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class GetTabBar {
  static TabBar myTabBar(_tabController) {
    return TabBar(
      controller: _tabController,
      labelColor: ColorConst.kBlack,
      tabs: const [
        Tab(
          text: "Posts",
          icon: Icon(Icons.local_post_office_outlined),
        ),
        Tab(
          text: "Comments",
          icon: Icon(Icons.comment_outlined),
        ),
        Tab(
          text: "Albums",
          icon: Icon(Icons.album_outlined),
        ),
        Tab(
          text: "Photos",
          icon: Icon(Icons.photo_camera_outlined),
        ),
        Tab(
          text: "ToDos",
          icon: Icon(Icons.today_outlined),
        ),
        Tab(
          text: "Users",
          icon: Icon(Icons.person_outline),
        ),
      ],
    );
  }
}
