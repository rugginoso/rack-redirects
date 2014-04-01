module Rack
  module Redirects
    class Middleware
      DEFAULT_FIND_REDIRECT_PROC = Proc.new { nil }

      def initialize(app, &block)
        @app = app
        @find_redirect = block || DEFAULT_FIND_REDIRECT_PROC
      end

      def call(env)
        status, headers, body = @app.call(env)

        return [status, headers, body] if status != 404

        case new_url = @find_redirect.call(env['REQUEST_URI'])
        when nil then
          return [status, headers, body]
        when '' then
          return [410, {}, ['Gone']]
        else
          return [301, {'Location' => new_url }, ['Moved Permanently']]
        end
      end
    end
  end
end
