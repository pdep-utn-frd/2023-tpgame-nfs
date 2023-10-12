import example.*
import wollok.game.*
import Monedas.*



object sedan {
	var property score = 0
	var property position = game.at(4.3,2)
	var property monedas = 0

	method image() = "sedan.png"

	method moverseDerecha() {
			position = position.right(1)
			}

	method moverseIzquierda() {
		position = position.left(1)
	}	
	
	method sumaMonedas(cantidad) { monedas += cantidad}
	
	method sumarScore(){
		score += 1
		if (self.score() == 5){
			game.removeTickEvent("aparece Auto")
			game.removeTickEvent("aparece Auto1")
			game.removeTickEvent("aparece moneda")
			game.removeVisual(self)
			keyboard.v().onPressDo{game.stop()}
			game.addVisual(ganar)
		}
	}
	
}


object autoinvisible1{
	var property position = game.at(2,2)	
}


object autoinvisible2{
	var property position = game.at(12.5,2)

	
}