require 'monoriel'
require 'slim'

class App
	include Monoriel
	def index
		slim :index
	end
	def blogs
		"Blogs del usuario"
	end
	def usuario
		"Usuario: Carlitos"
	end
	def articulo_por_fecha(day,month,year)
		#day = args.shift
		#month = args.shift
		#year = args.last
		"<h1>Articulos para el dia #{day}/#{month}/#{year}</h1>"
	end
	def articulo(id)
		#id = args.first
		@res['Content-Type'] = "text/html;charset=utf-8"
		"<h1>Articulo #{id}</h1><br>" +
		"<h2>Como escribir un Blog</h2><br>" +
		"<p>Información básica del blog </p>" +
		"<p><a href='/'>Inicio</a>"
	end
	def eventos
		slim :eventos
	end
	def not_found(*args)
		slim :not_found
	end
end
