class WebSnap

  class Middleware

    def initialize(app, options = {}, conditions = {})
      @app        = app
      @options    = options
      @conditions = conditions
    end

    def call(env)
      @request    = Rack::Request.new(env)
      @render_jpg = false

      set_request_to_render_as_jpg(env) if render_as_jpg?
      status, headers, response = @app.call(env)

      if rendering_jpg? && headers['Content-Type'] =~ /text\/html|application\/xhtml\+xml/
        body = response.respond_to?(:body) ? response.body : response.join
        body = body.join if body.is_a?(Array)
        body = WebSnap.new(translate_paths(body, env), @options).to_bytes

        response = [body]

        # Do not cache JPGs
        headers.delete('ETag')
        headers.delete('Cache-Control')

        headers["Content-Length"] = (body.respond_to?(:bytesize) ? body.bytesize : body.size).to_s
        headers["Content-Type"]   = "image/jpeg"
      end

      [status, headers, response]
    end

    private

    # Change relative paths to absolute
    def translate_paths(body, env)
      # Host with protocol
      root = WebSnap.root_url || "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}/"
      body.gsub(/(href|src)=(['"])\/([^\"']*|[^"']*)['"]/, '\1=\2' + root + '\3\2')
    end

    def rendering_jpg?
      @render_jpg
    end

    def render_as_jpg?
      request_path_is_jpg = @request.path.match(%r{\.jpg$})

      if request_path_is_jpg && @conditions[:only]
        rules = [@conditions[:only]].flatten
        rules.any? do |pattern|
          if pattern.is_a?(Regexp)
            @request.path =~ pattern
          else
            @request.path[0, pattern.length] == pattern
          end
        end
      else
        request_path_is_jpg
      end
    end

    def set_request_to_render_as_jpg(env)
      @render_jpg = true
      path = @request.path.sub(%r{\.jpg$}, '')
      %w[PATH_INFO REQUEST_URI].each { |e| env[e] = path }
      env['HTTP_ACCEPT'] = concat(env['HTTP_ACCEPT'], Rack::Mime.mime_type('.html'))
      env["Rack-Middleware-WebSnap"] = "true"
    end

    def concat(accepts, type)
      (accepts || '').split(',').unshift(type).compact.join(',')
    end

  end

end
