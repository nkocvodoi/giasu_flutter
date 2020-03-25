//import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/classModel.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/ui/UI_Main/Filter.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/ui/Widgets/ClassBox.dart';

import 'General_Infor.dart';

class Lists_Class extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lists_Class_State();
  }
}

class _Lists_Class_State extends State<Lists_Class> {
  ScrollController _scrollController = new ScrollController();
  int i;

  @override
  void initState() {
    i = 1;
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          (_scrollController.position.maxScrollExtent)) {
        i++;
        if (i < ((120 / 15) + 1)) {
//          print(i);
          Provider.of<ClassModel>(context).setPage(i);
        }
      }
    });
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ClassModel>(builder: (_, model, __) {
      return Center(
        child: FutureBuilder<CLassData>(
          future: model.Page_class,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              model.setList_class(snapshot.data.data);
//                      model.setScroll();
//                    print(snapshot.data.total);
              return Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
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
                                          ' ${snapshot.data.total} kết quả',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: colorApp,
                                        border: Border.all(
                                            color: Colors.blueAccent),
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
                                              fontSize: 18,
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
                                        border: Border.all(
                                            color: Colors.blueAccent),
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
                  body: List_Box(
                    box: model.list_class,
                    controller: _scrollController,
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      );
    });
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
