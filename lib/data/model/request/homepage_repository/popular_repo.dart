import '../../../../utill/images.dart';
import '../../response/homepage_model/popular_model.dart';

class PopularRepository{

  List<PopularModel> popularList = [
    PopularModel(1, Images.watch, "Space Gray Aluminum Case With Sport Bard", "342.34"),
    PopularModel(1, Images.camera1, "Harman Kardon Allure Bluetooth Speaker", "87564.56"),
    PopularModel(1, Images.iPhone1, "Immerse yourself in real-world learning. ", "435.98"),
    PopularModel(1, Images.ladiesBeg1, "Gain the skills to excel in the world of business", "44.3"),
    PopularModel(1, Images.ladiesBeg2, "Don't miss the application", "99.86"),
    PopularModel(1, Images.lens1, "window for our world-renowned, interactive", "876.90"),
    PopularModel(1, Images.powerBank1, "online courses. World-Class Content", "71.90"),
    PopularModel(1, Images.tShart1, "Online Courses. Social Learning Platform.", "87.90"),
    PopularModel(1, Images.tShart2, "Unique Online Programs. Apply for Free.", "12.90"),
    PopularModel(1, Images.watch2, "Find the lowest price for Online Certificate Courses today", "44.90"),
    PopularModel(1, Images.watch3, "Now on sale at GigaPromo. GigaPromo is the website", "76.90"),
  ];
  Future<List<PopularModel>> getPopularListData() async{
    return popularList;
  }
}