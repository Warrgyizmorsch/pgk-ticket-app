class TicketPricingResponse {
  final bool success;
  final String status;
  final String message;
  final List<TicketPricing> data;

  TicketPricingResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory TicketPricingResponse.fromJson(Map<String, dynamic> json) {
    return TicketPricingResponse(
      success: json['success'] ?? false,
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<TicketPricing>.from(
          json['data'].map((x) => TicketPricing.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class TicketPricing {
  final int id;
  final String ticketType;
  final String nationality;
  final int infantRate;
  final int kidRate;
  final int adultRate;

  TicketPricing({
    required this.id,
    required this.ticketType,
    required this.nationality,
    required this.infantRate,
    required this.kidRate,
    required this.adultRate,
  });

  factory TicketPricing.fromJson(Map<String, dynamic> json) {
    return TicketPricing(
      id: json['id'] ?? 0,
      ticketType: json['ticket_type'] ?? '',
      nationality: json['nationality'] ?? '',
      infantRate: json['infant_rate'] ?? 0,
      kidRate: json['kid_rate'] ?? 0,
      adultRate: json['adult_rate'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticket_type': ticketType,
      'nationality': nationality,
      'infant_rate': infantRate,
      'kid_rate': kidRate,
      'adult_rate': adultRate,
    };
  }
}