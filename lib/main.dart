import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(FriendlychatApp());

const _name = "y_mengae";

class FriendlychatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendlychat',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final _messages = <ChatMessage>[];
  final _textController = TextEditingController();
  bool _isTextEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Friendlychat")),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              Divider(
                height: 1.0,
              ),
              Material(
                color: Theme.of(context).cardColor,
                child: _buildTextComposer(),
              ),
            ],
          ),
        ));
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onChanged: _handleTextChanged,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          IconTheme(
            data: IconThemeData(color: Theme.of(context).accentColor),
            child: Theme.of(context).platform == TargetPlatform.iOS
                ? CupertinoButton(
                    child: Text("Send"),
                    onPressed: _isTextEmpty
                        ? null
                        : () => _handleSubmitted(_textController.text))
                : IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _isTextEmpty
                        ? null
                        : () => _handleSubmitted(_textController.text)),
          )
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    final message = ChatMessage(
      text: text,
    );
    setState(() {
      _isTextEmpty = true;
      _messages.insert(0, message);
    });
  }

  void _handleTextChanged(String text) {
    setState(() {
      _isTextEmpty = text.isEmpty;
    });
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(_name[0])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_name, style: Theme.of(context).textTheme.subhead),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}
