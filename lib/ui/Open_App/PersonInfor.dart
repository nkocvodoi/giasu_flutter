import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';
import 'package:test_giasu/ui/Open_App/SpecialtyInfor.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/SmallTextField.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_giasu/core/view_model/personalInforModel.dart';
import 'package:flutter/material.dart';

class PersonInfor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonInforState();
  }
}

class _PersonInforState extends State<PersonInfor> {
  // Map personalInfor = new Map();
  GlobalKey<FormState> _key1 = new GlobalKey();
  bool _validate = false;
  final TextEditingController full_name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController birthdate = TextEditingController();
  final TextEditingController facebook = TextEditingController();
  final TextEditingController phone_number = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(value, textAlign: TextAlign.start),
        duration: Duration(seconds: 1),
      ),
    );
  }

  String validateString(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  static final String uploadEndPoint =
      'http://192.168.0.106:3300/api/v1/avatar_uploaders/';
  _saveToServer() {
    if (_key1.currentState.validate()) {
      // No any error in validation
      _key1.currentState.save();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  void chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

//   void startUpload() {
//   setStatus('Uploading Image...');
//   if (null == tmpFile) {
//     setStatus(errMessage);
//     return;
//   }
//   String fileName = tmpFile.path.split('/').last;
//   upload(fileName);
// }

// void upload(String fileName) {
//   http.post(uploadEndPoint, body: {
//     "image": base64Image,
//     "name": fileName,
//   }).then((result) {
//     setStatus(result.statusCode == 200 ? result.body : errMessage);
//   }).catchError((error) {
//     setStatus(error);
//   });
// }

  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  DateTime _date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        birthdate.text = formatDate(_date, [dd, '-', mm, '-', yyyy]);
      });
    }
  }

  bool imageNull() {
    if (file == null) return true;
    return false;
  }

  bool dateTimeNull() {
    if (_date == null) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 900, height: 1334, allowFontScaling: true);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: buildPreviousButton(),
          centerTitle: true,
          backgroundColor: colorApp,
          title: Text(
            'THÔNG TIN CÁ NHÂN',
          ),
        ),
        body: Consumer<PersonalInforModel>(
          builder: (_, model, __) {
            return SingleChildScrollView(
              child: Form(
                key: _key1,
                autovalidate: _validate,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(28),
                    right: ScreenUtil.getInstance().setWidth(28),
                    top: ScreenUtil.getInstance().setHeight(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ảnh đại diện',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        // padding: EdgeInsets.all(3.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: chooseImage,
                          child: imageNull()
                              ? Image.asset(
                                  'assets/user.png',
                                  width: 90,
                                )
                              : showImage(),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SmallTextField('Họ và tên', full_name),
                                  SmallTextField('Giới tính', gender),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 3.0, bottom: 5.0, left: 10),
                                    width: 360,
                                    height: 50,
                                    child: DropdownButton<int>(
                                      autofocus: true,
                                      underline: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.transparent,
                                      ),
                                      isExpanded: true,
                                      value: model.idProvince,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('Quê quán',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.grey)),
                                          value: null,
                                        ),
                                        ...List.generate(model.province.length,
                                            (index) {
                                          return DropdownMenuItem(
                                            child: Text(
                                                '${model.province[index].name}',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.grey)),
                                            value: model.province[index].id,
                                          );
                                        }),
                                      ],
                                      onChanged: (int value) {
                                        if (value != model.idProvince) {
                                          model.setIdProvince(value);
                                        }
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: black, width: 1.5),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                      padding: EdgeInsets.only(
                                          top: 3.0, bottom: 3.0),
                                      width: 360,
                                      height: 80,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 8,
                                            child: TextFormField(
                                              controller: birthdate,
                                              autofocus: true,
                                              validator: validate,
                                              onSaved: (String val) {
                                                if (dateTimeNull()) {
                                                  birthdate.text = val;
                                                } else {
                                                  birthdate.text = formatDate(
                                                      _date,
                                                      [dd, '/', mm, '/', yyyy]);
                                                }
                                              },
                                              enableSuggestions: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                hintText: 'Ngày sinh',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'UTM',
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Expanded(
                                              child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: black),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: IconButton(
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                onPressed: () {
                                                  selectDate(context);
                                                }),
                                          )),
                                        ],
                                      )),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 3.0, bottom: 5.0, left: 10),
                                    width: 360,
                                    height: 50,
                                    child: DropdownButton<int>(
                                      autofocus: true,
                                      underline: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.transparent,
                                      ),
                                      isExpanded: true,
                                      value: model.idVoice,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('Giọng nói',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.grey)),
                                          value: null,
                                        ),
                                        ...List.generate(model.voice.length,
                                            (index) {
                                          return DropdownMenuItem(
                                            child: Text(
                                                '${model.voice[index].name}',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.grey)),
                                            value: model.voice[index].id,
                                          );
                                        }),
                                      ],
                                      onChanged: (int value) {
                                        if (value != model.idVoice) {
                                          model.setIdVoice(value);
                                        }
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: black, width: 1.5),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  SmallTextField(
                                      'Link Facebook của bạn', facebook),
                                  SmallTextField('Số điện thoại', phone_number),
                                  SmallTextField('Email', email),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 3.0, bottom: 5.0, left: 10),
                                    width: 360,
                                    height: 50,
                                    child: DropdownButton<int>(
                                      autofocus: true,
                                      underline: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        color: Colors.transparent,
                                      ),
                                      isExpanded: true,
                                      value: model.idCity,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('Địa điểm dạy',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.grey)),
                                          value: null,
                                        ),
                                        ...List.generate(model.city.length,
                                            (index) {
                                          return DropdownMenuItem(
                                            child: Text(
                                                '${model.city[index].name}',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.grey)),
                                            value: model.city[index].id,
                                          );
                                        }),
                                      ],
                                      onChanged: (int value) {
                                        if (value != model.idCity) {
                                          model.setIdCity(value);
                                        }
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: black, width: 1.5),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  SmallTextField('Địa chỉ hiện tại', address),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, top: 10.0, bottom: 10.0),
                                    child: Text(
                                      'Ảnh xác thực',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10.0),
                                    // padding: EdgeInsets.all(3.0),

                                    width: SizeConfig.safeBlockHorizontal * 90,

                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(width: 5),
                                          Image.asset(
                                            'assets/user.png',
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    25,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Chứng minh thư mặt trước ',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Container(
                                                width: SizeConfig
                                                        .safeBlockHorizontal *
                                                    50,
                                                child: Text(
                                                  'CMT của bạn sẽ được sử dụng để xác thực. Thông tin này sẽ được chúng tôi bảo mật an toàn.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10.0),
                                    // padding: EdgeInsets.all(3.0),

                                    width: SizeConfig.safeBlockHorizontal * 90,

                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(width: 5),
                                          Image.asset(
                                            'assets/user.png',
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    25,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Thẻ sinh viên hoặc bằng cấp ',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Container(
                                                width: ScreenUtil.getInstance()
                                                    .setWidth(440),
                                                child: Text(
                                                  'Thẻ sinh viên/bằng cấp của bạn sẽ được sử dụng để xác thực. Thông tin này sẽ được chúng tôi bảo mật an toàn.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(50),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Wrap(
                                        children: <Widget>[
                                          Container(
                                            width: ScreenUtil.getInstance()
                                                .setWidth(300),
                                            height: ScreenUtil.getInstance()
                                                .setHeight(150),
                                            margin: EdgeInsets.all(5.0),
                                            child: Text(
                                              'Vui lòng cập nhập đầy đủ thông tin phía trên',
                                              style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Consumer<PersonalInforModel>(
                                          builder: (_, model, __) {
                                        return GestureDetector(
                                          onTap: () async {
                                            // startUpload();
                                            _saveToServer();
                                            model.personalInfor["full_name"] =
                                                (full_name.text == "")
                                                    ? "null"
                                                    : full_name.text;
                                            model.personalInfor["location_id"] =
                                                (model.idCity == null)
                                                    ? "null"
                                                    : model.idCity.toString();
                                            model.personalInfor[
                                                    "native_country_id"] =
                                                (model.idProvince == null)
                                                    ? "null"
                                                    : model.idProvince
                                                        .toString();
                                            model.personalInfor["voice_id"] =
                                                (model.idVoice == null)
                                                    ? "null"
                                                    : model.idVoice.toString();
                                            if (gender != null)
                                              model.personalInfor["gender"] =
                                                  (gender.text == "")
                                                      ? "null"
                                                      : gender.text;
                                            if (birthdate != null)
                                              model.personalInfor["birthdate"] =
                                                  (birthdate.text == "")
                                                      ? "null"
                                                      : birthdate.text;
                                            model.personalInfor[
                                                    "phone_number"] =
                                                (phone_number.text == "")
                                                    ? "null"
                                                    : phone_number.text;
                                            model.personalInfor["facebook"] =
                                                (facebook.text == "")
                                                    ? "null"
                                                    : facebook.text;
                                            model.personalInfor["email"] =
                                                (email.text == "")
                                                    ? "null"
                                                    : email.text;
                                            model.personalInfor["address"] =
                                                (address.text == "")
                                                    ? "null"
                                                    : address.text;
                                            print(
                                                model.personalInfor.toString());
                                            // var success = await model
                                            //     .personalInforCheckup(
                                            //         personalInfor);
                                            // if (success) {
                                            Navigator.pushNamed(
                                                context, '/specialty');
                                            // } else {
                                            //   var _message = await model.Infor;
                                            //   showInSnackBar(_message);
                                            // }
                                          },
                                          child: Image.asset(
                                            "assets/next.png",
                                            width: 100,
                                          ),
                                        );
                                      }),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  String validate(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }
}
