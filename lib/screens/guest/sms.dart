import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

List<String> recipents = ["+237 671 571 216", "+237 242 139 545"];

class _MessageScreenState extends State<MessageScreen> {
  List<String>? get recipients => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Send SMS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: ElevatedButton(
          child:
              Text("Send Sms", style: Theme.of(context).accentTextTheme.button),
          onPressed: () {
            _sendSMS("This is a test message!", recipients!);
          },
        ),
      ),
    );
  }
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
