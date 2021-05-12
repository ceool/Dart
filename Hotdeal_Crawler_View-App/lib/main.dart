import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8, json;
import 'models/deal.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<List<Deal>> fetchDeals() async {
    List<Deal> deals = [];
    var url = Uri.parse('http://YOUR_IP:PORT/api/deals/');
    var response = await http.get(url);
    var data = json.decode(utf8.decode(response.bodyBytes));
    //print(data);

    print(data);
    data.forEach((e) {
      //print(e["title"]);
      Deal deal = Deal.fromJson(e);
      deals.add(deal);
    });

    return deals.reversed.toList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      new MyApp();
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: Text("hotdeal")),
        body: RefreshIndicator(
          key: refreshKey,
          child: FutureBuilder<List<Deal>>(
            future: fetchDeals(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    //reverse: true,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Deal deal = snapshot.data[index];
                      return ListTile(
                        onTap: () {
                          launch(deal.link);
                        },
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(deal.imageUrl)),
                        title: Text(
                          deal.title,
                          style: TextStyle(
                            fontSize: 15,
                            //color: Colors.amber
                          ),
                        ),
                        trailing: Text(deal.upCount.toString()),
                      );
                    });
              } else {
                return Center(
                  child: Text("no hot deal"),
                );
              }
            },
          ),
          onRefresh: refreshList,
        ),
      ),
    );
  }
}
