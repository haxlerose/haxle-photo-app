module Fog
  module Compute
    class DigitalOcean
      class Real
        def change_kernel(id, kernel)
          body = { :type => "change_kernel", :kernel => kernel }

          encoded_body = Fog::JSON.encode(body)

          request(
            :expects => [201],
            :headers => {
              'Content-Type' => "application/json; charset=UTF-8",
            },
            :method  => 'POST',
            :path    => "v2/droplets/#{id}/actions",
            :body    => encoded_body,
          )
        end
      end

      class Mock
        def change_kernel(id, kernel)
          response         = Excon::Response.new
          response.status  = 201
          response.body    = {
            'action' => {
              'id'            => Fog::Mock.random_numbers(1).to_i,
              'status'        => "in-progress",
              'type'          => "change_kernel",
              'started_at'    => "2014-11-14T16:31:00Z",
              'completed_at'  => nil,
              'resource_id'   => id,
              'resource_type' => "droplet",
              'region'        => "nyc3",
              'region_slug'   => "nyc3"
            }
          }
          response
        end
      end
    end
  end
end
