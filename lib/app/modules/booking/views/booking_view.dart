import 'package:intl/intl.dart';
import '../../../common/constant/app_imports.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: l10n.bookTicket,

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              ImageConstant.lightSound,
              height: 220,
              fit: BoxFit.contain,
            ),
            Transform.translate(
              offset: const Offset(0, -20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.lightShadow,
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.attractionDetails, style: AppTextStyles.sectionHeading),
                      const SizedBox(height: 16),

                      // All 3 Options
                      _buildAttractionOptions(l10n),

                      const Divider(color: AppColors.lightDivider, height: 32, thickness: 1),

                      _buildDateSelector(context, l10n),
                      const SizedBox(height: 12),
                      _buildNationalityToggle(l10n),

                      const Divider(color: AppColors.lightDivider, height: 20, thickness: 1),

                      Text(l10n.selectTickets, style: AppTextStyles.sectionHeading),
                      const SizedBox(height: 8),
                      _buildCounters(l10n),
                      _buildAddWaterShowToggle(l10n),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.priceBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.priceDivider),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(l10n.totalAmountLabel, style: AppTextStyles.priceTitle),
                            Obx(() => Text(
                              '₹${controller.totalAmount.toStringAsFixed(2)}',
                              style: AppTextStyles.totalValue.copyWith(fontSize: 22),
                            )),
                          ],
                        ),
                      ),
                      // const Divider(color: AppColors.lightDivider, height: 20, thickness: 1),
                      //
                      // _buildContactForm(l10n),

                      const SizedBox(height: 12),

                      _buildTotalAndSubmit(l10n),

                      const SizedBox(height: 12),

                      _buildRulesSection(l10n),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttractionOptions(AppLocalizations l10n) {
    return Column(
      children: [
        _attractionCard(0, l10n.pratapGouravKendra, Icons.account_balance),
        _attractionCard(1, l10n.waterLaserShowOnly, Icons.water_drop),
        _attractionCard(2, l10n.pratapGouravKendraCombo, Icons.stars),
      ],
    );
  }

  Widget _attractionCard(int index, String title, IconData icon) {
    return Obx(() {
      bool isSelected = controller.selectedAttraction.value == index;
      return GestureDetector(
        onTap: () {
          controller.selectedAttraction.value = index;
          // Reset toggle if they click something else
          if (index != 0) controller.isWaterShowAdded.value = false;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.tagBg : AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.lightDivider,
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.transparent : AppColors.lightDivider,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 14,
                  color: isSelected ? AppColors.white : AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? AppColors.primary : AppColors.textPrimary,
                    fontSize: 13,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAddWaterShowToggle(AppLocalizations l10n) {
    return Obx(() {
      // Show ONLY if the user selected the first option (index 0)
      if (controller.selectedAttraction.value != 0) return const SizedBox.shrink();

      return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.tagBg.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                l10n.wantToAddWaterLaserShow,
                style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 8),
            ToggleButtons(
              isSelected: [!controller.isWaterShowAdded.value, controller.isWaterShowAdded.value],
              onPressed: (index) => controller.isWaterShowAdded.value = (index == 1),
              borderRadius: BorderRadius.circular(6),
              selectedColor: AppColors.white,
              fillColor: AppColors.primary,
              color: AppColors.textPrimary,
              constraints: const BoxConstraints(minHeight: 32, minWidth: 45),
              children: [
                Text(l10n.no, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text(l10n.yes, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDateSelector(BuildContext context, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l10n.dateLabel, style: AppTextStyles.titleSmall),
        Obx(() => InkWell(
          onTap: () => controller.pickDateTime(context),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primary.withValues(alpha: 0.05),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_month, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  DateFormat('dd MMM, yyyy').format(controller.selectedDate.value),
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildNationalityToggle(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l10n.nationalityLabel, style: AppTextStyles.titleSmall),
        Obx(() => Container(
          decoration: BoxDecoration(
            color: AppColors.tagBg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ToggleButtons(
            isSelected: [controller.isIndian.value, !controller.isIndian.value],
            onPressed: (index) => controller.isIndian.value = index == 0,
            borderRadius: BorderRadius.circular(8),
            selectedColor: AppColors.white,
            fillColor: AppColors.primary,
            color: AppColors.textPrimary,
            constraints: const BoxConstraints(minHeight: 44, minWidth: 80),
            children: [
              Text(l10n.indian, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              Text(l10n.foreigner, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildCounters(AppLocalizations l10n) {
    final List<int> countItems = List.generate(21, (index) => index);

    return Obx(() => Column(
      children: [
        _personDropdownRow(
          l10n.infantLabel,
          l10n.free,
          controller.infantNotifier,
          countItems,
        ),
        _personDropdownRow(
          l10n.kidsLabel,
          '₹${controller.currentChildPrice.toStringAsFixed(2)}',
          controller.childNotifier,
          countItems,
        ),
        _personDropdownRow(
          l10n.adultLabel,
          '₹${controller.currentAdultPrice.toStringAsFixed(2)}',
          controller.adultNotifier,
          countItems,
        ),
      ],
    ));
  }

  Widget _personDropdownRow(String label, String priceText, ValueNotifier<int?> notifier, List<int> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightDivider),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(
                priceText,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomDropdown<int>(
            valueListenable: notifier,
            items: items,
            label: (val) => val.toString(),
            onChanged: (val) {
              if (val != null) notifier.value = val;
            },
            hint: '0',
            dropdownWidth: 80,
            height: 40,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ],
      ),
    );
  }


  Widget _buildTotalAndSubmit(AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: controller.submitBooking,
        child: Text(l10n.bookNowBtn, style: AppTextStyles.button),
      ),
    );
  }

  Widget _buildRulesSection(AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightDivider),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            l10n.rulesRegulationsTitle,
            style: AppTextStyles.subtitle.copyWith(color: AppColors.primary),
          ),
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.textSecondary,
          childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          children: [
            _ruleText(l10n.rule1),
            _ruleText(l10n.rule2),
            _ruleText(l10n.rule3),
            _ruleText(l10n.rule4),
            _ruleText(l10n.rule5),
            _ruleText(l10n.rule6),
            _ruleText(l10n.rule7),
            _ruleText(l10n.rule8),
            _ruleText(l10n.rule9),
          ],
        ),
      ),
    );
  }

  Widget _ruleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, right: 8.0),
            child: Icon(Icons.circle, size: 6, color: AppColors.textSecondary),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.caption.copyWith(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}