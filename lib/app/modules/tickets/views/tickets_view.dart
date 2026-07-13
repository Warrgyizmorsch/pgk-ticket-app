import '../../../common/constant/app_imports.dart';
import '../../../core/models/booking/booking_list_response.dart';
import '../widget/ticket_details_view.dart';

class TicketsView extends GetView<TicketsController> {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: Column(
          children: [
            // --- TAB BAR UI ---
            Container(
              color: AppColors.primary,
              child: TabBar(
                labelColor: AppColors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: AppColors.background,
                indicatorWeight: 5,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                tabs:  [
                  Tab(text: l10n.tabSuccess),
                  Tab(text: l10n.tabPending),
                ],
              ),
            ),

            // --- TAB BAR VIEWS ---
            Expanded(
              child: TabBarView(
                children: [
                  // 1. SUCCESS TAB
                  Obx(() {
                    if (controller.isLoadingSuccess.value && controller.successData.isEmpty) {
                      return const Center(child: CustomAppLoader());
                    }

                    final successTickets = controller.successData
                        .where((t) => t.paymentStatus.value.toLowerCase() == 'success')
                        .toList();

                    return RefreshIndicator(
                      onRefresh: () => controller.fetchTickets('success', isRefresh: true),
                      color: AppColors.primary,
                      child: successTickets.isEmpty
                          ? _buildEmptyState(context, l10n, 'empty_success')
                          : _buildTicketList(
                        l10n,
                        successTickets, // <- Pass the filtered list here
                        controller.isLoadMoreSuccess.value,
                            () => controller.fetchTickets('success', isRefresh: false),
                        'list_success',
                      ),
                    );
                  }),

                  // 2. PENDING TAB
                  Obx(() {
                    if (controller.isLoadingPending.value && controller.pendingData.isEmpty) {
                      return const Center(child: CustomAppLoader());
                    }

                    // 🔴 FIX: Filter locally to guarantee ONLY pending/not_started tickets show here
                    final pendingTickets = controller.pendingData
                        .where((t) => t.paymentStatus.value.toLowerCase() != 'success')
                        .toList();

                    return RefreshIndicator(
                      onRefresh: () => controller.fetchTickets('pending', isRefresh: true),
                      color: AppColors.primary,
                      child: pendingTickets.isEmpty
                          ? _buildEmptyState(context, l10n, 'empty_pending')
                          : _buildTicketList(
                        l10n,
                        pendingTickets, // <- Pass the filtered list here
                        controller.isLoadMorePending.value,
                            () => controller.fetchTickets('pending', isRefresh: false),
                        'list_pending',
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Empty State UI
  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n, String tabKey) {
    return SingleChildScrollView(
      key: PageStorageKey<String>(tabKey),
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Center(
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
                  style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.noTicketsDesc,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary, height: 1.5, fontSize: 14),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(Routes.BOOKING),
                  icon: const Icon(Icons.add, color: AppColors.white),
                  label: Text(l10n.bookATicketBtn, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketList(
      AppLocalizations l10n,
      List<BookedTicketDataModel> tickets,
      bool isLoadMore,
      VoidCallback onLoadMore,
      String tabKey,
      ) {
    // 1. THIS is where we detect the bottom scroll!
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!isLoadMore && scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 50) {
          onLoadMore();
        }
        return false;
      },
      child: ListView.separated(
        key: PageStorageKey<String>(tabKey),
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 80),

        itemCount: tickets.length + (isLoadMore ? 1 : 0),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          debugPrint('Ticket Index: $index , Ticket Length: ${tickets.length}');
          if (index == tickets.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final ticket = tickets[index];
          final status = ticket.paymentStatus.value.toLowerCase();

          final isSuccess = status == 'success';
          final isPending = status == 'pending' || status == 'not_started';

          final totalPersons = ticket.adultsCount + ticket.kidsCount + ticket.infantsCount;
          final attractionName = '${ticket.ticketType.capitalizeFirst ?? l10n.generalWord} ${l10n.ticketWord}';

          Color statusColor;
          String statusText = status.replaceAll('_', ' ').capitalizeFirst ?? status;

          if (isSuccess) {
            statusColor = AppColors.success;
          } else if (isPending) {
            statusColor = Colors.orange;
          } else {
            statusColor = Colors.grey.shade600;
          }

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
                  color: isSuccess ? AppColors.primary.withValues(alpha: 0.3) : Colors.transparent,
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
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isSuccess) ...[
                                Icon(Icons.check_circle, size: 12, color: statusColor),
                                const SizedBox(width: 4),
                              ] else if (isPending) ...[
                                Icon(Icons.access_time_filled, size: 12, color: statusColor),
                                const SizedBox(width: 4),
                              ],
                              Text(
                                statusText,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: statusColor,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}