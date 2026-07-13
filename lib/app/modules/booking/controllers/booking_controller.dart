import 'package:intl/intl.dart';
import 'package:pgk_ticket_app/app/core/utils/api/booking_api/ticket_booking_api.dart';
import '../../../common/constant/app_imports.dart';
import '../../../core/models/booking/booking_payload_model.dart';
import '../../../core/models/booking/ticket_prices_master_response.dart';


class BookingController extends GetxController {
  var selectedAttraction = 0.obs;
  var isWaterShowAdded = false.obs;
  RxBool isLoaded = false.obs;
  var isIndian = true.obs;
  var selectedDate = DateTime.now().obs;

  var infantCount = 0.obs;
  var childCount = 0.obs;
  var adultCount = 0.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final infantNotifier = ValueNotifier<int?>(0);
  final childNotifier = ValueNotifier<int?>(0);
  final adultNotifier = ValueNotifier<int?>(0);

  // --- NEW: Dynamic Pricing State ---
  var ticketPrices = <TicketPricing>[].obs;
  var isLoadingPrices = false.obs;

  @override
  void onInit() {
    super.onInit();

    infantNotifier.addListener(() => infantCount.value = infantNotifier.value ?? 0);
    childNotifier.addListener(() => childCount.value = childNotifier.value ?? 0);
    adultNotifier.addListener(() => adultCount.value = adultNotifier.value ?? 0);

    // Fetch prices as soon as the controller initializes
    fetchTicketPrices();
  }

  // --- NEW: Fetch Prices from API ---
  Future<void> fetchTicketPrices() async {
    try {
      isLoadingPrices.value = true;
      final response = await TicketBooking.ticketPriceMaster();

      if (response.success) {
        ticketPrices.value = response.data;
      } else {
        debugPrint('Failed to fetch prices: ${response.message}');
      }
    } catch (e) {
      debugPrint('Error fetching prices: $e');
    } finally {
      isLoadingPrices.value = false;
    }
  }

  // --- NEW: Helpers to map UI selection to API strings ---
  String get _selectedTicketType {
    if (selectedAttraction.value == 2 || (selectedAttraction.value == 0 && isWaterShowAdded.value)) {
      return "combo";
    } else if (selectedAttraction.value == 0) {
      return "pratap gaurav kendra";
    } else {
      return "water laser show";
    }
  }

  String get _selectedNationality => isIndian.value ? "Indian" : "Foreigner";

  // Finds the specific pricing rule based on current selections
  TicketPricing? get _currentPricingRule {
    return ticketPrices.firstWhereOrNull((price) =>
    price.ticketType == _selectedTicketType &&
        price.nationality == _selectedNationality
    );
  }

  // --- UPDATED: Dynamic Price Getters ---
  double get currentAdultPrice {
    return _currentPricingRule?.adultRate.toDouble() ?? 0.0;
  }

  double get currentChildPrice {
    return _currentPricingRule?.kidRate.toDouble() ?? 0.0;
  }

  // Total Calculation
  double get totalAmount {
    return (adultCount.value * currentAdultPrice) + (childCount.value * currentChildPrice);
  }

  void pickDateTime(BuildContext context) async {
    // 1. Pick the Date first
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFE75B22), // AppColors.primary
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate.value),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFFE75B22), // AppColors.primary
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        selectedDate.value = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }
  }

  Future<void> submitBooking() async {
    // 1. Validate if tickets are selected
    if (totalAmount == 0) {
      CustomSnackbar.showSnackbar(
        'Action Required',
        'Please select at least one ticket to proceed.',
        AppColors.error,
      );
      return;
    }

    // 2. Determine the ticket type string for the booking payload
    String ticketTypeString = 'P.G.K.';
    if (selectedAttraction.value == 2 || (selectedAttraction.value == 0 && isWaterShowAdded.value)) {
      ticketTypeString = 'Combo';
    } else if (selectedAttraction.value == 1) {
      ticketTypeString = 'L.S.W.';
    }

    try {
      final userData = StorageService.to.getUser();
      debugPrint('User Data: $userData');
      isLoaded.value = true;
      // 3. Prepare payload
      TicketBookingModel bookingPayload = TicketBookingModel(
        userId: userData?.id ?? 0,
        ticketType: ticketTypeString,
        time: DateFormat('h:mm a').format(selectedDate.value),
        date: DateFormat('yyyy-MM-dd').format(selectedDate.value),
        nationality: _selectedNationality,
        adultsCount: adultCount.value,
        kidsCount: childCount.value,
        infantsCount: infantCount.value,
        totalRs: totalAmount,
      );

      // 4. Call API
      final rawResponse = await TicketBooking.ticketBooking(data: bookingPayload);

      // 5. Check success and navigate using the paymentUrl
      if (rawResponse.success && rawResponse.paymentUrl.isNotEmpty) {
        Get.toNamed(
          Routes.PAYMENT,
          arguments: {
            'paymentUrl': rawResponse.paymentUrl,
            'bookingId': rawResponse.bookingId,
            'amount': totalAmount,
            'customerName': userData?.name ?? "",
            'customerEmail': emailController.text.trim(),
            'customerPhone': userData?.mobile ?? "",
            'bookingDate': selectedDate.value.toString().split(' ')[0],
            'tickets': rawResponse.data.priceBreakdown,
          },
        );
      } else {
        isLoaded.value = false;
        CustomSnackbar.showSnackbar(
          'Booking Failed Error',
          rawResponse.message,
          AppColors.error,
        );
      }
    } catch (e) {
      debugPrint('Booking Error: $e');
      isLoaded.value = false;
      CustomSnackbar.showSnackbar(
        'Booking Failed',
        'Could not process your booking. Please try again.',
        AppColors.error,
      );
    }
  }

  @override
  void onClose() {
    infantNotifier.dispose();
    childNotifier.dispose();
    adultNotifier.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}