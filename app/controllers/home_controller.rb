class HomeController < ApplicationController

  def dashboard
    @q = Doctor.includes(:appointments).ransack(params[:q])
    @pagy, @doctors = pagy(@q.result(distinct: true), items: 10)
  end
end