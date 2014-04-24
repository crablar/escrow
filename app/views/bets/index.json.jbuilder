json.array!(@bets) do |bet|
  json.extract! bet, :id
  json.url bet_url(bet, format: :json)
end
