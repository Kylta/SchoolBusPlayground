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

class SchoolBus: Bus {                  // la class ShoolBus hérite de la classe Bus, donc elle retrouve toutes ses propriétés et méthodes
    var schoolName = ""                 // On peut créer des nouvelles propriétés ou méthodes a cette nouvelle classe
    
    override func drive(road: Road) {   // On utilise le methode "drive" de la class mère Bus dont on utilise le paramètre road pour ramener la class Road
        for section in road.sections {  // Pour les sections dans la class Road qui créé les sections road.sections = "var sections = [RoadSection]()" l.65
            switch section.type {       // Ensuite on parcours section dont on lui ramène la variable type l.100 pour pouvoir utiliser les énumérations
            case .plain:                // On utilise l'énumération ".plain" pour notre section de route vide
                moveForward()           // Le bus avance lorsque nous sommes sur l'énumération donc "canvas.createRoadSection()" qui est une section vide
            case .home:                 // On utilise l'énumération ".home" pour notre section de route avec maison
                stopBus()               // Le bus s'arrête lorsqu'on est à une section de route avec maison ".home" = canvas.createHomeRoadSection()
            case .school:               // On utilise l'énumération ".school" pour notre section de route avec école
                stopBus()               // Le bus s'arrête lorsqu'on est sur une section de route avec école ".school" = canvas.createSchoolRoadSection()
            }
        }
    }
    
    func pickChildren(from roadSection: RoadSection) {      // On créé la méthode pickChildren qui utilise l'étiquette from du paramètre roadSection qui ramène la class RoadSection
        if let section = roadSection as? HomeRoadSection {  // On controle la class RoadSection en créant la variable section qui change le paramètre roadSection en HomeRoadSection
            occupiedSeats += section.children               // Ensuite on ajoute à la propriété "occupiedSeats" le nombre d'enfant de la propriété children de HomeRoadSection via la nouvelle
        }                                                   // variable créée en local "section", ce qui donne "section.children" => section = class HomeRoadSection donc on peut utiliser la
    }                                                       // propriété children de HomeRoadSection sur la propriété locale section. => section.children
    
    func shouldPickChildren() -> Bool {                     // On créé la méthode shouldPickChildren pour que occupiedSeats soit toujours inférieur à seats avec la fonction retour: Bool (vrai)
        return occupiedSeats < seats                        // Tant que occupiedSeats < seats la fonction = Bool donc elle s'éxecute, si occupiedSeats > seats la fonction = False donc ne
    }                                                       // s'éxécute pas.
    
    func dropChildren() {                                   // On crée la méthode dropChildren pour que la paramètre "occupiedSeats" de la class Bus soit de nouveau à 0
        occupiedSeats = 0                                   // Donc on demande à la propriété occupiedSeats de revenir à 0 soit => occupiedSeats = 0
    }                                                       // Lorsque nous utiliserons cette méthode, occupiedSeats sera égale à 0 soit la réinitialisation de la propriété occupiedSeats
}

class Road {                            // class Road = type Road
    var sections = [RoadSection]()      // propriété variable : sections ; Créé un tableau de section de route qu'on peut parcourir
    static let maxLength = 77           // Propriété constante : maxLength vaut 77
    
    static func createStraightRoad() -> Road {  // Créé une méthode de class sans paramètre qui retourne le type de la class Road
        return Road(length: 11)                 // Il retourne la class Road qui créé 11 sections de routes
    }
    
    static func createRoadToSchool() -> Road {  // On créé notre méthode de class qui retourne la class Road
        let road = Road(length: 30)             // On crée une constante pour ramener notre class Road avec un paramètre qui vaut 30 (30 sections de routes)
        for i in 0..<30 {                       // On parcours notre paramètre de 30 sections de routes, donc pour i allant de 0 à 29.
            if i % 7 == 1 {                     // Si on est sur la 7ème section on crée une section de route avec une maison
                road.sections.append(HomeRoadSection(children: 2))  // On ramène notre class "HomeRoadSection()" auquel on remplie le paramètre children: 2
            } else {                                                // Sinon, on crée des sections de route vide
                road.sections.append(RoadSection(type: .plain))     // On ramène notre class RoadSection  auquel on utilise le paramètre RoadSectionType
            }                                                       // de la class RoadSectionType qui utilise l'énumération ".plain" pour créer la route
        }                                                           // vide
        road.sections.append(SchoolRoadSection())                   // On ramène notre class "SchoolRoadSection" pour créer notre school à la 30ème section
        return road                                                 // Ensuite on retourne notre paramètre road pour avoir nos 30 sections de route.
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

enum RoadSectionType {
    case plain, home, school
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


var road = Road.createRoadToSchool()
var unBusScolaire = SchoolBus(driverName: "Jean")   // Ensuite on utilise toutes les propriétés et méthode de la class Bus & SchoolBus


