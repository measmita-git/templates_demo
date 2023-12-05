import 'package:get/get.dart';

class ExpandableNavBarController extends GetxController {
  var _isExpanded = false.obs;

  bool get isExpanded => _isExpanded.value;

  var _isSelect = false.obs;

  bool get isSelect=> _isSelect.value;

  void toggleExpansion() {
    _isExpanded.value = !_isExpanded.value;
  }
}
