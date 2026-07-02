import '../../../common/constant/app_imports.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../controllers/bluetooth_controller.dart'; // Ensure correct path

class BluetoothView extends GetView<BluetoothController> {
  const BluetoothView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Bluetooth Audio Guides',
      ),
      body: Obx(() {
        // Handle Bluetooth turned off
        if (!controller.isBluetoothOn.value) {
          return _buildBluetoothOffState();
        }

        return Column(
          children: [
            _buildHeader(),

            // Show Connected Device (if any)
            if (controller.connectedDevice.value != null)
              _buildConnectedDeviceCard(),

            // List of discovered devices
            Expanded(
              child: controller.scanResults.isEmpty && !controller.isScanning.value
                  ? _buildEmptyState()
                  : _buildDeviceList(),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Available Devices', style: AppTextStyles.titleLarge),
              SizedBox(height: 4),
              Text('Select a headset to connect', style: AppTextStyles.sectionSub),
            ],
          ),
          Obx(() => controller.isScanning.value
              ? const SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(color: AppColors.primary, strokeWidth: 2),
          )
              : IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.primary),
            onPressed: () => controller.startScan(),
          )),
        ],
      ),
    );
  }

  Widget _buildConnectedDeviceCard() {
    final device = controller.connectedDevice.value!;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.success.withValues(alpha: 0.5)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.headphones, color: AppColors.success, size: 32),
        title: Text(device.platformName.isNotEmpty ? device.platformName : 'Unknown Device', style: AppTextStyles.titleLarge),
        subtitle: const Text('Connected', style: TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
        trailing: TextButton(
          onPressed: () => controller.disconnectDevice(),
          child: const Text('Disconnect', style: TextStyle(color: AppColors.error)),
        ),
      ),
    );
  }

  Widget _buildDeviceList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: controller.scanResults.length,
      separatorBuilder: (context, index) => const Divider(color: AppColors.lightDivider),
      itemBuilder: (context, index) {
        final result = controller.scanResults[index];
        final deviceName = result.device.platformName;

        // Hide empty names if preferred
        if (deviceName.isEmpty) return const SizedBox.shrink();

        return ListTile(
          tileColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.bluetooth, color: AppColors.primary),
          ),
          title: Text(deviceName, style: AppTextStyles.subtitle),
          subtitle: Text(result.device.remoteId.str, style: AppTextStyles.caption),
          trailing: ElevatedButton(
            onPressed: () => controller.connectToDevice(result.device),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 0,
            ),
            child: const Text('Connect'),
          ),
        );
      },
    );
  }

  Widget _buildBluetoothOffState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bluetooth_disabled, size: 64, color: AppColors.lightTextDisabled),
          const SizedBox(height: 16),
          const Text('Bluetooth is turned off', style: AppTextStyles.titleLarge),
          const SizedBox(height: 8),
          const Text('Please enable Bluetooth in your settings.', style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text('No devices found.\nTap refresh to scan again.',
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyMedium,
      ),
    );
  }
}