import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/core/constants/radius_cont.dart';
import 'package:api_placeholder/models/photo_model.dart';
import 'package:api_placeholder/service/photo_service.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kBlack,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: PMConst.kMediumPM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Categories",
                    style: TextStyle(
                        fontSize: FontConst.kMediumFont,
                        color: ColorConst.kWhite),
                  ),
                  Divider(
                    thickness: 2,
                    color: ColorConst.kWhite,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder(
                  future: PhotoService.getPosts(),
                  builder: (ctx, AsyncSnapshot<List<PhotoModel>> snap) {
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
                      return GridView.builder(
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (ctx, i) {
                          return Container(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 40,
                              width: 100,
                              child: Padding(
                                padding: PMConst.kExtraSmallPM,
                                child: Center(
                                  child: Text(
                                    data[i].title.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: ColorConst.kWhite,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          RadiusConst.kMediumRadius),
                                      topRight: Radius.circular(
                                          RadiusConst.kMediumRadius))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(RadiusConst.kMediumRadius)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(data[i].url.toString()),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
