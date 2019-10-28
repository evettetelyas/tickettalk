class DiscoService

	def search_events(keyword)
		data = conn.get("search") do |req|
			req.params[:keyword] = keyword
		end
		JSON.parse(data.body, symbolize_names: true)
	end

	private
	def conn
		Faraday.new(url: "https://disco-service.herokuapp.com/") do |f|
		  f.adapter  Faraday.default_adapter
		end
	end
end