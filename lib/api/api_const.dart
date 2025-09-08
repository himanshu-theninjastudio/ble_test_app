class ApiConst {
  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwiaWQiOjEsImlhdCI6MTc1NzMzMjQ1NCwiZXhwIjoxNzU3NDE4ODU0fQ.IoCAg-HH6RMHABsGcUb6Pl8LvnZig9DoV54V5LtizDE';
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
