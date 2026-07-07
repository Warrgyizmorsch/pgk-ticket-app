import '../../../common/constant/app_imports.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title:'Payment',
        showBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Order Summary Card ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightShadow,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Total Payable Amount',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Obx(() => Text(
                          '₹${controller.totalAmount.value.toStringAsFixed(2)}',
                          style: AppTextStyles.displayMedium.copyWith(color: AppColors.primary),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // --- Payment Methods Section ---
                  const Text(
                    'Select Payment Method',
                    style: AppTextStyles.sectionHeading,
                  ),
                  const SizedBox(height: 16),

                  _buildPaymentOption(
                    title: 'UPI',
                    subtitle: 'Google Pay, PhonePe, Paytm',
                    icon: Icons.qr_code_scanner,
                    methodKey: 'UPI',
                  ),
                  _buildPaymentOption(
                    title: 'Credit / Debit Card',
                    subtitle: 'Visa, MasterCard, RuPay',
                    icon: Icons.credit_card,
                    methodKey: 'CARD',
                  ),
                  _buildPaymentOption(
                    title: 'Net Banking',
                    subtitle: 'All Indian Banks',
                    icon: Icons.account_balance,
                    methodKey: 'NET_BANKING',
                  ),
                  _buildPaymentOption(
                    title: 'Wallets',
                    subtitle: 'Amazon Pay, Mobikwik',
                    icon: Icons.account_balance_wallet,
                    methodKey: 'WALLET',
                  ),
                ],
              ),
            ),
          ),

          // --- Bottom Pay Button ---
          _buildBottomPayBar(),
        ],
      ),
    );
  }

  /// Helper widget to build selectable payment method rows
  Widget _buildPaymentOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required String methodKey,
  }) {
    return Obx(() {
      final isSelected = controller.selectedPaymentMethod.value == methodKey;

      return GestureDetector(
        onTap: () => controller.selectPaymentMethod(methodKey),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.tagBg : AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.lightDivider,
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.background,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 20,
                      color: isSelected ? AppColors.white : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: isSelected ? AppColors.primary : AppColors.lightDivider,
                  ),
                ],
              ),

              // Expands credit card form
              if (isSelected && methodKey == 'CARD')
                _buildCardForm(),

              // Expands net banking banks list
              if (isSelected && methodKey == 'NET_BANKING')
                _buildNetBankingForm(),

              // NEW: Expands wallets list
              if (isSelected && methodKey == 'WALLET')
                _buildWalletForm(),
            ],
          ),
        ),
      );
    });
  }

  /// Inner Card Form UI when Credit Card is selected
  Widget _buildCardForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 16,
            style: AppTextStyles.bodyMedium,
            decoration: InputDecoration(
              counterText: '',
              hintText: 'Card Number',
              hintStyle: AppTextStyles.hintText,
              prefixIcon: const Icon(Icons.credit_card, size: 20, color: AppColors.textSecondary),
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.lightDivider),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.lightDivider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  maxLength: 5,
                  style: AppTextStyles.bodyMedium,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'MM/YY',
                    hintStyle: AppTextStyles.hintText,
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.lightDivider),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.lightDivider),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  obscureText: true,
                  style: AppTextStyles.bodyMedium,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'CVV',
                    hintStyle: AppTextStyles.hintText,
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.lightDivider),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.lightDivider),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            keyboardType: TextInputType.name,
            style: AppTextStyles.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Cardholder Name',
              hintStyle: AppTextStyles.hintText,
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.lightDivider),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.lightDivider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  /// Inner UI for Net Banking selection
  Widget _buildNetBankingForm() {
    final List<String> popularBanks = [
      'State Bank of India',
      'HDFC Bank',
      'ICICI Bank',
      'Axis Bank',
      'Kotak Mahindra Bank',
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Banks',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: popularBanks.map((bank) {
              return Obx(() {
                final isSelected = controller.selectedBank.value == bank;
                return GestureDetector(
                  onTap: () => controller.selectBank(bank),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.lightDivider,
                      ),
                    ),
                    child: Text(
                      bank,
                      style: AppTextStyles.caption.copyWith(
                        color: isSelected ? AppColors.white : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Inner UI for Wallet selection
  Widget _buildWalletForm() {
    final List<String> wallets = [
      'Amazon Pay',
      'MobiKwik',
      'Freecharge',
      'Airtel Money',
      'JioMoney',
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Supported Wallets',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: wallets.map((wallet) {
              return Obx(() {
                final isSelected = controller.selectedWallet.value == wallet;
                return GestureDetector(
                  onTap: () => controller.selectWallet(wallet),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.lightDivider,
                      ),
                    ),
                    child: Text(
                      wallet,
                      style: AppTextStyles.caption.copyWith(
                        color: isSelected ? AppColors.white : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Helper widget for the fixed bottom bar containing the checkout button
  Widget _buildBottomPayBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightShadow,
            blurRadius: 10,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: SafeArea(
        child: Obx(() {
          final isMethodSelected = controller.selectedPaymentMethod.value.isNotEmpty;

          // Disable if Net Banking is selected but no bank is chosen
          final isNetBankingPending = controller.selectedPaymentMethod.value == 'NET_BANKING' &&
              controller.selectedBank.value.isEmpty;

          // Disable if Wallet is selected but no wallet is chosen
          final isWalletPending = controller.selectedPaymentMethod.value == 'WALLET' &&
              controller.selectedWallet.value.isEmpty;

          final bool canPay = isMethodSelected && !isNetBankingPending && !isWalletPending && !controller.isProcessing.value;

          String btnText = 'Select a Payment Method';
          if (isNetBankingPending) btnText = 'Select a Bank';
          if (isWalletPending) btnText = 'Select a Wallet';

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: canPay ? AppColors.primary : AppColors.lightDisabled,
              foregroundColor: AppColors.white,
              elevation: 0,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: canPay ? controller.processPayment : null,
            child: controller.isProcessing.value
                ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 2.5,
              ),
            )
                : Text(
              canPay ? 'Pay ₹${controller.totalAmount.value.toStringAsFixed(2)}' : btnText,
              style: AppTextStyles.button.copyWith(fontSize: 16),
            ),
          );
        }),
      ),
    );
  }
}