
class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'UW12IFMM1RHV0GMD3TOIZIKWHPCIPIE5UYME5M21M5PLPJQC'
      req.params['client_secret'] = '0UWNFS4KA401Y4VV3ZYO3TV13LTKOQRQEGJDRKKOCTR4UJKH'
      req.params['v'] = '20170201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
      # req.options.timeout = 0
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @venues = body['response']['venues']
    else
      @error = body['meta']['errorDetail']
    end

    rescue Faraday::TimeoutError
      @error = 'There was a timeout. Pleasee try again.'
    end
    render 'search'
  end