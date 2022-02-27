import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/radius_cont.dart';
import 'package:api_placeholder/models/todo_model.dart';
import 'package:flutter/material.dart';

class ToDoItem {
  static Widget toDoItem(context, ToDoModel t) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(RadiusConst.kExtraLargeRadius)),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      t.title.toString(),
                      maxLines: 1,
                      style: TextStyle(
                        color: t.completed == false ? ColorConst.kBlack : ColorConst.kBlack.withOpacity(0.6),
                        decoration: t.completed == true ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: ColorConst.kBlack,
                      child: CircleAvatar(
                        radius: 11,
                        backgroundColor: t.completed == false ? ColorConst.kWhite : Colors.lightGreen,
                        child: Icon(Icons.check, size: 15, color: ColorConst.kWhite,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(RadiusConst.kExtraLargeRadius)),
            ),
          ),
        ),
      ),
    );
  }
}
