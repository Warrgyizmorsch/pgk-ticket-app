import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';
// Ensure your central theme/colors are imported. 
// Adjust this import path if needed based on your file structure.
import '../../../common/constant/app_imports.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using a very light grey/tinted background to make the white cards pop
      backgroundColor: AppColors.background,

      appBar: CustomAppBar(

        title:
          'Payment History',
        showBackButton: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.white),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),

      // Using ListView.separated to easily manage the spacing between cards
      body: ListView.separated(
        // Extra bottom padding ensures the last item isn't hidden behind your global bottom navigation bar
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
        itemCount: 4, // Replace with your actual item count from the controller
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _buildHistoryCard();
        },
      ),
    );
  }

  /// Extracts the individual card UI to keep the build method clean
  Widget _buildHistoryCard() {
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
          // 1. Left Side: Image Thumbnail
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.tagBg, // Light orange/beige background
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // Replace with actual Image.asset or network image for the horse
              child: Image.asset(ImageConstant.otp),
            ),
          ),
          const SizedBox(width: 12),

          // 2. Middle: Booking Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pratap Gourav Kendra',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  'Total:- 5 Tickets',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Booked On- 12/2/2024, 12:57 PM',
                  style: AppTextStyles.overline.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          // 3. Right Side: Action Button & Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Action to view full ticket details
                },
                child: Text(
                  'Show Tickets',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '₹ 1457',
                style: AppTextStyles.priceValue.copyWith(
                  color: AppColors.success, // Green color for payment amounts
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