import 'package:flutter/material.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBarStudent.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInforDemo.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextField.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/SmallTextField.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';


class Post extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostRequestState();
  }
}

class PostRequestState extends State<Post> {
  final TextEditingController _controller14 = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  final TextEditingController _controller10 = TextEditingController();
  final TextEditingController _controller11 = TextEditingController();
  final TextEditingController _controller12 = TextEditingController();
  final TextEditingController _controller13 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: colorApp,
              expandedHeight: 40,
              leading: buildPreviousButton(),
//              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Đăng yêu cầu',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'UTM',
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(40),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 30,
                            alignment: Alignment.center,
                            color: Color.fromRGBO(47, 101, 174, 1),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 90,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _controller14,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText:
                                    'VD: Tìm gia sư Tiếng Anh lớp 6 tại Cầu Giấy',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            )
          ];
        },
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: <Widget>[
                        SmallTextField('Môn học',_controller),
                        SmallTextField('Chủ đề học',_controller1),
                        SmallTextField('Lớp',_controller2),
                        SmallTextField('Số buổi học/tuần',_controller3),
                        SmallTextField('Thời gian học/buổi',_controller4),
                        SmallTextField('Số học viên/lớp',_controller5),
                        SmallTextField('Đối tượng dạy',_controller6),
                        SmallTextField('Giới tính gia sư',_controller7),
                        SmallTextField('Hình thức dạy',_controller8),
                        SmallTextField('Học phí/buổi (vnđ)',_controller9),
                        SmallTextField('Điện thoại',_controller10),
                        SmallTextField('Địa điểm',_controller11),
                        SmallTextField('Địa chỉ học',_controller12),
                        LargeTextField('Nhập mô tả chi tiết nội dung muốn học',_controller13),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichTextLine(),
                  SelectedTimeColumn(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
//        width: SizeConfig.blo
//        height: SizeConfig.safeBlockVertical * 7,
        decoration: BoxDecoration(),
        child: Row(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: SizeConfig.safeBlockHorizontal * 45,
//                  height: SizeConfig.safeBlockVertical * 7,
                  margin: EdgeInsets.all(5.0),
                  child: Text(
                    'Vui lòng cập nhật đầy đủ thông tin phía trên',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: RaisedButton(
//              padding: EdgeInsets.only(),
                color: Colors.blue[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomNavigationBarStudent(0,_controller14.text, 'Đang tìm gia sư', "1980", _controller.text, _controller2.text, _controller8.text, _controller3.text, _controller4.text , _controller5.text, _controller11.text, _controller9.text, '260,000', _controller13.text)));
                },
                child: Text(
                  'Đăng yêu cầu',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
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