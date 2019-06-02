import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static BuildContext _context;
  var time;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;
  _launchUrl() async {
    const url = 'https://api.whatsapp.com/send?phone=919414510891&text=Hello';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _MyHomePageState() {
    _controller = TabController(vsync: this, length: tabs.length);
    time = DateTime.now();
  }
  final tabs = <Widget>[
    Tab(
      child: Text("Pending",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          )),
    ),
    Tab(
      child: Text("Completed",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          )),
    ),
  ];
  String greetings = "Morning ";
  var _list;
  @override
  void initState() {
    super.initState();
    //build the list here
    _list=ListView.builder(
      itemCount: 10,
      itemBuilder: (context,i){
        return Container(
          padding: EdgeInsets.all(13),
          child: Container(
            //color: Colors.white,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
          ),
        );
      },
    );
    if (time.hour > 12) greetings = "Afternoon ";
    if (time.hour > 17) greetings = "Evening ";
  }
_fun(){

    }
  
  @override
  Widget build(BuildContext context) {
    _context = context;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size(_width, _height / 5),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12),
            ),
            ListTile(
              title: Text(
                greetings,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
              ),
              subtitle: Text("Here's <something cool here>"),
              // trailing: Text(
              //   "${percent.floor().toString()}% +ve",
              //   style: TextStyle(
              //       color: Colors.blue,
              //       fontSize: 30,
              //       fontWeight: FontWeight.w300),
              // ),
            ),
            Divider(
              color: Colors.grey,
              indent: 5,
            ),
            TabBar(
              controller: _controller,
              tabs: tabs,
              indicatorWeight: 1,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          (_list != null) ? _list : Container(),
          (_list != null) ? _list : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _fun,
      ),
      floatingActionButtonLocation: Location(),
    );
    
  }
  
}
class Location extends FloatingActionButtonLocation{
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // TODO: implement getOffset
    return Offset(
      
    );
  }
    
}
