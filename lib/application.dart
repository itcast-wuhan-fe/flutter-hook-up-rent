import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/scoped_model/city.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    Router router = Router();
    Routes.configureRoutes(router);
    return ScopedModel<AuthModel>(
        model: AuthModel(),
        child: ScopedModel<CityModel>(
          model: CityModel(),
          child: ScopedModel<FilterBarModel>(
            model: FilterBarModel(),
            child: MaterialApp(
              theme: ThemeData(primaryColor: Colors.green),
              onGenerateRoute: router.generator,
              initialRoute: Routes.loading,
            ),
          ),
        ));
  }
}
