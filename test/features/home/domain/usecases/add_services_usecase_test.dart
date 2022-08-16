import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/features/home/domain/entities/service_entity.dart';
import 'package:smart_home/features/home/domain/repositories/service_repository.dart';
import 'package:smart_home/features/home/domain/use_cases/add_service_use_case.dart';

class ServiceRepositoryMock extends Mock implements ServiceRepository {}

void main() {
  final repository = ServiceRepositoryMock();
  final useCase = AddServiceUseCase(repository);
  group('Add service UseCase -', () {
    const serviceEntity = ServiceEntity(
      id: 'id',
      name: 'name',
      icon: 'icon',
      details: '',
    );

    test('''
verify a call to [ServiceRepository.addService]
    the right data''', () async {
      when(() => repository.addService(serviceEntity))
          .thenAnswer((_) async => const Right(serviceEntity));
      await useCase(serviceEntity);
      verify(
        () => repository.addService(
          const ServiceEntity(
            id: 'id',
            name: 'name',
            icon: 'icon',
            details: '',
          ),
        ),
      );
    });
  });
}
