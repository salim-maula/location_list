
import 'dart:convert';

List<ResponseProviences> responseProviencesFromJson(String str) => List<ResponseProviences>.from(json.decode(str).map((x) => ResponseProviences.fromJson(x)));

String responseProviencesToJson(List<ResponseProviences> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseProviences {
    String? id;
    String? name;

    ResponseProviences({
        this.id,
        this.name,
    });

    factory ResponseProviences.fromJson(Map<String, dynamic> json) => ResponseProviences(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
