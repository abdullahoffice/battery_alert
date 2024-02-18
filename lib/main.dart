
import 'battery_alert.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await OnePref.init();
  // WidgetsBinding.instance.addObserver(MyObserver());
  NotificationService().initialiseNotifications();
  runApp(const MyApp());
}
