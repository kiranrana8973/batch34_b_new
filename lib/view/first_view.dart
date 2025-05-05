import 'package:flutter/material.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar"),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(),
          TextField(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text("Add")),
          ),
          Text("Result : 0"),
        ],
      ),
    );
  }
}
