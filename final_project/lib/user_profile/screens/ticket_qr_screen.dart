import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../data/user.dart';

class TicketQR extends StatelessWidget {
  const TicketQR({Key? key, required Data ticketData})
      : _ticketData = ticketData,
        super(key: key);

  final Data _ticketData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_ticketData.name!),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: QrImage(
                foregroundColor: Colors.white,
                data: jsonEncode(_ticketData.toJson()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
