module Zendesk
  class Client
    attr_accessor :username, :password

    def initialize(options = {})
      options.each { |key, value| instance_variable_set "@#{key}", value }
      yield self if block_given?
    end

    def credentials
      {
        username: username,
        password: password
      }
    end

    def credentials?
      credentials.values.all?
    end
  end
end
