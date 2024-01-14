# frozen_string_literal: true

require 'forwardable'
require 'uri'

# BEGIN
class Url
  def initialize(uri)
    @uri = URI(uri)
    @url = @uri.to_s.split('?').first
    @query_params = (@uri.query || '').split('&').map { |el| el.split('=') }.to_h.transform_keys(&:to_sym)
  end

  extend Forwardable
  include Comparable
  attr_accessor :uri
  attr_reader :query_params, :url

  def_delegators :@uri, :scheme, :host, :port

  def query_param(key, default = nil)
    @query_params.fetch(key, default)
  end

  def <=>(other)
    return 0 if @url == other.url && @query_params == other.query_params

    nil
  end
end
# END

# x = Url.new('http://localhost:4000?a=b&b=a')

# pp x.uri
# pp x.scheme
# pp x.host
# pp x.port
# pp x.query_params
# pp x.==(URI('http://localhost:4000?b=a&a=b'))
