sealed class Result {}

class Success<T> extends Result {
  final T data;
  Success(this.data);
}

class Error extends Result {
  final String errorMessage;
  Error(this.errorMessage);
}
