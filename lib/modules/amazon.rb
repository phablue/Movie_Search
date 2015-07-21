module Amazon
  class Movies
    def initialize
      @request = Vacuum.new
      configure(@request)
    end

    private
    def configure (request)
      request.configure(
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        associate_tag: ENV["AWS_ASSOCIATE_TAG"]
      )
    end
  end
end