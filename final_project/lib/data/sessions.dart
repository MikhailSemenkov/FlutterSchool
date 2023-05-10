class Sessions {
  bool? success;
  List<Session>? data;

  Sessions({this.success, this.data});

  Sessions.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Session>[];
      json['data'].forEach((v) {
        data!.add(Session.fromJson(v));
      });
      data?.sort((Session a, Session b) => a.date! - b.date!);
    }
  }
}

class Session {
  int? id;
  int? date;
  String? type;
  int? minPrice;
  Room? room;

  Session({this.id, this.date, this.type, this.minPrice, this.room});

  Session.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    type = json['type'];
    minPrice = json['minPrice'];
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }
}

class Room {
  int? id;
  int maxSeatsInRow = 0;
  String? name;
  List<Rows>? rows;
  int totalAvailable = 0;

  Room({this.id, this.name, this.rows, required this.totalAvailable});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
        final seatsAmount = rows!.last.seats?.length;
        rows!.last.seats?.forEach((v) {
          if (v.isAvailable!) totalAvailable++;
        });
        if (seatsAmount != null && seatsAmount > maxSeatsInRow) {
          maxSeatsInRow = seatsAmount;
        }
      });
    }
  }
}

class Rows {
  int? id;
  int? index;
  List<Seats>? seats;

  Rows({this.id, this.index, this.seats});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(Seats.fromJson(v, index));
      });
    }
  }
}

class Seats {
  int? id;
  int? row;
  int? index;
  int? type;
  int? price;
  bool? isAvailable;

  Seats(
      {this.id, this.row, this.index, this.type, this.price, this.isAvailable});

  Seats.fromJson(Map<String, dynamic> json, this.row) {
    id = json['id'];
    index = json['index'];
    type = json['type'];
    price = json['price'];
    isAvailable = json['isAvailable'];
  }
}
