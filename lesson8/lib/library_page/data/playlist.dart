class Playlist {
  String? title;
  String? description;
  String? image;

  Playlist({this.title, this.description, this.image});

  Playlist.fromJson(
      {required Map<String, dynamic> json, required bool isAlbum}) {
    title = json['name'];
    if (isAlbum) {
      List<Artist>? artists;
      if (json['artists'] != null) {
        artists = <Artist>[];
        json['artists'].forEach((v) {
          artists!.add(Artist.fromJson(v));
        });
        description = '${json['type']} • ';
        for (var element in artists) {
          description = '$description ${element.name}, ';
        }
        description = description!.substring(0, description!.length - 2);
      }
    } else {
      description =
          '${json['type']} • ${json['owner'] != null ? json['owner']['display_name'] : ''}';
    }
    if (json['images'] != null) {
      List<Images> images = <Images>[];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
      if (images.isNotEmpty) {
        image = images[0].url;
      }
    }
  }
}

class Images {
  String? url;

  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Owner {
  String? displayName;

  Owner({this.displayName});

  Owner.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['display_name'] = displayName;
    return data;
  }
}

class Artist {
  String? name;

  Artist({this.name});

  Artist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
