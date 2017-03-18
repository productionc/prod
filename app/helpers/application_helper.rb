module ApplicationHelper
  def publish channel, msg=[]
    uri = URI.parse("http://#{ENV["FAYE_URL"]}/faye")
    message = { channel: channel, data: msg }
    Net::HTTP.post_form(uri, message: message.to_json)
  end
end
