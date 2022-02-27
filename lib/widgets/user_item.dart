import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/models/user_model.dart';
import 'package:api_placeholder/service/user_service.dart';
import 'package:flutter/material.dart';

class UserItem {
  static userItem(BuildContext context, int i) {
    return FutureBuilder(
      future: UserService.getPosts(),
      builder: (ctx, AsyncSnapshot<List<UserModel>> snap) {
        if (!snap.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snap.hasError) {
          return const Center(
            child: Text("Internet bilan bog'lanib bo'lmadi!"),
          );
        } else {
          var data = snap.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  data[i].name.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: FontConst.kMediumFont),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  data[i].address!.street.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: ColorConst.kPrimaryColor),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  data[i].email.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: ColorConst.kBlack.withOpacity(0.6),
                      fontSize: FontConst.kExtraSmallFont),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
