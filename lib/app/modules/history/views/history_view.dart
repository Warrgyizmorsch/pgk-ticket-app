
import '../../../core/models/booking/booking_payment_response.dart';
import '../../../common/constant/app_imports.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Payment History',
        showBackButton: true,
        actions: [
          // Filter Icon in AppBar
          IconButton(
            icon: const Icon(Icons.filter_list, color: AppColors.white),
            onPressed: () => _showFilterDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.white),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // _buildSearchSection(), // Only Search Bar remains here
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CustomAppLoader());
              }

              if (controller.errorMessage.value.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              }

              final response = controller.paymentResponse.value;

              // Check if the response or its data list is empty
              if (response == null || response.data == null || response.data!.isEmpty) {
                return const Center(child: Text('No payment history found.'));
              }

              final payments = response.data!;

              return ListView.separated(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 100),
                itemCount: payments.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildHistoryCard(payments[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }


  // --- Filter Dialog ---
  void _showFilterDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter By',
                    style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 1. Status Dropdown
              Text('Status', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              CustomDropdown<String>(
                valueListenable: controller.selectedStatus,
                items: controller.statuses,
                hint: 'All Status',
                label: (String status) => status.capitalizeFirst ?? status,
                onChanged: (String? newValue) {
                  controller.selectedStatus.value = newValue;
                },
                showBorder: true,
                borderColor: AppColors.lightShadow,
                borderRadius: 8,
                height: 48,
              ),
              const SizedBox(height: 16),

              // 2. Date Range
              Text('Date Range', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Row(
                children: [
                  // From Date
                  Expanded(
                    child: InkWell(
                      onTap: () => controller.selectDate(context, isFromDate: true),
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.lightShadow),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Obx(() => Text(
                                controller.fromDate.value ?? 'From Date',
                                style: AppTextStyles.caption,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ),
                            const Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // To Date
                  Expanded(
                    child: InkWell(
                      onTap: () => controller.selectDate(context, isFromDate: false),
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.lightShadow),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Obx(() => Text(
                                controller.toDate.value ?? 'To Date',
                                style: AppTextStyles.caption,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ),
                            const Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 3. Action Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          controller.clearFilters();
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          side: const BorderSide(color: AppColors.lightShadow),
                        ),
                        child: const Text('Clear All', style: TextStyle(color: AppColors.textPrimary)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: AppButton(
                      title: 'Apply',
                      onTap: () => controller.applyFiltersFromDialog(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- History Card Component ---
  // Now accepts PaymentData instead of PaymentHistoryResponse
  Widget _buildHistoryCard(PaymentData payment) {
    // Utilize the new PaymentStatus enum for checking status safely
    final bool isSuccess = payment.status == PaymentStatus.success;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightShadow,
            blurRadius: 6,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.tagBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(ImageConstant.otp), // Update asset if necessary
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking ID: #${payment.bookingId ?? "N/A"}',
                  style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  'Gateway: ${payment.gateway?.toUpperCase() ?? "N/A"}',
                  style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 4),
                Text(
                  'Status: ${payment.status.value.capitalizeFirst}',
                  style: AppTextStyles.overline.copyWith(
                    color: isSuccess ? AppColors.success : AppColors.error,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹ ${payment.amount ?? "0.00"}', // Amount is a String based on the new model
                style: AppTextStyles.priceValue.copyWith(
                  color: isSuccess ? AppColors.success : AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}