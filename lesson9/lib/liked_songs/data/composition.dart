class Composition {
  String? title;
  String? artist;
  String? image;

  Composition({this.title, this.artist, this.image});

  Composition.fromJson(Map<String, dynamic> json) {
    title = json['name'];
    List<Artist>? artists;
    if (json['artists'] != null) {
      artists = <Artist>[];
      json['artists'].forEach((v) {
        artists!.add(Artist.fromJson(v));
      });
      artist = '';
      for (var element in artists) {
        artist = '$artist ${element.name}, ';
      }
      artist = artist!.substring(1, artist!.length - 2);
    }
    Album? album = json['album'] != null ? Album.fromJson(json['album']) : null;
    image = album?.images?[0].url;
  }
}

class Album {
  List<Image>? images;

  Album({this.images});

  Album.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Image>[];
      json['images'].forEach((v) {
        images!.add(Image.fromJson(v));
      });
    }
  }
}

class Image {
  String? url;

  Image({this.url});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}

class Artist {
  String? name;

  Artist({this.name});

  Artist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
