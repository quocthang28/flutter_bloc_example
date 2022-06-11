import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/navigation/app_router.gr.dart';
import 'package:flutter_bloc_example/repository/restaurant_repository.dart';
import 'package:flutter_bloc_example/ui/common_component/card.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:get_it/get_it.dart';
import 'package:velocity_x/velocity_x.dart';

Map<String, dynamic> _secretKey = {
  "type": "service_account",
  "project_id": "cqt-dialogflow-uwps",
  "private_key_id": "5d8dd51f39ba8950d8ce2c393b74451af1deda26",
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDQzvlXtyRuAdov\ns8uBu8K/BTu8H8md17UvyJYgZKQTs3+EgFPRzG8zn1HegspDmJICoGgGorUjCtep\nPiT+UyZUVIhggXlb0wwJ4Unw1EqXiYnnKco8yEs9ZbsAAZNARCsc3m0jTvku70hp\n2uHSTKUaG33djBrzQQtXKGUzU/PBfvJnZw7hStuBAPN4eSjHw7NETKPNXvASkFFD\nELJfTwHiik/JbzYAC8yIcNXjkUaPazHiF9Wn0rBMsSH1OnyQE2B9f9+WVagHuqEC\nA1Ayn39k4ysEtCicUJMTM3OlJqERDhM4ZpdI3bMV9TXPH6mbla0vhuTotV0p48J3\nu9vCVWHvAgMBAAECggEAOAudvG/xTL+dhxk8oc06R9hJQMTNclrgDHvL49Tvf0Q6\nEV/6X4D+Rf5Y1J8JWBxe8GqKkWFhug6idRAzkLnTu2XXFwQZhU5/2DUKiiQJA2SM\nyambWTYvj8K67xT9J45EfiKra4M6eeEK8DKqUy50UC4Z2fnNkAYg25uBkkXR0tjZ\n9ZAkLpT0DwmTHEm/fcEGTCDXKuNLe4TD05PgnX/nNjrdItv1H2kCMiqd/+/PHrNE\ntnoLSwUnBa/C14c+S8sofRwRrvapjam4hwExkyykvxZefAl4cYtrILGD/rIicJ8L\nVmB3/mjXLVFZe9mZapZJ4QXWjTt5pxwfTM8zV4ykuQKBgQD8Jk/jXNScf2+8SiD+\nQ23x0pGue75gX76LlEAnD3bYnf2BibW6n0gjmu4gIhwgbJoBPqOG62ZORhQsVwwy\nbd0zxTcbexTTdFfqYnAJRVx8uFARmUunc5hR7Jrx20rpYUYNWUYby+Tb05/VE3Y7\nr0PWmDIsjMpUclv8hbaW85wUdwKBgQDT/zw9sPbFiXxm9EsV+3BlDONvGts6RBn8\n7Bh8VL+iw58DiFn54nJqGxn/GoT11zi7FJ/Y3ip/3MpBltg+5d/PrTkPCn11j0js\nESzbYxUJpimFcWAwBi3x0azSFzFTTSz1QLtCOt20d5VsLwC888DhaDCKH0YpSTZX\na9ipImfUSQKBgQDXgq9ZNqiJseoAVqNobp1zyHO3XBBVMsAbcHR8bh03+6EGrHrk\nrOrtc6f/UugTVn8yfSUrVds1H3RyiVvlZj1f2DnHhSVBrfjOXaBAbEYmWyokQI+G\n6afQrZepC7M1UWycUCc57sUGlhPP/DhbvusOaTrJFPSBxNSWOnra/g/y9QKBgAMW\n1g7kFER+o2RwrONuHY4raOkGkClCMsq/uf+d0IkTpq6LfxwoE5i+OlvATC207Cu1\nujqTyjTAx+W6x/3qpZ9GG+2/LmLXKq3d9jRgNj9Ev5glNcydWnAKqSUKl3pqRnxw\nbAokB3UIxRGlgbI/LxFZzlNE72XMnlEZzjdwu+iZAoGAZiErSZ07+CQyAecsUQxn\nGfooyusKPeF4L6MbyjCoF6FNjvdrAI/MAuWDNh/ZulPSqI3VFiqlkXbInqOGHXWd\nQKZ32fsJjDbXwQsWUKvV1x0fwjpMge5FUa4b3B6GVlpGzIGzZV5eUC8IpkWnuObI\nTPfawW/fMrp0VXnh4pOxT6s=\n-----END PRIVATE KEY-----\n",
  "client_email": "flutterdialogflowdemo@cqt-dialogflow-uwps.iam.gserviceaccount.com",
  "client_id": "102670774643290051476",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url":
      "https://www.googleapis.com/robot/v1/metadata/x509/flutterdialogflowdemo%40cqt-dialogflow-uwps.iam.gserviceaccount.com"
};

List<String> botResponses = [
  'Chờ tôi một chút nhé',
  'Tôi đang kiếm quán cho bạn đây. Vui lòng chờ tôi nhé',
  'Bạn chờ chút nhé. Tôi đang kiến quán ngon cho bạn đây'
];

late final Restaurant saved;

