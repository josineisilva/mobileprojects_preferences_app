import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import '../utils/theme.dart';

class Configuration extends StatefulWidget {

  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracao"),
      ),
      body: PreferencePage([
        PreferenceTitle('Theme'),

        PreferenceDialogLink(
          'Brightness',
          dialog: PreferenceDialog(
            [
              RadioPreference('Light', 'light', 'brightness',
                onSelect: () => DynamicTheme.of(context).setThemeData(getTheme()),
              ),
              RadioPreference('Dark', 'dark', 'brightness',
                onSelect: () => DynamicTheme.of(context).setThemeData(getTheme()),
              ),
            ],
            title: 'Select an option',
            cancelText: 'Close',
          ),
        ),

        DropdownPreference(
          'Color',
          'color',
          defaultVal: 'Blue',
          values: ['Blue', 'Green', 'Red'],
          onChange: (_value) => DynamicTheme.of(context).setThemeData(getTheme()),
        ),

        PreferenceTitle('Content'),

        PreferenceDialogLink(
          'Show',
          dialog: PreferenceDialog(
            [
              CheckboxPreference('Label', 'show_label'),
              CheckboxPreference('Counter', 'show_counter'),
            ],
            title: 'Enabled Content',
            cancelText: 'Cancel',
            submitText: 'Save',
            onlySaveOnSubmit: true,
          ),
        ),

        PreferencePageLink(
          'Actions',
          leading: Icon(Icons.code),
          trailing: Icon(Icons.keyboard_arrow_right),
          page: PreferencePage([
            PreferenceTitle('Enable'),
            SwitchPreference(
              'Increment',
              'action_increment',
              defaultVal: true,
              desc: 'Enable incremment buttom',
            ),
            SwitchPreference(
              'Decrement',
              'action_decrement',
              defaultVal: true,
              desc: 'Enable decremment buttom',
            ),
          ]),
        ),

        PreferenceTitle('Advanced'),

        CheckboxPreference(
          'Enable Advanced Features',
          'advanced_enabled',
          onChange: () => setState(() {}),
        ),

        PreferenceHider([
          TextFieldPreference(
            'Title',
            'title',
          ),
        ], '!advanced_enabled'),

        PreferenceTitle('Display'),

        PreferenceText(
          "Counter: ${PrefService.getInt('counter')}",
          style: TextStyle(color: Colors.grey),
        ),
      ]),
    );
  }
}
