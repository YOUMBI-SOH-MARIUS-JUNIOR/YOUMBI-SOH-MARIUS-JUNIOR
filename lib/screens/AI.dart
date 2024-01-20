import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future<String> getChatGPTResponse(String userMessage) async {
  try {
    const apiUrl = 'https://api.openai.com/v1/chat/completions';
    const apiKey = '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';
    const model = 'gpt-3.5-turbo';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': model,
        'messages': [
          {'role': 'user', 'content': userMessage},
        ],
        
      }),
    );

    // ignore: avoid_print
    print('Request: ${jsonEncode({
      'model': model,
      'messages': [{'role': 'user', 'content': userMessage}]
    })}');
    // ignore: avoid_print
    print('Response Status Code: ${response.statusCode}');
    // ignore: avoid_print
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to get response: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

class ChatProvider with ChangeNotifier {
  final List<String> _messages = [];
  bool _loading = false;
  String _error = '';

  List<String> get messages => _messages;
  bool get loading => _loading;
  String get error => _error;

  void sendMessage(String message) async {
    try {
      _loading = true;
      notifyListeners();

      final response = await getChatGPTResponse(message);
      _messages.add('You: $message');
      _messages.add('FREEDOM: $response');
      _error = ''; // Clear any previous errors
    } catch (e) {
      _error = 'Error: $e';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

class AIscreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AIscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Freedom'.toUpperCase(),
          style: const TextStyle( fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, _) {
                return ListView.builder(
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    if(index %2==0) {
                  return UserMessage(message: chatProvider.messages[index]);
                }else{
                  return ChatGPTMessage(message: chatProvider.messages[index]);
                }

                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Type your message...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue))),
                  ),
                ),
                Consumer<ChatProvider>(
                  builder: (context, chatProvider, _) {
                    return IconButton(
                      icon: chatProvider.loading
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.send),
                      onPressed: chatProvider.loading
                          ? null
                          : () {
                              String message = _controller.text.trim();
                              if (message.isNotEmpty) {
                                _controller.clear();
                                chatProvider.sendMessage(message);
                              }
                            },
                    );
                  },
                ),
              ],
            ),
          ),
          Consumer<ChatProvider>(
            builder: (context, chatProvider, _) {
              if (chatProvider.error.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    chatProvider.error,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return Container(); // Empty container if no error
            },
          ),
        ],
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  final String message;
  const UserMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
class ChatGPTMessage extends StatelessWidget {
  final String message;
  const ChatGPTMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

