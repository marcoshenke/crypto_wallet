class WelcomeController < ApplicationController
  def index
    cookies[:curso] = 'Curso de Ruby on Rails [cookie]'
    session[:curso] = 'Curso de Ruby on Rails [session]'
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
