require "net/http"
require "net/https"
require "json"

class EmailValidationService
  BASE_URL = "https://emailvalidation.abstractapi.com/v1/"

  def initialize(email)
    @email = email
    @api_key = EnvCredentials::ABSTRACTAPI_KEY
  end

  def call
    uri = URI("#{BASE_URL}?api_key=#{@api_key}&email=#{@email}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(uri)

    response = http.request(request)

    handle_response(response)
  rescue StandardError => error
    { success: false, error: error.message }
  end

  private

  def handle_response(response)
    if response.code == "200"
      { success: true, body: JSON.parse(response.body) }
    else
      { success: false, error: "Status code: #{response.code}" }
    end
  end
end
