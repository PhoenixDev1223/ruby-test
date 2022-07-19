# require "api_client_fun/version"
require 'uri'
require 'net/http'
require 'json'

module ApiClientFun
  def self.profile_for_name(user_name)
    uri = URI("https://blooming-savannah-20593.herokuapp.com/api/users")
    res = Net::HTTP.get_response(uri)
    json_string = res.body if res.is_a?(Net::HTTPSuccess)
    users = JSON.parse(json_string)
    i = 0
    result_user = ''
    while i < users['users'].length do
      user = users['users'].at(i)
      if user_name === user['name']
        result_user = user['profile']
      end
      i += 1
    end
    return result_user
  end
  
  def self.profile_list()
    uri = URI("https://blooming-savannah-20593.herokuapp.com/api/users")
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end

  def self.profile_info_by_id(id)
    uri = "https://blooming-savannah-20593.herokuapp.com/api/users/" + id
    uri = URI(uri)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end
end

puts "===================Input User name====================="
name = gets.chomp
profile = ApiClientFun.profile_for_name(name)
puts profile
# ApiClientFun.profile_list()
# puts "====================Input user ID================"
# id = gets.chomp
# ApiClientFun.profile_info_by_id(id)