import wollok.game.*

object sedan {
	var Puntaje = 0
	var property position = game.at(4,1)
	method image() = "sedan.png"

	method moverseDerecha() {
			position = position.right(1)
			}

	method moverseIzquierda() {
		position = position.left(1)
	}
}



object autoinvisible1{
	var property position = game.at(2,1)
	
	
	
	
}

object autoinvisible2{
	var property position = game.at(16,1)

	
}




//class AutoAzul{
	
	//var position
	//var puntos = 1
	
	//method position() = position
	
	//method image() = "autoazul.png"
	
	
	
//d}

class autoRojo{
	
	
	var puntos = 1
	
	method image() = "simple-travel-car-top_view.png"
	


}




object autosRojos{

	var property position = game.at(18,20)

	method posicionAleatoria()  {position = game.at(3.randomUpTo(game.width()-3),game.height()-1)}
	
	method generarAuto() = {
		game.onTick(1000,"aparece auto",{new autoRojo()})
	}
	
	method bajarAuto() = {
			position = position.down(1)
	}
	
method desaparecer() {
		game.boardGround("gameover.jpeg")
	}

}



object pantalla {
	
	var cantAutosRojos = 1
	var cantAutosAzules = 1
	
	method iniciar() {
		self.configurarInicio()
		self.agregarVisuales()
		self.programarTeclas()
		self.definirColisiones1()
		self.definirColisiones2()
		self.spawnAutos()
		self.moverAutos()
		}
	
	
	
	method configurarInicio() {
		game.height(18)
		game.width(20)
		game.title("Fast and furious: Panamericana Edition")
		game.boardGround("Ruta.png")
		game.start()
	}
	method agregarVisuales() {
		game.addVisualCharacter(sedan)
		game.addVisualCharacter(autoinvisible1)
		game.addVisualCharacter(autoinvisible2)
		
		//game.addVisual(new AutoAzul(position = game.at(3,10))
		//cantAutosAzules.times({
			//i => game.addVisual(new AutoAzul(position = game.at(i+3,10)))
		//}
		//game.addVisual(tablero)

	}
	method programarTeclas() {
		
		keyboard.d().onPressDo{sedan.moverseDerecha()}
		
			
		keyboard.a().onPressDo{sedan.moverseIzquierda()}
		}
		
	//method definirColisiones() {
		//game.onCollideDo(sedan,{algo => sedan.desaparecer() }) 
	//}
	
	method moverAutos(){
		game.onTick(500,"mueve auto", autosRojos.bajarAuto())
	}
	
	method spawnAutos() {
		game.onTick(1000,"aparece Auto", autosRojos.generarAuto())
	}
	method definirColisiones1() {
		game.onCollideDo(autoinvisible1,{algo => algo.moverseDerecha() }) 
	}
	method definirColisiones2() {
		game.onCollideDo(autoinvisible2,{algo => algo.moverseIzquierda()}) 
	}
}
