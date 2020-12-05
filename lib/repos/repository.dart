
import 'package:flutterapppagination/model/reposdata.dart';
import 'package:flutterapppagination/repos/api_provider.dart';

class Repository{

  ApiProvider provider= ApiProvider();

  Future<List<ReposData>> repositoryData(String firstKey,String keyword)=>provider.getRepositoryData(firstKey,keyword);
}