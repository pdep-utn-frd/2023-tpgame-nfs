import wollok.game.*
import example.*

object score{

	const posicionInicial = game.at(16,1)
	

	method dibujarItem(elemento,posicion){
		game.addVisual(new Visual(image = elemento.image(),position = posicion))
		game.addVisualIn(numberConverter.getNumberImage(elemento.score()),posicion.right(1))
		game.addVisualIn(numberConverter.getNumberImage(elemento.score() ),posicion.right(2))
		
	}

}

object numberConverter{
    method getNumberImage(number){
    	return new Visual(image= ("nro" + number + ".png"))
    }
}