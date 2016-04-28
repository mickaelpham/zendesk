module Zendesk
  class Client
    attr_accessor :username, :password, :endpoint

    def initialize(options = {})
      if block_given?
        yield self
      else
        config    = yaml_configuration.merge(options)
        @username = config[:username]
        @password = config[:password]
        @endpoint = config[:endpoint]
      end
    end

    private

    def yaml_configuration
      File.exist?('config.yml') ? YAML.load(File.read('config.yml')) : {}
    end

    def connection
      @connection ||= Faraday.new(url: endpoint) do |builder|
        builder.use Faraday::Request::BasicAuthentication, username, password
        builder.use Faraday::Response::Logger
        builder.adapter Faraday.default_adapter
      end
    end
  end
end
