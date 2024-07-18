require 'Faraday'

class Dummy
    def self.print_Date
        puts Time.now.strftime('%F') + '\n'
    end

    def self.print(response)
        puts response
        puts '\n'
        puts response.status
        puts '\n'
        puts response.headers
        puts '\n'
        puts response.body
        puts '\n'
    end

    def self.get_Groups
        puts '*** get_Groups ***\n'
        response = Faraday.get('http://localhost:3000/groups')
        Dummy.print(response)
    end

    def self.get
        puts '*** get ***\n'
        response = Faraday.get('http://localhost:3000/groups/1')
        Dummy.print(response)
    end

    def self.post
        puts '*** post ***\n'
        conn = Faraday.new(
            url: 'http://localhost:3000',
            params: {param: '1'},
            headers: {'Content-Type' => 'application/json'}
        )

        response = conn.post('/groups') do |req|
            req.params['limit'] = 100
            req.body = {name: 'chunky bacon - ' + Time.now.strftime('%F')}.to_json
        end
        # => POST http://httpbingo.org/post?param=1&limit=100

        Dummy.print(response)

    end

    def self.put
        puts '*** put ***\n'
        conn = Faraday.new(
            url: 'http://localhost:3000',
            params: {param: '1'},
            headers: {'Content-Type' => 'application/json'}
        )

        response = conn.put('/groups/1') do |req|
            req.params['limit'] = 100
            req.body = {name: 'chunky bacon - ' + Time.now.strftime('%F')}.to_json
        end
        # => POST http://httpbingo.org/post?param=1&limit=100

        Dummy.print(response)

    end

    def self.patch
        puts '*** patch ***\n'
        conn = Faraday.new(
            url: 'http://localhost:3000',
            params: {param: '1'},
            headers: {'Content-Type' => 'application/json'}
        )

        response = conn.patch('/groups/1') do |req|
            req.params['limit'] = 100
            req.body = {name: 'chunky bacon - ' + Time.now.strftime('%F')}.to_json
        end
        # => POST http://httpbingo.org/post?param=1&limit=100

        Dummy.print(response)

    end

    def self.delete
        puts '*** delete ***\n'
        
        response = Faraday.delete('http://localhost:3000/groups/2')
        Dummy.print(response)
    end



end

Dummy.print_Date
Dummy.get_Groups
Dummy.get
Dummy.post
Dummy.put
Dummy.patch
Dummy.delete
