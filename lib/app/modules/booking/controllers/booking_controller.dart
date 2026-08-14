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

  // --- Base (PGK) Counts ---
  var infantCount = 0.obs;
  var childCount = 0.obs;
  var adultCount = 0.obs;

  final infantNotifier = ValueNotifier<int?>(0);
  final childNotifier = ValueNotifier<int?>(0);
  final adultNotifier = ValueNotifier<int?>(0);

  // --- Separate Water Show Counts ---
  var wsInfantCount = 0.obs;
  var wsChildCount = 0.obs;
  var wsAdultCount = 0.obs;

  final wsInfantNotifier = ValueNotifier<int?>(0);
  final wsChildNotifier = ValueNotifier<int?>(0);
  final wsAdultNotifier = ValueNotifier<int?>(0);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  var ticketPrices = <TicketPricing>[].obs;
  var isLoadingPrices = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen to Base Counters
    infantNotifier.addListener(() => infantCount.value = infantNotifier.value ?? 0);
    childNotifier.addListener(() => childCount.value = childNotifier.value ?? 0);
    adultNotifier.addListener(() => adultCount.value = adultNotifier.value ?? 0);

    // Listen to Separate Water Show Counters
    wsInfantNotifier.addListener(() => wsInfantCount.value = wsInfantNotifier.value ?? 0);
    wsChildNotifier.addListener(() => wsChildCount.value = wsChildNotifier.value ?? 0);
    wsAdultNotifier.addListener(() => wsAdultCount.value = wsAdultNotifier.value ?? 0);

    fetchTicketPrices();
  }

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

  String get _selectedTicketType {
    if (selectedAttraction.value == 2) {
      return "combo";
    } else if (selectedAttraction.value == 0) {
      return "pratap gaurav kendra";
    } else {
      return "water laser show";
    }
  }

  String get _selectedNationality => isIndian.value ? "Indian" : "Foreigner";

  TicketPricing? get _currentPricingRule {
    return ticketPrices.firstWhereOrNull((price) =>
    price.ticketType.toLowerCase() == _selectedTicketType.toLowerCase() &&
        price.nationality.toLowerCase() == _selectedNationality.toLowerCase()
    );
  }

  TicketPricing? get _waterShowPricingRule {
    return ticketPrices.firstWhereOrNull((price) =>
    price.ticketType.toLowerCase() == "water laser show" &&
        price.nationality.toLowerCase() == _selectedNationality.toLowerCase()
    );
  }

  // --- Base Prices ---
  double get currentAdultPrice {
    return _currentPricingRule?.adultRate.toDouble() ?? 0.0;
  }

  double get currentChildPrice {
    return _currentPricingRule?.kidRate.toDouble() ?? 0.0;
  }

  // --- Water Show Add-On Prices ---
  double get waterShowAdultPrice {
    return _waterShowPricingRule?.adultRate.toDouble() ?? 0.0;
  }

  double get waterShowChildPrice {
    return _waterShowPricingRule?.kidRate.toDouble() ?? 0.0;
  }

  // --- Exact Calculation for Independent Counters ---
  double get totalAmount {
    // 1. Calculate base total using PGK counts
    double baseTotal = (adultCount.value * currentAdultPrice) + (childCount.value * currentChildPrice);

    // 2. Add Water Show total using the totally separate WS counts
    if (selectedAttraction.value == 0 && isWaterShowAdded.value) {
      double wsTotal = (wsAdultCount.value * waterShowAdultPrice) + (wsChildCount.value * waterShowChildPrice);
      return baseTotal + wsTotal;
    }

    return baseTotal;
  }

  void pickDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFFE75B22)),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      if (!context.mounted) return;
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate.value),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xFFE75B22)),
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
    if (totalAmount == 0) {
      CustomSnackbar.showSnackbar(
        'Action Required',
        'Please select at least one ticket to proceed.',
        AppColors.error,
      );
      return;
    }

    String ticketTypeString = 'P.G.K.';
    if (selectedAttraction.value == 2) {
      ticketTypeString = 'Combo';
    } else if (selectedAttraction.value == 0 && isWaterShowAdded.value) {
      ticketTypeString = 'PGK + L.S.W.';
    } else if (selectedAttraction.value == 1) {
      ticketTypeString = 'L.S.W.';
    }

    try {
      final userData = StorageService.to.getUser();
      isLoaded.value = true;

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

      final rawResponse = await TicketBooking.ticketBooking(data: bookingPayload);

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
    wsInfantNotifier.dispose();
    wsChildNotifier.dispose();
    wsAdultNotifier.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}