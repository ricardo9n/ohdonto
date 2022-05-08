import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohdonto/app/pages/main_page.dart';

import '../routes.dart';

class MainModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/$toMainPage',
            child: (context, args) => MainPage(userEntity: args.data)),
      ];
}
