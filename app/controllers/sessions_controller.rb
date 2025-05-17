class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by(email: params[:email])
    if usuario&.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      redirect_to lists_path, notice: "Login realizado com sucesso!"
    else
      flash.now[:alert] = "Email ou senha inválidos"
      render :new
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to login_path, notice: "Logout feito com sucesso!"
  end
end
