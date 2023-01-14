class Character {
    int? id;
    String? name;
    String? status;
    String? species;
    String? type;
    String? gender;
    Origin? origin;
    Location? location;
    String? image;
    List<String>? episode;
    String? url;
    String? created;

    Character({
      this.id, 
      this.name, 
      this.status, 
      this.species, 
      this.type, 
      this.gender, 
      this.origin, 
      this.location, 
      this.image, 
      this.episode, 
      this.url, 
      this.created
    });

    Character.fromJson(Map<String, dynamic> json) {
      id = json["id"];
      name = json["name"];
      status = json["status"];
      species = json["species"];
      type = json["type"];
      gender = json["gender"];
      origin = json["origin"] == null ? null : Origin.fromJson(json["origin"]);
      location = json["location"] == null ? null : Location.fromJson(json["location"]);
      image = json["image"];
      episode = json["episode"]==null ? null : List<String>.from(json["episode"]);
      url = json["url"];
      created = json["created"];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data["id"] = id;
      data["name"] = name;
      data["status"] = status;
      data["species"] = species;
      data["type"] = type;
      data["gender"] = gender;

      if(origin != null) {
        data["origin"] = origin?.toJson();
      }

      if(location != null) {
        data["location"] = location?.toJson();
      }

      data["image"] = image;

      if(episode != null) {
        data["episode"] = episode;
      }

      data["url"] = url;
      data["created"] = created;
      return data;
    }
}

class Location {
    String? name;
    String? url;

    Location({this.name, this.url});

    Location.fromJson(Map<String, dynamic> json) {
      name = json["name"];
      url = json["url"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["name"] = name;
        data["url"] = url;
        return data;
    }
}

class Origin {
    String? name;
    String? url;

    Origin({this.name, this.url});

    Origin.fromJson(Map<String, dynamic> json) {
      name = json["name"];
      url = json["url"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["name"] = name;
        data["url"] = url;
        return data;
    }
}