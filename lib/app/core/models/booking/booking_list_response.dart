// 1. Payment Status Enum
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

// 2. Root Response Model (Updated for Lists & Pagination)
class BookingListResponse {
  final bool success;
  final String status;
  final String message;
  final List<BookedTicketDataModel> data;
  final PaginationModel? pagination;

  BookingListResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
    this.pagination,
  });

  factory BookingListResponse.fromJson(Map<String, dynamic> json) {
    return BookingListResponse(
      success: json['success'] as bool? ?? false,
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? (json['data'] as List).map((i) => BookedTicketDataModel.fromJson(i)).toList()
          : [],
      pagination: json['pagination'] != null
          ? PaginationModel.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }
}

// 3. Pagination Model
class PaginationModel {
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;

  PaginationModel({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['current_page'] as int? ?? 1,
      perPage: json['per_page'] as int? ?? 10,
      total: json['total'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'per_page': perPage,
      'total': total,
      'last_page': lastPage,
    };
  }
}

// 4. Booking Data Model
class BookedTicketDataModel {
  final int bookingId;
  final int userId;
  final String ticketType;
  final String time;
  final String date;
  final String nationality;
  final int infantsCount;
  final int kidsCount;
  final int adultsCount;
  final int totalPassengers;
  final double infantsTotalRs;
  final double kidsTotalRs;
  final double adultsTotalRs;
  final double calculatedTotalRs;
  final PassengerBreakdownModel? passengerBreakdown;
  final PriceBreakdownModel? priceBreakdown;
  final double totalRs;
  final PaymentStatus paymentStatus;
  final String paymentLinkId;
  final String paymentUrl;
  final String createdAt;
  final String updatedAt;
  final UserBookingModel user;
  final PaymentResponseModel payment;

  BookedTicketDataModel({
    required this.bookingId,
    required this.userId,
    required this.ticketType,
    required this.time,
    required this.date,
    required this.nationality,
    required this.infantsCount,
    required this.kidsCount,
    required this.adultsCount,
    required this.totalPassengers,
    required this.infantsTotalRs,
    required this.kidsTotalRs,
    required this.adultsTotalRs,
    required this.calculatedTotalRs,
    this.passengerBreakdown,
    this.priceBreakdown,
    required this.totalRs,
    required this.paymentStatus,
    required this.paymentLinkId,
    required this.paymentUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.payment,
  });

