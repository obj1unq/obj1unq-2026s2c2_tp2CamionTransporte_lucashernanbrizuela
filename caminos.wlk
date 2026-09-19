import camion.*
object ruta9 {

    method soportaViaje(camion) {
      if (not camion.puedeCircularEnRutaDeNivel(20)){
        self.error("No puede circular en la ruta")
      }
    }
  
}

object caminosVecinales {

    var pesoPermitido = 0

    method soportaViaje(camion) {
      if (camion.pesoTotal() > pesoPermitido){
        self.error("No puede circular en la ruta")
      }
    }

    method pesoPermitido(nuevoPeso) {
      pesoPermitido = nuevoPeso
    }
  
}