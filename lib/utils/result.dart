sealed class Result<T> {
  Result();

  T? get value => null;
  Exception? get error => null;

  factory Result.success(T value) = Success._;
  factory Result.failure(Exception error) = Failure._;
}

final class Success<T> extends Result<T> {
  final T _value;

  Success._(this._value);

  @override
  T get value => _value;
}

final class Failure<T> extends Result<T> {
  final Exception _error;

  Failure._(this._error);

  @override
  Exception get error => _error;
}
