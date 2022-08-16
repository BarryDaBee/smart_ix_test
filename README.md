# Smart_home

SmartIX interview task

A mobile smart hub application

## Getting Started :rocket:

[Install Flutter](https://docs.flutter.dev/get-started/install?gclid=Cj0KCQjwgO2XBhCaARIsANrW2X0IZvIEVUN_Dc3v6mUEkZf67a2wnOWEQKTCyLC6A7jjWSoGNINQMa0aAssHEALw_wcB&gclsrc=aw.ds)



For demonstration purposes, the project contains two flavors:
* dev
* prod

To run the desired flavor use the following command

### Development
```
flutter run --flavor dev --target lib/app/flavors/main_dev.dart
```
OR

### Production
```
flutter run --flavor production --target lib/app/flavors/main_prod.dart
```
# Folder Structure
This application uses a feature driven folder structure to seperate related functionality into individual features

```
(lib/features)
│ 
├── feature0
|     ├── data
│     │     ├── data_sources
│     │     ├── models
│     │     └── repositories(implementation)
│     ├── domain     
│     │     ├── entities
│     │     ├── repositories(abstract)
│     │     └── use_cases
│     └── presentation
│     │     ├── blocs
│     │     ├── pages
│     │     └── widgets
│     │        
```

# Running Tests :memo:

All tests are contained in the ``test`` folder.
> The ``test`` folder structure mirrors that of the ``lib`` folder with a prefix of ``_test``
i.e the test file for ``lib/filename.dart`` is ``test/filename_test.dart``

To run all tests, paste and run the following command in the terminal
(PS: navigate to the root directory of the project)

```
flutter test
```

