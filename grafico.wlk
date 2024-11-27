import wollok.game.*

class BarraVertical {
	const valor
	var position
	
	method dibujar() {
		if (valor > 0) valor.times(
				{ i =>
					new Item(position = position).dibujar()
					position = position.up(1)
				}
			)
	}
}

class GraficoBarras {
	const valores
	const etiquetas
	const maximo = 10
	var property position
	
	method dibujar() {
		self.dibujarBarras()
		self.dibujarEtiquetasHorizontales()
		self.dibujarEtiquetasVerticales()
	}
	
	method dibujarBarras() {
		var pos = position
		
		valores.forEach(
			{ valor =>
				new BarraVertical(valor = valor, position = pos).dibujar()
				pos = pos.right(2)
			}
		)
	}
	
	method dibujarEtiquetasHorizontales() {
		var pos = position.down(2)
		etiquetas.forEach(
			{ etiqueta =>
				self.nuevaEtiquetaHorizontal(etiqueta, pos).dibujar()
				pos = pos.right(2)
			}
		)
	}
	
	method dibujarEtiquetasVerticales() {
		var pos = position.left(2)
		maximo.times(
			{ nro =>
				self.nuevaEtiquetaVertical(nro.toString(), pos).dibujar()
				pos = pos.up(1)
			}
		)
	}
	
	method nuevaEtiquetaHorizontal(etiqueta, pos) = new Etiqueta(
		text = etiqueta,
		position = pos
	)
	
	method nuevaEtiquetaVertical(etiqueta, pos) = self.nuevaEtiquetaHorizontal(
		etiqueta,
		pos
	)
}

class GraficoBarrasIconos inherits GraficoBarras {
	override method nuevaEtiquetaHorizontal(etiqueta, pos) = new Icono(
		image = etiqueta,
		position = pos
	)
	
	override method nuevaEtiquetaVertical(etiqueta, pos) = new Icono(
		image = ("number-" + etiqueta) + ".png",
		position = pos
	)
}

class Visual {
	const property position
	
	method dibujar() {
		game.addVisual(self)
	}
}

class Icono inherits Visual {
	const property image
}

class Etiqueta inherits Visual {
	const property text
}

class Item inherits Visual {
	method image() = "cuadradoliso.jpg"
}
