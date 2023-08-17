import random
class Nodo:
    def __init__(self, id):
        self.id = id
        self.saliente = []
        self.entrante = []

class Arco:
    def __init__(self, id, costo_recorrido, costo_recoleccion, obligatoria, origen, destino, bidireccional):
        self.id = id
        self.costo_recorrido = costo_recorrido
        self.costo_recoleccion = costo_recoleccion
        self.obligatoria = obligatoria
        self.origen = origen
        self.destino = destino
        self.bidireccional = bidireccional

class Grafo:
    def __init__(self):
        self.nodos = {}
        self.arcos = {}

def construir_grafo(arcos):
    grafo = Grafo()
    IdArco = 0
    for arco in arcos:
        bi_or_uni, origen, destino, costo_recorrido, costo_recoleccion = arco

        if origen not in grafo.nodos:
            grafo.nodos[origen] = Nodo(origen)

        if destino not in grafo.nodos:
            grafo.nodos[destino] = Nodo(destino)

        arco = Arco(IdArco, costo_recorrido, costo_recoleccion, True, grafo.nodos[origen], grafo.nodos[destino], bi_or_uni == "bi")

        grafo.arcos[IdArco] = arco

        grafo.nodos[origen].saliente.append(arco)
        grafo.nodos[destino].entrante.append(arco)

        IdArco += 1

    return grafo



def parsear_resultados_gurobi(resultados_gurobi):
    mapa = {}
    for resultado in resultados_gurobi:
        # Extraemos los nodos del resultado
        nodos = resultado[0][2:-1].split(',')
        nodo_inicial = int(nodos[0])
        nodo_final = int(nodos[1])

        # Extraemos la cantidad de veces que se recorre el arco
        y = int(resultado[1])

        # Usamos la tupla (nodo_inicial, nodo_final) como clave en el mapa
        mapa[(nodo_inicial, nodo_final)] = y
    return mapa


def construir_mapa_adyacencia(grafo, mapa_resultados):
    mapa_adyacencia = {}
    for id, nodo in grafo.nodos.items():
        mapa_adyacencia[nodo.id] = []
        for arco in nodo.saliente:            
            cantidad = mapa_resultados[(nodo.id, arco.destino.id)]
            if cantidad > 0:
                mapa_adyacencia[nodo.id].append([arco.destino.id,cantidad])
    return mapa_adyacencia
    
def elegirSiguiente(mapa_adyacencia, nodo_inicial, avoid):
    mayor_recorrido = 0
    indice_mayor_recorrido = -1  
    for i, (adyacente, recorrido) in enumerate(mapa_adyacencia[nodo_inicial]):
        if avoid is not None and adyacente in avoid:
            continue
        if recorrido > mayor_recorrido:
            mayor_recorrido = recorrido
            indice_mayor_recorrido = i
    return indice_mayor_recorrido

def reparar_solucion(mejor_ruta, mejor_mapa_adyacencia, mapa_adyacencia_copia):
    arcos_faltantes = {}

    for nodo, adyacentes in mejor_mapa_adyacencia.items():
        adyacentes_faltantes = [adyacente for adyacente in adyacentes if adyacente[1] == 1]
        if adyacentes_faltantes:
            arcos_faltantes[nodo] = adyacentes_faltantes
    nodos_faltantes = list(arcos_faltantes.keys())
    #ruta = dfs(False, 1, mapa_adyacencia_copia, nodos_faltantes[0], nodos_faltantes[1])
    #print(ruta)



    return mejor_ruta, mejor_mapa_adyacencia

def dfs(metodo_random, limite_paso_salida, mapa_adyacencia, nodo_inicial, nodo_final, avoid, camino=None): 
    assert avoid is None or isinstance(avoid, list), "avoid no es una lista"

    if camino is None:
        camino = [nodo_inicial]

    if (nodo_inicial == nodo_final and limite_paso_salida == 0):
        return camino
    
    if len(mapa_adyacencia[nodo_inicial]) == 0:
        avoid.append(nodo_inicial)
        camino.pop()
        return None
    indices = list(range(len(mapa_adyacencia[nodo_inicial])))
    if metodo_random:
        random.shuffle(indices)
    
    for i in indices:
        if metodo_random:
            indice_nodo_elegido = i 
            adyacente, recorrido = mapa_adyacencia[nodo_inicial][i]
        else:
            indice_nodo_elegido = elegirSiguiente(mapa_adyacencia, nodo_inicial, avoid) #agregar memoria o aleatoriedad a elegirSiguiente
            adyacente, recorrido = mapa_adyacencia[nodo_inicial][indice_nodo_elegido]
        if avoid is not None and indice_nodo_elegido in avoid:
            continue
        if adyacente == nodo_final:             
            limite_paso_salida -= 1
        camino.append(adyacente)
        recorrido -= 1
        if recorrido == 0:
            del mapa_adyacencia[nodo_inicial][-indice_nodo_elegido]
        break
    return camino

def dfs2(metodo_random, limite_paso_salida, mapa_adyacencia, nodo_inicial, nodo_final, avoid, camino=None):
    assert avoid is None or isinstance(avoid, list), "avoid no es una lista"

    if camino is None:
        camino = [nodo_inicial]
        
    if nodo_inicial == nodo_final and limite_paso_salida == 0:
        return camino

    if nodo_inicial in avoid or len(mapa_adyacencia[nodo_inicial]) == 0:
        return None

    indices = list(range(len(mapa_adyacencia[nodo_inicial])))
    if metodo_random:
        random.shuffle(indices)

    for i in indices:
        adyacente, recorrido = mapa_adyacencia[nodo_inicial][i]
        if adyacente in avoid:
            continue
        if adyacente == nodo_final:
            limite_paso_salida -= 1
        if recorrido > 0:
            mapa_adyacencia[nodo_inicial][i][1] -= 1
            nuevo_camino = camino.copy()
            nuevo_camino.append(adyacente)
            result = dfs(metodo_random, limite_paso_salida, mapa_adyacencia.copy(), adyacente, nodo_final, avoid, nuevo_camino)
            if result:
                return result

    # Si llegamos a este punto, significa que no encontramos un camino válido desde este nodo, entonces lo añadimos a 'avoid'
    avoid.append(nodo_inicial)
    return None



    #while mapa_adyacencia[nodo_inicial] and contador < max_iteraciones:
     #   contador += 1       
      #  if metodo_random:
       #     adyacente, recorrido = random.choice(mapa_adyacencia[nodo_inicial])            
        #else:
            #indice_nodo_elegido = elegirSiguiente(mapa_adyacencia, nodo_inicial)
            #adyacente, recorrido = mapa_adyacencia[nodo_inicial][indice_nodo_elegido]
        #if adyacente == nodo_final: 
            #limite_paso_salida -= 1
        #camino.append(adyacente)
        #recorrido -= 1
        #if recorrido == 0:
            #del mapa_adyacencia[nodo_inicial][-indice_nodo_elegido] # arreglar esto, generar lista de indices 
        #ruta_resultante = dfs(metodo_random, limite_paso_salida, mapa_adyacencia, adyacente ,nodo_final, camino)
        #if ruta_resultante:
            #return ruta_resultante
    
    





 