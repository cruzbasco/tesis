require './gemas'
require 'sinatra'

before do
  @network = Network.new
  @entity_types = @network.entity_type
  @exist_root = @network.exist_root?
  @root = @network.get_root
end

get "/" do
  # @entity_types
  erb :"main_page"
end

get "/forms" do
  @forms = @network.get_forms
  erb :"configuration/forms/forms"
end

get "/show_form/:name" do
  @form = @network.get_form(params[:name])
  erb :"configuration/forms/show_form"
end

get "/form_builder/:type" do
  @entity_type = params[:type]
  erb :"configuration/forms/form_builder"
end

get "/edit_form/:name" do
  @form = @network.get_form(params[:name])
  erb :"configuration/forms/editable_form"
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
  # @entity_types
  @forms = @network.get_forms  
  erb :"configuration/forms/forms"
end

post "/update_form" do
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
  # @entity_types
  @forms = @network.get_forms  
  erb :"configuration/forms/forms"
end

get "/delete_form/:name" do
  @network.delete_form(params[:name])
  # @entity_types
  @forms = @network.get_forms
  erb :"configuration/forms/forms"
end

get "/create_root" do
  erb :"nodes/root_builder"
end

post "save_root" do
  @node = @root
  erb :"nodes/show_node"
end

post "update_root" do
  @node = @root
  erb :"nodes/show_node"
end

get "/show_root" do
  @node = @root
  erb :"nodes/show_node"
end






















