import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/LargeTextField.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/SmallTextField.dart';


class PostRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostRequestState();
  }
}

class PostRequestState extends State<PostRequest> {
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
                        SmallTextField('Môn học'),
                        SmallTextField('Chủ đề học'),
                        SmallTextField('Lớp'),
                        SmallTextField('Số buổi học/tuần'),
                        SmallTextField('Thời gian học/buổi'),
                        SmallTextField('Số học viên/lớp'),
                        SmallTextField('Đối tượng dạy'),
                        SmallTextField('Giới tính gia sư'),
                        SmallTextField('Hình thức dạy'),
                        SmallTextField('Học phí/buổi (vnđ)'),
                        SmallTextField('Điện thoại'),
                        SmallTextField('Địa điểm'),
                        SmallTextField('Địa chỉ học'),
                        LargeTextField('Nhập mô tả chi tiết nội dung muốn học'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Thời gian',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text: '(màu',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: ' cam ',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'hiển thị thời gian có thể dạy)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  print('tap');
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