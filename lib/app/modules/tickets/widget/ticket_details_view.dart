import '../../../common/constant/app_imports.dart';

class TicketDetailView extends StatelessWidget {
  const TicketDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize AppLocalizations
    final l10n = AppLocalizations.of(context)!;
    final Map<String, dynamic> ticket = Get.arguments ?? {};

    return Scaffold(
      backgroundColor: AppColors.background,
      // Your CustomAppBar automatically handles the back button here
      appBar: CustomAppBar(
        title: l10n.ticketDetailTitle,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Digital Ticket Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: AppColors.lightShadow, blurRadius: 10, offset: Offset(0, 5)),
                ],
              ),
              child: Column(
                children: [
                  // Top section (Attraction Name & QR)
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: const BoxDecoration(
                      color: AppColors.tagBg,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          ticket['attractionName'] ?? l10n.attractionNameFallback,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.h1.copyWith(fontSize: 20, color: AppColors.primary),
                        ),
                        const SizedBox(height: 24),

                        // Placeholder QR Code Box
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.lightDivider),
                          ),
                          child: Icon(
                            Icons.qr_code_2,
                            size: 150,
                            // Note: if ticket status is localized by backend, you may need to adjust this logic check
                            color: ticket['status'] == 'Upcoming' ? AppColors.textPrimary : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          ticket['orderId'] ?? l10n.notAvailableFallback,
                          style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.5),
                        ),
                      ],
                    ),
                  ),

                  // Dashed Line Separator
                  Row(
                    children: [
                      _buildSemiCircle(isLeft: true),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                (constraints.constrainWidth() / 10).floor(),
                                    (index) => const SizedBox(
                                  width: 5,
                                  height: 1,
                                  child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      _buildSemiCircle(isLeft: false),
                    ],
                  ),

                  // Bottom section (Detailed Information)
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoColumn(l10n.nameLabel, ticket['customerName'] ?? l10n.notAvailableFallback),
                            _buildInfoColumn(l10n.statusLabel, ticket['status'] ?? l10n.notAvailableFallback, alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoColumn(l10n.emailLabel, ticket['email'] ?? l10n.notAvailableFallback),
                            _buildInfoColumn(l10n.phoneLabel, ticket['phone'] ?? l10n.notAvailableFallback, alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoColumn(l10n.bookingDateLabel, ticket['bookingDate'] ?? l10n.notAvailableFallback),
                            _buildInfoColumn(l10n.visitDateLabel, ticket['visitDate'] ?? l10n.notAvailableFallback, alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildInfoColumn(l10n.nationalityLabel, ticket['nationality'] ?? l10n.notAvailableFallback),
                            _buildInfoColumn(l10n.totalPaidLabel, '₹${ticket['totalAmount'] ?? 0.0}', alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: AppColors.lightDivider),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${l10n.ticketsBreakupLabel} (${ticket['ticketCount']} ${l10n.totalWord})',
                                style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.bold)
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildBreakdownItem(l10n.adultsLabel, ticket['adultCount']?.toString() ?? '0'),
                            _buildBreakdownItem(l10n.kidsLabel, ticket['childCount']?.toString() ?? '0'),
                            _buildBreakdownItem(l10n.infantsLabel, ticket['infantCount']?.toString() ?? '0'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, {CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(label, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownItem(String label, String count) {
    return Column(
      children: [
        Text(count, style: AppTextStyles.h1.copyWith(fontSize: 18, color: AppColors.primary)),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildSemiCircle({required bool isLeft}) {
    return Container(
      width: 10,
      height: 20,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: isLeft
            ? const BorderRadius.horizontal(right: Radius.circular(20))
            : const BorderRadius.horizontal(left: Radius.circular(20)),
      ),
    );
  }
}