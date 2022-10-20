import 'package:chex_test_case/features/home/model/_model_exports.dart';

class HomeService {
   
  Future<List<MenuModel>?> fetcMenuModel() async{
    List<MenuModel> listMenuModel=[];
     await Future.delayed(const Duration(seconds: 2),() {
      List.generate(100, (index) {
      List<ItemsModel> tempItemModel=[];
      List.generate(100, (indexIn) {
        tempItemModel.add(ItemsModel((index*100)+indexIn));
      });
      listMenuModel.add(MenuModel(index.toString(), tempItemModel));
    }
    
    );
 
      
    });
   //
    return listMenuModel;
  }
}