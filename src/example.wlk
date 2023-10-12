import wollok.game.*
import sedan.*
import Monedas.*
import Npcs.*
import Score.*


object gameover {
	method image() = "gameover.png"
	method position() = game.at(-1,1)
}

object ganar{
	method position() = game.at(0,-1)
	method image() = "ganar.jpg"
	
}


object juego{
	method empezar(){
		game.height(18)
		game.width(15)
		game.boardGround("ruta.png")
		game.addVisual(menu)
		game.title("Fast and furious: Panamericana Edition")
		game.start()
		menu.iniciarjuego()
		
		}
}


object menu {
	method image() = "menu.jpg"
	method position() = game.at(0.5,-2)
	
	
	
	method iniciarjuego(){
		keyboard.c().onPressDo{
			game.removeVisual(self)
			pantalla.iniciar()
			
		}}
}

	
class Visual {
	var property image
	var property position = game.origin()
}	
	
	
object pantalla {
	
	const scoreInGame = new Score(
		position = game.at(0,17),
		image='score.png'
	)
	const scoreNumber = new Score(
		position = game.at(0, 17),
		image= sedan.score().toString() + '.png'
	)
	
	var fondo = null
	var cantAutosRojos = 1
	var cantAutosAzules = 1
	
	
	method position() = game.at(-1.5,1)
	method image() = "ruta.png"
	
	method iniciar() {
		
		self.agregarVisuales()
		self.programarTeclas()
		self.definirColisiones1()
		self.definirColisiones2()
		self.spawnAutos()
		self.definirColisiones3()
		self.spawnMonedas()
		self.sumarpuntos()
		self.mostrarscore()
		self.spawnAutos1()
		}
		
	method agregarVisuales() {
		game.addVisualCharacter(sedan)
		game.addVisualCharacter(autoinvisible1)
		game.addVisualCharacter(autoinvisible2)
		game.addVisual(scoreInGame)
		game.addVisual(scoreNumber)			
	}
	method programarTeclas() {
		
		keyboard.d().onPressDo{sedan.moverseDerecha()}
		
			
		keyboard.a().onPressDo{sedan.moverseIzquierda()}
		}
		
	method spawnAutos() {
		game.onTick(2000,"aparece Auto", {new Autos().aparece()})
	}
	
	method spawnAutos1() {
		game.onTick(2500,"aparece Auto1", {new Autos().aparece()})
	}
	
	method spawnMonedas(){
		game.onTick(5000,"aparece moneda",{new Moneda().aparecer()})
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
	
	method sumarpuntos(){
		game.onTick(2300,"suma puntos",{sedan.sumarScore()})
	}
		
	method mostrarscore(){
			game.onTick(1000, 'add score', {
			
			scoreNumber.changeScoreImage(sedan.score())			
		})
	
		}
		
	method estaEnElTablero(ubicacion) = ubicacion.x().between(0, game.width()) && ubicacion.y().between(-5, game.height())		
}
