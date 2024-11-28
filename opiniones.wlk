class Opinion {

    // de 0 a 10, cuánto aprendieron de programación orientada a objetos
    var property objetos
    // de 0 a 10, cuánto aprendieron de programación funcional
    var property funcional
    // de 0 a 10, cuánto aprendieron de programación lógica
    var property logico
    // de 0 a 10, cuánto aprendieron de otras habilidades técnicas, destrezas 
    // o buenas practicas de desarrollo de software 
    var property oficio
    // de 0 a 10, cuánto aprendieron de habilidades "blandas", cultura general, 
    // trabajo en equipo, diseño gráfico, sociablidad, etc.
    var property blandas
    //Ponderación de cada aspecto. 
    //Por defecto, 20% cada una
    //Modificar para ponderar diferente, que sume 1!!
    var property ponderacionObjetos = 0.20
    var property ponderacionFuncional = 0.20
    var property ponderacionLogico = 0.20
    var property ponderacionOficio = 0.20
    var property ponderacionBlandas = 0.20

    method general() = 
        objetos*ponderacionObjetos + 
        funcional*ponderacionFuncional + 
        logico*ponderacionLogico +
        oficio*ponderacionOficio +
        blandas*ponderacionBlandas

}


class Encuesta {
    const property opiniones = []
    const property descripciones = ["wollok.png", "haskell.png", "prolog.png","oficio.png","blandas.png","pdep.png"]
//    const property descripciones = self.resultados().map{r=>r.toString()}
    const property criterios = [{o=>o.objetos()},{o=>o.funcional()},{o=>o.logico()},{o=>o.oficio()},{o=>o.blandas()},{o=>o.general()} ]

    method resultados() = criterios.map({c=>opiniones.sum(c)/opiniones.size()})
}