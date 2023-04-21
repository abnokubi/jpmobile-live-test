class StreamController < ApplicationController
  include ActionController::Live
  def index
    response.headers['Content-Type'] = 'text/event-stream'
    # response.headers['Last-Modified'] = Time.now.httpdate
    response.headers['Last-Modified'] = 0
    sse = SSE.new(response.stream)
    2.times {
      sse.write({ name: 'test' })
      # response.stream.write "data: {'count': #{i}}\r\n"
      sleep 1
    }
  ensure
    # response.stream.close
    sse.close
  end
end
