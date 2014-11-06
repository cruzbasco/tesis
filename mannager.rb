require './gemas'
require 'sinatra'
before do
  @network = Network.new
end

get "/" do
  # @forms = Repositorio.instance.recuperar
  @forms = @network.get_forms
  erb :"forms"
end

get "/form_builder" do
  @form = Form.new("","")
  erb :"form_builder"
end

get "/form_builder/:nombre" do
  # @form = Repositorio.instance.recuperarPorNombre(params[:nombre])  
  @form = @network.get_form(params[:nombre])
  puts @form.instance_of? Form
  erb :"form_builder"
end

post "/formularios" do  
  @form = Form.new(params[:form_name],params[:entity_type])
    
  params.each do |key, value|     
    if key != "form_name" then
      attribute = Attribute.new(key,value,TextType.new)
      @form.add_attribute(attribute)
    end
  end
  
  # Repositorio.instance.guardar(@form) 
  # @forms = Repositorio.instance.recuperar
  @network.save_form(@form)
  
  @forms = @network.get_forms
  
  erb :"forms"
end