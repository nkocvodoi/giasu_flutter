import 'package:flutter/material.dart';
import 'package:test_giasu/core/model/List_TeacherData.dart';
import 'package:test_giasu/ui/Students/PostRequest.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/Anouncement.dart';
import 'package:test_giasu/ui/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInforDemo.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/UI_Main/Lists_Class.dart';

class MyBottomNavigationBarStudent extends StatefulWidget {

  var currentIndex;
  String name, subject, grade, form_teaching;
  String status, address, about_course;
  String id,
      lesson_per_week,
      tuition_fee,
      class_fee,
      time_per_lesson,
      student_per_class;
  MyBottomNavigationBarStudent(
    this.currentIndex,
      this.name,
      this.status,
      this.id,
      this.subject,
      this.grade,
      this.form_teaching,
      this.lesson_per_week,
      this.time_per_lesson,
      this.student_per_class,
      this.address,
      this.tuition_fee,
      this.class_fee,
      this.about_course);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarState(currentIndex, name,
        status,
        id,
        subject,
        grade,
        form_teaching,
        lesson_per_week,
        time_per_lesson,
        student_per_class,
        address,
        tuition_fee,
        class_fee,
        about_course);
  }
}

class _BottomNavigationBarState extends State<MyBottomNavigationBarStudent> {
String name, subject, grade, form_teaching;
  String status, address, about_course;
  String id,
      lesson_per_week,
      tuition_fee,
      class_fee,
      time_per_lesson,
      student_per_class;

  var currentIndex;
  _BottomNavigationBarState(this.currentIndex,this.name,
      this.status,
      this.id,
      this.subject,
      this.grade,
      this.form_teaching,
      this.lesson_per_week,
      this.time_per_lesson,
      this.student_per_class,
      this.address,
      this.tuition_fee,
      this.class_fee,
      this.about_course);
  List<Data_teacher> teacher;
  Future<TeacherData> list_teacher;

  @override
  void initState() {
    super.initState();
    list_teacher = fetchTeacherData();
  }
   List<Widget> _children = [
    ClassDetailWithMoreTutorInforDemo(),
    
    Bits_Manager(),
    Anouncement(),
    Account(),
  ];
  void _onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: blue,
          unselectedItemColor: black,
          type: BottomNavigationBarType.fixed,
          onTap: _onTappedBar,
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 45.0,
              ),
              title: Text(
                'Trang chủ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
           
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
                size: 45.0,
              ),
              title: Text(
                'Thanh toán',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                size: 45.0,
              ),
              title: Text(
                'Hộp thư',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 45.0,
              ),
              title: Text(
                'Tài khoản',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ));
  }
}
