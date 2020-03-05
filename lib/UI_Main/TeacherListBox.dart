import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/UI_Main/TutorInfor.dart';
import 'package:test_giasu/Widgets/loadmore_widget.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/UI_Main/ClassDetail.dart';
import 'package:test_giasu/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/UI_Main/Filter.dart';
import 'package:test_giasu/Widgets/TeacherBox.dart';
import 'package:test_giasu/fetchData/List_ClassData.dart';
import 'package:test_giasu/fetchData/List_TeacherData.dart';
import 'dart:async';

import 'package:test_giasu/fetchData/List_TeacherDetail.dart';

final Color _color = Color.fromRGBO(47, 101, 174, 1);
int _N;

class TeacherListBox extends StatefulWidget {
  List<Data_teacher> teacherBox;
  TeacherListBox(this.teacherBox);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeacherListBoxState(teacherBox);
  }
}

class TeacherListBoxState extends State<TeacherListBox> {
  List<Data_teacher> teacherBox;

  TeacherListBoxState(this.teacherBox);

  //List<Future<TeacherDetail>> list_teacherdetail;
  // @override
  // void initState() {
  //   super.initState();
  //   // for (int i = 0; i < 12; i++) {
  //   //   list_teacherdetail.add(fetchTeacherDetail(teacherBox[i]));

  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    SizeConfig().init(context);
    return Container(
      // child: RefreshIndicator(
      //   onRefresh: _refresh,
      //   child: LoadMore(
      //     isFinish: count >= teacherBox.length,
      //     onLoadMore: _loadMore,
      //     whenEmptyLoad: false,
      //     textBuilder: DefaultLoadMoreTextBuilder.english,
      //     delegate: DefaultLoadMoreDelegate(),
      //     child:
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: teacherBox.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          childAspectRatio: 2 / 3,
        ),

        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder<TeacherDetail>(
            future: fetchTeacherDetail(teacherBox[index]),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorInfor(
                          snapshot.data.data,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: TeacherBox(
                        teacherBox[index].avatar,
                        teacherBox[index].full_name,
                        teacherBox[index].location.name,
                        teacherBox[index].subject_text,
                        teacherBox[index].tuition_fee,
                        8,
                        teacherBox[index].achievement),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
