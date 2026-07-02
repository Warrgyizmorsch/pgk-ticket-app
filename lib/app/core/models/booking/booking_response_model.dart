class TicketBookingResponseModel {
  final bool success;
  final String status;
  final String message;
  final int bookingId;
  final BookedTicketDataModel data;

  TicketBookingResponseModel({
    required this.success,
    required this.status,
    required this.message,
    required this.bookingId,
    required this.data,
  });

  factory TicketBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return TicketBookingResponseModel(
      // Safely default to false/empty/0 if keys are missing
      success: json['success'] as bool? ?? false,
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      bookingId: json['booking_id'] as int? ?? 0,

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
      'data': data.toJson(),
    };
  }
}

// ---------------------------------------------------------
// Nested Data Model
// ---------------------------------------------------------

class BookedTicketDataModel {
  final int userId;
  final String ticketType;
  final int adultsCount;
  final double totalRs;
  final int id;

  BookedTicketDataModel({
    required this.userId,
    required this.ticketType,
    required this.adultsCount,
    required this.totalRs,
    required this.id,
  });

  factory BookedTicketDataModel.fromJson(Map<String, dynamic> json) {
    return BookedTicketDataModel(
      userId: json['user_id'] as int? ?? 0,
      ticketType: json['ticket_type'] as String? ?? '',
      adultsCount: json['adults_count'] as int? ?? 0,
      totalRs: (json['total_rs'] as num?)?.toDouble() ?? 0.0,
      id: json['id'] as int? ?? 0,
    );
  }

  factory BookedTicketDataModel.empty() {
    return BookedTicketDataModel(
      userId: 0,
      ticketType: '',
      adultsCount: 0,
      totalRs: 0.0,
      id: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'ticket_type': ticketType,
      'adults_count': adultsCount,
      'total_rs': totalRs,
      'id': id,
    };
  }
}