import '../../../../utill/images.dart';
import '../../response/find product model/findwoman_model.dart';

class FindWoman_Repository{
  List<FindWoman_model> findWomanList = [
    FindWoman_model(1, Images.dress, "Dress",),
    FindWoman_model(1, Images.womanTshirt, "Woman T-Shirt",),
    FindWoman_model(1, Images.womanPants, "Woman Pants",),
    FindWoman_model(1, Images.skirt, "Skirt",),
    FindWoman_model(1, Images.womanBag, "Woman Nag",),
    FindWoman_model(1, Images.heels, "High Heels",),
  ];
  Future<List<FindWoman_model>> getFindWomanListData() async{
    return findWomanList;
  }
}