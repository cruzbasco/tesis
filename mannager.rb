require './gemas'
require 'sinatra'
before do
  @network = Network.new
end

get "/" do
  @forms = @network.get_forms
  erb :"forms"
end

get "/show_form/:name" do
  @form = @network.get_form(params[:name])
  
  @form.get_attributes_values.each do |attribute|
	  puts "#{attribute.property} value #{attribute.value} "
	end
  erb :show_form
end

get "/form_builder" do
  @form = Form.new("","")
  erb :"form_builder"
end

get "/form_builder/:name" do
  @form = @network.get_form(params[:name])
  erb :"form_builder"
end

post "/forms" do  
  @form = Form.new(params[:form_name],params[:entity_type])
  p = []
  params.each do |key,value|
    if key != "form_name" then
          p.push(key)
          p.push(value)
    end
  end
  p.each_slice(4) do |key, value, useless, type|
    puts "1>> #{key} #{value} #{useless} #{type}"
    attribute_type = Attribute.select(type)
    puts "2>> #{key} #{value} #{useless} #{type}"
    
    attribute = Attribute.new(key,value,attribute_type)
    puts "3>> #{key} #{value} #{useless} #{type}"
    
    @form.add_attribute(attribute)
    puts "4>> #{key} #{value} #{useless} #{type}"
    
  end
  
  @network.save_form(@form)
  @forms = @network.get_forms  
  erb :"forms"
end

get "/delete_form/:name" do
  @network.delete_form(params[:name])
  @forms = @network.get_forms
  erb :"forms"
end























