import 'package:flutter/material.dart';

class ColumnView extends StatelessWidget {
  const ColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Icon(Icons.star, size: 100),
              Spacer(),
              Icon(Icons.star, size: 100),
              Icon(Icons.star, size: 100),
            ],
          ),
        ),
      ),
    );
  }
}
