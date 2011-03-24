class Endereco
	def self.para(pagina)
		if pagina =~ /(raiz|home)/ 
			'/'
		else 
			if pagina =~ /^http:\/\/(.*)$/
				pagina.downcase
			else
				componentes_endereco = pagina.split(/\s+/)	
				"/" + componentes_endereco.join('/').downcase
			end
		end	
	end
end