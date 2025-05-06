import 'package:batch34_b/model/arithmetic_model.dart';
import 'package:flutter/material.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  int first = 0;
  int second = 0;
  int result = 0;

  late ArithmeticModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arithmetic"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              first = int.parse(value);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter first no",
            ),
          ),
          SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              second = int.parse(value);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter second no",
            ),
          ),
          SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  model = ArithmeticModel(first: first, second: second);
                  result = model.add();
                });
              },
              child: Text("Add"),
            ),
          ),
          SizedBox(height: 8),

          Text("Result : $result", style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
