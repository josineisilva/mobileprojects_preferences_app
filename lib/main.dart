import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'pages/home.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init(prefix: 'pref_');
  PrefService.setDefaultValues({'brightness': 'light'});
  PrefService.setDefaultValues({'color': 'Blue'});
  PrefService.setDefaultValues({'title': 'Preferences'});
  PrefService.setDefaultValues({'show_label': true});
  PrefService.setDefaultValues({'show_counter': true});
  PrefService.setDefaultValues({'action_increment': true});
  PrefService.setDefaultValues({'action_decrement': true});
  PrefService.setDefaultValues({'counter': 0});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => getTheme(),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Preferences Demo',
          theme: theme,
          home: Home(),
        );
      }
    );
  }
}
