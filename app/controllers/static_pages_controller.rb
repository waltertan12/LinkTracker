class StaticPagesController < ApplicationController
  def index
    render file: "public/index.html.erb"
  end
end
