class RecordNotFoundException implements Exception {
  final String message;

  RecordNotFoundException(this.message);

  @override
  String toString() {
    return 'RecordNotFoundException:Record not found $message';
  }
}
