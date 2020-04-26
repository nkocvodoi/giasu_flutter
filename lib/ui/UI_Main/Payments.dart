import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/paymentModel.dart';
import 'package:test_giasu/ui/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailRequestDemo.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/UI_Main/Nap_Bits.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

import 'ClassDetail4.dart';

class Payments extends StatefulWidget {
  int phinhanlop;
  int nophi;
  Data_class classData;
  Payments(this.phinhanlop, this.nophi,this.classData);
  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return _Payments_State(this.phinhanlop, this.nophi);
  }
}

class _Payments_State extends State<Payments> {

  int phinhanlop;
  int nophi;
  _Payments_State(this.phinhanlop, this.nophi);

  List<String> _menu1 = ['Thanh toán đủ phí'];
  List<String> _menu2 = ['Thanh toán đủ phí', 'Nợ phí',
  ];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        leading: buildPreviousButton(),
        backgroundColor: colorApp,
      ),
      body:Consumer<PaymentModel>(
          builder: (_ ,model, __) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 80.0,
                      child: Text(
                        'Chọn hình thức thanh toán',
                        style: TextStyle(
                             color: Colors.white, fontSize: 18.0),
                      ),
                      decoration: BoxDecoration(
                        color: colorApp,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        
                        width: 380,
                        child: Text(
                          '${model.mess_thanhtoan}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: colorApp, fontSize: 18.0),
                        ),
                      ),
                    Expanded(child: SizedBox()),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 240),
                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        color: colorApp,
                        onPressed: () async {
                          int _code = await model.thanhtoan(634, phinhanlop);
                          if(_code == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ClassDetail4(widget.classData),
                              ),
                            );
                          }
                          else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Nap_Bits(model.message),
                              ),
                            );
                          }
//                        print(model.phi_nhanlop(346332, 40, 23));
                        },
                        child: Text(
                          'Thanh toán',
                          style: TextStyle(
                            
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
                Positioned(
                  top: 60,
                  child: Container(
                    height: 50,
                    
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: DropdownButton<String>(
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        iconSize: 36,
                        value: model.v,
                        items: (phinhanlop<nophi ? _menu1 : _menu2).map((_menu) {
                          return DropdownMenuItem(
                            value: _menu,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  _menu,
                                  style:
                                  TextStyle(fontSize: 18.0, color: black),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                //Icon(Icons.keyboard_arrow_down, size: 10,)
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String val) async {
                          model.setValue(val);
//                          await model.thanhtoan(640, 4, 1826321);
                        model.setMess_thanhtoan(phinhanlop, nophi);

                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                ),
              ],
            );
          }
      ) ,

    );
  }
}
