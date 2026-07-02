class TicketBookingModel {
  final int userId;
  final String ticketType;
  final String time;
  final String date;
  final String nationality;
  final int adultsCount;
  final int kidsCount;
  final int infantsCount;
  final double totalRs;

  TicketBookingModel({
    required this.userId,
    required this.ticketType,
    required this.time,
    required this.date,
    required this.nationality,
    required this.adultsCount,
    required this.kidsCount,
    required this.infantsCount,
    required this.totalRs,
  });

  factory TicketBookingModel.fromJson(Map<String, dynamic> json) {
    return TicketBookingModel(
      userId: json['user_id'] as int? ?? 0,
      ticketType: json['ticket_type'] as String? ?? '',
      time: json['time'] as String? ?? '',
      date: json['date'] as String? ?? '',
      nationality: json['nationality'] as String? ?? 'Unknown',
      adultsCount: json['adults_count'] as int? ?? 0,
      kidsCount: json['kids_count'] as int? ?? 0,
      infantsCount: json['infants_count'] as int? ?? 0,
      totalRs: (json['total_rs'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'ticket_type': ticketType,
      'time': time,
      'date': date,
      'nationality': nationality,
      'adults_count': adultsCount,
      'kids_count': kidsCount,
      'infants_count': infantsCount,
      'total_rs': totalRs,
    };
  }
}