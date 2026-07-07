import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pgk_ticket_app/app/core/utils/api/booking_api/ticket_booking_api.dart';

import '../../../core/models/booking/booking_payload_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/storage_services.dart';

class BookingController extends GetxController {

  var selectedAttraction = 0.obs;
  var isWaterShowAdded = false.obs;

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

  @override
  void onInit() {
    super.onInit();

    infantNotifier.addListener(() => infantCount.value = infantNotifier.value ?? 0);
    childNotifier.addListener(() => childCount.value = childNotifier.value ?? 0);
    adultNotifier.addListener(() => adultCount.value = adultNotifier.value ?? 0);
  }

  double get currentAdultPrice {
    if (selectedAttraction.value == 2 || (selectedAttraction.value == 0 && isWaterShowAdded.value)) {
      return 200.0;
    } else if (selectedAttraction.value == 0) {
      return isIndian.value ? 160.0 : 460.0;
    } else {
      return 100.0;
    }
  }

  double get currentChildPrice {
    if (selectedAttraction.value == 2 || (selectedAttraction.value == 0 && isWaterShowAdded.value)) {
      return 150.0;
    } else if (selectedAttraction.value == 0) {
      return isIndian.value ? 110.0 : 260.0;
    } else {
      return 50.0;
    }
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

  /// Helper method to create the ticket list for the receipt
  List<Map<String, dynamic>> _generateTicketBreakdown() {
    List<Map<String, dynamic>> tickets = [];
    String prefix = '';

    if (selectedAttraction.value == 2 || (selectedAttraction.value == 0 && isWaterShowAdded.value)) {
      prefix = 'Combo';
    } else if (selectedAttraction.value == 0) {
      prefix = 'P.G.K.';
    } else {
      prefix = 'L.S.W.';
    }

    // Add Adult Tickets if > 0
    if (adultCount.value > 0) {
      tickets.add({
        'name': '$prefix Adult',
        'price': currentAdultPrice,
        'qty': adultCount.value,
        'total': currentAdultPrice * adultCount.value,
      });
    }

    // Add Child Tickets if > 0
    if (childCount.value > 0) {
      tickets.add({
        'name': '$prefix Kids',
        'price': currentChildPrice,
        'qty': childCount.value,
        'total': currentChildPrice * childCount.value,
      });
    }

    // Add Infant Tickets if > 0 (Free)
    if (infantCount.value > 0) {
      tickets.add({
        'name': '$prefix Infant',
        'price': 0.00,
        'qty': infantCount.value,
        'total': 0.00,
      });
    }

    return tickets;
  }

  Future<void> submitBooking() async {
    // 1. Validate if tickets are selected
    if (totalAmount == 0) {
      Get.snackbar(
        'Action Required',
        'Please select at least one ticket to proceed.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Determine the ticket type string
    String ticketTypeString = 'P.G.K.';
    if (selectedAttraction.value == 2 || (selectedAttraction.value == 0 && isWaterShowAdded.value)) {
      ticketTypeString = 'Combo';
    } else if (selectedAttraction.value == 1) {
      ticketTypeString = 'L.S.W.';
    }

    try {
      final userData = StorageService.to.getUser();
      debugPrint('User Data: $userData');

      TicketBookingModel bookingPayload = TicketBookingModel(
        userId: userData?.id??0,
        ticketType: ticketTypeString,
        time: DateFormat('h:mm a').format(selectedDate.value),
        date: DateFormat('yyyy-MM-dd').format(selectedDate.value),
        nationality: isIndian.value ? "Indian" : "Foreigner",
        adultsCount: adultCount.value,
        kidsCount: childCount.value,
        infantsCount: infantCount.value,
        totalRs: totalAmount,
      );


      final rawResponse = await TicketBooking.ticketBooking(data: bookingPayload);
      if (rawResponse.success) {
        // 5. Package all data and send it to the Payment Screen
        Get.toNamed(
          Routes.PAYMENT,
          arguments: {
            'amount': totalAmount,
            'customerName': userData?.name ?? "",
            'customerEmail': emailController.text.trim(),
            'customerPhone': userData?.mobile ?? "",
            'bookingDate': selectedDate.value.toString().split(' ')[0],
            'tickets': _generateTicketBreakdown(),
          },
        );
      }
    } catch (e) {
      Get.snackbar(
        'Booking Failed',
        'Could not process your booking. Please try again.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
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