import wollok.game.*

object sedan {
	var Puntaje = 0
	var property position = game.at(4.5,0)
	method image() = "sedan.png"
}

object pantalla {
	
	//var cantAutos = random
	
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
		//cantAutos.times({
			//i => game.addVisual(new Auto(position = game.at(i+3,10)))
		}
		
	//}
	//method programarTeclas() {
		//TODO: Código autogenerado 
	//}
	//method definirColisiones() {
		//game.onCollideDo(alien,{algo => algo.desaparecer() }) 
	//}
	
	
}