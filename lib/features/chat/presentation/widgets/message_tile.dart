import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tinygram/features/chat/domain/models/message.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.lightGreen,
          child: Text(
            message.userName[0],
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.userName,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        RichText(
                          textWidthBasis: TextWidthBasis.longestLine,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: message.text,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const WidgetSpan(
                                child: SizedBox(
                                  width: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Text(
                        DateFormat.Hm().format(
                          message.sentAt,
                        ),
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
