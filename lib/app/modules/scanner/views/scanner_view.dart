import '../../../common/constant/app_imports.dart';


class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize AppLocalizations
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.qrScanTitle, // Reused from previous
        showBackButton: false,
      ),
      body: Obx(() {
        // STATE 1: Checking the network (Loading)
        if (controller.isCheckingNetwork.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(l10n.verifyingWifi),
              ],
            ),
          );
        }

        // STATE 2: Wrong Wi-Fi network (Access Denied)
        if (!controller.isAuthorizedNetwork.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wifi_off, color: Colors.red, size: 80),
                const SizedBox(height: 16),
                Text(
                  l10n.accessDenied,
                  style: AppTextStyles.h1,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.connectToAuthorizedWifi,
                  style: AppTextStyles.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // ElevatedButton.icon(
                //   onPressed: controller.verifyWifiConnection,
                //   style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.primary)),
                //   icon: const Icon(Icons.refresh, color: AppColors.white),
                //   label: Text(l10n.retryConnectionCheck, style: AppTextStyles.button),
                // ),
              ],
            ),
          );
        }

        // STATE 3: Correct Wi-Fi network (Show Scanner)
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              Text(
                l10n.scanYourQrSubtitle, // Reused from previous
                style: const TextStyle(fontSize: 16, color: AppColors.primary, fontFamily: FontFamily.regular),
              ),
              const SizedBox(height: 20),

              // Scanner Box
              Container(
                height: 280,
                width: 280,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),


                  borderRadius: BorderRadius.circular(16),
                ),
                child: MobileScanner(
                  controller: controller.scannerController,
                  onDetect: controller.onDetect,
                  errorBuilder: (context, error) {
                    return const Center(
                      child: Icon(Icons.error, color: Colors.red, size: 50),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Flashlight Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withValues(alpha: 0.3), // Consider using AppColors
                    radius: 24,
                    child: IconButton(
                      icon: const Icon(Icons.flash_on, color: Colors.black54), // Consider using AppColors
                      onPressed: controller.toggleFlash,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      }),
    );
  }
}