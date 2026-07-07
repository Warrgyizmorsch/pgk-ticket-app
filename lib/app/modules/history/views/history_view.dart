

import '../../../core/models/booking/booking_payment_response.dart';
import '../controllers/history_controller.dart';
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
          _buildSearchSection(), // Only Search Bar remains here
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.value.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              }

              final paymentData = controller.paymentResponse.value;

              if (paymentData == null) {
                return const Center(child: Text('No payment history found.'));
              }

              return ListView.separated(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 100),
                itemCount: 1, // Change to your list length
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildHistoryCard(paymentData);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // --- Main Page Search Bar ---
  Widget _buildSearchSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.white,
      child: TextField(
        controller: controller.searchController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Search by Booking ID',
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, size: 20),
            onPressed: () {
              controller.searchController.clear();
              controller.applyFilters();
            },
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightShadow),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightShadow),
          ),
        ),
        onSubmitted: (_) => controller.applyFilters(),
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
                  // Secondary Action: Keep as outlined so it doesn't clash with your gradient AppButton
                  Expanded(
                    child: SizedBox(
                      height: 48, // Matched height with your AppButton
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

                  // Primary Action: Your Custom AppButton
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
  Widget _buildHistoryCard(PaymentResponseModel payment) {
    // ... (Your existing card code remains exactly the same)
    final bool isSuccess = payment.status.value == 'success';

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
              child: Image.asset(ImageConstant.otp),
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
                '₹ ${payment.amount ?? 0}',
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