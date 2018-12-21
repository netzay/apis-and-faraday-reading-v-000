class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['UW12IFMM1RHV0GMD3TOIZIKWHPCIPIE5UYME5M21M5PLPJQC
'] = client_id
      req.params['S2PAXW20A5YR1XC4O11STDBDLQZGQW2SUW444D5FRNLMYJFS
'] = client_secret
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    render 'search'
  end
end
