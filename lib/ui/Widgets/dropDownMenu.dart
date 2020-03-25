import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';

class DropDownMenu extends StatelessWidget {
  List list = List();
  int id;
  String subject;
  int type;
  DropDownMenu(this.list, this.subject, this.id,this.type);

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return DropDownMenuState(list, subject, id);
//   }
// }

// class DropDownMenuState extends State<DropDownMenu> {
//   List list = List();
//   int id;
//   String subject;
//   DropDownMenuState(this.list, this.subject, this.id);
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterModel>(builder: (_, model, __) {
      // TODO: implement build
      return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        padding: EdgeInsets.only(left: 20),
        height: 50,
        width: 320,
        child: DropdownButton<int>(
          underline: Container(
            color: Colors.transparent,
          ),
          isExpanded: true,
          value: model.idSubject,
          items: [
            DropdownMenuItem(
              child: Text(subject,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey)),
              value: null,
            ),
            ...List.generate(list.length, (index) {
              return DropdownMenuItem(
                child: Text('${list[index].name}',
                    style: TextStyle(fontSize: 18.0, color: Colors.grey)),
                value: list[index].id,
              );
            }),
          ],
          onChanged: (int value) {
            if(value != id){
              
             model.setIdSubject(value);
            }
          },
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueAccent, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      );
    });
  }
}
