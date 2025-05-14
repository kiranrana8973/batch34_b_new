import 'package:batch34_b/common/my_snackbar.dart';
import 'package:flutter/material.dart';

class FlexibleExpandedView extends StatelessWidget {
  const FlexibleExpandedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            //flex: 1,
            child: GestureDetector(
              onTap: () {
                showMySnackBar(context: context, message: "Container 1");
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.red,
                child: Text("COntainer 1", style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
          Expanded(
            //flex: 2,
            child: GestureDetector(
              onDoubleTap: () {
                showMySnackBar(
                  context: context,
                  message: "Container 2",
                  color: Colors.red,
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.yellow,
                child: Text("COntainer 2", style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
