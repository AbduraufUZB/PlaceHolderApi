import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/screens/albums/albums_page.dart';
import 'package:api_placeholder/screens/comments/comments_page.dart';
import 'package:api_placeholder/screens/photos/photos_page.dart';
import 'package:api_placeholder/screens/posts/posts_page.dart';
import 'package:api_placeholder/screens/todos/todos_page.dart';
import 'package:api_placeholder/screens/users/users_page.dart';
import 'package:api_placeholder/widgets/get_tabbar.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kWhite,
      bottomNavigationBar: GetTabBar.myTabBar(_tabController),
      body: _body,
    );
  }

  Widget get _body => TabBarView(
        controller: _tabController,
        children: [
          const PostsPage(),
          CommentsPage(),
          const AlbumsPage(),
          const PhotosPage(),
          const ToDosPage(),
          const UsersPage(),
        ],
      );
}
