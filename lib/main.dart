import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Get Device ID"),
          centerTitle: true,
        ),
        body: Home(),
      )
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data = "here will show user id";

  var channel = MethodChannel("GETID");
  getData() async {
    data = await channel.invokeMethod("getid");
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: [
                Text(data),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: getData,
                  child: Text("Get Device Id"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

