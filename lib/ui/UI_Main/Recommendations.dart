import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/recommendation.dart';
import 'package:test_giasu/core/view_model/classDetailModel.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/UI_Main/TeacherListBox.dart';
import 'package:test_giasu/ui/Widgets/TeacherBox.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

import 'TutorInfor.dart';

class Recommendations extends StatefulWidget {
  int course_id;
  @override
  Recommendations(this.course_id);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RecommendationsState(course_id);
  }
}

class _RecommendationsState extends State<Recommendations> {
  int course_id;
  _RecommendationsState(this.course_id);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: buildPreviousButton(),
        backgroundColor: colorApp,
        title: Text(
          'Xem đề nghị dạy',
          textAlign: TextAlign.start,
        ),
      ),
      body: Consumer<ClassDetailModel>(builder: (_, model, __) {
        return FutureBuilder<List<Recommendation>>(
            future: model.get_danhsachdenghi(course_id),
            builder: (context, snapshot) {
//print(snapshot.data[0].tutor);
              if (snapshot.hasData) {
                List<Recommendation> _teacher = snapshot.data;
                return Container(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _teacher.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // return FutureBuilder<TeacherDetail>(
                      //   future: fetchTeacherDetail(teacherBox[index]),
                      //   builder: (BuildContext context, snapshot) {
                      //     if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                  builder: (context) => TutorInfor(
//                                    _teacher[index].tutor,
//                                  ),
//                                ),
//                              );
                        },
                        child: Container(
                          child: TeacherBox(
                            _teacher[index],
                            _teacher[index].status,
                              _teacher[index].tutor.avatar,
                              _teacher[index].tutor.full_name,
                              _teacher[index].location.name,
                              '',
//                                  _teacher[index].tutor.subject_text,
                              _teacher[index].tutor.tuition_fee,
                              8,
                              _teacher[index].tutor.achievement),
                        ),
                      );
                      //     } else if (snapshot.hasError) {
                      //       return Text("${snapshot.error}");
                      //     }
                      //     return CircularProgressIndicator();
                      //   },
                      // );
                    },
                  ),
                );
              }
              return CircularProgressIndicator();
            });
      }),
    );
  }
}
