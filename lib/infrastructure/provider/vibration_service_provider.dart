import 'package:clean_architecture_todo/domain/service/vibration_service.dart';
import 'package:clean_architecture_todo/infrastructure/service/vibration_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vibration_service_provider.g.dart';

@riverpod
IVibrationService vibrationService(Ref ref) {
  return VibrationServiceImpl();
}
