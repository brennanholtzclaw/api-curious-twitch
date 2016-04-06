class TwitchService

  def initialize
    @headers = {"Client-ID" => "si0orm5co5ag077jshcfjrbhurdqp6u", "Accept" => "application/vnd.twitchtv.v2+json"}
    @host = "https://api.twitch.tv/kraken"
  end

  def get(path)
    HTTParty.get(prepare_path(path), headers: @headers)
  end

  def get_hash(path)
    parse(get(path).body)
  end

  def prepare_path(path)
    @host + path + ".json"
  end

  def top_games(num = 10)
    get("/games/top?limit=#{num}")
  end

  def post(path, params)
    parse(HTTParty.post(@host + path + ".json?" + params.to_query, headers: @headers).body)
  end

  # def delete(path)
  #   parse(HTTParty.delete(@host + path + ".json", headers: @headers).body)
  # end
  #
  # def artists
  #   get("/artists")
  # end
  #
  # def artist(id)
  #   get("/artists/#{id}")
  # end
  #
  # def create_artist(artist)
  #   post("/artists", artist.to_h)
  # end
  #
  # def destroy_artist(artist)
  #   delete("/artists/#{artist.id}")
  # end

private

  def parse(json_string)
    JSON.parse(json_string, symbolize_names: true)
  end

end
