class NetworkListResponseModel {
  final bool? status;
  final int? totalCount;
  final int? activeCount;
  final List<NetworkItemModel>? data;

  NetworkListResponseModel({
    this.status,
    this.totalCount,
    this.activeCount,
    this.data,
  });

  factory NetworkListResponseModel.fromJson(Map<String, dynamic> json) {
    return NetworkListResponseModel(
      status: json['status'] as bool?,
      totalCount: json['total_count'] as int?,
      activeCount: json['active_count'] as int?,
      data: json['data'] != null
          ? (json['data'] as List).map((i) => NetworkItemModel.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'total_count': totalCount,
      'active_count': activeCount,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class NetworkItemModel {
  final int? id;
  final String? locationName;
  final String? networkName;
  final String? publicIp;
  final String? privateIp;
  final String? remarks;
  final bool? status;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;

  NetworkItemModel({
    this.id,
    this.locationName,
    this.networkName,
    this.publicIp,
    this.privateIp,
    this.remarks,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory NetworkItemModel.fromJson(Map<String, dynamic> json) {
    return NetworkItemModel(
      id: json['id'] as int?,
      locationName: json['location_name'] as String?,
      networkName: json['network_name'] as String?,
      publicIp: json['public_ip'] as String?,
      privateIp: json['private_ip'] as String?,
      remarks: json['remarks'] as String?,
      status: json['status'] is bool
          ? json['status'] as bool
          : (json['status'] == 1 || json['status'] == '1'),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location_name': locationName,
      'network_name': networkName,
      'public_ip': publicIp,
      'private_ip': privateIp,
      'remarks': remarks,
      'status': status,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
