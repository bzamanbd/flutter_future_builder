import 'package:flutter/material.dart';

class FutureScreen extends StatelessWidget {
  final String title;
  const FutureScreen({Key? key, required this.title}) : super(key: key);

  Future<String> getData() async {
    final message = await Future.delayed(const Duration(seconds: 3), () {
      return 'Hello Flutter Developer';
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: FutureBuilder(
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(),
      ),
    );
  }
}
