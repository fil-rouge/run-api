module ErrorsHelper

  ERROR = {
    :invalid_token => "Invalid authorization: your token is not valid ",
    :invalid_header => "Invalid authorization: you need to give the user id and the authenthification token in the header as HTTP_USER_ID and HTTP_TOKEN",
    :unknown_error => "An unknown error has occured",
    :name_already_used => "this name is already taken !",
    :bad_user_id => "you can not make that action for an other user",
    :bad_id => "not found with that ID",
    :not_admin => "This action in forbiden because you're not admin",
    :bad_api_key => "This api key is not accepted by the server"
  }

  def self.json_error(symbol = :unknown_error, code = 000)
    symbol = (ERROR.keys.include? symbol) ? symbol : :unknown_error
    {
      :errors => [
        :detail => ERROR[symbol],
        :id => code
      ]
    }
  end

end