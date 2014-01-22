class HomeController < ApplicationController

  # GET /listas
  # GET /listas.json
  def index
    @listas = Lista.all
  end

end
