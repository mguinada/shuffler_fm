require 'faraday'
require 'multi_json'

#total ripoff from https://github.com/pengwynn/octokit
module Faraday
  # @private
  class Response::ErrorHandler < Faraday::Response::Middleware
    def on_complete(response)
      case response[:status].to_i
      when 400
        raise ShufflerFM::BadRequest, error_message(response)
      when 401
        raise ShufflerFM::Unauthorized, error_message(response)
      when 403
        raise ShufflerFM::Forbidden, error_message(response)
      when 404
        raise ShufflerFM::NotFound, error_message(response)
      when 406
        raise ShufflerFM::NotAcceptable, error_message(response)
      when 422
        raise ShufflerFM::UnprocessableEntity, error_message(response)
      when 500
        raise ShufflerFM::InternalServerError, error_message(response)
      when 501
        raise ShufflerFM::NotImplemented, error_message(response)
      when 502
        raise ShufflerFM::BadGateway, error_message(response)
      when 503
        raise ShufflerFM::ServiceUnavailable, error_message(response)
      end
    end

    def error_message(response)
      msg = response[:body].nil? ? "" : response[:body]
      msg = "The requested URL was not found on the server." if response[:status].to_i == 404
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]} #{msg}"
    end
  end
end