import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/tickets_controller.dart';
import '../../../common/constant/app_imports.dart';
import '../widget/ticket_details_view.dart';


class TicketsView extends GetView<TicketsController> {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'My Tickets',
        showBackButton: false, // Set to true if this screen is not the bottom nav root
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.BOOKING),
            icon: const Icon(Icons.add, color: AppColors.white),
            tooltip: 'Book New Ticket',
          )
        ],
      ),
      body: Obx(() {
        if (controller.myTickets.isEmpty) {
          return const Center(
            child: Text(
              'No tickets found.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.myTickets.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final ticket = controller.myTickets[index];
            final isUpcoming = ticket['status'] == 'Upcoming';

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
                      // Header Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              ticket['attractionName'] ?? 'Attraction',
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
                              ticket['status'] ?? 'Unknown',
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

                      // Details Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Visit Date', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                              const SizedBox(height: 4),
                              Text(ticket['visitDate'] ?? 'N/A', style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tickets', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                              const SizedBox(height: 4),
                              Text('${ticket['ticketCount'] ?? 0} Persons', style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Total', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
                              const SizedBox(height: 4),
                              Text('₹${(ticket['totalAmount'] as num?)?.toStringAsFixed(0) ?? '0'}',
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