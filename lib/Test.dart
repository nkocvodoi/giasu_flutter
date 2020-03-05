//import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/core/model/api.dart';

import 'core/model/List_ClassData.dart';
import 'ui/UI_Main/ClassDetail.dart';
import 'ui/UI_Main/Filter.dart';
import 'ui/UI_Main/General_Infor.dart';

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
                Expanded(child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10.0),
//                  height: 190,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: RaisedButton(
                      onPressed: () {
                        print(box[index].about_course);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassDetail(box[index],),
                            ));
                      },
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _iconTextBox(
                            box[index].name,
                            colorApp,
                            20,
                            Icon(Icons.account_box),
                          ),
                          _iconTextBox(
                            box[index].parent.full_name,
                            Colors.deepOrange,
                            20,
                            Icon(Icons.account_box),
                          ),
                          _iconTextBox(
                            box[index].address,
                            Colors.grey,
                            20,
                            Icon(Icons.account_box),
                          ),
                          _iconTextBox(
                            '${box[index].tuition_fee} vnd/${box[index].time_per_lesson}h - ${box[index].lesson_per_week}/tuần',
                            Colors.grey,
                            21,
                            Icon(Icons.account_box),
                          ),
                          _iconTextBox(
                            'Cách bạn: 2 km',
                            Colors.grey,
                            20,
                            Icon(Icons.account_box),
                          ),
                          _iconTextBox(
                            'Phí nhận lớp: ${box[index].class_fee} vnđ',
                            Colors.blue,
                            20,
                            Icon(Icons.account_box),
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
                    border: Border.all(
                        color: Colors.blueAccent,
                        width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),),
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
                  top: 153,
                  right: 25,
                  child: SizedBox(
                    height: 33,
                    child: RaisedButton(

                      padding: EdgeInsets.only(left: 2.0, right: 2.0,),
                      color: colorApp,
                      onPressed: () {},
                      child: Text(
                        'Đề nghị dạy',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top:125,
                  right: 40,
                  child: Text(
                    '${box[index].recommend_number}/6 đề nghị',
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _iconTextBox(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      height: 28,
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lists_Class_State();
  }
}

class _Lists_Class_State extends State<Test> {
  Future<CLassData> list_class;
//Api _api;
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
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: colorApp,
                      expandedHeight: 40,
//              floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          'Danh sách lớp gia sư',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
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
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: colorApp,
                                            border: Border.all(color: Colors.blueAccent),
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
                                                  fontSize: 25,
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
                                            border: Border.all(color: Colors.blueAccent),
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
                          )
                      ),
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

  _SliverAppBarDelegate({ this.child });

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
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