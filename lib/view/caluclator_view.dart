import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final lstText = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];

  String operator = "";
  int firstNum = 0;
  int secondNum = 0;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 4 / 5,
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  for (int i = 0; i < lstText.length; i++)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Handle button press
                        if (lstText[i].contains(RegExp(r'[0-9]'))) {
                          _controller.text += lstText[i];
                        } else if (lstText[i] == "C") {
                          _controller.clear();
                        } else if (lstText[i] == "<-") {
                          _controller.text = _controller.text.substring(
                            0,
                            _controller.text.length - 1,
                          );
                        } else if (lstText[i] == "=") {
                          secondNum = int.parse(_controller.text);
                          switch (operator) {
                            case "+":
                              _controller.text =
                                  (firstNum + secondNum).toString();
                              break;
                            case "-":
                              _controller.text =
                                  (firstNum - secondNum).toString();
                              break;
                            case "*":
                              _controller.text =
                                  (firstNum * secondNum).toString();
                              break;
                            case "/":
                              _controller.text =
                                  (firstNum ~/ secondNum).toString();
                              break;
                            default:
                              break;
                          }
                        } else {
                          operator = lstText[i];
                          firstNum = int.parse(_controller.text);
                          _controller.clear();
                        }
                      },
                      child: Text(
                        lstText[i],
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
