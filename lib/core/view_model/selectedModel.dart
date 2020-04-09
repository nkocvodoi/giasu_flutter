import 'package:flutter/material.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';

class SelectedTimeModel extends ChangeNotifier {
//SelectedColumnModel selectedColumnModel;
//SelectedTimeModel({this.selectedColumnModel});

//List<bool> _count = selectedColumnModel.isSelected;

  List<bool> isSelected = List.filled(3, false, growable: true);
  List<bool> isSelected1 = List.filled(3, false, growable: true);
  List<bool> isSelected2 = List.filled(3, false, growable: true);
  List<bool> isSelected3 = List.filled(3, false, growable: true);
  List<bool> isSelected4 = List.filled(3, false, growable: true);
  List<bool> isSelected5 = List.filled(3, false, growable: true);
  List<bool> isSelected6 = List.filled(3, false, growable: true);
  List<bool> isSelect = List.filled(21, false, growable: true);
  
   List<bool> get listSelected => isSelect;
  List<bool> count(int n) {
    switch(n) {
      case 0: return isSelected;
      break;
      case 1: return isSelected1;
      break;
      case 2: return isSelected2;
      break;
      case 3: return isSelected3;
      break;
      case 4: return isSelected4;
      break;
      case 5: return isSelected5;
      break;
      default: return isSelected6;
      break;
    }
  }
  void setCount(bool val, int index, int n) {
    switch(n) {
      case 0:
        if (val != isSelected[index]) {
          isSelected[index] = val;
          isSelect[index + n*3] = val;
          Schedule newSchedule = Schedule(id: (index + n*3 +1),day: n,session: (index + n*3));
        }
        break;
        case 1:
        if (val != isSelected1[index]) {
          isSelected1[index] = val;
          isSelect[index + n*3] = val;
        }
        break;
        case 2:
        if (val != isSelected2[index]) {
          isSelected2[index] = val;
          isSelect[index + n*3] = val;
        }
        break;
        case 3:
        if (val != isSelected3[index]) {
          isSelected3[index] = val;
          isSelect[index + n*3] = val;
        }
        break;
        case 4:
          if (val != isSelected4[index]) {
          isSelected4[index] = val;
          isSelect[index + n*3] = val;
        }
          break;
        case 5:
          if (val != isSelected5[index]) {
          isSelected5[index] = val;
          isSelect[index + n*3] = val;

        }
        break;
      default:
        if (val != isSelected6[index]) {
          isSelected6[index] = val;
          isSelect[index + n*3] = val;
        }
        break;
    }
    notifyListeners();
    print(isSelect[0].toString()+ isSelect[10].toString() + isSelect[20].toString());
  }

}