import 'package:flutter/material.dart';
import 'package:tinygram/constants.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.title,
    required this.lastMessageSender,
    required this.lastMessage,
    required this.lastMessageSentAt,
    required this.unreadMessages,
  }) : super(key: key);

  final String title;
  final String lastMessageSender;
  final String lastMessage;
  final String lastMessageSentAt;
  final int unreadMessages;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                'assets/images/dartchat.jpg',
                height: 60,
                width: 60,
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFFE5E5E5), width: 0.8))),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "$lastMessageSender: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.darkBlue),
                            ),
                            Expanded(
                              child: Text(
                                lastMessage,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: AppColors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      lastMessageSentAt,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColors.grey),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(80)),
                      child: Text(
                        unreadMessages.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
