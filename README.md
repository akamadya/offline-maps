
[![Language][dart_language_badge]](http://dart.dev)
[![style: very good analysis][analysis_badge]](https://pub.dev/packages/very_good_analysis)
[![License][license]](https://git.gamatechno.net/emerging-products/starter-project/mobile-apps/ios/ios-example-swift-with-uikit/-/blob/main/LICENSE)
[![Made with Love by Emerging Product Team][team]](https://engineering.gamatechno.net)

# Flutter Starter Project
This project is an Android and IOS applications built with Flutter that follows the Modular Concept, Clean architecture pattern and uses BLoC for state management.

This project contains 3 flavors:
- development
- staging
- production


To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Flutter Starter works on iOS, Android, and Web._

---

## Build App 🔥

To build APK desired flavor use the following commands:

```sh
# Development
$ flutter build apk --flavor development --target lib/main_development.dart

# Staging
$ flutter build apk --flavor staging --target lib/main_staging.dart

# Production
$ flutter build apk --flavor production --target lib/main_production.dart

```

## Installation

1. Clone the repository to your local machine.
2. Open the project in Android Studio or Visual Studio Code.
3. Install the required Pods by running the following command in the terminal:
   ```bash
   $ make pub_get_all
   ```
4. Build and run the application on your Android or IOS device.

## plugin recommendations that can make you better

if you're using Android Studio you're can install :

- [BLoC][plugin_bloc]
- [Flutter Intl][plugin_flutter_intl]
- [Clean Architecture for Flutter][plugin_clean_arch]

or if you're using Visual Studio Code :

- 

## Structure

The project has the following file structure:
```
gtEp/
├── features/
│   └── settings/
│       ├── src
│       ├── data/
│       │   ├── data_sources/
│       │   │   └── settings_local_data_sources.dart
│       │   ├── models
│       │   └── repositories/
│       │       └── settings_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── settings.dart
│       │   ├── repositories/
│       │   │   └── settings_repository.dart
│       │   └── use_cases/
│       │       ├── get_data_settings_use_case.dart
│       │       ├── set_theme_use_case.dart
│       │       ├── set_language_use_case.dart
│       │       └── set_flavor_use_case.dart
│       └── presentation/
│           ├── blocs/
│           │   └── settings/
│           │       ├── settings_bloc.dart
│           │       ├── settings_event.dart
│           │       └── settings_state.dart
│           ├── pages/
│           │   └── settings_page.dart
│           └── widgets
├── lib/
│   ├── app/
│   │   ├── app.dart
│   │   ├── locator.dart
│   │   ├── routes.dart
│   │   └── runner.dart
│   └── l10n/
│       ├── app_en.arb
│       └── app_id.arb
├── libraries/
│   ├── core
│   └── shared
└── pubspec.yaml
```

## How to Use


### Create Module and add Dependencies
To Creating module in this project you can follow this step:
```bash
# open the features directory
cd features
# create your features
flutter create --template=package your_feature_name
```

and then after this you can following this step:

remove all except:
- lib
- test
- .metadata
- pubspec.yaml

and then you can add/import this code to your features pubspec.yaml

```yaml
  # this is a base core features for this project, 
  core:
    path: ../../libraries/core
  shared:
    path: ../../libraries/shared
    
  # if you require other modules, you can add both with following this step
  your_module_name:
    path: your_module_path

```

#### Add Dependencies

you can add the dependencies with following this step
open libraries/shared/pubspec.yaml

```yaml
  
  ...
  your_package: version

```

and then you can follow this step in terminal
``` bash

   # run this command in the root directory project
   $ make pub_get_all
   
```

### Working with Translations
This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

#### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:shared/shared.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

#### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```plist
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

#### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```


[dart_language_badge]:https://img.shields.io/badge/Language-Dart-blue
[analysis_badge]:https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[license]: https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
[team]:https://img.shields.io/badge/Made%20with%20❤%EF%B8%8F-by%20Emerging%20Product%20Team-red.svg
[flutter_localizations_link]:https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[plugin_bloc]:https://plugins.jetbrains.com/plugin/12129-bloc
[plugin_clean_arch]:https://plugins.jetbrains.com/plugin/13470-clean-architecture-for-flutter
[plugin_flutter_intl]:https://plugins.jetbrains.com/plugin/13666-flutter-intl
[vs_plugin_bloc]:https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc
