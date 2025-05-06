import 'package:batch34_b/model/arithmetic_model.dart';
import 'package:flutter/material.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  // TextEdiitingCOntroller
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  int result = 0;

  late ArithmeticModel model;

  // Global key
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arithmetic"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              TextFormField(
                // onChanged: (value) {
                //   first = int.parse(value);
                // },
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter first no",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter first number";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                // onChanged: (value) {
                //   second = int.parse(value);
                // },
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter second no",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter second number";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {}
                  },
                  child: Text("Add"),
                ),
              ),
              SizedBox(height: 8),

              Text("Result : $result", style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
