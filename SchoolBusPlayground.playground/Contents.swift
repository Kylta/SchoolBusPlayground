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

enum RoadSectionType {                  // On créé notre énumération de type RoadSectionType
    case plain, home, school            // Notre énumération comporte 3 cas: plain, home & school
}


class Road {                            // class Road = type Road
    var sections = [RoadSection]()      // propriété variable : sections ; Créé un tableau de section de route qu'on peut parcourir
    static let maxLength = 77           // Propriété constante : maxLength vaut 77
    
    static func createStraightRoad() -> Road {  // Créé une méthode de class sans paramètre qui retourne le type de la class Road
        return Road(length: 11)                 // Il retourne la class Road qui créé 11 sections de routes
    }
    
    init(length: Int) {                 // Initialisation de la class Road avec paramètre "length" de type Int; ensuite conditions
        var length = length             // On créé la variable length du paramètre de l'init length
        if length > Road.maxLength {    // Si length > Road.maxLength (on appel la propriété maxLength de la class Road) /n
            length = Road.maxLength     // length sera égale a la propriété maxLength qui vaut 77. Elle ne dépassera donc jamais 77 sections de routes.
        }
        for _ in 0..<length {           // On parcour le tableau pour aller de 0 jusqu'au paramètre length de type Int lors que l'appel de la méthode ex: 20
            self.sections.append(RoadSection(type: .plain)) // On appel le propriété sections a laquelle on ajoute le tableau des sections sur lequel on
        }                                                   //   met l'énumération ".plain" pour créer une section de route nue */
    }
}

class RoadSection {                     // class RoadSection = type RoadSection
    var type: RoadSectionType           // On créé une propriété de nom type qui ramène notre énumération RoadSectionType
    
    init(type: RoadSectionType) {       // Ensuite on initialise avec un paramètre qui ramène le type RoadSectionType pour rapporter notre énumération
        self.type = type                // Ensuite j'utilise ma propriété type qui comporte RoadSectionType à laquelle je lui ajoute le paramètre type
        switch type {                   // Ensuite j'ajoute mon switch
        case.plain:                         // J'ajoute mon énum ".plain" qui créé une route de section nue avec "canvas.createRoadSection()"
            canvas.createRoadSection()
        case.home:                          // J'ajoute mon énum ".plain" qui créé une route de section avec maison avec "canvas.createHomeSection()"
            canvas.createHomeRoadSection()
        case.school:                         // J'ajoute mon énum ".plain" qui créé une route de section avec école avec "canvas.createSchoolSection()"
            canvas.createSchoolRoadSection()
        }
    }
}

class HomeRoadSection: RoadSection {        // On créé la class HomeRoadSection qui hérite de la class RoadSection
    var children: Int                       // On ajoute la propriété children de type Int
    
    init(children: Int) {                   // On ajoute le paramètre children de type Int
        self.children = children            // On ajoute le paramètre children de type Int à la propriété children
        
        super.init(type: .home)             // On utilise le mot "super" qui permet de faire récupéré les propriété/méthode de la classe mère dans ce cas
    }                                       // on récupère l'init de la class RoadSection donc "super.init(type: .home)"
}

class SchoolRoadSection: RoadSection {      // On créé la class HomeRoadSection qui hérite de la class RoadSection
    init() {                                // On initialise la class
        super.init(type: .school)           // On utilise le mot "super" qui permet de faire récupéré les propriété/méthode de la classe mère dans ce cas
    }                                       // on récupère l'init de la class RoadSection donc "super.init(type: .school)"
}



var route = Road(length: 20)             // On appel la class Road à laquelle on remplie le paramètre pour créer le nombre de sections via la variable route
var unBus = Bus(driverName: "Jean")     // On appel la class Bus à laquelle on ajoute remplie le paramètre via la variable unBus
unBus.drive(road: route)                /* On utilise l'instance unBus à laquelle on utilise la méthode drive qui prend le paramètre "road" auquel on ajoute
                                        le type Road de paramètre 20 via la variable route */

class SchoolBus: Bus {                  // la class ShoolBus hérite de la classe Bus, donc elle retrouve toutes ses propriétés et méthodes
    var schoolName = ""                 // On peut créer des nouvelles propriétés ou méthodes a cette nouvelle classe
}
var unBusScolaire = SchoolBus(driverName: "Jean")   // Ensuite on utilise toutes les propriétés et méthode de la class Bus & SchoolBus
unBusScolaire.seats = 50