class MMessage {
  String content;
  bool isUser;
  bool hasContent;

  MMessage({required this.content, required this.isUser, required this.hasContent});
}

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter _dialogFlowtter;
  List<MMessage> messages = [MMessage(content: 'Hôm nay bạn muốn ăn gì?', isUser: false, hasContent: false)];
  final TextEditingController _textEditingController = TextEditingController();
  Map<String, dynamic> responseParams = {};
  final RestaurantRepository _restaurantRepository = GetIt.I<RestaurantRepository>();

  bool isLoading = true;

  void initDialogFlow() async {
    DialogAuthCredentials credentials = await getCredentials();
    _dialogFlowtter = DialogFlowtter(
      credentials: credentials,
      sessionId: "SESSION_ID",
    );
    await testChat();
  }

  Future<void> testChat() async {
    final QueryInput queryInput = QueryInput(
      text: TextInput(
        text: "hi",
        languageCode: "en",
      ),
    );

    DetectIntentResponse response = await _dialogFlowtter.detectIntent(
      queryInput: queryInput,
    );

    String? textResponse = response.text;

    print(textResponse);
  }

  Future<DialogAuthCredentials> getCredentials() async {
    return DialogAuthCredentials.fromJson(_secretKey);
  }

  @override
  void initState() {
    initDialogFlow();
    _restaurantRepository
        .getRestaurant(Random().nextInt(10).toString(), Random().nextInt(7).toString(), Random().nextInt(10).toString())
        .then((value) => saved = value)
        .then((value) => setState(() {
              isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          messages.isEmpty
              ? MediaQuery.of(context).size.height.heightBox
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: messages.length,
                          reverse: true,
                          itemBuilder: (context, index) => ChatBubble(message: messages[index], hasOption: false))
                      .pOnly(bottom: 50)),
          Row(
            children: <Widget>[
              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _textEditingController,
                maxLines: null,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  hintText: '',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.mainColor, width: 0.7),
                  ),
                ),
              ).expand(),
              IconButton(
                onPressed: () async {
                  final QueryInput queryInput = QueryInput(
                    text: TextInput(
                      text: _textEditingController.text,
                      languageCode: "vi",
                    ),
                  );

                  setState(() {
                    messages.insert(0, MMessage(content: _textEditingController.text, isUser: true, hasContent: false));
                    _textEditingController.clear();
                  });

                  DetectIntentResponse response = await _dialogFlowtter.detectIntent(
                    queryInput: queryInput,
                  );

                  if (response.queryResult != null) {
                    if (response.queryResult?.parameters != null) {
                      responseParams.addAll(response.queryResult!.parameters!);
                    }
                  }

                  setState(() {
                    messages.insert(0, MMessage(content: response.text!, isUser: false, hasContent: false));
                  });

                  if (response.text! == 'Chờ tôi một chút nhé' ||
                      response.text! == 'Tôi đang kiếm quán cho bạn đây. Vui lòng chờ tôi nhé' ||
                      response.text! == 'Bạn chờ chút nhé. Tôi đang kiến quán ngon cho bạn đây') {
                    Future.delayed(const Duration(seconds: 2)).then((value) {
                      setState(() {
                        messages.insert(
                            0,
                            MMessage(
                                content: 'Đây là những quán mà tôi tìm được.', isUser: false, hasContent: true));
                      });
                    });

                    setState(() {});
                  }

                  // if (response.queryResult?.intent?.name ==
                  //     'projects/cqt-dialogflow-uwps/agent/intents/26551046-c318-457c-b4e5-73523e0575df') {
                  //   Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.of(context)
                  //       .push(MaterialPageRoute(
                  //       builder: (BuildContext context) => InfoScreen(info: responseParams))));
                  // }
                },
                disabledColor: Colors.grey,
                icon: const Icon(
                  Icons.send,
                  color: AppColor.mainColor,
                ),
              ),
            ],
          ).px(5),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final MMessage message;
  final bool hasOption;
  const ChatBubble({Key? key, required this.message, required this.hasOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.mainColor),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomLeft: Radius.circular(message.isUser ? 8 : 0),
                  bottomRight: Radius.circular(message.isUser ? 0 : 8),
                ),
                color: message.isUser ? AppColor.mainColor : Colors.white),
            child: message.content.text.size(16).color(message.isUser ? Colors.white : AppColor.mainColor).make().p(10),
          ).p(6).px(6).pOnly(left: message.isUser ? 60 : 0, right: message.isUser ? 0 : 60),
        ),
        10.heightBox,
        message.hasContent
            //? 'aaa'.text.make()
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: saved.data!
                    .sublist(0, Random().nextInt(saved.data!.length))
                    .map((e) => GestureDetector(
                          onTap: () => context.pushRoute(RestaurantDetailRoute(res: e)),
                          child: AppCard(
                              child: ListTile(
                            visualDensity: VisualDensity.compact,
                            leading: Image.network(e.photos!.first),
                            title: e.name!.text.make(),
                            subtitle: e.addressDetail!.text.make(),
                          )),
                        ))
                    .toList())
            : const SizedBox.shrink(),
        10.heightBox,
      ],
    );
  }
}
