// 1. Payment Status Enum
import 'booking_list_response.dart';

enum PaymentStatus {
  pending('pending'),
  success('success'),
  failed('failed'),
  cancelled('cancelled'),
  refunded('refunded'),
  unknown('unknown');

  final String value;
  const PaymentStatus(this.value);

  factory PaymentStatus.fromString(String? statusString) {
    return PaymentStatus.values.firstWhere(
          (e) => e.value == statusString?.toLowerCase(),
      orElse: () => PaymentStatus.unknown,
    );
  }
}

// 2. Root Response Model
class TicketBookingResponseModel {
  final bool success;
  final String status;
  final String message;
  final int bookingId;
  final String paymentStatus;
  final String paymentLinkId;
  final String paymentUrl;
  final BookedTicketDataModel data;

  TicketBookingResponseModel({
    required this.success,
    required this.status,
    required this.message,
    required this.bookingId,
    required this.paymentStatus,
    required this.paymentLinkId,
    required this.paymentUrl,
    required this.data,
  });

  factory TicketBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return TicketBookingResponseModel(
      success: json['success'] as bool? ?? false,
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      bookingId: json['booking_id'] as int? ?? 0,
      paymentStatus: json['payment_status'] as String? ?? '',
      paymentLinkId: json['payment_link_id'] as String? ?? '',
      paymentUrl: json['payment_url'] as String? ?? '',
      data: json['data'] != null
          ? BookedTicketDataModel.fromJson(json['data'] as Map<String, dynamic>)
          : BookedTicketDataModel.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'booking_id': bookingId,
      'payment_status': paymentStatus,
      'payment_link_id': paymentLinkId,
      'payment_url': paymentUrl,
      'data': data.toJson(),
    };
  }
}

