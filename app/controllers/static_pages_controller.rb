class StaticPagesController < ApplicationController

  def index
    render template: 'public/index.html'
  end
end
