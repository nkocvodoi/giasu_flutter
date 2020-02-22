import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Widgets/SelectedTimeColumn.dart';

class Request extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RequestState();
  }
}

class _RequestState extends State<Request> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        centerTitle: true,
        title: Center(
          child: Text(
            'Đăng yêu cầu',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: _color,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                _textField('Môn học'),
                SizedBox(
                  height: 10,
                ),
                _textField('Chủ đề học'),
                SizedBox(
                  height: 10,
                ),
                _textField('Lớp'),
                SizedBox(
                  height: 10,
                ),
                _textField('Số buổi hoc/tuần'),
                SizedBox(
                  height: 10,
                ),
                _textField('Thời gian hoc/buổi'),
                SizedBox(
                  height: 10,
                ),
                _textField('Số hoc viên/lớp'),
                SizedBox(
                  height: 10,
                ),
                _textField('Đối tượng dạy'),
                SizedBox(
                  height: 10,
                ),
                _textField('Giới tính gia sư'),
                SizedBox(
                  height: 10,
                ),
                _textField('Hình thức dạy'),
                SizedBox(
                  height: 10,
                ),
                _textField('Học phí/buổi(vnđ)'),
                SizedBox(
                  height: 10,
                ),
                _textField('Điện thoại'),
                SizedBox(
                  height: 10,
                ),
                _textField('Địa điểm'),
                SizedBox(
                  height: 10,
                ),
                _textField('Địa chỉ học'),
                SizedBox(
                  height: 10,
                ),
                _textLargeField('Nhập mô tả chi tiết nội dung muốn học'),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Thời gian học',
                        style: TextStyle(
                          fontSize: 19.0,
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
                Divider(
                  thickness: 1,
                ),
                Row(
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.getInstance().setWidth(320),
                          height: ScreenUtil.getInstance().setHeight(100),
                          //margin: EdgeInsets.all(5.0),
                          child: Text(
                            'Vui lòng cập nhập đầy đủ thông tin phía trên',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: ScreenUtil.getInstance().setSp(28),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(150),
                    ),
                    RaisedButton(
                      color: _color,
                      onPressed: () {
                        print('tap');
                      },
                      child: Text(
                        'Đăng yêu cầu',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(35),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                top: 0,
                child: Container(
                  height: 50,
                  width: 385,
                  child: TextField(
                    style: TextStyle(fontSize: 17.0),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText:
                            'VD:Tìm gia sư dạy kèm tiếng anh 6 tại Cầu Giấy'),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _textField(String _s) {
    return Container(
      height: 50,
      width: 380,
      child: TextField(
        style: TextStyle(fontSize: 19.0),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: _s),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _textLargeField(String _s) {
    return Container(
      height: 120,
      width: 380,
      child: SizedBox(
        height: 120,
        child: TextField(
          maxLines: 5,
          style: TextStyle(fontSize: 19.0),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: _s),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _selectedDay(String day, List<bool> isSelected, int space) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Text(
            day,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(30),
              fontStyle: FontStyle.normal,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(space),
          ),
          ToggleButtons(
            borderWidth: 0.0,
            borderRadius: BorderRadius.circular(30.0),
            borderColor: _color,
            selectedBorderColor: _color,
            fillColor: Colors.orangeAccent,
            highlightColor: Colors.grey,
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(170),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi sáng',
                    style: TextStyle(
                      // color:  ? Colors.black87: Colors.white,
                      fontSize: ScreenUtil.getInstance().setSp(30),
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(170),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi chiều',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(170),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi tối',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                    ),
                  ),
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }
}
