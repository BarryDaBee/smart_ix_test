import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/bootstrap.dart';

void main() async {
  await initApp();
  await bootstrap(
    () => const App(
      title: 'Smart Home Dev',
    ),
  );
}
