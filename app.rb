require 'monoriel'
require 'slim'

class App
	include Monoriel
	def index
		"<h1>Página de inicio</h1>"
		"<a href='/html/about.html'>Acerca de... </a>"
	end
	def blogs
		"Blogs del usuario"
	end
	def usuario
		"Usuario: Carlitos"
	end
	def articulo(id)
		"<h1>Articulo #{id}<h1><br>"
		"<h2>Como escribir un Blog</h2><br>"
		"<p>Información básica del blog </p>"
	end
	def eventos
		slim :eventos
	end
	def not_found(*args)
		slim :not_found
	end
end
