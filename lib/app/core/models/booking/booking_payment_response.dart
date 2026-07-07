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

// 2. The main response model
class PaymentResponseModel {
  final int? bookingId;
  final String? gateway;
  final String? gatewayOrderId;
  final String? gatewayPaymentId;
  final String? gatewaySignature;
  final int? amount;
  final String? currency;
  final String? paymentMethod;
  final PaymentStatus status; // <-- Now strictly typed as an Enum
  final GatewayResponse? gatewayResponse;

  PaymentResponseModel({
    this.bookingId,
    this.gateway,
    this.gatewayOrderId,
    this.gatewayPaymentId,
    this.gatewaySignature,
    this.amount,
    this.currency,
    this.paymentMethod,
    this.status = PaymentStatus.unknown,
    this.gatewayResponse,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      bookingId: json['booking_id'],
      gateway: json['gateway'],
      gatewayOrderId: json['gateway_order_id'],
      gatewayPaymentId: json['gateway_payment_id'],
      gatewaySignature: json['gateway_signature'],
      amount: json['amount'],
      currency: json['currency'],
      paymentMethod: json['payment_method'],
      // Map the raw JSON string into our strict enum
      status: PaymentStatus.fromString(json['status']),
      gatewayResponse: json['gateway_response'] != null
          ? GatewayResponse.fromJson(json['gateway_response'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'gateway': gateway,
      'gateway_order_id': gatewayOrderId,
      'gateway_payment_id': gatewayPaymentId,
      'gateway_signature': gatewaySignature,
      'amount': amount,
      'currency': currency,
      'payment_method': paymentMethod,
      // Convert the enum back to its raw string format for the API
      'status': status.value,
      'gateway_response': gatewayResponse?.toJson(),
    };
  }
}

class GatewayResponse {
  final String? paymentMode;
  final String? bank;

  GatewayResponse({
    this.paymentMode,
    this.bank,
  });

  factory GatewayResponse.fromJson(Map<String, dynamic> json) {
    return GatewayResponse(
      paymentMode: json['payment_mode'],
      bank: json['bank'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_mode': paymentMode,
      'bank': bank,
    };
  }
}