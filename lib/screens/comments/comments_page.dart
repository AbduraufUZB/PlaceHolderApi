import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/models/comment_model.dart';
import 'package:api_placeholder/service/comment_service.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  CommentsPage({Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List tflst = List.generate(500, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    return SafeArea(
      child: Padding(
        padding: PMConst.kLargePM,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Comments",
                  style: TextStyle(fontSize: FontConst.kMediumFont),
                ),
                const Icon(Icons.close)
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: CommentService.getPosts(),
                builder: (ctx, AsyncSnapshot<List<CommentModel>> snap) {
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
                        return _commentItem(i, context, data);
                      },
                      itemCount: data.length,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _commentItem(int i, context, List<CommentModel> data) {
    return Padding(
      padding: PMConst.kMediumPM,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.175,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  NetworkImage("https://source.unsplash.com/random/$i"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          "${data[i].email.toString().split("@")[0]} • ${data[i].postId} min ago",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      data[i].body.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Reply",
                            style: TextStyle(
                                color: ColorConst.kBlack.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          tflst[i] == false
                              ? Text(
                                  "Like?",
                                  style: TextStyle(
                                      color:
                                          ColorConst.kBlack.withOpacity(0.8)),
                                )
                              : const Text(
                                  "You Like",
                                  style: TextStyle(color: Colors.redAccent),
                                )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          tflst[i] = !tflst[i];
                          setState(() {
                            
                          });
                        },
                        iconSize: 20,
                        icon: tflst[i] == false
                            ? const Icon(Icons.favorite_outline)
                            : const Icon(Icons.favorite),
                        color:
                            tflst[i] == false ? ColorConst.kBlack : Colors.red,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
