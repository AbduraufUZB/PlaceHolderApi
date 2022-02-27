import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/models/post_model.dart';
import 'package:api_placeholder/service/post_service.dart';
import 'package:api_placeholder/widgets/post_item.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kBlack,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) => Padding(
        padding: PMConst.kExtraLargePM,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Posts",
              style: TextStyle(
                color: ColorConst.kWhite,
                fontSize: FontConst.kMediumFont,
              ),
            ),
            Divider(
              color: ColorConst.kWhite.withOpacity(0.6),
            ),
            Expanded(
              child: FutureBuilder(
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
                    return ListView.builder(
                      itemBuilder: (ctx, i) {
                        return PostItem.postItem(i, context, data[i].title.toString());
                      },
                      itemCount: data.length,
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
}
