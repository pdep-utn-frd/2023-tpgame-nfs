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
	
	method desaparecer() {
		game.onTick(1000,"perdiste",{game.stop()})
	}
}



object autoinvisible1{
	var property position = game.at(2,1)
	
	
	
	
}

object autoinvisible2{
	var property position = game.at(16,1)

	
}

class Moneda {
	
	var property evento = null
	var property position = null
	var property image = null
	
	method desaparece(){
		if (game.hasVisual(self)){
			game.removeTickEvent(evento)
			game.removeVisual(self)
		}
	}
	
	method aparecer(){
		evento = "Aparece moneda"
		image = "coin.png"
		const x = (3 .. game.width() - 5).anyOne()
		const y = game.height() - 2
		position = game.at(x,y)
		game.addVisual(self)
		game.onTick(100,evento,{self.avanzar()})
		
		
}
	method avanzar(){
		position = self.position().down(1)
		}

}




class auto{
	var property evento = null
	var property position = null
	var property image = null
	
	method desaparece(){
		if (game.hasVisual(self)){
			game.removeTickEvent(evento)
			game.removeVisual(self)
		}
	}
	
}


class Autos inherits auto{
	

	method aparece(){
		evento = "Aparece auto"
		image = "simple-travel-car-top_view.png"
		const x = (3 .. game.width() - 4).anyOne()
		const y = game.height() - 2
		position = game.at(x,y)
		game.addVisual(self)
		game.onTick(100,evento,{self.avanza()})
		game.onCollideDo(sedan,{algo => sedan.desaparecer() })
		
	}
	
		method avanza(){
		position = self.position().down(1)
	}
	
	
}



object pantalla {
	var fondo = null
	var cantAutosRojos = 1
	var cantAutosAzules = 1
	
	method iniciar() {
		self.configurarInicio()
		self.agregarVisuales()
		self.programarTeclas()
		self.definirColisiones1()
		self.definirColisiones2()
		self.spawnAutos()
		self.definirColisionesfinal()
		self.spawnMonedas()
		
		}
	
	
	
	method configurarInicio() {
		fondo = "Ruta.png"
		game.height(18)
		game.width(15)
		game.title("Fast and furious: Panamericana Edition")
		game.boardGround(fondo)
		game.start()
		
	}
	method agregarVisuales() {
		game.addVisualCharacter(sedan)
		game.addVisualCharacter(autoinvisible1)
		game.addVisualCharacter(autoinvisible2)
		
	}
	method programarTeclas() {
		
		keyboard.d().onPressDo{sedan.moverseDerecha()}
		
			
		keyboard.a().onPressDo{sedan.moverseIzquierda()}
		}
		
	method spawnAutos() {
		game.onTick(2000,"aparece Auto", {new Autos().aparece()})
	}
	
	method spawnMonedas(){
		game.onTick(500,"aparece moneda",{new Moneda().aparecer()})
	}
	
	method definirColisiones1() {
	game.onCollideDo(autoinvisible1,{sedan => sedan.moverseDerecha() }) 
	}
	method definirColisiones2() {
		game.onCollideDo(autoinvisible2, {sedan => sedan.moverseIzquierda()}) 
	}
	
		method definirColisionesfinal() {
		fondo = "gameover.png"
		game.onCollideDo(sedan, {algo => game.boardGround(fondo)}) 
	}
	
}
