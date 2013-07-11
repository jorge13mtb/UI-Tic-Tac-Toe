TictactoeApp::Application.routes.draw do

  #root to: 'game_page#home', via: [:get, :post]
  match 'game_page/home', via: [:get, :post]
  match 'game_page/new_game', via: [:get, :post]
  get 'game_page/help'
  #match 'game_page/put_piece', via: [:get, :post]
 
  post 'game_page/put_piece', to: "game_page#put_piece"

end
