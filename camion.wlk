import cosas.*
import almacen.*
import caminos.*


object camion {

	const cosas = #{}

	method cosasCargadasPorAhora() {
		return cosas
	}

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todoPesoEsPar() {
	  return cosas.all({cosa => cosa.tienePesoPar()})
	}

	method algunaCosaPesaExacto(pesoABuscar) {
	  return cosas.any({cosa => cosa.peso() == pesoABuscar})
	}

	method pesoTotal() {
	  return 1000 + cosas.sum({cosa => cosa.peso()})
	}

	method estaExcedidoDePeso() {
	  return self.pesoTotal() > 2500
	}

	method cosaConPeligrosidadDe(cantPeligrosidad) { //DUDA
	  const cosasConPeligrosidad = cosas.filter({cosa => cosa.nivelPeligrosidad() == cantPeligrosidad})
	  self.hayUnaCosaConPeligrosidad(cosasConPeligrosidad)
	  return cosasConPeligrosidad
	  
	}

	method hayUnaCosaConPeligrosidad(cosasConPeligrosidad) {
	  if (cosasConPeligrosidad == #{}){
		self.error("No hay cosa con ese nivel de peligrosidad") 
	  }	  
	}

	method cosasPeligrosasSuperiorA(nivelDePeligrosidad) {
	  return self.cosasMasPeligrosasA(nivelDePeligrosidad)
	}

	method cosasMasPeligrosasQue(cosaACoomparar) {
	  return self.cosasMasPeligrosasA(cosaACoomparar.nivelPeligrosidad())
	}

	method cosasMasPeligrosasA(nivel) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method puedeCircularEnRutaDeNivel(nivelDePeligrosidad) {
	  return (not self.estaExcedidoDePeso()) && (self.cosasPeligrosasSuperiorA(nivelDePeligrosidad) == #{})
	}

	method tieneAlgoConPesoEntre(minimo,maximo) {
	  return cosas.any({cosa => cosa.peso() > minimo && cosa.peso() < maximo})
	}

	method elementoMasPesado() {
	  self.verificacionSiHayCosasEnCamion()
	  return cosas.max({cosa => cosa.peso()})
	}

	method verificacionSiHayCosasEnCamion() {
	  if (cosas == #{}){
		self.error("No hay elementos en la camión") 
	  }  
	}

	method pesosDeTodosLosElementos() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method totalDeBultos() {
	  return cosas.sum({cosa => cosa.bultosUsados()})
	}

	method sufirAccidente() {
	  cosas.forEach({cosa => cosa.aplicarEfectoDeAccidente()})
	}

	method transportar(destino, camino) {
		camino.soportaViaje(self)
		destino.agregarCosasDelCamion(self)
		cosas.clear()
	  
	}
	

}
/*

## 4 Reflexionar sobre los conceptos

* Realizar un diagrama estático del sistema de objetos

* Describir los polimorfismos asociados a las colecciones: 
   - ¿Qué nombre tiene el tipo de los objetos polimórficos?
   NO ENTIENDO LA PREGUNTA
   Hay varios tipos de objetos polimorficos (caminos, cosas, almacenes)
   *
   - ¿Qué mensajes componen ese tipo?
   //En base al tipo cosas
   Los mensajes que componene a ese tipo son:
    peso() / nivelDePeligrosidad() / bultosUsados() / aplicarEfectoDeAccidente
   
   - ¿Qué objetos son los emisores de los mensajes polimórficos?
   Los objetos que emiten los mensajes polimorficos
   
   - knightRider
   - arenaAGranel
   - bumblebee
   - paqueteDeLadrillos
   - bateriaAntiaerea
   - residuosRadiactivos
   - contenedorPortuario
   - embalajeDeSeguridad



*/