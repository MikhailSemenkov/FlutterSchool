class Comments {
  bool? success;
  List<Comment>? data;

  Comments({this.success, this.data});

  Comments.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Comment>[];
      json['data'].forEach((v) {
        data!.add(Comment.fromJson(v));
      });
    }
  }
}

class Comment {
  int? id;
  String? author;
  bool? isMy;
  String? content;
  int? rating;

  Comment({this.id, this.author, this.isMy, this.content, this.rating});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    isMy = json['isMy'];
    content = json['content'];
    rating = json['rating'];
  }
}
