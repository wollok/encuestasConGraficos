class Opinion {

    var property objetos

    var property funcional

    var property logico

}


class Encuesta {
    const property opiniones = []
    const property descripciones = ["wollok.png", "haskell.png", "prolog.png"]
    const property criterios = [{o=>o.objetos()},{o=>o.funcional()},{o=>o.logico()} ]

    method resultados() = criterios.map({c=>opiniones.sum(c)/opiniones.size()})
}