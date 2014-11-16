require './gemas'
require 'sinatra'

before do
  @network = Network.new
  @entity_types = @network.entity_type
end

get "/" do
  @forms = @network.get_forms
  @entity_types
  erb :"forms"
end

get "/show_form/:name" do
  @form = @network.get_form(params[:name])
  erb :show_form
end

get "/form_builder/:type" do
  @entity_type = params[:type]
  erb :"form_builder"
end

get "/edit_form/:name" do
  @form = @network.get_form(params[:name])
  erb :"editable_form"
end

post "/save_form" do  
  @form = Form.new(params[:cc_form_name],params[:cc_form_type], DateTime.now.strftime("%d-%m-%Y %H:%M"))
  p = []
  params.each do |key,value|
    if !( key =~ /cc_form(.*)/ ) then
          p.push(key)
          p.push(value)
    end
  end
  
  p.each_slice(4) do |key, value, useless, type|
    attribute_type = Attribute.select(type)
    attribute = Attribute.new(key,value,attribute_type)
    @form.add_attribute(attribute)
  end
  
  @network.save_form(@form)
  @entity_types
  @forms = @network.get_forms  
  erb :"forms"
end

post "/update_form"do
  @network.delete_form(params[:cc_form_old_name])
  @form = Form.new(params[:cc_form_name],params[:cc_form_type], params[:cc_form_date])
  p = []
  params.each do |key,value|
    if !( key =~ /cc_form(.*)/ ) then
          p.push(key)
          p.push(value)
    end
  end
  
  p.each_slice(4) do |key, value, useless, type|
    attribute_type = Attribute.select(type)
    attribute = Attribute.new(key,value,attribute_type)
    @form.add_attribute(attribute)
  end
  
  @network.save_form(@form)
  @entity_types
  @forms = @network.get_forms  
  erb :"forms"
end

get "/delete_form/:name" do
  @network.delete_form(params[:name])
  @entity_types
  @forms = @network.get_forms
  erb :"forms"
end























