///Custom implementation of Exception
abstract class AppException implements Exception{
  AppException(this.message);

  final String message;
}

 class DeviceException implements AppException{
  const DeviceException(this.message);

  @override
  final String message;
}

 class RoutineException implements AppException{
  const RoutineException(this.message);

  @override
  final String message;
}
