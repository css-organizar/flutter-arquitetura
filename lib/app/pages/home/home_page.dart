import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/app/pages/home/component/custom_switch_widget.dart';
import 'package:flutter_arquitetura/app/pages/home/controller/home_controller.dart';
import 'package:flutter_arquitetura/app/repositories/apiadvisor/apiadvisor_model.dart';
import 'package:flutter_arquitetura/app/repositories/apiadvisor/apiadvisor_repository.dart';
import 'package:flutter_arquitetura/app/services/client_http_service.dart';
import 'package:flutter_arquitetura/app/view_models/apiadvisor_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController(
    viewModel: ApiAdvisorViewModel(
      repository: ApiAdvisorRepository(
        client: ClientHttpService(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiAdvisorModel>(
              valueListenable: controller.climate,
              builder: (context, value, child) {
                if (value?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    value?.text,
                    textAlign: TextAlign.justify,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          controller.getClimate();
        },
      ),
    );
  }
}
