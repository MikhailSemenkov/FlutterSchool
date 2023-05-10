class User {
  int? id;
  String? name;
  String? phoneNumber;
  int? createdAt;
  int? updatedAt;
  Tickets? tickets;

  User(
      {this.id,
      this.name,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt,
      this.tickets});

  User.fromJson(
      Map<String, dynamic> userJson, Map<String, dynamic> ticketsJson) {
    id = userJson['id'];
    name = userJson['name'];
    phoneNumber = userJson['phoneNumber'];
    createdAt = userJson['createdAt'];
    updatedAt = userJson['updatedAt'];
    tickets = Tickets.fromJson(ticketsJson);
  }
}

class Tickets {
  List<Data>? data;

  Tickets({this.data});

  Tickets.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
      data!.sort((Data a, Data b) => b.date! - a.date!);
    }
  }
}

class Data {
  int? id;
  int? movieId;
  String? name;
  int? date;
  int? seatIndex;
  int? rowIndex;
  String? roomName;
  String? image;
  String? smallImage;

  Data(
      {this.id,
      this.movieId,
      this.name,
      this.date,
      this.seatIndex,
      this.rowIndex,
      this.roomName,
      this.image,
      this.smallImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['movieId'];
    name = json['name'];
    date = json['date'];
    seatIndex = json['seatIndex'];
    rowIndex = json['rowIndex'];
    roomName = json['roomName'];
    image = json['image'];
    smallImage = json['smallImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['movieId'] = movieId;
    data['name'] = name;
    data['date'] = date;
    data['seatIndex'] = seatIndex;
    data['rowIndex'] = rowIndex;
    data['roomName'] = roomName;
    data['image'] = image;
    data['smallImage'] = smallImage;
    return data;
  }
}
