import 'package:floor/floor.dart';

@Entity(tableName: 'climate')
class ClimateEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'climateId', nullable: false)
  int id;
  @ColumnInfo(name: 'climateCountry', nullable: true)
  String country;
  @ColumnInfo(name: 'climateDate', nullable: true)
  String date;
  @ColumnInfo(name: 'climateText', nullable: true)
  String text;

  ClimateEntity({
    this.id,
    this.country,
    this.date,
    this.text,
  });

  ClimateEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    date = json['date'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['date'] = this.date;
    data['text'] = this.text;
    return data;
  }
}
