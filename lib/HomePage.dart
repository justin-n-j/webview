import 'package:flutter/material.dart';
import 'WebView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        backgroundColor: Colors.black,
      ),
      body: Container(
          color: Colors.black,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              color: Colors.blue,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewScreen(
                          url: "https://flutter.dev/",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Go",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
          )),
    );
  }
}
