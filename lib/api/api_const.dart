class ApiConst {
  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiaWQiOjEsImlhdCI6MTc1Njg5MzE2NCwiZXhwIjoxNzU2OTc5NTY0fQ.GInsApG2P_zqHWfylegsu4jCo_q9B1xZqAlnoSI3sys';
  static const String baseUrl = "https://admin.moanatech.com/api/v1/";
  static String getFirmwareUrl({
    required int page,
    required int limit,
    required int productId,
    required int generationId,
  }) {
    return "firmwares?page=$page&limit=$limit&productId=$productId&generationId=$generationId";
  }
}
