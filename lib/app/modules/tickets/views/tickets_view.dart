import '../../../common/widget/custom_loading/custom_loading_app.dart';

import '../controllers/tickets_controller.dart';
import '../../../common/constant/app_imports.dart';
import '../widget/ticket_details_view.dart';

class TicketsView extends GetView<TicketsController> {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize AppLocalizations
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.myTicketsTitle,
        showBackButton: false,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.BOOKING),
            icon: const Icon(Icons.add, color: AppColors.white),
            tooltip: l10n.bookNewTicketTooltip,
          )
        ],
      ),

      // --- NEW: Floating Action Button ---
      floatingActionButton: Obx(() {
        // Only show the FAB if the list is NOT empty and NOT loading
        if (!controller.isLoading.value && controller.bookingData.isNotEmpty) {
          return FloatingActionButton.extended(
            onPressed: () => Get.toNamed(Routes.BOOKING),
            backgroundColor: AppColors.primary,
            elevation: 4,
            icon: const Icon(Icons.confirmation_num_outlined, color: AppColors.white),
            label: Text(
              l10n.bookNowBtn,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          );
        }
        return const SizedBox.shrink(); // Hide the FAB
      }),
      // -----------------------------------

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CustomAppLoader());
        }

        // 2. The polished Empty State UI
        if (controller.bookingData.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.local_activity_outlined,
                      size: 64,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.noTicketsYet,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.noTicketsDesc,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () => Get.toNamed(Routes.BOOKING),
                    icon: const Icon(Icons.add, color: AppColors.white),
                    label: Text(
                      l10n.bookATicketBtn,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // 3. The Populated List View
        return ListView.separated(
          padding: const EdgeInsets.all(16.0),
          // Added extra padding at the bottom so the last item isn't hidden behind the FAB
          // padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),
          itemCount: controller.bookingData.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {

            final ticket = controller.bookingData[index];
            final isUpcoming = ticket.paymentStatus.toLowerCase() == 'success';
            final totalPersons = ticket.adultsCount + ticket.kidsCount + ticket.infantsCount;
            final attractionName = '${ticket.ticketType.capitalizeFirst ?? l10n.generalWord} ${l10n.ticketWord}';

            return GestureDetector(
              onTap: () {
                Get.to(() => const TicketDetailView(), arguments: ticket);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: AppColors.lightShadow, blurRadius: 8, offset: Offset(0, 4)),
                  ],
                  border: Border.all(
                    color: isUpcoming ? AppColors.primary.withValues(alpha: 0.3) : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              attractionName,
                              style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isUpcoming ? AppColors.success.withValues(alpha: 0.1) : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isUpcoming ? l10n.upcomingStatus : l10n.pendingStatus,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: isUpcoming ? AppColors.success : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24, color: AppColors.lightDivider),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.visitDateLabel, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                              const SizedBox(height: 4),
                              Text(ticket.date, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.ticketsLabel, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                              const SizedBox(height: 4),
                              Text('$totalPersons ${l10n.personsLabel}', style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(l10n.totalLabel, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                              const SizedBox(height: 4),
                              Text('₹${ticket.totalRs.toStringAsFixed(0)}',
                                  style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600, color: AppColors.primary)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}