class BookingListResponse {
  final bool success;
  final String status;
  final String message;
  final List<BookingItem> data;
  final PaginationData pagination;

  BookingListResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory BookingListResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return BookingListResponse.empty();

    return BookingListResponse(
      success: json['success'] ?? false,
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => BookingItem.fromJson(item))
          .toList() ??
          [],
      pagination: json['pagination'] != null
          ? PaginationData.fromJson(json['pagination'])
          : PaginationData.empty(),
    );
  }

  factory BookingListResponse.empty() {
    return BookingListResponse(
      success: false,
      status: '',
      message: '',
      data: [],
      pagination: PaginationData.empty(),
    );
  }
}

class BookingItem {
  final int bookingId;
  final int userId;
  final String ticketType;
  final String time;
  final String date;
  final String nationality;
  final int infantsCount;
  final int kidsCount;
  final int adultsCount;
  final num totalRs;
  final String paymentStatus;
  final String createdAt;
  final String updatedAt;
  final BookingUser? user;
  final PaymentData? payment;

  BookingItem({
    required this.bookingId,
    required this.userId,
    required this.ticketType,
    required this.time,
    required this.date,
    required this.nationality,
    required this.infantsCount,
    required this.kidsCount,
    required this.adultsCount,
    required this.totalRs,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    this.user,
    this.payment,
  });

  factory BookingItem.fromJson(Map<String, dynamic> json) {
    return BookingItem(
      bookingId: json['booking_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      ticketType: json['ticket_type'] ?? '',
      time: json['time'] ?? '',
      date: json['date'] ?? '',
      nationality: json['nationality'] ?? '',
      infantsCount: json['infants_count'] ?? 0,
      kidsCount: json['kids_count'] ?? 0,
      adultsCount: json['adults_count'] ?? 0,
      totalRs: json['total_rs'] ?? 0,
      paymentStatus: json['payment_status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      user: json['user'] != null ? BookingUser.fromJson(json['user']) : null,
      payment: json['payment'] != null ? PaymentData.fromJson(json['payment']) : null,
    );
  }
}

class BookingUser {
  final int id;
  final String name;
  final String email;
  final String mobile;

  BookingUser({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory BookingUser.fromJson(Map<String, dynamic> json) {
    return BookingUser(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
    );
  }
}

class PaymentData {
  final int id;
  final int ticketDataId;
  final String gateway;
  final String gatewayOrderId;
  final String gatewayPaymentId;
  final String gatewaySignature;
  final String amount;
  final String currency;
  final String paymentMethod;
  final String status;
  final String? failureReason;
  final String? gatewayResponse;
  final String? paidAt;
  final String createdAt;
  final String updatedAt;

  PaymentData({
    required this.id,
    required this.ticketDataId,
    required this.gateway,
    required this.gatewayOrderId,
    required this.gatewayPaymentId,
    required this.gatewaySignature,
    required this.amount,
    required this.currency,
    required this.paymentMethod,
    required this.status,
    this.failureReason,
    this.gatewayResponse,
    this.paidAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      id: json['id'] ?? 0,
      ticketDataId: json['ticket_data_id'] ?? 0,
      gateway: json['gateway'] ?? '',
      gatewayOrderId: json['gateway_order_id'] ?? '',
      gatewayPaymentId: json['gateway_payment_id'] ?? '',
      gatewaySignature: json['gateway_signature'] ?? '',
      amount: json['amount'] ?? '0.00',
      currency: json['currency'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
      status: json['status'] ?? '',
      failureReason: json['failure_reason'],
      gatewayResponse: json['gateway_response'],
      paidAt: json['paid_at'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

class PaginationData {
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;

  PaginationData({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) {
    return PaginationData(
      currentPage: json['current_page'] ?? 1,
      perPage: json['per_page'] ?? 15,
      total: json['total'] ?? 0,
      lastPage: json['last_page'] ?? 1,
    );
  }

  /// Creates a default empty pagination state
  factory PaginationData.empty() {
    return PaginationData(
      currentPage: 1,
      perPage: 15,
      total: 0,
      lastPage: 1,
    );
  }
}