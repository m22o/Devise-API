class Api::V1::RegistrationsController < ApplicationController

  def create
    u=User.new(params[:fields].permit!)
    if u.save
      render json: {record: u, message: 'User created'}
    else
      render json: {message: 'User Not created'}
    end
  end
  
end