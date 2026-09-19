import camion.*
object almacen {
    
  var cosasAlmacenadas = #{}

  method agregarCosasDelCamion(camion) {
   cosasAlmacenadas = cosasAlmacenadas.union(camion.cosasCargadasPorAhora())
  }

  method agregarCosas(cosas) {
    cosasAlmacenadas = cosasAlmacenadas.union(cosas)
  }

  method cosasAlmacenadas() = cosasAlmacenadas 


}