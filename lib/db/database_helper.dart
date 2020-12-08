
import 'package:flutterapppagination/model/reposdata.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
 static Database database;
 static final DatabaseHelper instance= DatabaseHelper._privateConstructor();
 DatabaseHelper._privateConstructor();

  createDatabase() async {
    if(database==null){
      String databasesPath = await getDatabasesPath();
      String dbPath = join(databasesPath, 'repos.db');

      database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    }
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE ReposData ("
        "ids INTEGER PRIMARY KEY AUTOINCREMENT,"
        "id INTEGER,"
        "private TEXT,"
        "archive_url TEXT,"
        "archived TEXT,"
        "assignees_url TEXT,"
        "blobs_url TEXT,"
        "branches_url TEXT,"
        "clone_url TEXT,"
        "collaborators_url TEXT,"
        "comments_url TEXT,"
        "commits_url TEXT,"
        "compare_url TEXT,"
        "contents_url TEXT,"
        "contributors_url TEXT,"
        "created_at TEXT,"
        "default_branch TEXT,"
        "deployments_url TEXT,"
        "description TEXT,"
        "disabled TEXT,"
        "downloads_url TEXT,"
        "events_url TEXT,"
        "fork TEXT,"
        "forks TEXT,"
        "forks_count TEXT,"
        "forks_url TEXT,"
        "full_name TEXT,"
        "git_commits_url TEXT,"
        "git_refs_url TEXT,"
        "git_tags_url TEXT,"
        "git_url TEXT,"
        "has_downloads TEXT,"
        "has_issues TEXT,"
        "has_pages TEXT,"
        "has_projects TEXT,"
        "has_wiki TEXT,"
        "homepage TEXT,"
        "hooks_url TEXT,"
        "html_url TEXT,"
        "issue_comment_url TEXT,"
        "issue_events_url TEXT,"
        "issues_url TEXT,"
        "keys_url TEXT,"
        "labels_url TEXT,"
        "language TEXT,"
        "languages_url TEXT,"
        "license TEXT,"
        "merges_url TEXT,"
        "milestones_url TEXT,"
        "mirror_url TEXT,"
        "name TEXT,"
        "node_id TEXT,"
        "notifications_url TEXT,"
        "owner TEXT,"
        "open_issues TEXT,"
        "open_issues_count TEXT,"
        "pulls_url TEXT,"
        "pushed_at TEXT,"
        "releases_url TEXT,"
        "size TEXT,"
        "ssh_url TEXT,"
        "stargazers_count TEXT,"
        "stargazers_url TEXT,"
        "statuses_url TEXT,"
        "subscribers_url TEXT,"
        "subscription_url TEXT,"
        "svn_url TEXT,"
        "tags_url TEXT,"
        "teams_url TEXT,"
        "trees_url TEXT,"
        "updated_at TEXT,"
        "url TEXT,"
        "watchers TEXT,"
        "watchers_count TEXT"
        ")");
    
//database.delete("ReposData");

  }




  Future<int> createCustomer(ReposData customer) async {
    var result = await database.insert("ReposData", customer.toJson());
    print("createCustomer  ${result.toString()}");
    return result;
  }

  Future<List> getCustomers() async {
    var result = await database.query("ReposData", columns: ['private',
      'archive_url',
      'archived',
      'assignees_url',
      'blobs_url',
      'branches_url',
      'clone_url',
      'collaborators_url',
      'comments_url',
      'commits_url',
      'compare_url',
      'contents_url',
      'contributors_url',
      'created_at',
      'default_branch',
      'deployments_url',
      'description',
      'disabled',
      'downloads_url',
      'events_url',
      'fork',
      'forks' ,
      'forks_count',
      'forks_url',
      'full_name',
      'git_commits_url',
      'git_refs_url',
      'git_tags_url',
      'git_url',
      'has_downloads',
      'has_issues',
      'has_pages',
      'has_projects',
      'has_wiki',
      'hooks_url',
      'html_url',
      'id',
      'issue_comment_url',
      'issue_events_url',
      'issues_url',
      'keys_url',
      'labels_url',
      'languages_url',
      'merges_url',
      'milestones_url',
      'name',
      'node_id',
      'notifications_url',
      'open_issues',
      'open_issues_count',
      'pulls_url',
      'pushed_at',
      'releases_url',
      'size',
      'ssh_url',
      'stargazers_count',
      'stargazers_url',
      'statuses_url',
      'subscribers_url',
      'subscription_url',
      'svn_url',
      'tags_url',
      'teams_url',
      'trees_url',
      'updated_at',
      'url',
      'watchers',
      'watchers_count',]);
    print("getCustomer  ${result.toList()}");
    return result.toList();
  }

  Future<List> getsCustomers() async {
    var result = await database.rawQuery('SELECT * FROM ReposData');
    return result.toList();
  }

}