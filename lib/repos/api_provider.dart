import 'package:flutterapppagination/model/reposdata.dart';
import 'package:flutterapppagination/util/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiProvider{

  http.Client client= http.Client();

  Future<List<ReposData>> getRepositoryData(String firstKey,String keyword) async{

    Map<String, String> queryParams = {
      'page': firstKey,
      'per_page': keyword
    };
    String queryString = Uri(queryParameters: queryParams).query;

    var response=await http.get(base_url+"?page=${firstKey}&per_page=${keyword}");
    /*page=${firstKey}&per_page=${keyword}*/
    print(base_url+"?page=${firstKey}&per_page=${keyword}");

    List data=json.decode(response.body);
    List<ReposData> datas=[];
    print(response.body);
    if(response.statusCode==200){
//      print(ReposData.fromJson(data));
     /*  data.map((e) =>
       datas.add(ReposData.fromJson(e)));*/
     return data.map((e) => ReposData.fromJson(e)).toList();
    }else{
      throw Exception('Failed to load post');
    }

  }
}