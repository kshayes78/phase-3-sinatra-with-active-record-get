class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'


 get '/games' do
  games = Game.all.order(:title).limit(10)
  games.to_json
 end

 get '/games/:id' do
  gameId = Game.find(params[:id])
  gameId.to_json(only: [:id, :title, :genre, :price],include: {
    reviews: {only: [:comment, :score], include: {
      user: {only: [:name]}
      }}
  })
 end

end
