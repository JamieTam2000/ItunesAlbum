class Model {
  int? resultCount;
  List<Results>? results;

  Model({this.resultCount, this.results});

  Model.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCount'] = this.resultCount;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? wrapperType;
  String? collectionType;
  int? artistId;
  int? collectionId;
  int? amgArtistId;
  String? artistName;
  String? collectionName;
  String? collectionCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  String? collectionExplicitness;
  int? trackCount;
  String? copyright;
  String? country;
  String? currency;
  String? releaseDate;
  String? primaryGenreName;
  String? contentAdvisoryRating;

  Results(
      {this.wrapperType,
      this.collectionType,
      this.artistId,
      this.collectionId,
      this.amgArtistId,
      this.artistName,
      this.collectionName,
      this.collectionCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.collectionExplicitness,
      this.trackCount,
      this.copyright,
      this.country,
      this.currency,
      this.releaseDate,
      this.primaryGenreName,
      this.contentAdvisoryRating});

  Results.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    collectionType = json['collectionType'];
    artistId = json['artistId'];
    collectionId = json['collectionId'];
    amgArtistId = json['amgArtistId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    collectionCensoredName = json['collectionCensoredName'];
    artistViewUrl = json['artistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    collectionExplicitness = json['collectionExplicitness'];
    trackCount = json['trackCount'];
    copyright = json['copyright'];
    country = json['country'];
    currency = json['currency'];
    releaseDate = json['releaseDate'];
    primaryGenreName = json['primaryGenreName'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wrapperType'] = this.wrapperType;
    data['collectionType'] = this.collectionType;
    data['artistId'] = this.artistId;
    data['collectionId'] = this.collectionId;
    data['amgArtistId'] = this.amgArtistId;
    data['artistName'] = this.artistName;
    data['collectionName'] = this.collectionName;
    data['collectionCensoredName'] = this.collectionCensoredName;
    data['artistViewUrl'] = this.artistViewUrl;
    data['collectionViewUrl'] = this.collectionViewUrl;
    data['artworkUrl60'] = this.artworkUrl60;
    data['artworkUrl100'] = this.artworkUrl100;
    data['collectionPrice'] = this.collectionPrice;
    data['collectionExplicitness'] = this.collectionExplicitness;
    data['trackCount'] = this.trackCount;
    data['copyright'] = this.copyright;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['releaseDate'] = this.releaseDate;
    data['primaryGenreName'] = this.primaryGenreName;
    data['contentAdvisoryRating'] = this.contentAdvisoryRating;
    return data;
  }
}