#authenticator.rb

require 'jwt'

module Authenticator
     #Simples banco de dados de usuários (substitua por um banco de dados real)
     USERS = [
          { username: 'usuario1', passaword: 'senha1'},
          { username: 'usuario2', passaword: 'senha2'}
     ]

     #Chave secreta para assinar os tokens JWT
     SECRET_KEY = 'sua_chave_secreta'

     #Método para autenticar um usuário e gerar um token JWT
     def self.authenticate(username, password)
          user = USERS.find { |u| u[:username] == username && u[:password]}
          return nil unless user

          payload = { username: username }
          token = JWT.encode(payload, SECRET_KEY, 'HS256')
          