import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/model/currentUser.dart';
import 'package:test_giasu/core/view_model/bitsmanagerModel.dart';
import 'package:test_giasu/core/view_model/classManagerModel.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/Nap_Bits.dart';
import 'package:test_giasu/ui/Widgets/ClassBox.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'BottomNavigationBar.dart';
import 'General_Infor.dart';

class Class_Manager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Class_Manager_State();
  }
}

class _Class_Manager_State extends State<Class_Manager> {

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: buildPreviousButton(),
        centerTitle: true,
        backgroundColor: colorApp,
        title: Text(
          'Lớp học của bạn',
          textAlign: TextAlign.center,
        ),
      ),

//      bottomNavigationBar: MyBottomNavigationBar(),
      body:Consumer<ClassManagerModel>(
          builder: (_ ,model, __) {
            return FutureBuilder<CLassData>(
              future: model.fetchMyClass(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
//                  model.setList_class(snapshot.data.data);
//                      model.setScroll();
//                    print(snapshot.data.total);
                  if(snapshot.data.data.isNotEmpty) {
                    return List_Box(
                      box: snapshot.data.data,
                      controller: _scrollController,
                     
                    );
                  }
                  else {
                    return Center(
                      child: Text('Không có lớp học nào !',
                        style: TextStyle(fontSize: 25, color: Colors.grey),),
                    );
                  }
                }
                return Center( child: CircularProgressIndicator(),);
              },
            );
          }
      ),
    );
  }


}
