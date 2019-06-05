class FiguresController < ApplicationController
 set :views, './app/views/figures'
  get "/figures" do
    @figures = Figure.all
    erb :index
  end

  get "/figures/new" do
    erb :new
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :show
  end

  post "/figures" do
    binding.pry
    @figure = Figure.create(name: params["figure"]["name"])
    unless params["figure"]["new_landmark_name"].empty?
      @figure.landmarks << Landmark.create(name: params["figure"]["new_landmark_name"], year_completed: params["figure"]["new_landmark
      _year"])
    end
  end

 

end
