import wollok.game.*
import example.*


class Moneda {
	
	var property evento = null
	var property position = null
	var property image = null
	
	method desaparece(){
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}
	
	method aparecer(){
		evento = "Aparece moneda"
		image = "coin.png"
		const x = (3 .. game.width() - 5).anyOne()
		const y = game.height() - 2
		position = [game.at(4,14),game.at(6.6,17),game.at(8.6,17),game.at(10.6,17)].anyOne()
		game.addVisual(self)
		game.onTick(100,evento,{self.avanzar()})
		
		
}
	method avanzar(){
		position = self.position().down(1)
		if (!pantalla.estaEnElTablero(position)){self.desaparece()}
		}

}
	