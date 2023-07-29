class MessageHistoryModel {
  int? userId;
  int? isFile;
  String? fileType;
  String? message;
  String? time;
  String? date;

  MessageHistoryModel(
      {this.userId,
        this.isFile,
        this.fileType,
        this.message,
        this.time,
        this.date});

  MessageHistoryModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    isFile = json['is_file'];
    fileType = json['file_type'];
    message = json['message'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['is_file'] = this.isFile;
    data['file_type'] = this.fileType;
    data['message'] = this.message;
    data['time'] = this.time;
    data['date'] = this.date;
    return data;
  }
}