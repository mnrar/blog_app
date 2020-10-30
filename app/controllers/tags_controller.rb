class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end  

  def index
    @tags = Tag.all
  end 
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.articles.each do |article|
      article.tags.delete(@tag)
    end  
    @tag.destroy

    flash.notice = "The tag '#{@tag.name}' was deleted"

    redirect_to tags_path
  end

end
