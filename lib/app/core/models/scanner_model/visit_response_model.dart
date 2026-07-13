class VisitResponseModel {
  final bool success;
  final String? status;
  final String? message;
  final VisitDataModel? data;

  VisitResponseModel({
    required this.success,
    this.status,
    this.message,
    this.data,
  });

  factory VisitResponseModel.fromJson(Map<String, dynamic> json) {
    return VisitResponseModel(
      success: json['success'] ?? false,
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null ? VisitDataModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class VisitDataModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? qrCode;
  final String? thumbnailUrl;
  final String? videoUrl;
  final String? audioUrl;
  final String? contentHtml;
  final List<FaqModel>? faqs; // Added FAQs list
  final String? publicUrl;
  final String? scanApiUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VisitDataModel({
    this.id,
    this.title,
    this.slug,
    this.qrCode,
    this.thumbnailUrl,
    this.videoUrl,
    this.audioUrl,
    this.contentHtml,
    this.faqs,
    this.publicUrl,
    this.scanApiUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory VisitDataModel.fromJson(Map<String, dynamic> json) {
    return VisitDataModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      qrCode: json['qr_code'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      videoUrl: json['video_url'] as String?,
      audioUrl: json['audio_url'] as String?,
      contentHtml: json['content_html'] as String?,
      // Map the JSON list to a List<FaqModel> safely
      faqs: json['faqs'] != null
          ? (json['faqs'] as List).map((i) => FaqModel.fromJson(i)).toList()
          : null,
      publicUrl: json['public_url'] as String?,
      scanApiUrl: json['scan_api_url'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'qr_code': qrCode,
      'thumbnail_url': thumbnailUrl,
      'video_url': videoUrl,
      'audio_url': audioUrl,
      'content_html': contentHtml,
      'faqs': faqs?.map((e) => e.toJson()).toList(), // Serialize the list back to JSON
      'public_url': publicUrl,
      'scan_api_url': scanApiUrl,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

// New model class to handle the FAQ objects
class FaqModel {
  final String? question;
  final String? answer;

  FaqModel({
    this.question,
    this.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}