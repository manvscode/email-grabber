#!ruby 
require 'net/http'
require 'uri'

def scrapEmails( urlString )
	url = URI.parse( urlString )
	req = Net::HTTP::Get.new(url.path)
	res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
	emails = res.body.scan( /[A-Za-z0-9]+[@ | (at) | (AT) ][A-Za-z0-9]+\.[A-Za-z]+/i )
	return emails
end

email_addresses = scrapEmails( ARGV[ 0 ] )
email_addresses.length.times { |i| puts (i + 1).to_s + " " + email_addresses[ i ] }
