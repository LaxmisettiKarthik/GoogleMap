import 'package:get/get.dart';

class SelectedListContoller extends GetxController {
  var _selectedList = List<String>.empty(growable: true).obs;
  getSelectedList() => _selectedList;
  setSelectedList(List<String> list) => _selectedList.value = list;
}
