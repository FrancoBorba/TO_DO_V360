class ApplicationController < ActionController::Base
  helper_method :usuario_logado

  def usuario_logado
    @usuario_logado ||= Usuario.find_by(id: session[:usuario_id]) if session[:usuario_id]
  end

  def autenticar_usuario!
    redirect_to login_path unless usuario_logado
  end
end
