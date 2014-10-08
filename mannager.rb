require './gemas'
require 'sinatra'

get "/" do

  @forms = Repositorio.instance.recuperar
  
  erb :"forms"
end

get "/form_builder" do
  @form = Entity.new("")
  erb :"form_builder"
end

get "/form_builder/:nombre" do
  @form = Repositorio.instance.recuperarPorNombre(params[:nombre])  
  erb :"form_builder"
end

post "/formularios" do
  @form = Entity.new(params[:form_name])
  Repositorio.instance.guardar(@form) 
  @forms = Repositorio.instance.recuperar
  erb :"forms"
end