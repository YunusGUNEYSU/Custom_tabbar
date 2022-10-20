import 'package:chex_test_case/features/home/model/menu.dart';
import 'package:chex_test_case/features/home/service/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeViewModel extends ChangeNotifier {
   List<MenuModel> menuList=[];
  final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  bool isLoad = false;
  int selectedIndex = 0;
  double offsetFrom=0.0;
  void selectedItem(int index){
    selectedIndex=index;
     itemScrollController.scrollTo(index: index, duration:const Duration(milliseconds: 30));
    notifyListeners();
  }
  void changeLoading() {
    isLoad = !isLoad;
    notifyListeners();
  }

  Future<void> initView() async {
    menuList=[];
    changeLoading();
    menuList = (await HomeService().fetcMenuModel())!;
    changeLoading();
  }
}
