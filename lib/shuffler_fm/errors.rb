module ShufflerFM
  # Root error class
  class Error < StandardError; end

  # Raised on the advent of a 400 HTTP status code
  class BadRequest < Error; end

  # Raised on the advent of a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised on the advent of a 403 HTTP status code
  class Forbidden < Error; end

  # Raised on the advent of a 404 HTTP status code
  class NotFound < Error; end

  # Raised on the advent of a 406 HTTP status code
  class NotAcceptable < Error; end

  # Raised on the advent of a 422 HTTP status code
  class UnprocessableEntity < Error; end

  # Raised on the advent of a 429 HTTP status code
  class TooManyRequests < Error; end

  # Raised on the advent of a 500 HTTP status code
  class InternalServerError < Error; end

  # Raised on the advent of a 501 HTTP status code
  class NotImplemented < Error; end

  # Raised on the advent of a 502 HTTP status code
  class BadGateway < Error; end

  # Raised on the advent of a 503 HTTP status code
  class ServiceUnavailable < Error; end
end