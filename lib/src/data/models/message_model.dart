class MessageModel {
  String message;
  bool isUser;

  MessageModel({required this.message, this.isUser = true});

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      MessageModel(message: json["message"], isUser: false);

  Map<String, dynamic> toJson() => {"message": message};
}
