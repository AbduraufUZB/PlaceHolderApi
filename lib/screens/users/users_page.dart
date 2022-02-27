import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/core/constants/radius_cont.dart';
import 'package:api_placeholder/widgets/app_bar.dart';
import 'package:api_placeholder/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List _lst = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.myAppBar(),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.25),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, i) {
          return _userItem(i);
        },
      ),
    );
  }

  Widget _userItem(int i) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
      child: Padding(
        padding: PMConst.kMediumPM,
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: RadiusConst.kExtraLargeRadius + 5,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: RadiusConst.kLargeRadius + 3,
                        backgroundImage: NetworkImage(
                          "https://source.unsplash.com/random/$i",
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: RadiusConst.kExtraSmallRadius - 3,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                UserItem.userItem(context, i),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _lst[i] = !_lst[i];
                          setState(() {
                          });
                        },
                        child: CircleAvatar(
                          radius: RadiusConst.kMediumRadius,
                          backgroundColor: _lst[i] == false
                              ? ColorConst.kWhite
                              : Colors.green,
                          child: Icon(
                            Icons.thumb_up,
                            size: 20,
                            color: _lst[i] == false
                                ? Colors.grey
                                : ColorConst.kWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
