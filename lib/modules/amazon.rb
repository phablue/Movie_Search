module Amazon
  class Movies
    def initialize
      @request = Vacuum.new

    end

    def configure (request)
      request.configure(
        aws_access_key_id: 'key',
        aws_secret_access_key: 'secret',
        associate_tag: 'tag'
      )
    end
  end
end