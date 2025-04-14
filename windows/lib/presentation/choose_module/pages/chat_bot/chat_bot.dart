// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_print, non_constant_identifier_names, must_be_immutable, invalid_return_type_for_catch_error, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, unused_element

import 'package:Payirseai/data/common/widgets/appbar/app_bar.dart';

import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});
  @override
  State<ChatBotPage> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatBotPage> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    @override
    void initState() {
      super.initState();
      // Add listener to scroll to the bottom of the list when a new item is added
      _scrollController.addListener(() {
        if (_scrollController.position.atEdge) {
          final isTop = _scrollController.position.pixels == 0;
          if (!isTop) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }
        }
      });
    }

    String message = '';
    String? response;
    final MessageTextController = TextEditingController();

    final List<Widget> _chatMessages = [];
    // final List<Widget> _progressloader = [
    //   LoadingIndicator(),
    // ];
    final StreamController<List<Widget>> _messageStreamController =
        StreamController();

    void addChatMessage(String? message, bool sender) {
      _chatMessages.add(ChatBubble(
        text: message,
        isMe: sender,
      ));
      _messageStreamController.add(_chatMessages);
    }

    // void showLoadingIndicator() {
    //   _messageStreamController.add(_progressloader);
    // }

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BasicAppBar(
        title: Text('Farm Assist',
        style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w800),)
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Positioned.fill(child: Opacity(opacity: 0.1,child:Image.asset('assets/appimages/abi.png',fit: BoxFit.fill,),), ),
        SafeArea(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        maxRadius: 25,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Payir SeAI",
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Expanded(
                  child: StreamBuilder<List<Widget>>(
                    stream: _messageStreamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          controller: _scrollController,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return snapshot.data![index];
                          },
                        );
                      } else {
                        return SizedBox(
                          width: 300.0,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Agne',
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    'How may I help you today?'),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(25))),
                        child: TextField(
                          controller: MessageTextController,
                          onChanged: (value) {
                            message = value;
                          },
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                              hintText: "Message Payir Seai",
                              hintStyle: TextStyle(color: Colors.blueGrey),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        addChatMessage(message, true);
                        MessageTextController.clear();
                        try {
                          // showLoadingIndicator();
                          final gemini = Gemini.instance;
        
                          await gemini.text(message).then((value) {
                            response = value?.output;
                            // print(value?.output);
                          }).catchError((e) => print(e));
                          addChatMessage(response, false);
                          print(response);
                        } catch (e) {
                          print("The error is $e");
                        }
                      },
                      icon: Icon(Icons.send),
                      color: Colors.blueGrey,
                    )
                  ],
                ),
              ],
            ),
          ),
          
        ),
        ],
        
        
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.text, required this.isMe});

  String? text;
  bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            CircleAvatar(
              maxRadius: 18,
              backgroundColor: AppColors.lightBackground,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          SizedBox(
            width: 10,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 15, color: Colors.white),
              child: isMe
                  ? Text("$text")
                  : AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TypewriterAnimatedText('$text'),
                      ],
                    ),
            ),
          ),
          SizedBox(width: 10,),
          if (isMe)
          
            CircleAvatar(
              maxRadius: 18,
              backgroundColor: AppColors.lightBackground,
              child: Icon(
                Icons.person
              ),
            ),
        ],
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return JumpingDotsProgressIndicator(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontSize: 30.0,
    );
  }
}
