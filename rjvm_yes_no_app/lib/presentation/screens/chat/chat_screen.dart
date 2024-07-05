import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjvm_yes_no_app/domain/entities/message.dart';
import 'package:rjvm_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:rjvm_yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:rjvm_yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:rjvm_yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://imgs.search.brave.com/DwLvnAb_3Ox5cEXAzC1py2cHIQB1n7lg_hrFIWVdYRg/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL00v/TVY1QlltSXlNVFZo/TnpJdFlqQTVNUzAw/TW1FNUxXRmpOemN0/T1RkbFlUQXpZMk5r/T1daa1hrRXlYa0Zx/Y0dkZVFYUm9hWEpr/TFhCaGNuUjVMWFpw/WkdWdkxYVndaR0Yw/WlhJQC5qcGc'),
          ),
        ),
        title: const Text('Usuario'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.mine)
                    ? MyMessage(message: message)
                    : HerMessage(message: message);
              },
            )),
            MessageFileBox(
              onValue: (value) => chatProvider.sendMessage(value),
              //onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
