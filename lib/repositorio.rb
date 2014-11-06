require 'singleton'
require 'date'

class Repositorio
  include Singleton
  
  def initialize
    @formularios = Array.new
    @persistencia = Persistencia.new("./database/formulario.json")
  end
  
  def guardar(formulario)
    resp = false
    @formularios.each do |f| 
      if f.get_main_value == formulario.get_main_value then
        f.set_attributes(formulario.get_attributes)
        resp = true
      end
    end
    if !resp then
      @formularios.push(formulario)
    end
    @persistencia.guardar_todos(@formularios)
  end
  
  def recuperar
    @formularios = @persistencia.recuperar_todos
  end
  
  def recuperarPorNombre(nombre) 
    @formularios = @persistencia.recuperar_todos
    formulario = @formularios.select{|e| e.main_attribute.value == nombre }
    formulario.first
  end
  
end










