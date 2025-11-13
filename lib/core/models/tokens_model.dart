class TokensModel {
  final String accessToken;
  final String refreshToken;
  final String expiresAtUtc;

  TokensModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) {
    return TokensModel(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      expiresAtUtc: json['expiresAtUtc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresAtUtc': expiresAtUtc,
    };
  }
}
