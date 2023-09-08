class TasksController < ApplicationController
     #...

     #Autenticação do usuário e geração de token JWT
     def authenticate
          username = params[:username]
          passaword = params[:password]

          token = authenticate(username, password)

          if token
               render json: { token: token }
          else
               render json: { error: 'Autenticação falhou'}, status: :unauthorized
          end
     end

     #...
end



