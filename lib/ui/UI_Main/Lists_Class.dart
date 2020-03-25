//import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/ui/UI_Main/Filter.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';

import 'General_Infor.dart';

class _List_Box extends StatelessWidget {
  List<Data_class> box;

  _List_Box({Key key, this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: box.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10.0),
//                  height: 190,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: RaisedButton(
                      onPressed: () {
                      
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassDetailWithMoreTutorInfor(
                                box[index],
                              ),
                            ));
                      },
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _iconTextBox(
                            box[index].name,
                            colorApp,
                            17,
                            Icon(Icons.school),
                          ),
                          _iconTextBox(
                            box[index].parent.full_name,
                            Colors.deepOrange,
                            17,
                            Icon(Icons.account_box),
                          ),
                          _iconTextBox(
                            box[index].address,
                            Colors.grey,
                            17,
                            Icon(Icons.map),
                          ),
                          _iconTextBox(
                            '${(box[index].tuition_fee / 1000).toInt()},000 vnđ/${box[index].time_per_lesson.toInt()}h - ${box[index].lesson_per_week}/tuần',
                            Colors.grey,
                            17,
                            Icon(Icons.monetization_on),
                          ),
                          _iconTextBox(
                            'Cách bạn: 2 km',
                            Colors.grey,
                            17,
                            Icon(Icons.radio_button_checked),
                          ),
                          _iconTextBox(
                            'Phí nhận lớp: ${(box[index].class_fee / 1000).toInt()},000 vnđ',
                            Colors.blue,
                            15,
                            Icon(Icons.attach_money),
                          ),
                        ],
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Positioned(
                  top: 90,
                  right: 10,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: colorApp,
                    size: 30.0,
                  ),
                ),
                Positioned(
                   bottom: 15,
                  right: 25,
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${box[index].recommend_number}/6 đề nghị',
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 13,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 2,),
                      SizedBox(
                        height: 33,
                        child: RaisedButton(
                          padding: EdgeInsets.only(
                            left: 2.0,
                            right: 2.0,
                          ),
                          color: colorApp,
                          onPressed: () {},
                          child: Text(
                            'Đề nghị dạy',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _iconTextBox(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          SizedBox(width: 5),
          Container(
            width: 340,
            child: Text(
            _text,
            style: TextStyle(
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w500,
            ),
          ),),
        ],
      ),
    );
  }
}

class Lists_Class extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lists_Class_State();
  }
}

class _Lists_Class_State extends State<Lists_Class> {
  Future<CLassData> list_class;
//  Api _api;
  @override
  void initState() {
    super.initState();
    list_class = fetchClassData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FutureBuilder<CLassData>(
          future: list_class,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: colorApp,
                      expandedHeight: 40,
//              floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          'Danh sách lớp gia sư',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                          child: PreferredSize(
                        preferredSize: Size.fromHeight(60),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.center,
                                  color: colorApp,
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 55,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        '${snapshot.data.total} kết quả',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorApp,
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0)),
                                    ),
                                  ),
                                  Container(
                                    height: 55,
                                    width: 150,
                                    child: ListTile(
                                      title: Text(
                                        'Bộ lọc',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        print('Tap');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Filter(),
                                          ),
                                        );
                                      },
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorApp,
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40.0),
                                        bottomRight: Radius.circular(40.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    )
                  ];
                },
                body: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
//                          Container(
//                            height: 40,
//                            decoration: BoxDecoration(
//                              color: colorApp,
//                            ),
//                          ),
//                          SizedBox(
//                            height: 50,
//                          ),
                          _List_Box(
                            box: snapshot.data.data,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

// By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
