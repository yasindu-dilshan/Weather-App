class InternetConnectionError extends Error{
  final String error;

  InternetConnectionError(this.error);
  
}

class ServrerError extends Error{
  final String error;

  ServrerError(this.error);
}

class CacheError extends Error{
  final String error;

  CacheError(this.error);
}