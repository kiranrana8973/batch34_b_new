import 'package:batch34_b/common/my_card.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 10; i++) ...{
                if (i % 2 == 0) ...{
                  MyCard(title: "Card $i", color: Colors.amber),
                } else ...{
                  MyCard(title: "Card $i", color: Colors.blue),
                },
              },
            ],
          ),
        ),
      ),
    );
  }
}
