
class SearchesController < ApplicationController
  def search
  end

  def foursquare
     begin
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = 'UW12IFMM1RHV0GMD3TOIZIKWHPCIPIE5UYME5M21M5PLPJQC
'
        req.params['client_secret'] = 'S2PAXW20A5YR1XC4O11STDBDLQZGQW2SUW444D5FRNLMYJFS
'
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
        req.options.timeout = 0
      end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
end