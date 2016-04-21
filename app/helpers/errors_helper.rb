module ErrorsHelper
  # TODO : continue
  ERROR = {
    :invalid_token => "Invalid authorization: your token is not valid ",
    :invalid_header => "Invalid authorization: you need to give the user id and the authenthification token in the header as HTTP_USER_ID and HTTP_TOKEN",
    :unknown_error => "An unknown error has occured"
  }

# TODO: check how to return the status code in the json or in the request
  def json_error(symbol = :unknown_error, code = 401  )
    {:error => ERROR[symbol] } #, :status => code}
  end




end