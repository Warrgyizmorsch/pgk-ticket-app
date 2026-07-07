import 'package:app_settings/app_settings.dart';
import 'package:pgk_ticket_app/app/common/constant/app_imports.dart';
import '../controllers/bluetooth_controller.dart';

class BluetoothView extends GetView<BluetoothController> {
  const BluetoothView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bluetooth Audio Guides'),
      body: Obx(() {
        if (controller.isBluetoothAudioConnected.value) {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.headphones,
                  color: Colors.green,
                  size: 40,
                ),
                title: Text(
                  controller.connectedDeviceName.value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Status: Connected (Ready to Play)',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.headset_off, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'No Headphones Connected',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Please connect your EarPods via Bluetooth in your phone's Settings.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.settings_bluetooth),
                label: const Text(
                  'Open Bluetooth Settings',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
