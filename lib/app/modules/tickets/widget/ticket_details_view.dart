import '../../../common/constant/app_imports.dart';
import '../../../core/models/booking/booking_list_response.dart';

class TicketDetailView extends GetView<TicketsController> {
  const TicketDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize AppLocalizations
    final l10n = AppLocalizations.of(context)!;

    final BookedTicketDataModel ticket = Get.arguments;

    // Derived values for the UI
    final String rawStatus = ticket.paymentStatus.value.toLowerCase();
    final bool isSuccess = rawStatus == 'success';
    final bool isPending = rawStatus == 'pending';

    // Format the status text to show exactly what it is (e.g., "Success", "Pending")
    final String statusText = ticket.paymentStatus.value.replaceAll('_', ' ').capitalizeFirst ?? ticket.paymentStatus.value;

    // Determine color based on status
    Color statusColor;
    if (isSuccess) {
      statusColor = AppColors.success;
    } else if (isPending) {
      statusColor = Colors.orange;
    } else if (rawStatus == 'failed') {
      statusColor = Colors.red;
    } else {
      statusColor = Colors.grey.shade600;
    }

    final String attractionName = '${ticket.ticketType.capitalizeFirst ?? l10n.generalWord} ${l10n.ticketWord}';
    final String orderId = ticket.payment.referenceId;
    final int totalTickets = ticket.adultsCount + ticket.kidsCount + ticket.infantsCount;

    final String bookingDate = ticket.createdAt.contains('T')
        ? ticket.createdAt.split('T')[0]
        : ticket.createdAt;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.ticketDetailTitle,
        showBackButton: true,
      ),

      // --- Sticky Bottom Button for Pending Payments ---
      bottomNavigationBar: isPending
          ? SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              final paymentLink = ticket.paymentUrl ;

              if (paymentLink != null && paymentLink.isNotEmpty) {
                Get.toNamed(
                  Routes.PAYMENT,
                  arguments: {
                    'paymentUrl': paymentLink,
                    'bookingId': ticket.bookingId,
                    'bookingModel': ticket,
                    'amount': ticket.totalRs,
                    'customerName': ticket.user.name,
                    'customerEmail': ticket.user.email ,
                    'customerPhone': ticket.user.mobile,
                    'bookingDate': ticket.date,
                    'tickets':ticket.priceBreakdown,
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Pay Now',
              style: TextStyle(
                fontSize: 16,
             fontWeight: FontWeight.w600,
                fontFamily: FontFamily.regular,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      )
          : null,
      // -------------------------------------------------

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
                  // Top section (Attraction Name & Image)
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: const BoxDecoration(
                      color: AppColors.tagBg,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          attractionName,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.h1.copyWith(fontSize: 18, color: AppColors.primary),
                        ),
                        const SizedBox(height: 24),

                        // UPDATED: OTP Image replacing the QR Code
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.lightDivider),
                          ),
                          child: Image.asset(
                            ImageConstant.otp, // Ensure ImageConstant is properly imported
                            height: 150,
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          orderId,
                          style: AppTextStyles.bodyMedium.copyWith( fontWeight: FontWeight.w600,
         letterSpacing: 1.5),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoColumn(l10n.nameLabel, ticket.user.name ),
                            _buildInfoColumn(
                              l10n.statusLabel,
                              statusText,
                              alignment: CrossAxisAlignment.end,
                              valueColor: statusColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoColumn(l10n.emailLabel, ticket.user.email ),
                            _buildInfoColumn(l10n.phoneLabel, ticket.user.mobile , alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoColumn(l10n.nationalityLabel, ticket.nationality.isNotEmpty ? ticket.nationality : l10n.notAvailableFallback),

                            _buildInfoColumn(l10n.bookingDateLabel, bookingDate, alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            _buildInfoColumn(l10n.visitDateLabel, '${ticket.date} (${ticket.time})'),

                            _buildInfoColumn(l10n.totalPaidLabel, '₹${ticket.totalRs.toStringAsFixed(0)}', alignment: CrossAxisAlignment.end),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(color: AppColors.lightDivider),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${l10n.ticketsBreakupLabel} ($totalTickets ${l10n.totalWord})',
                                style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w600)
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildBreakdownItem(l10n.adultsLabel, ticket.adultsCount.toString()),
                            _buildBreakdownItem(l10n.kidsLabel, ticket.kidsCount.toString()),
                            _buildBreakdownItem(l10n.infantsLabel, ticket.infantsCount.toString()),
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

  Widget _buildInfoColumn(String label, String value, {CrossAxisAlignment alignment = CrossAxisAlignment.start, Color? valueColor}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(label, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
           fontWeight: FontWeight.w500,
                fontSize: 13,
                fontFamily: FontFamily.regular,
              color: valueColor,
            ),
            maxLines: 2,
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