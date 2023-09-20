import rodados.*
import pedidos.*

class Dependencias {
	var property cantidadEmpleados = 0
	const pedidos = []
	const rodados = []
	
	method agregarAFlota(unRodado){
		rodados.add(unRodado)
	}
	
	method quitarDeFlota(unRodado){
		rodados.remove(unRodado)
	}
	
	method pesoTotalFlota(){
		return rodados.sum({rodado=> rodado.peso()})
	}
	
	method todosSuperanXVelocidad(velocidad){
		return rodados.all({r=>r.velocidad()>=velocidad})
	}
	
	method estaBienEquipada(){
		return rodados.size()>=3 && self.todosSuperanXVelocidad(100)
	}
	
		
	
	method capacidadTotalEnColor(color){
		return (self.rodadosDeUnColor(color)).sum({r=>r.capacidad()})
		
	}
	
	method rodadosDeUnColor(unColor) {
		return rodados.filter({r=>r.color()==unColor})
	}
	
	method colorDelRodadoMasRapido(){
		return self.rodadoMasRapido().color()
	}
	
	method rodadoMasRapido() {
		if(rodados.isEmpty()){
			self.error("No se puede calcular el maximo")
		}
		return rodados.max({r=>r.velocidad()})
	}
	
	method capacidadDeLaFlota(){
		return rodados.sum({r=>r.capacidad()})
	}
	
	method capacidadFaltante(){
		return 0.max(cantidadEmpleados - self.capacidadDeLaFlota())
	}
	
	method esGrande(){
		return cantidadEmpleados<=40 && rodados.size() >= 5
	}

	method ningunoSatisface(pedido){
		return rodados.all({ r => not pedido.puedeSerSatisfechoPor(r)})
	}
	
	method pedidosInsatisfechos(){
		return pedidos.filter({p=>self.ningunoSatisface(p)})
	}
	
	
}



















