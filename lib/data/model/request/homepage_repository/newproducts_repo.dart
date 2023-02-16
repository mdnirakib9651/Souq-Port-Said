import '../../../../utill/images.dart';
import '../../response/homepage_model/newproduct_model.dart';

class NewProductsRepository{
  List<NewProductsModel> newProductList = [
    NewProductsModel(1, Images.watch, "Space Gray Aluminum Case With Sport Bard", "342.34"),
    NewProductsModel(2, Images.camera1, "Harman Kardon Allure Bluetooth Speaker", "87564.56"),
    NewProductsModel(3, Images.iPhone1, "Immerse yourself in real-world learning. ", "435.98"),
    NewProductsModel(4, Images.ladiesBeg1, "Gain the skills to excel in the world of business", "44.3"),
    NewProductsModel(5, Images.ladiesBeg2, "Don't miss the application", "99.86"),
    NewProductsModel(6, Images.lens1, "window for our world-renowned, interactive", "876.90"),
    NewProductsModel(7, Images.powerBank1, "online courses. World-Class Content", "71.90"),
    NewProductsModel(8, Images.tShart1, "Online Courses. Social Learning Platform.", "87.90"),
    NewProductsModel(9, Images.tShart2, "Unique Online Programs. Apply for Free.", "12.90"),
    NewProductsModel(10, Images.watch2, "Find the lowest price for Online Certificate Courses today", "44.90"),
    NewProductsModel(11, Images.watch3, "Now on sale at GigaPromo. GigaPromo is the website", "76.90"),
  ];
  Future<List<NewProductsModel>> getNewProductListData() async{
    return newProductList;
  }
}