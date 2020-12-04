import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/infrastructure/dal/entity/climate_entity.dart';

class DetalhePrevisaoView extends StatelessWidget {
  final ClimateEntity detalhe;

  const DetalhePrevisaoView({Key key, this.detalhe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe Previsao"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Id: ${detalhe.id ?? ''}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Data: ${detalhe.date ?? ''}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "País: ${detalhe.country ?? ''}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.blue,
                ),
                Text(
                  detalhe?.text,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
