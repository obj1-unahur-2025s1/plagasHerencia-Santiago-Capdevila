class Hogar {
    var mugre
    const confort

    method esBueno() = confort >= mugre / 2
    method recibirAtaque(unaPlaga) {
        mugre = mugre + unaPlaga.daño()
    }
}

class Huerta{
    var produccion
    method esBueno() = produccion > nivelMinimoProduccion.valor()
    method recibirAtaque(unaPlaga) {
        produccion = 0.max(produccion - (produccion * 0.1 + if (unaPlaga.transmiteEnfermedades()) 10 else 0))
    }
}

class Mascota {
  var salud
  
  method esBueno() = salud > 250
  method recibirAtaque(unaPlaga) {
    salud = 0.max(salud - if (unaPlaga.transmiteEnfermedades()) unaPlaga.daño() else 0)
  }
//   method recibirAtaque(unaPlaga) {
//     if (unaPlaga.transmiteEnfermedades()) {
//         salud = 0.max(salud - unaPlaga.daño())
//     }
//   }
}

class Barrio {
    const elementos = []
    method esBueno(unElemento) = unElemento.esBueno()
    method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()
    method cantElementosBuenos() = elementos.count({e => e.esBueno()})
    method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
}

object nivelMinimoProduccion {
  var property valor = 100
}