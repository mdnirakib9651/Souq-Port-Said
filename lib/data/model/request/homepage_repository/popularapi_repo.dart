import 'dart:convert';
import '../../response/homepage_model/popularapi_model.dart';
import 'package:http/http.dart' as http;

class PopularApiRepository{
  Future<List<PopularApiModel>> getPopularListData(context) async{
    List<PopularApiModel> popularApiList = [];
    try{
      var uri = Uri.https('fakestoreapi.com', '/products');

      var response = await http.get(uri);
      if(response.statusCode == 200){
        var item = json.decode(response.body);

        for(var json in item){
          PopularApiModel popular = PopularApiModel(
            id: json['id'],
            title: json['title'],
            price: json['price'],
            description: json['description'],
            category: json['category'],
            image: json['image'],
              rating : Rating.fromJson(json['rating']),
          );
          popularApiList.add(popular);
        }
      } else{
        print("Data Not Found");
      }
    } catch(error){
      print(error);
    }
    return popularApiList;
  }
}