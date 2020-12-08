import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutterapppagination/bloc/repos_bloc.dart';
import 'package:flutterapppagination/db/database_helper.dart';
import 'package:flutterapppagination/model/reposdata.dart';
import 'package:flutterapppagination/util/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MyPaginationPage(),
    );
  }
}

class MyPaginationPage extends  StatefulWidget{
  @override
  State createState() => MyPaginationPageState();
}

class MyPaginationPageState extends State<MyPaginationPage> {
  var list = [];
  var widgetList = <Widget>[];
  var inPage=1,lastpage=15;
  ScrollController controller=ScrollController();
  var database;
  var hasInternet=true;
  var dbDts;


  @override
  void initState() {
    database= DatabaseHelper.instance;
    isInternets();

    makeApiCalls();
  }


  @override
  void setState(VoidCallback fn) {
    isInternets();
  }

  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Repositories",
          style: TextStyle(fontSize: 18),),),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Flexible(child: StreamBuilder(builder: (context,AsyncSnapshot<List<ReposData>> snapshot){

                  getDbDetails(snapshot.data);
                  // Future.delayed(Duration(),(){
                // callDatabase();
                  // });


                  if(snapshot.hasData ){

                    // if(snapshot.hasData)
                    // {
                      if(list.length>0){list.removeLast();}
                      /*for(var i=0;i<snapshot.data.length;i++){
                      if(i<3){
                        list.add(snapshot.data[i]);
                      }
                    }*/

                      list.addAll(snapshot.data);
                      list.add(ReposData());
                    // }
//                  if(!hasInternet){
//                    list.clear();


//                  }
                    if(snapshot.data.length>0){

                    }
                    list.map((e) => widgetList.add(ItemViews(e)));
                    widgetList.add(Container(height: isLoading?50.0:0.0,
//          color: Colors.amber,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),));
                  }else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(list.length>0)
                  {
                    return Expanded( child:NotificationListener<ScrollNotification>(
                      child: ListView.builder(itemBuilder: (context,index){/*widgetList[index]*/
                        if(index<list.length-1 && list[index].description!=null && list[index].description.isNotEmpty){
                          return ItemViews(list[index]);
                        }else if(index==list.length-1){
                          return Container(height: 50.0,width: 50,
//          color: Colors.amber,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),);
                        }

                      },
                        itemCount:/*snapshot.data == null ||
                snapshot.data.length == null
                ? 0
                : snapshot.data.length*/list.length,
                        physics: BouncingScrollPhysics(),
                      )
                      /* ListView.builder(itemBuilder: (context,index)=>ItemViews(list[index]),
        itemCount: list.length,
        physics: BouncingScrollPhysics(),
      ),*/
                      ,onNotification:  (ScrollNotification scrollInfo) {
                      isInternets();
                      if (!isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        // start loading data
                        setState(() {
                          isLoading = true;
                        });
//            _loadData();
                        inPage=lastpage;

                        lastpage+=15;
                        bloc.getReposData(inPage, lastpage);

                      }
                    },));
                  }else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(!snapshot.hasData || snapshot.hasError){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },stream:/*(hasInternet as bool)?*/ bloc.repoSubject/*:database.getCustomers()*/,)),
                Container(height: isLoading?50.0:0.0,
//          color: Colors.amber,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),)
              ],
            ),
            Positioned(child: Container(height: isLoading?50.0:0.0,
//          color: Colors.amber,
              child: Center(
                child: CircularProgressIndicator(),
              ),)
              ,bottom: 0.0,)
          ],
        )
    );
  }

  /* Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(new Duration(seconds: 1));
    // update data and loading status
    setState(() {
      list.addAll( ['new item']);
      isLoading=false;
    });
  }*/
  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Mobile data detected & internet connection confirmed.
        hasInternet=true;
        return true;
      } else {
        // Mobile data detected but no internet connection found.
        hasInternet=false;
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
        hasInternet=true;

        return true;
      } else {
        // Wifi detected but no internet connection found.
        hasInternet=false;

        return false;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      hasInternet=false;

      return false;
    }

  }

  void getDbDetails(List<ReposData> datas) async{
    if(inPage==1 && datas.length>0){

      // Future.delayed(Duration(),(){
       /* datas.map((e) {
          var i= database.createCustomer(e);
          print("createCustomer${i}");});*/
        for(var dt in datas){
          var i= database.createCustomer(dt);
          print("createCustomer${i}");
        }

      // });

    }

   /* Future.delayed(Duration(seconds: 1),(){


    });*/
    print("database${database}");
    dbDts=await database.getCustomers();
    /*if(datas.length>0){
      Future.delayed(Duration(seconds: 3), () {
        print("${dbDts.length}");
        if (list.length > dbDts.length) {
          datas.map((e) => database.createCustomer(e));
        }
      });
    }*/
  }

  isInternets() async {
    await isInternet().then((value) => hasInternet=value);
  }

  void makeApiCalls() {

    database.createDatabase();
    if(hasInternet){ Future.delayed(Duration(seconds: 2),(){  bloc.getReposData(1,15);});}

  }

  void callDatabase() async{
    print("database ${database}");
    dbDts=await database.getCustomers();
    print("objectgetCustomers${dbDts.toString()}");
    if(inPage==1){
      dbDts.map((e)=>list.add(e));}
    print("hasInternet ${list.length}");
  }


}



Widget ItemViews(ReposData data) =>Container(padding: EdgeInsets.all(10)
  ,child: Material(
    elevation:3,
//    shadowColor: Colors.black12,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
//        side: BorderSide(color: Colors.red)
    ),
    child:Center(child: Padding(child:
    ExpansionTile(title:Container(margin: EdgeInsets.all(8), child:Text("Name:${data.full_name??""}",style: titlestyle,)),
      subtitle: Column(
        children: <Widget>[
          Text(data.description??"",style: othertyle,),
          Center(
            child: Icon(Icons.keyboard_arrow_down,color: Colors.amber[300],size: 50,),
          )
        ],
      ),

      trailing: Text(data.language??"",style: othertyle,),
      children: <Widget>[
        Padding(padding: EdgeInsets.all(3),child: Text(data.archive_url!=null?data.archive_url:"",style: childtyle,),),
        Padding(padding: EdgeInsets.all(3),child: Text(data.assignees_url!=null?data.assignees_url:"",style: childtyle,),),
        Padding(padding: EdgeInsets.all(3),child:Text(data.blobs_url!=null?data.blobs_url:"",style: childtyle,),),
        Padding(padding: EdgeInsets.all(3),child:Text(data.clone_url!=null?data.clone_url:"",style: childtyle,),),
        Padding(padding: EdgeInsets.all(3),child:Text(data.collaborators_url!=null?data.collaborators_url:"",style: childtyle,),),
        Padding(padding: EdgeInsets.all(3),child:Text(data.commits_url!=null?data.commits_url:"",style: childtyle,),),
        Padding(padding: EdgeInsets.all(3),child:Text(data.forks_url!=null?data.forks_url:"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.git_commits_url!=null?data.git_commits_url:"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.git_commits_url!=null?data.git_commits_url:"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.html_url!=null?data.html_url:"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.teams_url!=null?data.teams_url:"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.teams_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.hooks_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.issue_events_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.events_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.branches_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.git_tags_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.branches_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.trees_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.statuses_url??"",style: childtyle,),)
        ,Padding(padding: EdgeInsets.all(3),child:Text(data.languages_url??"",style: childtyle,),)
      ],),padding: EdgeInsets.all(5),),),
  ),);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
