class SearchesController < ApplicationController
  
  def search
    @model = params[:model]
    @content = params[:content]
    @search = params[:search]
    
    if @model == 'user'
      @users = User.search_for(@content, @search)
    else
      @books = Book.search_for(@content, @search)
    end
      
  end
end
