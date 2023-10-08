import wollok.game.*
import sedan.*
import Monedas.*
import Npcs.*
import Score.*


	
class Visual {
	var property image
	var property position = game.origin()
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
		self.definirColisiones3()
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
		game.onTick(2500,"aparece moneda",{new Moneda().aparecer()})
	}
	
	method definirColisiones1() {
	game.onCollideDo(autoinvisible1,{algo => sedan.moverseDerecha() }) 
	}
	method definirColisiones2() {
		game.onCollideDo(autoinvisible2, {algo => sedan.moverseIzquierda()}) 
	}
	
	method definirColisiones3(){
		game.onCollideDo(sedan,{algo => algo.desaparece()})
	}
	
	
	method estaEnElTablero(ubicacion) = ubicacion.x().between(0, game.width()) && ubicacion.y().between(-5, game.height())
	
		
}
