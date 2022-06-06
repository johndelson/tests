import 'data.dart';

class DataModel {
  bool? success;
  dynamic errors;
  dynamic messages;
  Data? data;

  DataModel({this.success, this.errors, this.messages, this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        success: json['success'] as bool?,
        errors: json['errors'] as dynamic,
        messages: json['messages'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'errors': errors,
        'messages': messages,
        'data': data?.toJson(),
      };
}
