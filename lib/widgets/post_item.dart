import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/core/constants/radius_cont.dart';
import 'package:flutter/material.dart';

class PostItem {
  static postItem(int i, context, String text) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/postinfo",
          arguments: i,
        );
      },
      child: Padding(
        padding: PMConst.kMediumPM,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.125,
                width: MediaQuery.of(context).size.height * 0.125,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(RadiusConst.kMediumRadius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        NetworkImage("https://source.unsplash.com/random/$i"),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CATEGORY",
                    style: TextStyle(
                        color: ColorConst.kWhite.withOpacity(0.6),
                        letterSpacing: 2),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.425,
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: ColorConst.kWhite,
                          fontSize: FontConst.kSmallFont,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
