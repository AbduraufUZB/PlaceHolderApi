import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/p_m_const.dart';
import 'package:api_placeholder/core/constants/radius_cont.dart';
import 'package:api_placeholder/models/todo_model.dart';
import 'package:api_placeholder/service/todo_service.dart';
import 'package:api_placeholder/widgets/todo_itme.dart';
import 'package:flutter/material.dart';

class ToDosPage extends StatelessWidget {
  const ToDosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "All Tasks",
          style:
              TextStyle(color: ColorConst.kBlack, fontWeight: FontWeight.w300),
        ),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: ColorConst.kWhite,
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: ToDoService.getPosts(),
            builder: (ctx,AsyncSnapshot<List<ToDoModel>> snap) {
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
                        return ToDoItem.toDoItem(context, data[i]);
                      },
                      itemCount: data.length,
                    );
                  }
            },
          ),
        ),
      ],
    );
  }
}
