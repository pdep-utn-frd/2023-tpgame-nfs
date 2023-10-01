import wollok.game.*

object sedan {
	var Puntaje = 0
	var property position = game.at(4.5,0)
	method image() = "sedan.png"
}

class AutoAzul{
	
	var position
	var puntos = 1
	
	method position() = position
	
	method image() = "car1spr.png"
	
	
	
}

class AutoRojo{
	
	var position
	var puntos = 1

	method position() = position
	
	method image() = "simple-travel-car-top_view.png"
	
	
	

}


object pantalla {
	
	var cantAutosRojos = 1
	var cantAutosAzules = 1
	
	//method iniciar() {
		//self.configurarInicio()
		//self.agregarVisuales()
		//self.programarTeclas()
		//self.definirColisiones()
	//}
	method configurarInicio() {
		game.height(18)
		game.width(13)
		game.title("Driving by Panamericana")
		game.boardGround("Ruta.png")
		game.start()
	}
	method agregarVisuales() {
		game.addVisualCharacter(sedan)
		cantAutosRojos.times({
			i => game.addVisual(new AutoRojo(position = game.at(i+3,10)))
		})
		
		cantAutosAzules.times({
			i => game.addVisual(new AutoAzul(position = game.at(i+3,10)))
		})
		//game.addVisual(tablero)

	//}
	//method programarTeclas() {
		//TODO: Código autogenerado 
	//}
	//method definirColisiones() {
		//game.onCollideDo(alien,{algo => algo.desaparecer() }) 
	//}
	
	
}
}