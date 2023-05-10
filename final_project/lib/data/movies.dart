class Movies {
  bool? success;
  List<Movie>? data;

  Movies({this.success, this.data});

  Movies.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Movie>[];
      json['data'].forEach((v) {
        data!.add(Movie.fromJson(v));
      });
    }
  }
}

class Movie {
  int? id;
  String? name;
  int? age;
  String? trailer;
  String? image;
  String? smallImage;
  String? originalName;
  int? duration;
  String? language;
  String? rating;
  int? year;
  String? country;
  String? genre;
  String? plot;
  String? starring;
  String? director;
  String? screenwriter;
  String? studio;

  Movie(
      {this.id,
      this.name,
      this.age,
      this.trailer,
      this.image,
      this.smallImage,
      this.originalName,
      this.duration,
      this.language,
      this.rating,
      this.year,
      this.country,
      this.genre,
      this.plot,
      this.starring,
      this.director,
      this.screenwriter,
      this.studio});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    trailer = json['trailer'];
    image = json['image'];
    smallImage = json['smallImage'];
    originalName = json['originalName'];
    duration = json['duration'];
    language = json['language'];
    rating = json['rating'];
    year = json['year'];
    country = json['country'];
    genre = json['genre'];
    plot = json['plot'];
    starring = json['starring'];
    director = json['director'];
    screenwriter = json['screenwriter'];
    studio = json['studio'];
  }
}
