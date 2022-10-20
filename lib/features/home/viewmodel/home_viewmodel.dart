import 'package:chex_test_case/core/_core_exports.dart';
import 'package:chex_test_case/core/const/size_const.dart';
import 'package:chex_test_case/features/home/model/menu.dart';
import 'package:chex_test_case/features/home/service/home_service.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  List<MenuModel> menuList = [];
  final ScrollController itemScrollController = ScrollController();
  bool isLoad = false;
  int selectedIndex = 0;

  void selectedItem(int index) {
    double offsetFrom = 0.0;
    selectedIndex = index;
    offsetFrom += (100 * ApplicationConstants.allCardHeight + 50.0.px) * index;
    itemScrollController.animateTo(offsetFrom, duration: const Duration(milliseconds: 300), curve: Curves.bounceOut);
    notifyListeners();
  }

  void changeLoading() {
    isLoad = !isLoad;
    notifyListeners();
  }
  Future<void> initView() async {
    double scrollOffset=0;
    menuList = [];
    changeLoading();
    menuList = (await HomeService().fetcMenuModel())!;
    itemScrollController.addListener(
      () {
         scrollOffset = itemScrollController.offset / (100 * ApplicationConstants.allCardHeight + 50.0.px);
        if (scrollOffset != selectedIndex) {
          selectedIndex = scrollOffset.toInt();
          notifyListeners();
        }
      },
    );
    changeLoading();
  }
}
