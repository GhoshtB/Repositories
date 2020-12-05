
import 'package:flutterapppagination/model/reposdata.dart';
import 'package:flutterapppagination/repos/repository.dart';
import 'package:rxdart/rxdart.dart';

class Repos_bloc{

  BehaviorSubject<List<ReposData>> _repoSubject= BehaviorSubject();
  Repository repository =Repository();

  getReposData(int page,int lastpage) async{

    List<ReposData> data =await repository.repositoryData("$page","$lastpage");

    _repoSubject.sink.add(data);
  }
  BehaviorSubject<List<ReposData>> get repoSubject=>_repoSubject.stream;
}

final bloc = Repos_bloc();