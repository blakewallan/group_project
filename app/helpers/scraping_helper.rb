
require 'rest-client'
require 'nokogiri'

module ScrapingHelper

  def self.scrape url
    response = RestClient.get url
    html = response.body
    data = Nokogiri::HTML(html)
    data
  end

  def self.long_lat_convert address
    puts address
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=AIzaSyAcXJDnxyoY6GsNLeBk9Gmfvhu5HCC-FeA"
    google_res = RestClient.get url
    if (JSON.parse(google_res))['results'].length > 0
      return JSON.parse(google_res)['results'][0]['geometry']['location']
    else
      return {lat: 0, lng: 0}
    end
  end

  def self.set_everything data
    title_capture = data.css('#results h2')
    address_capture = data.css('dl dd label')
    details_capture = data.css('.locationdetail')
    description_capture = data.css('.desc p')
    service_capture = data.css('h3 a')

    size = data.css('#results h2').count
    results = []
    i = 0
    while i < size - 1

      coords = long_lat_convert(address_capture[i].text)

      results[i] = {title: title_capture[i].text,
                    address: address_capture[i].text,
                    longitude: coords['lng'],
                    latitude: coords['lat'],
                    phone: details_capture[i].text.match(/(?:Phone:)(.*)/),
                    hours: details_capture[i].text.match(/(?:Hours:)(.*)/),
                    description: description_capture[i].text,
                    #My god this is horrible
                    service: ((service_capture[i].to_s.match(/>(.*)</)).to_s.sub(">", "").sub("<", ""))
      }
      i +=1
    end
    results
  end
end