class PaymentModel {
  final int? bookingId;
  final String? gateway;
  final String? gatewayOrderId;
  final String? gatewayPaymentId;
  final String? gatewaySignature;
  final int? amount;
  final String? currency;
  final String? paymentMethod;
  final String? status;
  final GatewayResponse? gatewayResponse;

  PaymentModel({
    this.bookingId,
    this.gateway,
    this.gatewayOrderId,
    this.gatewayPaymentId,
    this.gatewaySignature,
    this.amount,
    this.currency,
    this.paymentMethod,
    this.status,
    this.gatewayResponse,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      bookingId: json['booking_id'],
      gateway: json['gateway'],
      gatewayOrderId: json['gateway_order_id'],
      gatewayPaymentId: json['gateway_payment_id'],
      gatewaySignature: json['gateway_signature'],
      amount: json['amount'],
      currency: json['currency'],
      paymentMethod: json['payment_method'],
      status: json['status'],
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
      'status': status,
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