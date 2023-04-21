class RackController < ApplicationController
    def stream
        response.headers['Content-Type'] = 'text/event-stream'
        response.headers['Cache-Control'] = 'no-cache'
    
        sse = SSE.new(response.stream)
    
        begin
          loop do
            sse.write({ time: Time.now })
            sleep 1
          end
        rescue IOError
          # クライアントが接続を閉じたときに発生する
        ensure
          sse.close
        end
    
        render plain: "Done"
    end
end
