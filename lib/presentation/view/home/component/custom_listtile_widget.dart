import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/infrastructure/dal/entity/climate_entity.dart';

class CustomListTileWidget extends StatelessWidget {
  final ClimateEntity detalhe;

  const CustomListTileWidget({Key key, this.detalhe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Id: ${detalhe.id ?? ''}",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Data: ${detalhe.date ?? ''}",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "País: ${detalhe.country ?? ''}",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            detalhe.text ?? '',
            maxLines: 3,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
