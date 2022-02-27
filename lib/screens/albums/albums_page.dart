import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/models/album_model.dart';
import 'package:api_placeholder/service/album_service.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF131844),
      body: Column(
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
              child: Column(
                children: [
                  Container(
                    color: ColorConst.kBlack.withOpacity(0.2),
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 20, left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            color: ColorConst.kWhite,
                          ),
                          Text(
                            "album | tracks",
                            style: TextStyle(
                                color: ColorConst.kWhite,
                                fontSize: FontConst.kSmallFont),
                          ),
                          Icon(
                            Icons.search,
                            color: ColorConst.kWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder(
                            future: AlbumService.getPosts(),
                            builder:
                                (ctx, AsyncSnapshot<List<AlbumModel>> snap) {
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
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Center(
                                    child: Text(
                                      data[index].title.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: FontConst.kLargeFont),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Pogo • Kindred Shadow",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: FontConst.kExtraSmallFont),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (index != 0) {
                                  index -= 1;
                                } else {
                                  index = 99;
                                }
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.skip_previous,
                                color: ColorConst.kWhite.withOpacity(0.4),
                              ),
                            ),
                            const SizedBox(width: 25),
                            Icon(Icons.play_arrow,
                                color: ColorConst.kWhite, size: 45),
                            const SizedBox(width: 25),
                            IconButton(
                              onPressed: () {
                                if (index != 99) {
                                  index += 1;
                                } else {
                                  index = 0;
                                }
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.skip_next,
                                color: ColorConst.kWhite.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.replay,
                          color: ColorConst.kWhite,
                        ),
                        Icon(
                          Icons.shuffle,
                          color: ColorConst.kWhite,
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: ColorConst.kWhite,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
