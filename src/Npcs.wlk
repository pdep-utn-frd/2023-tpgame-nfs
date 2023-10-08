import wollok.game.*
import example.*


class Auto{
	var property evento = null
	var property position = null
	var property image = null
}


class Autos inherits Auto{
	
	method aparece(){
		evento = "Aparece auto"
		image = "simple-travel-car-top_view.png"
		const x = (3 .. game.width() - 4).anyOne()
		const y = game.height() - 2
		position = game.at(x,y)
		game.addVisual(self)
		game.onTick(50,evento,{self.avanza()})		
	}
	
	
	method desaparece(){
		if (game.hasVisual(self)){
			game.removeTickEvent(evento)
			game.removeVisual(self)
			game.boardGround("gameover.png")
			game.stop()
		}
	}
	
	method desaparecer(){
		if (game.hasVisual(self)){
			game.removeTickEvent(evento)
			game.removeVisual(self)
		}
		
		}
	
	method avanza(){
		position = self.position().down(0.5)
		if (!pantalla.estaEnElTablero(position)){self.desaparecer()}
		}
		
	}
	