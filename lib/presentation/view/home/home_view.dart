import 'package:flutter/material.dart';
import 'package:flutter_arquitetura/application/modules/app_module.dart';
import 'package:flutter_arquitetura/infrastructure/dal/dao/sqlite_floor/sqlite_floor_connection.dart';
import 'package:flutter_arquitetura/infrastructure/dal/entity/climate_entity.dart';
import 'package:flutter_arquitetura/infrastructure/repository/apiadvisor/apiadvisor_model.dart';
import 'package:flutter_arquitetura/presentation/view/home/component/custom_listtile_widget.dart';
import 'package:flutter_arquitetura/presentation/view/home/component/custom_switch_widget.dart';
import 'package:flutter_arquitetura/presentation/view/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:moduler_route/moduler_route.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Inject.get<HomeController>();

  @override
  initState() {
    controller.getClimate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ApiAdvisor - Climate"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    child: Column(
                      children: [
                        Text(
                          "Data: ${value?.date ?? ''}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "País: ${value?.country ?? ''}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          value?.text,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Text(
                "Histórico de Previsões - Climatempo",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.blue,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: StreamBuilder(
                    stream: Inject.get<SqliteFloorConnection>().climateDao.findAllStream(),
                    initialData: null,
                    builder: (context, AsyncSnapshot<List<ClimateEntity>> snapshot) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot?.data?.length ?? 0,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 5,
                            color: Colors.blue,
                          );
                        },
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                AppModule.routePaths.detalhePrevisaoView,
                                arguments: snapshot?.data[index],
                              );
                            },
                            child: CustomListTileWidget(
                              detalhe: snapshot?.data[index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
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