// // 3. Booking Data Model
// class BookedTicketDataModel {
//   final int userId;
//   final String ticketType;
//   final String time;
//   final String date;
//   final String nationality;
//   final int infantsCount;
//   final int kidsCount;
//   final int adultsCount;
//   final double totalRs;
//   final String updatedAt;
//   final String createdAt;
//   final int id;
//   final UserBookingModel user;
//   final PaymentResponseModel payment;
//
//   BookedTicketDataModel({
//     required this.userId,
//     required this.ticketType,
//     required this.time,
//     required this.date,
//     required this.nationality,
//     required this.infantsCount,
//     required this.kidsCount,
//     required this.adultsCount,
//     required this.totalRs,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//     required this.user,
//     required this.payment,
//   });
//
//   factory BookedTicketDataModel.fromJson(Map<String, dynamic> json) {
//     return BookedTicketDataModel(
//       userId: json['user_id'] as int? ?? 0,
//       ticketType: json['ticket_type'] as String? ?? '',
//       time: json['time'] as String? ?? '',
//       date: json['date'] as String? ?? '',
//       nationality: json['nationality'] as String? ?? '',
//       infantsCount: json['infants_count'] as int? ?? 0,
//       kidsCount: json['kids_count'] as int? ?? 0,
//       adultsCount: json['adults_count'] as int? ?? 0,
//       totalRs: (json['total_rs'] as num?)?.toDouble() ?? 0.0,
//       updatedAt: json['updated_at'] as String? ?? '',
//       createdAt: json['created_at'] as String? ?? '',
//       id: json['id'] as int? ?? 0,
//       user: json['user'] != null
//           ? UserBookingModel.fromJson(json['user'] as Map<String, dynamic>)
//           : UserBookingModel.empty(),
//       payment: json['payment'] != null
//           ? PaymentResponseModel.fromJson(json['payment'] as Map<String, dynamic>)
//           : PaymentResponseModel.empty(),
//     );
//   }
//
//   factory BookedTicketDataModel.empty() {
//     return BookedTicketDataModel(
//       userId: 0,
//       ticketType: '',
//       time: '',
//       date: '',
//       nationality: '',
//       infantsCount: 0,
//       kidsCount: 0,
//       adultsCount: 0,
//       totalRs: 0.0,
//       updatedAt: '',
//       createdAt: '',
//       id: 0,
//       user: UserBookingModel.empty(),
//       payment: PaymentResponseModel.empty(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'user_id': userId,
//       'ticket_type': ticketType,
//       'time': time,
//       'date': date,
//       'nationality': nationality,
//       'infants_count': infantsCount,
//       'kids_count': kidsCount,
//       'adults_count': adultsCount,
//       'total_rs': totalRs,
//       'updated_at': updatedAt,
//       'created_at': createdAt,
//       'id': id,
//       'user': user.toJson(),
//       'payment': payment.toJson(),
//     };
//   }
// }
//
// // 4. User Model
// class UserBookingModel {
//   final int id;
//   final String name;
//   final String email;
//   final String mobile;
//
//   UserBookingModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.mobile,
//   });
//
//   factory UserBookingModel.fromJson(Map<String, dynamic> json) {
//     return UserBookingModel(
//       id: json['id'] as int? ?? 0,
//       name: json['name'] as String? ?? '',
//       email: json['email'] as String? ?? '',
//       mobile: json['mobile'] as String? ?? '',
//     );
//   }
//
//   factory UserBookingModel.empty() {
//     return UserBookingModel(id: 0, name: '', email: '', mobile: '');
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'mobile': mobile,
//     };
//   }
// }
//
// // 5. Payment Model
// class PaymentResponseModel {
//   final int id;
//   final int ticketDataId;
//   final String gateway;
//   final String paymentLinkId;
//   final String paymentLinkUrl;
//   final String referenceId;
//   final double amount;
//   final String currency;
//   final PaymentStatus status;
//   // NOTE: Nullable fields are used below since these are often completely null until payment finishes
//   final String? gatewayOrderId;
//   final String? gatewayPaymentId;
//   final String? paymentMethod;
//   final String? failureReason;
//
//   PaymentResponseModel({
//     required this.id,
//     required this.ticketDataId,
//     required this.gateway,
//     required this.paymentLinkId,
//     required this.paymentLinkUrl,
//     required this.referenceId,
//     required this.amount,
//     required this.currency,
//     required this.status,
//     this.gatewayOrderId,
//     this.gatewayPaymentId,
//     this.paymentMethod,
//     this.failureReason,
//   });
//
//   factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
//     return PaymentResponseModel(
//       id: json['id'] as int? ?? 0,
//       ticketDataId: json['ticket_data_id'] as int? ?? 0,
//       gateway: json['gateway'] as String? ?? '',
//       paymentLinkId: json['payment_link_id'] as String? ?? '',
//       paymentLinkUrl: json['payment_link_url'] as String? ?? '',
//       referenceId: json['reference_id'] as String? ?? '',
//       amount: double.tryParse(json['amount']?.toString() ?? '0') ?? 0.0,
//       currency: json['currency'] as String? ?? '',
//       status: PaymentStatus.fromString(json['status'] as String?),
//       gatewayOrderId: json['gateway_order_id'] as String?,
//       gatewayPaymentId: json['gateway_payment_id'] as String?,
//       paymentMethod: json['payment_method'] as String?,
//       failureReason: json['failure_reason'] as String?,
//     );
//   }
//
//   factory PaymentResponseModel.empty() {
//     return PaymentResponseModel(
//       id: 0,
//       ticketDataId: 0,
//       gateway: '',
//       paymentLinkId: '',
//       paymentLinkUrl: '',
//       referenceId: '',
//       amount: 0.0,
//       currency: '',
//       status: PaymentStatus.unknown,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'ticket_data_id': ticketDataId,
//       'gateway': gateway,
//       'payment_link_id': paymentLinkId,
//       'payment_link_url': paymentLinkUrl,
//       'reference_id': referenceId,
//       'amount': amount.toStringAsFixed(2),
//       'currency': currency,
//       'status': status.value,
//       'gateway_order_id': gatewayOrderId,
//       'gateway_payment_id': gatewayPaymentId,
//       'payment_method': paymentMethod,
//       'failure_reason': failureReason,
//     };
//   }
// }