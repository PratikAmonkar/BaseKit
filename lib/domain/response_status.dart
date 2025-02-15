class ResponseStatus<T> {
  final bool isSuccess;
  final bool isLoading;
  final bool isEmpty;
  final bool isError;
  final T? data;
  final ApiErrorDetails? error;

  ResponseStatus({
    required this.isSuccess,
    required this.isLoading,
    required this.isEmpty,
    required this.isError,
    this.data,
    this.error,
  });

  factory ResponseStatus.onSuccess(T data) => ResponseStatus(
        isSuccess: true,
        isLoading: false,
        isEmpty: false,
        isError: false,
        data: data,
      );

  factory ResponseStatus.onError(ApiErrorDetails? errorDetails) =>
      ResponseStatus(
        isSuccess: false,
        isLoading: false,
        isEmpty: false,
        isError: true,
        error: errorDetails,
      );

  factory ResponseStatus.onEmpty() => ResponseStatus(
        isSuccess: false,
        isLoading: false,
        isError: false,
        isEmpty: true,
      );

  factory ResponseStatus.onLoading() => ResponseStatus(
        isSuccess: false,
        isLoading: true,
        isError: false,
        isEmpty: false,
      );
}

class ApiErrorDetails {
  final String? message;
  final int? statusCode;

  ApiErrorDetails({required this.message, required this.statusCode});
}
