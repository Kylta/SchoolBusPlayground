/*: 
⬇️ *Vous pouvez ignorez le code ci-dessous, il nous permet juste d'initialiser et de visualiser le canvas à droite.*
 */
import PlaygroundSupport
let canvas = Canvas()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = canvas

/*:
 - - -
 # Découverte du canevas
 Le canevas, c'est l'étendue de pelouse verte qui se trouve sur la droite 🌿.
 Sur ce canevas, nous allons pouvoir dessiner notre route. Et nous allons faire cela en utilisant les fonctions proposées par le canevas :
 ## Route

 `canvas.createRoadSection()`
 - 🛣 Cette fonction permet de **créer une section de route**. A chaque appel de cette fonction, une nouvelle section de route est crée.

 `canvas.createHomeRoadSection()`
 - 🛣🏠 Similaire à la précédente, cette fonction permet de créer une section de route **qui contient une maison**.

 `canvas.createSchoolRoadSection()`
 - 🛣🏫 Similaire à la précédente, cette fonction permet de créer une section de route **qui contient une école**.

 ## Bus
 `canvas.moveBusForward()`

 - 🚌➡️ Cette fonction permet de faire avancer le bus jusqu'à la section de route suivante. Attention, le bus ne peut pas avancer s'il n'y a plus de route devant lui.

 `canvas.stopBus()`
 - 🚌🛑 Cette fonction permet de faire marquer un arrêt au bus.

 ## A vous de jouer !
 */
class Bus {                             // class Bus = type Bus
    var driverName: String              // propriété variable : driverName
    var seats = 20                      // propriété variable : seats
    var occupiedSeats = 0               // propriété variable : occupiedSeats
    
    let numberOfWheel = 4               // propriété constante : Le nombre de roue est constant et vaut 4
    
    init(driverName: String) {
        self.driverName = driverName    // self.driverName appel la propriété et non le paramètre; driverName appel le paramètre et non la propriété
    }
    
    func moveForward() {                // Créé une fonction moveForward qui fait avancé le bus d'une section
        canvas.moveBusForward()
    }
    func stopBus() {                    // Créé une fonction qui fait stoppé le bus momentanément a un point demandé
        canvas.stopBus()
    }
    func drive(road: Road) {            // appelle la class de type "Road"
        for _ in road.sections {        // appelle le paramètre road de propriété "sections" de class Road
            moveForward()               // Permet de faire avancer le bus d'autant de section de route créée par la class Road
        }
    }
}



class Road {                            // class Road = type Road
    var sections = [RoadSection]()      // propriété variable : sections ; Créé un tableau de section de route qu'on peut parcourir

    init(length: Int) {                 // Initialisation de la class Road avec paramètre "length" de type Int; ensuite conditions
        for _ in 0..<length {           // On parcour le tableau pour aller de 0 jusqu'au paramètre length de type Int lors que l'appel de la méthode ex: 20
            self.sections.append(RoadSection()) // On appel le propriété sections a laquelle on ajoute le tableau des sections de routes
        }
    }
}

class RoadSection {                     // class RoadSection = type RoadSection
    
    init() {                            // On itinialise la class RoadSection
        canvas.createRoadSection()      // On ajoute le canvas "canvas.createRoadSection()" pour créer des sections de route avec la class RoadSection
    }
}

var route = Road(length: 20)             // On appel la class Road à laquelle on remplie le paramètre pour créer le nombre de sections via la variable route
var unBus = Bus(driverName: "Jean")     // On appel la class Bus à laquelle on ajoute remplie le paramètre via la variable unBus
unBus.drive(road: route)                /* On utilise l'instance unBus à laquelle on utilise la méthode drive qui prend le paramètre "road" auquel on ajoute
                                        le type Road de paramètre 20 via la variable route */


