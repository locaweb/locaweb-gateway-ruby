class ResponseFixture
  attr_reader :body, :to_i, :headers

  def initialize(options={})
    @body    = options[:body]
    @to_i    = options[:status] # RestClient Response Status code is #to_i :S
    @headers = []
  end
end
