import 'package:flutter/material.dart';

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

  List<bool> cout(int n) {
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
        }
        break;
        case 1:
        if (val != isSelected1[index]) {
          isSelected1[index] = val;
        }
        break;
        case 2:
        if (val != isSelected2[index]) {
          isSelected2[index] = val;
        }
        break;
        case 3:
        if (val != isSelected3[index]) {
          isSelected3[index] = val;
        }
        break;
        case 4:
          if (val != isSelected4[index]) {
          isSelected4[index] = val;
        }
          break;
        case 5:
          if (val != isSelected5[index]) {
          isSelected5[index] = val;
        }
        break;
      default:
        if (val != isSelected6[index]) {
          isSelected6[index] = val;
        }
        break;
    }
    notifyListeners();
  }

}