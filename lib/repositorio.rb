require 'singleton'
require 'date'

class Repositorio
  include Singleton
  
  def initialize
    @formularios = Array.new
    @persistencia = Persistencia.new("./database/formulario.json")
  end
  
  def guardar(formulario)
    @formularios.push(formulario)
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










