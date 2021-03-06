import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String? subject;
  final String? body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'Important'}) async {
    // String url = status == 'important'
    //     ? 'https://run.mocky.io/v3/a194cbb5-4e5c-41a4-b793-818ba860df14'
    //     : 'https://run.mocky.io/v3/3fd43feb-c47d-47b2-b6c8-72fa74b6ba1f';

    var url = Uri.parse(status == 'Important'
        ? 'https://run.mocky.io/v3/a194cbb5-4e5c-41a4-b793-818ba860df14'
        : 'https://run.mocky.io/v3/3fd43feb-c47d-47b2-b6c8-72fa74b6ba1f');

    var response = await http.get(url);

    await Future.delayed(const Duration(seconds: 1));

    String content = response.body;
    // http.Response response = Uri.parse(
    //     'https://run.mocky.io/v3/3fd43feb-c47d-47b2-b6c8-72fa74b6ba1f');
    // String content = await rootBundle.loadString('data/message.json');
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((e) => Message.fromJson(e)).toList();
    print(content);
    return _messages;
  }
}
