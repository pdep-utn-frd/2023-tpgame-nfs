import example.*
import wollok.game.*



object sedan {
	var property score = 0
	var property position = game.at(4.3,2)
	method image() = "sedan.png"

	method moverseDerecha() {
			position = position.right(1)
			}

	method moverseIzquierda() {
		position = position.left(1)
	}	
}


object autoinvisible1{
	var property position = game.at(2,2)
	
	
	
	
}

object autoinvisible2{
	var property position = game.at(12,2)

	
}