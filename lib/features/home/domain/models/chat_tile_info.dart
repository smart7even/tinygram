class ChatTileInfo {
  final String id;
  final String title;
  final String lastMessageSender;
  final String lastMessage;
  final String lastMessageSentAt;
  final int unreadMessages;
  final String imagePath;

  ChatTileInfo({
    required this.id,
    required this.title,
    required this.lastMessageSender,
    required this.lastMessage,
    required this.lastMessageSentAt,
    required this.unreadMessages,
    required this.imagePath,
  });
}
