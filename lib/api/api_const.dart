class ApiConst {
  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiaWQiOjEsInVzZXJUeXBlIjoibWFuYWdlciIsImlhdCI6MTc1NzQxNzc3OSwiZXhwIjoxNzU3NTA0MTc5fQ.1wzYf-i5Fqy1bw34GHldFuZLSd09dGDbFCPpdn3T5_I';
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
