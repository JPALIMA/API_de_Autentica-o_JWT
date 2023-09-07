# app/controllers/taks_controller.rb

require_relative ' ../authenticator' #Certifique-se de ajustar o caminho para o authenticator.rb

class TasksController < ApplicationController
     include Authenticator #Inclua o módulo Authenticator

     # ...

     #autenticação do usuário e geração de token JWT
     def authenticate_user
          username = params[:username]
          password = params[:password]

          token = authenticate(username, password)

          if token
               render json: { token: token }
          else
               render json: { error: 'Autenticação falhou'}, status: :unauthorized
          end
     end


     #...
end


