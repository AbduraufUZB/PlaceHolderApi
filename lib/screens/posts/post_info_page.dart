import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/models/post_model.dart';
import 'package:api_placeholder/service/post_service.dart';
import 'package:flutter/material.dart';

class PostInfoPage extends StatelessWidget {
  int index;
  PostInfoPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kBlack,
      body: _body(context),
    );
  }

  Widget _body(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("https://source.unsplash.com/random/$index"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Padding(
                padding: PMConst.kLargePM,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "CATEGORY",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: FontConst.kMediumFont,
                        color: ColorConst.kWhite.withOpacity(0.6),
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FutureBuilder(
                      future: PostService.getPosts(),
                      builder: (ctx, AsyncSnapshot<List<PostModel>> snap) {
                        if (!snap.hasData) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        } else if (snap.hasError) {
                          return const Center(
                            child: Text("Internet mavjud emas!"),
                          );
                        } else {
                          var data = snap.data!;
                          return Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  data[index].title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: ColorConst.kWhite,
                                    fontSize: FontConst.kLargeFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  data[index].body.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: ColorConst.kWhite.withOpacity(0.6),
                                    fontSize: FontConst.kSmallFont,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Read full story...",
                      style: TextStyle(
                        color: ColorConst.kWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: FontConst.kSmallFont,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "By: Abdurauf",
                                style: TextStyle(
                                  color: ColorConst.kWhite.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                  color: ColorConst.kWhite.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                "On: 27.02.2022",
                                style: TextStyle(
                                  color: ColorConst.kWhite.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                  color: ColorConst.kWhite.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                "5minutes Read",
                                style: TextStyle(
                                  color: ColorConst.kWhite.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
