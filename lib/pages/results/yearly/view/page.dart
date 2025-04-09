import 'package:flutter/material.dart';

class YearlyResultPage extends StatelessWidget {
  const YearlyResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yearly Result'),
      ),
      body: const Center(
        child: Text(
          'Yearly Result Page',
        ),
      ),
    );
  }
}
