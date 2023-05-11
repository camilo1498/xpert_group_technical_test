import 'package:hive/hive.dart';

part 'history_model.g.dart';

@HiveType(typeId: 1)
class HistoryModel {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final DateTime? createdAt;

  HistoryModel({
    required this.url,
    this.createdAt,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        url: json["url"],
        createdAt:
            json["createAt"] != null ? DateTime.parse(json["createAt"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "createdAt": createdAt?.toIso8601String(),
      };
}
