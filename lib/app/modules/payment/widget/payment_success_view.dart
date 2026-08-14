import '../../../common/constant/app_imports.dart';

class PaymentSuccessView extends GetView<PaymentController> {
  const PaymentSuccessView({super.key});

  void _returnToNavBar() {
    Get.until((route) => route.settings.name == Routes.NAV_BAR);
    Get.find<NavBarController>().changeTab(5);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _returnToNavBar();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(
          title: 'Payment',
          showBackButton: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white),
            onPressed: _returnToNavBar,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: AppColors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Receipt',
                    style: AppTextStyles.h1.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  // --- SHARE OPTION ---
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share_outlined, color: AppColors.textPrimary, size: 28),
                        onPressed: controller.shareReceipt,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Receipt Ticket Card
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  // The main ticket body
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: CustomPaint(
                      painter: TicketPainter(
                        borderColor: AppColors.primary,
                        bgColor: AppColors.white,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 35, // Space for the checkmark
                          left: 20,
                          right: 20,
                          bottom: 40, // Space for the scalloped edge
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Optional Watermark Logo
                            Opacity(
                              opacity: 0.04,
                              child: Image.asset(
                                ImageConstant.appLogo,
                                width: 180,
                                height: 180,
                              ),
                            ),

                            // Receipt Content
                            Column(
                              children: [
                                Text(
                                  'Maharana Pratap Gaurav Kendra Veer\nShiromani Maharana Pratap Samiti Tiger\nHills, Manoharpura, Near',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 18),

                                // --- ALIGNED CUSTOMER & ORDER DETAILS ---
                                Obx(() => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left Column: Order ID & Date
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _buildDetailText('Order ID : \n', controller.orderId.value),
                                          const SizedBox(height: 8),
                                          _buildDetailText('Booking Date: \n', controller.bookingDate.value),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    // Right Column: Name & Phone
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _buildDetailText('Name: \n', controller.customerName.value),
                                          const SizedBox(height: 8),
                                          _buildDetailText('Com P.No.: \n', controller.customerPhone.value),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                                // ----------------------------------------

                                const SizedBox(height: 18),
                                const Divider(color: AppColors.lightDivider, thickness: 1),
                                const SizedBox(height: 12),

                                // Table Header (Simplified to Ticket and Qty)
                                Row(
                                  children: [
                                    Expanded(flex: 3, child: Text('Tickets', style: AppTextStyles.caption)),
                                    Expanded(flex: 1, child: Text('Qty', textAlign: TextAlign.right, style: AppTextStyles.caption)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Divider(color: AppColors.lightDivider, thickness: 1),
                                const SizedBox(height: 12),

                                // --- REACTIVE TABLE ITEMS (Updated for PassengerBreakdownModel) ---
                                Obx(() {
                                  final breakdown = controller.priceBreakdown.value;

                                  if (breakdown == null) {
                                    return const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      child: Text('Loading tickets...'),
                                    );
                                  }

                                  List<Widget> ticketRows = [];
                                  if (breakdown.infants != null && breakdown.infants!.count > 0) {
                                    ticketRows.add(_buildTicketRow(title: 'Infants', qty: breakdown.infants?.count??0, price:breakdown.infants?.totalRs??0));
                                  }
                                  if (breakdown.kids != null && breakdown.kids!.count > 0) {
                                    ticketRows.add(_buildTicketRow(title: 'Kids', qty: breakdown.kids?.count??0, price:breakdown.kids?.totalRs??0));
                                  }
                                  if (breakdown.adults != null && breakdown.adults!.count > 0) {
                                    ticketRows.add(_buildTicketRow(title: 'Adults', qty: breakdown.adults?.count??0, price: breakdown.adults?.totalRs??0));
                                  }



                                  if (ticketRows.isEmpty) {
                                    return const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      child: Text('No tickets found.'),
                                    );
                                  }

                                  return Column(children: ticketRows);
                                }),
                                // ------------------------------------------------------------------

                                const Divider(color: AppColors.lightDivider, thickness: 1),
                                const SizedBox(height: 12),

                                // Grand Total
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Grand Total', style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary)),
                                    const SizedBox(width: 16),
                                    Obx(() => Text(
                                      '₹${controller.totalAmount.value.toStringAsFixed(2)}',
                                      style: AppTextStyles.priceValue.copyWith(color: AppColors.success),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Top Center Green Checkmark Badge
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 1.5),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.check, color: AppColors.white, size: 28),
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

  /// Helper for rich text (Bold Label + Regular Value)
  Widget _buildDetailText(String label, String value) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary, fontSize: 10),
        children: [
          TextSpan(text: label, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: value),
        ],
      ),
    );
  }

  /// Helper to build a single ticket row
  Widget _buildTicketRow({required String title, required int qty, required double price}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(title, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 1,
            child: Text(qty.toString(), textAlign: TextAlign.right, style: AppTextStyles.bodySmall),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Text(price.toString(), textAlign: TextAlign.right, style: AppTextStyles.bodySmall),
          // ),
        ],
      ),
    );
  }
}

/// Custom Painter to draw the receipt ticket with rounded top corners,
/// a scalloped bottom edge, and an orange border.
class TicketPainter extends CustomPainter {
  final Color borderColor;
  final Color bgColor;

  TicketPainter({required this.borderColor, required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final path = Path();
    const double radius = 16.0;

    // Start at top-left corner
    path.moveTo(radius, 0);

    // Top line & Top-right corner
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right vertical line (stop before the scalloped edge)
    const double bottomOffset = 15.0; // Height of the scallop cuts
    path.lineTo(size.width, size.height - bottomOffset);

    // Bottom Scalloped Edge (drawn right to left)
    const double scallopRadius = 8.0;
    final int scallopCount = (size.width / (scallopRadius * 2.5)).floor();
    final double remainingSpace = size.width - (scallopCount * (scallopRadius * 2));
    final double padding = remainingSpace / (scallopCount + 1);

    double currentX = size.width;

    for (int i = 0; i < scallopCount; i++) {
      // Line to the start of the next semi-circle
      currentX -= padding;
      path.lineTo(currentX, size.height - bottomOffset);

      // Draw the inward semi-circle
      currentX -= (scallopRadius * 2);
      path.arcToPoint(
        Offset(currentX, size.height - bottomOffset),
        radius: const Radius.circular(scallopRadius),
        clockwise: false,
      );
    }

    // Line to the bottom-left corner
    path.lineTo(0, size.height - bottomOffset);

    // Left vertical line & Top-left corner
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}