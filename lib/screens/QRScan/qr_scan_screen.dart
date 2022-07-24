import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

class QRScanScreen extends StatelessWidget {
  const QRScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('QR Scan')),
        body: const Center(
          child: Text(
            "Under Implementation",
            style: TextStyle(color: primaryColor, fontSize: 25),
          ),
        ));
  }
}
