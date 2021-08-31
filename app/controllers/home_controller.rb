class HomeController < ApplicationController

  def dashboard
    @q = Doctor.includes(:appointments).search(params[:q])
    @pagy, @doctors = pagy(@q.result(distinct: true), items: 10)
  end
  

end