  factory BookedTicketDataModel.fromJson(Map<String, dynamic> json) {
    return BookedTicketDataModel(
      bookingId: json['booking_id'] as int? ?? 0,
      userId: json['user_id'] as int? ?? 0,
      ticketType: json['ticket_type'] as String? ?? '',
      time: json['time'] as String? ?? '',
      date: json['date'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      infantsCount: json['infants_count'] as int? ?? 0,
      kidsCount: json['kids_count'] as int? ?? 0,
      adultsCount: json['adults_count'] as int? ?? 0,
      totalPassengers: json['total_passengers'] as int? ?? 0,
      infantsTotalRs: (json['infants_total_rs'] as num?)?.toDouble() ?? 0.0,
      kidsTotalRs: (json['kids_total_rs'] as num?)?.toDouble() ?? 0.0,
      adultsTotalRs: (json['adults_total_rs'] as num?)?.toDouble() ?? 0.0,
      calculatedTotalRs: (json['calculated_total_rs'] as num?)?.toDouble() ?? 0.0,
      passengerBreakdown: json['passenger_breakdown'] != null
          ? PassengerBreakdownModel.fromJson(json['passenger_breakdown'])
          : null,
      priceBreakdown: json['price_breakdown'] != null
          ? PriceBreakdownModel.fromJson(json['price_breakdown'])
          : null,
      totalRs: double.tryParse(json['total_rs']?.toString() ?? '0') ?? 0.0,
      paymentStatus: PaymentStatus.fromString(json['payment_status'] as String?),
      paymentLinkId: json['payment_link_id'] as String? ?? '',
      paymentUrl: json['payment_url'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      user: json['user'] != null
          ? UserBookingModel.fromJson(json['user'] as Map<String, dynamic>)
          : UserBookingModel.empty(),
      payment: json['payment'] != null
          ? PaymentResponseModel.fromJson(json['payment'] as Map<String, dynamic>)
          : PaymentResponseModel.empty(),
    );
  }

factory BookedTicketDataModel.empty() {
    return BookedTicketDataModel(
      userId: 0,
      ticketType: '',
      time: '',
      date: '',
      nationality: '',
      infantsCount: 0,
      kidsCount: 0,
      adultsCount: 0,
      totalRs: 0.0,
      updatedAt: '',
      createdAt: '',
      passengerBreakdown: null,
      priceBreakdown: null,
      user: UserBookingModel.empty(),
      payment: PaymentResponseModel.empty(), bookingId: 0, totalPassengers: 0, infantsTotalRs: 0, kidsTotalRs: 0, adultsTotalRs: 0, calculatedTotalRs: 0, paymentStatus: PaymentStatus.unknown, paymentLinkId: '', paymentUrl: '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'user_id': userId,
      'ticket_type': ticketType,
      'time': time,
      'date': date,
      'nationality': nationality,
      'infants_count': infantsCount,
      'kids_count': kidsCount,
      'adults_count': adultsCount,
      'total_passengers': totalPassengers,
      'infants_total_rs': infantsTotalRs,
      'kids_total_rs': kidsTotalRs,
      'adults_total_rs': adultsTotalRs,
      'calculated_total_rs': calculatedTotalRs,
      'passenger_breakdown': passengerBreakdown?.toJson(),
      'price_breakdown': priceBreakdown?.toJson(),
      'total_rs': totalRs.toStringAsFixed(2),
      'payment_status': paymentStatus.value,
      'payment_link_id': paymentLinkId,
      'payment_url': paymentUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user': user.toJson(),
      'payment': payment.toJson(),
    };
  }
}

// 5. Passenger Breakdown Model
class PassengerBreakdownModel {
  final int infants;
  final int kids;
  final int adults;
  final int total;

  PassengerBreakdownModel({
    required this.infants,
    required this.kids,
    required this.adults,
    required this.total,
  });

  factory PassengerBreakdownModel.fromJson(Map<String, dynamic> json) {
    return PassengerBreakdownModel(
      infants: json['infants'] as int? ?? 0,
      kids: json['kids'] as int? ?? 0,
      adults: json['adults'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'infants': infants,
      'kids': kids,
      'adults': adults,
      'total': total,
    };
  }
}

// 6. Price Breakdown Models
class PriceBreakdownModel {
  final PriceDetailModel? infants;
  final PriceDetailModel? kids;
  final PriceDetailModel? adults;
  final double totalRs;

  PriceBreakdownModel({
    this.infants,
    this.kids,
    this.adults,
    required this.totalRs,
  });

  factory PriceBreakdownModel.fromJson(Map<String, dynamic> json) {
    return PriceBreakdownModel(
      infants: json['infants'] != null ? PriceDetailModel.fromJson(json['infants']) : null,
      kids: json['kids'] != null ? PriceDetailModel.fromJson(json['kids']) : null,
      adults: json['adults'] != null ? PriceDetailModel.fromJson(json['adults']) : null,
      totalRs: (json['total_rs'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'infants': infants?.toJson(),
      'kids': kids?.toJson(),
      'adults': adults?.toJson(),
      'total_rs': totalRs,
    };
  }
}

class PriceDetailModel {
  final int count;
  final double rate;
  final double totalRs;

  PriceDetailModel({
    required this.count,
    required this.rate,
    required this.totalRs,
  });

  factory PriceDetailModel.fromJson(Map<String, dynamic> json) {
    return PriceDetailModel(
      count: json['count'] as int? ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      totalRs: (json['total_rs'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rate': rate,
      'total_rs': totalRs,
    };
  }
}

// 7. User Model
class UserBookingModel {
  final int id;
  final String name;
  final String email;
  final String mobile;

  UserBookingModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory UserBookingModel.fromJson(Map<String, dynamic> json) {
    return UserBookingModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
    );
  }

  factory UserBookingModel.empty() {
    return UserBookingModel(id: 0, name: '', email: '', mobile: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
    };
  }
}

// 8. Payment Model
class PaymentResponseModel {
  final int id;
  final int ticketDataId;
  final String gateway;
  final String paymentLinkId;
  final String paymentLinkUrl;
  final String referenceId;
  final double amount;
  final String currency;
  final PaymentStatus status;
  final String? gatewayOrderId;
  final String? gatewayPaymentId;
  final String? paymentMethod;
  final String? failureReason;
  final Map<String, dynamic>? gatewayResponse;
  final String? paidAt;
  final String? createdAt;
  final String? updatedAt;

  PaymentResponseModel({
    required this.id,
    required this.ticketDataId,
    required this.gateway,
    required this.paymentLinkId,
    required this.paymentLinkUrl,
    required this.referenceId,
    required this.amount,
    required this.currency,
    required this.status,
    this.gatewayOrderId,
    this.gatewayPaymentId,
    this.paymentMethod,
    this.failureReason,
    this.gatewayResponse,
    this.paidAt,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      id: json['id'] as int? ?? 0,
      ticketDataId: json['ticket_data_id'] as int? ?? 0,
      gateway: json['gateway'] as String? ?? '',
      paymentLinkId: json['payment_link_id'] as String? ?? '',
      paymentLinkUrl: json['payment_link_url'] as String? ?? '',
      referenceId: json['reference_id'] as String? ?? '',
      amount: double.tryParse(json['amount']?.toString() ?? '0') ?? 0.0,
      currency: json['currency'] as String? ?? '',
      status: PaymentStatus.fromString(json['status'] as String?),
      gatewayOrderId: json['gateway_order_id'] as String?,
      gatewayPaymentId: json['gateway_payment_id'] as String?,
      paymentMethod: json['payment_method'] as String?,
      failureReason: json['failure_reason'] as String?,
      gatewayResponse: json['gateway_response'] as Map<String, dynamic>?,
      paidAt: json['paid_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  factory PaymentResponseModel.empty() {
    return PaymentResponseModel(
      id: 0,
      ticketDataId: 0,
      gateway: '',
      paymentLinkId: '',
      paymentLinkUrl: '',
      referenceId: '',
      amount: 0.0,
      currency: '',
      status: PaymentStatus.unknown,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticket_data_id': ticketDataId,
      'gateway': gateway,
      'payment_link_id': paymentLinkId,
      'payment_link_url': paymentLinkUrl,
      'reference_id': referenceId,
      'amount': amount.toStringAsFixed(2),
      'currency': currency,
      'status': status.value,
      'gateway_order_id': gatewayOrderId,
      'gateway_payment_id': gatewayPaymentId,
      'payment_method': paymentMethod,
      'failure_reason': failureReason,
      'gateway_response': gatewayResponse,
      'paid_at': paidAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}