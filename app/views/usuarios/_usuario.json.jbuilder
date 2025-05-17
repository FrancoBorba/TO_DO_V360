json.extract! usuario, :id, :nome, :email, :password_digest, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
