// //import 'dart:ui';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
// import 'package:test_giasu/ui/UI_Main/Filter.dart';
// import 'package:test_giasu/core/model/List_ClassData.dart';

// import 'core/view_model/classModel.dart';
// import 'ui/UI_Main/General_Infor.dart';
// import 'ui/Widgets/ClassBox.dart';



// class TestLists_Class extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _Lists_Class_State();
//   }
// }

// class _Lists_Class_State extends State<TestLists_Class> {
//   Future<CLassData> list_class;
//   ScrollController _scrollController = new ScrollController();
//   int i =1;

//   @override
//   void initState() {
//     super.initState();
//     list_class = fetchClassDatatest();
//     _scrollController..addListener(() {
// //      while(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
// //        print(i);
// //        list_class = fetchClassDataNext(i++);
// //      }
// //    print(_scrollController.position.pixels);
//       if(_scrollController.position.pixels == (_scrollController.position.maxScrollExtent)){
// //        setState(() {
// //          list_class = fetchClassDataNext(2);
// //        });
//       Consumer<ClassModel>(
//           builder: (_ ,model, __) {
//             list_class = fetchClassDataNext(2);
//             // return list_class;
//           }
//       );
//       }

//     });
//   }

//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Consumer<ClassModel>(
//         builder: (_ ,model, __) {
//           return Scaffold(
//             body: NestedScrollView(
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) {
//                 return <Widget>[
//                   SliverAppBar(
//                     backgroundColor: colorApp,
//                     expandedHeight: 40,
// //              floating: false,
//                     pinned: true,
//                     flexibleSpace: FlexibleSpaceBar(
//                       centerTitle: true,
//                       title: Text(
//                         'Danh sách lớp gia sư',
//                         style: TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.w400),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   SliverPersistentHeader(
//                     pinned: true,
//                     delegate: _SliverAppBarDelegate(
//                         child: PreferredSize(
//                           preferredSize: Size.fromHeight(60),
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: <Widget>[
//                               Column(
//                                 children: <Widget>[
//                                   Container(
//                                     width: double.infinity,
//                                     height: 30,
//                                     alignment: Alignment.center,
//                                     color: colorApp,
//                                   ),
//                                 ],
//                               ),
//                               Positioned(
//                                 top: 0,
//                                 child: Row(
//                                   children: <Widget>[
//                                     Container(
//                                       height: 55,
//                                       width: 150,
//                                       child: Center(
//                                         child: Text(
//                                           ' ${model.total} kết quả',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.w400,
//                                               color: Colors.white),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: colorApp,
//                                         border:
//                                         Border.all(color: Colors.blueAccent),
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(40.0),
//                                             bottomLeft: Radius.circular(40.0)),
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 55,
//                                       width: 150,
//                                       child: ListTile(
//                                         title: Text(
//                                           'Bộ lọc',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.w400,
//                                               color: Colors.white),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         onTap: () {
//                                           print('Tap');
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => Filter(),
//                                             ),
//                                           );
//                                         },
//                                         trailing: Icon(
//                                           Icons.arrow_forward_ios,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: colorApp,
//                                         border:
//                                         Border.all(color: Colors.blueAccent),
//                                         borderRadius: BorderRadius.only(
//                                           topRight: Radius.circular(40.0),
//                                           bottomRight: Radius.circular(40.0),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )),
//                   )
//                 ];
//               },
//               body: Center(
//                 child: FutureBuilder<CLassData>(
//                   future: list_class,
//                   builder: (context, snapshot) {
//                     if(snapshot.hasData) {
//                       model.setTotal(snapshot.data.total);
//                       return List_Box(
//                           box: snapshot.data.data,controller: _scrollController,
//                       );
//                     }
//                     return CircularProgressIndicator();
//                   },
//                 ),
//               ),
//             ),
//           );
//         }
//     );
//   }
// }



// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final PreferredSize child;

//   _SliverAppBarDelegate({this.child});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // TODO: implement build
//     return child;
//   }

//   @override
//   // TODO: implement maxExtent
//   double get maxExtent => child.preferredSize.height;

//   @override
//   // TODO: implement minExtent
//   double get minExtent => child.preferredSize.height;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     // TODO: implement shouldRebuild
//     return false;
//   }
// }

// Future<CLassData> fetchClassDatatest() async {
// //  https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=2
//   final response =
//   await http.get('https://giasu.htcon.vn/api/v1/parents/courses');
//   Map<String, dynamic> mapResponse = json.decode(response.body);
//   print(mapResponse["total"]);
//   if (response.statusCode == 200) {
// //    Map<String, dynamic> mapResponse = json.decode(response.body);
//     return CLassData.fromJson(mapResponse);
//   } else {
//     // If that call was not successful, throw an error.
//     throw Exception('Failed to load ');
//   }
// }
// Future<CLassData> fetchClassDataNext(int i) async {
// print(i);
//   final response =
//   await http.get('https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=${i}');
//   Map<String, dynamic> mapResponse = json.decode(response.body);
//   print(mapResponse["total"]);
//   if (response.statusCode == 200) {
// //    Map<String, dynamic> mapResponse = json.decode(response.body);
//     return CLassData.fromJson(mapResponse);
//   } else {
//     // If that call was not successful, throw an error.
//     throw Exception('Failed to load ');
//   }
// }
