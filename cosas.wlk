object knightRider {
	
	method peso() {
		return 500 
	}

	method bultosUsados() {
	  return 1
	}

	method nivelPeligrosidad() {
		 return 10
	}

	method tienePesoPar() {
	  return (self.peso() % 2) == 0
	}

	method aplicarEfectoDeAccidente() {
	  
	}

}

object arenaAGranel {
	var pesoActual = 0

	method peso() {
	  return pesoActual
	}

	method bultosUsados() {
	  return 1
	}	

	method nivelPeligrosidad() {
		return 1
	}

	method cambiarDePeso(nuevoPeso) {
		pesoActual = nuevoPeso
	} 

	method tienePesoPar() {
	  return (self.peso() % 2) == 0
	}

	method aplicarEfectoDeAccidente() {
		pesoActual += 20
	}
}

object bumblebee {
	var modoActual = modoAuto
	
	method peso() {
		return 800
	}
	
	method bultosUsados() {
	  return 2
	}


	method nivelPeligrosidad() {
		return modoActual.nivelPeligrosidad()
	}

	method tranformarA() {
		modoActual = modoActual.cambiarModo()
	} 

	method tienePesoPar() {
	  return (self.peso() % 2) == 0
	}

	method modoActual() {
	  return modoActual
	}

	method aplicarEfectoDeAccidente() {
	  self.tranformarA()
	}
}

object modoAuto {
  method nivelPeligrosidad() = 15 

  method cambiarModo() {
	return modoRobot
  }
}

object modoRobot {

  method nivelPeligrosidad() = 30 

  method cambiarModo() = modoAuto
}

object paqueteDeLadrillos {

	var cantidadDeLadrillos = 0

	method peso() {
		return 2 * cantidadDeLadrillos
	}

	method bultosUsados() {
	  return if (cantidadDeLadrillos <= 100){
		1
	  }else if (cantidadDeLadrillos <= 300){
		2
	  }else{
		3
	  }
	}
	
	method nivelPeligrosidad() {
		return 2
	}

	method nuevaCantidadDeLadrillos(cantidad) {
		cantidadDeLadrillos = cantidad
	}

	method cantidadDeLadrillos() {
	  return cantidadDeLadrillos
	}

	method tienePesoPar() {
	  return (self.peso() % 2) == 0
	}	

	//Paquete de ladrillos: pierde hasta 12 ladrillos. Si tenía menos de 12 queda en 0.

	method aplicarEfectoDeAccidente() {
	  if (cantidadDeLadrillos <= 12){
		cantidadDeLadrillos = 0
	  }else{
		cantidadDeLadrillos -= 12
	  }
	}
}

object bateriaAntiaerea {

	var estaConMisiles = false 

	method peso() {
		if (estaConMisiles){
			return 300
		}else{
			return 200
		}
	}

	method bultosUsados() {
	  if (estaConMisiles){
		return 2
	  }else{
		return 1
	  }
	}

	method nivelPeligrosidad() {
		if (estaConMisiles){
			return 100
		}else{
			return 0
		}
	}

	method cargarMisiles() {
	  estaConMisiles = true
	}

	method descargarMisiles() { //OJO
	  estaConMisiles = false
	}

	method tienePesoPar() {
	  return (self.peso() % 2) == 0
	}

	method estaConMisiles() = estaConMisiles 

	method aplicarEfectoDeAccidente() {
		self.descargarMisiles()
	}
}

object residuosRadiactivos {

	var pesoActual = 0 

	method peso() {
		return pesoActual
	}

	method bultosUsados() {
	  return 1
	}	
	
	method nivelPeligrosidad() {
		return 200
	}

	method tienePesoPar() {
	  return (self.peso() % 2) == 0
	}

	method pesoNuevo(nuevoPeso) {
	  pesoActual = nuevoPeso
	}

	method aplicarEfectoDeAccidente() {
	  pesoActual += 15
	}
  
}

object contenedorPortuario {
  const cosasDentro = #{}
  
  method peso() {
	return 100 + cosasDentro.sum({cosa => cosa.peso()})
  }
  
  method bultosUsados() {
	return 1 + cosasDentro.sum({cosa => cosa.bultosUsados()})
  }  

  method agregarCosaAlContenedor(cosaAAgregar) {
	cosasDentro.add(cosaAAgregar)
  }
  
  method nivelPeligrosidad() {
	if (cosasDentro == #{}){
		return 0
	}else{
		return cosasDentro.map({cosa => cosa.nivelPeligrosidad()}).max()
	}
  }

  /*
  Contenedor portuario: hace que reaccione cada una de las cosas que
   tiene adentro (por ejemplo, si llevaba a Bumblebee, éste queda en modo robot).
   */

   method aplicarEfectoDeAccidente() {
	 cosasDentro.forEach({cosa => cosa.aplicarEfectoDeAccidente()})
   }
}

object embalajeDeSeguridad {

    var elementoAEnvolver = knightRider

	method elementoAEnvolver() {
		return elementoAEnvolver
	}

	method bultosUsados() {
	  return 2
	}	

	method elementoAEnvolver(elemento) {
		elementoAEnvolver = elemento
	}
	method peso() {
		return elementoAEnvolver.peso()
	}
	
	method nivelPeligrosidad() {
		return elementoAEnvolver.nivelPeligrosidad()/2
	}

	method aplicarEfectoDeAccidente() {
	  
	}
}

