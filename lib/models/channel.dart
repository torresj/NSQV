class Channel {
  Channel({required this.name, required this.logoUrl});

  String name;
  String logoUrl;

  factory Channel.fromJson(Map<String, dynamic> parsedJson){
    return Channel(
        name: parsedJson['name'].toString(),
        logoUrl : parsedJson['logoUrl'].toString(),
    );
  }
}
