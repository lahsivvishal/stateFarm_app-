class Message {
  String contactName;
  String description;
  String messageDate;
  String receivedTime;
  String accNumber;
  String receivedDate;
  String callHistory;
  String duration;
  String notes;
  String recordingPath;

  Message(
      this.contactName,
      this.description,
      this.messageDate,
      this.receivedTime,
      this.accNumber,
      this.receivedDate,
      this.callHistory,
      this.duration,
      this.notes,
      this.recordingPath);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        json["contactName"],
        json["description"],
        json["messageDate"],
        json["receivedTime"],
        json["accNumber"],
        json["receivedDate"],
        json["callHistory"],
        json["duration"],
        json["notes"],
        json["recordingPath"]);
  }
}
