// 1. Define the restricted values using an enhanced enum
enum PaymentStatus {
  pending('pending'),
  success('success'),
  failed('failed'),
  cancelled('cancelled'),
  refunded('refunded'),
  unknown('unknown'); // Safe fallback for unexpected API changes

  final String value;
  const PaymentStatus(this.value);

  // Helper method to safely parse the string from JSON
  factory PaymentStatus.fromString(String? statusString) {
    return PaymentStatus.values.firstWhere(
          (e) => e.value == statusString?.toLowerCase(),
      orElse: () => PaymentStatus.unknown,
    );
  }
}

// 2. The Root Response Model
class PaymentHistoryResponse {
  final bool? success;
  final String? status;
  final String? message;
  final List<PaymentData>? data;
  final Pagination? pagination;

  PaymentHistoryResponse({
    this.success,
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory PaymentHistoryResponse.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryResponse(
      success: json['success'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List).map((i) => PaymentData.fromJson(i)).toList()
          : null,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': data?.map((i) => i.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }
}

// 3. The main Payment Data Model
class PaymentData {
  final int? paymentId;
  final int? bookingId;
  final int? userId;
  final String? gateway;
  final String? gatewayOrderId;
  final String? gatewayPaymentId;
  final String? amount; // Changed to String based on JSON ("860.00")
  final String? currency;
  final String? paymentMethod;
  final PaymentStatus status;
  final String? failureReason;
  final DateTime? paidAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Booking? booking;
  final User? user;

  PaymentData({
    this.paymentId,
    this.bookingId,
    this.userId,
    this.gateway,
    this.gatewayOrderId,
    this.gatewayPaymentId,
    this.amount,
    this.currency,
    this.paymentMethod,
    this.status = PaymentStatus.unknown,
    this.failureReason,
    this.paidAt,
    this.createdAt,
    this.updatedAt,
    this.booking,
    this.user,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      paymentId: json['payment_id'],
      bookingId: json['booking_id'],
      userId: json['user_id'],
      gateway: json['gateway'],
      gatewayOrderId: json['gateway_order_id'],
      gatewayPaymentId: json['gateway_payment_id'],
      amount: json['amount'],
      currency: json['currency'],
      paymentMethod: json['payment_method'],
      status: PaymentStatus.fromString(json['status']),
      failureReason: json['failure_reason'],
      paidAt: json['paid_at'] != null ? DateTime.parse(json['paid_at']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      booking: json['booking'] != null ? Booking.fromJson(json['booking']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_id': paymentId,
      'booking_id': bookingId,
      'user_id': userId,
      'gateway': gateway,
      'gateway_order_id': gatewayOrderId,
      'gateway_payment_id': gatewayPaymentId,
      'amount': amount,
      'currency': currency,
      'payment_method': paymentMethod,
      'status': status.value,
      'failure_reason': failureReason,
      'paid_at': paidAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'booking': booking?.toJson(),
      'user': user?.toJson(),
    };
  }
}

// 4. Nested Booking Model
class Booking {
  final int? id;
  final int? userId;
  final String? ticketType;
  final String? time;
  final String? date;
  final String? nationality;
  final int? infantsCount;
  final int? kidsCount;
  final int? adultsCount;
  final String? totalRs;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  Booking({
    this.id,
    this.userId,
    this.ticketType,
    this.time,
    this.date,
    this.nationality,
    this.infantsCount,
    this.kidsCount,
    this.adultsCount,
    this.totalRs,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['user_id'],
      ticketType: json['ticket_type'],
      time: json['time'],
      date: json['date'],
      nationality: json['nationality'],
      infantsCount: json['infants_count'],
      kidsCount: json['kids_count'],
      adultsCount: json['adults_count'],
      totalRs: json['total_rs'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'ticket_type': ticketType,
      'time': time,
      'date': date,
      'nationality': nationality,
      'infants_count': infantsCount,
      'kids_count': kidsCount,
      'adults_count': adultsCount,
      'total_rs': totalRs,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'user': user?.toJson(),
    };
  }
}

// 5. User Model
class User {
  final int? id;
  final String? name;
  final String? email;
  final String? mobile;

  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
    );
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

// 6. Pagination Metadata
class Pagination {
  final int? currentPage;
  final int? perPage;
  final int? total;
  final int? lastPage;

  Pagination({
    this.currentPage,
    this.perPage,
    this.total,
    this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      perPage: json['per_page'],
      total: json['total'],
      lastPage: json['last_page'],
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