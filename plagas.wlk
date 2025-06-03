import elementos.*
// Superclase
class Plaga {
    var poblacion

    method transmiteEnfermedades() = poblacion >= 10
    method daño() = poblacion
    method efectoDeAtacar() {
        poblacion = poblacion + poblacion * 0.10
    }
    method atacar(unElemento) {
        unElemento.recibirAtaque(self)
        self.efectoDeAtacar()
    }
}

class Cucarachas inherits Plaga {
    var pesoPromedioBicho

    override method daño() = super() * 0.5
    override method transmiteEnfermedades() = super() >= 10 && pesoPromedioBicho >= 10
    override method efectoDeAtacar() {
        super()
        pesoPromedioBicho = pesoPromedioBicho + 2
    }
}

class Pulgas inherits Plaga {
    override method daño() = super() * 2
}

class Garrapatas inherits Pulgas {
    override method efectoDeAtacar() {
        poblacion = poblacion + poblacion * 0.20
    }
}

class Mosquitos inherits Plaga {
  override method daño() = super()
  override method transmiteEnfermedades() = super() && poblacion % 3 == 0
}