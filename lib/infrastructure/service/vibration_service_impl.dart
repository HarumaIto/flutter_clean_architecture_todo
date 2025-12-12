import 'package:clean_architecture_todo/domain/service/vibration_service.dart';
import 'package:vibration/vibration.dart';

class VibrationServiceImpl implements IVibrationService {
  @override
  Future<void> vibrate() async {
    final hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      Vibration.vibrate(duration: 100);
    }
  }
}
