require 'monoriel'
require_relative 'activestore' 
require_relative 'models/usuario'
require 'slim'

class App
	include Monoriel
	def initialize
		@blog = ActiveStore.new "blog.store"
	end
	def index
		@articulos = @blog.list
		slim :index
	end
	def usuario
		slim :usuario
	end
	def articulo(id)
		@articulo = @blog.read id.to_i
		puts @articulo.to_s
		slim :articulo
	end
	def articulo_new
		slim :articulo_new
	end
	def articulo_edit(id)
		@articulo = @blog.read id.to_i
		slim :articulo_edit unless @articulo.nil?
	end
	def articulo_destroy(id)
		@articulo = @blog.read id.to_i
		slim :articulo_delete
	end
	def post_articulo
		key = @blog.keys.last.nil? ? 1 : @blog.keys.last + 1
		@articulo = Articulo.new key, @r.params["titulo"]
		puts @articulo.to_s
		@articulo.contenido = @r.params["contenido"]
		@blog.create key, @articulo
		index
	end
	def put_articulo(id)
		@articulo = @blog.read id.to_i
		@articulo.titulo = @r.params["titulo"]
		@articulo.contenido = @r.params["contenido"]
		@blog.update id.to_i, @articulo
		index
	end
	def delete_articulo(id)
		@blog.delete id.to_i
		index
	end
	def not_found(*args)
		slim :not_found
	end
end
