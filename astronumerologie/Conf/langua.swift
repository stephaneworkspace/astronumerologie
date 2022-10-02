//
// Created by Stéphane on 05.09.22.
//

import Foundation

// Language

enum L {
    case F, E
}

// VInput

enum LEData: String {
    case F = "Données",
         E = "Datas"
}

func LData(L: L) -> String {
    switch L {
    case .F:
        return LEData.F.rawValue
    case .E:
        return LEData.E.rawValue
    }
}

enum LELocalisation: String {
    case F = "Coordonnées",
         E = "Localisation"
}

func LLocalisation(L: L) -> String {
    switch L {
    case .F:
        return LELocalisation.F.rawValue
    case .E:
        return LELocalisation.E.rawValue
    }
}

enum LEBirthDate: String {
    case F = "Date de naissance",
         E = "Birthdate"
}

func LBirthDate(L: L) -> String {
    switch L {
    case .F:
        return LEBirthDate.F.rawValue
    case .E:
        return LEBirthDate.E.rawValue
    }
}

enum LEFirstName: String {
    case F = "Prénom",
         E = "First Name"
}

func LFirstName(L: L) -> String {
    switch L {
    case .F:
        return LEFirstName.F.rawValue
    case .E:
        return LEFirstName.E.rawValue
    }
}

enum LESecondName: String {
    case F = "2ème prénom",
         E = "Second Name"
}

func LSecondName(L: L) -> String {
    switch L {
    case .F:
        return LESecondName.F.rawValue
    case .E:
        return LESecondName.E.rawValue
    }
}

enum LEThridName: String {
    case F = "3ème prénom",
         E = "Thrid Name"
}

func LThirdName(L: L) -> String {
    switch L {
    case .F:
        return LEThridName.F.rawValue
    case .E:
        return LEThridName.E.rawValue
    }
}

enum LELastName: String {
    case F = "Nom de famille",
         E = "Last Name"
}

func LLastName(L: L) -> String {
    switch L {
    case .F:
        return LELastName.F.rawValue
    case .E:
        return LELastName.E.rawValue
    }
}

enum LELastNameAux: String {
    case F = "Nom de famille aux.",
         E = "Last Name Aux."
}

func LLastNameAux(L: L) -> String {
    switch L {
    case .F:
        return LELastNameAux.F.rawValue
    case .E:
        return LELastNameAux.E.rawValue
    }
}

func LLatitude(L: L) -> String {
    switch L {
    case .F:
        return "Latitude"
    case .E:
        return "Latitude"
    }
}

func LLongitude(L: L) -> String {
    switch L {
    case .F:
        return "Longitude"
    case .E:
        return "Longitude"
    }
}

// VNumerologie

enum LENumerologie: String {
    case F = "Numerologie",
         E = "Numerology"
}

func LNumerologie(L: L) -> String {
    switch L {
    case .F:
        return LENumerologie.F.rawValue
    case .E:
        return LENumerologie.E.rawValue
    }
}

enum LEBorn: String {
    case F = "La naissance",
         E = "Born"
}

func LBorn(L: L) -> String {
    switch L {
    case .F:
        return LEBorn.F.rawValue
    case .E:
        return LEBorn.E.rawValue
    }
}

enum LEAge: String {
    case F = "L'age",
         E = "Age"
}

func LAge(L: L) -> String {
    switch L {
    case .F:
        return LEAge.F.rawValue
    case .E:
        return LEAge.E.rawValue
    }
}

enum LELifePath: String {
    case F = "Le chemin de vie",
         E = "The life path"
}

func LLifePath(L: L) -> String {
    switch L {
    case .F:
        return LELifePath.F.rawValue
    case .E:
        return LELifePath.E.rawValue
    }
}

func LCycle(L: L) -> String {
    switch L {
    case .F:
        return "Cycle"
    case .E:
        return "Cycle"
    }
}

func LCalcul(L: L) -> String {
    switch L {
    case .F:
        return "Calcul"
    case .E:
        return "Calcul"
    }
}

enum LENumber: String {
    case F = "Nombre",
         E = "Number"
}

func LNombre(L: L) -> String {
    switch L {
    case .F:
        return LENumber.F.rawValue
    case .E:
        return LENumber.E.rawValue
    }
}

enum LECycleRealisation: String {
    case F = "Cycle de réalisation",
         E = "Realisation cycle"
}

func LCycleRealisation(L: L) -> String {
    switch L {
    case .F:
        return LECycleRealisation.F.rawValue
    case .E:
        return LECycleRealisation.E.rawValue
    }
}

enum LECycleRealisation1JM: String {
    case F = "0 à 35 ans",
         E = "0 to 35 year"
}

enum LECycleRealisation2JM: String {
    case F = "0 à 34 ans",
         E = "0 to 34 year"
}

enum LECycleRealisation3JM: String {
    case F = "0 à 33 ans",
         E = "0 to 33 year"
}

enum LECycleRealisation4JM: String {
    case F = "0 à 32 ans",
         E = "0 to 32 year"
}

enum LECycleRealisation5JM: String {
    case F = "0 à 31 ans",
         E = "0 to 31 year"
}

enum LECycleRealisation6JM: String {
    case F = "0 à 30 ans",
         E = "0 to 30 year"
}

enum LECycleRealisation7JM: String {
    case F = "0 à 29 ans",
         E = "0 to 29 year"
}

enum LECycleRealisation8JM: String {
    case F = "0 à 28 ans",
         E = "0 to 28 year"
}

enum LECycleRealisation9JM: String {
    case F = "0 à 27 ans",
         E = "0 to 27 year"
}

enum LECycleRealisation1JA: String {
    case F = "35 à 44 ans",
         E = "35 to 44 year"
}

enum LECycleRealisation2JA: String {
    case F = "34 à 43 ans",
         E = "34 to 43 year"
}

enum LECycleRealisation3JA: String {
    case F = "33 à 42 ans",
         E = "33 to 42 year"
}

enum LECycleRealisation4JA: String {
    case F = "32 à 41 ans",
         E = "32 to 41 year"
}

enum LECycleRealisation5JA: String {
    case F = "31 à 40 ans",
         E = "31 to 40 year"
}

enum LECycleRealisation6JA: String {
    case F = "30 à 39 ans",
         E = "30 to 39 year"
}

enum LECycleRealisation7JA: String {
    case F = "29 à 38 ans",
         E = "29 to 38 year"
}

enum LECycleRealisation8JA: String {
    case F = "28 à 37 ans",
         E = "28 to 37 year"
}

enum LECycleRealisation9JA: String {
    case F = "27 à 36 ans",
         E = "27 to 36 year"
}

enum LECycleRealisation112: String {
    case F = "44 à 53 ans",
         E = "44 to 53 year"
}

enum LECycleRealisation212: String {
    case F = "43 à 52 ans",
         E = "43 to 52 year"
}

enum LECycleRealisation312: String {
    case F = "42 à 51 ans",
         E = "42 to 51 year"
}

enum LECycleRealisation412: String {
    case F = "41 à 50 ans",
         E = "41 to 50 year"
}

enum LECycleRealisation512: String {
    case F = "40 à 49 ans",
         E = "40 to 49 year"
}

enum LECycleRealisation612: String {
    case F = "39 to 48 ans",
         E = "39 to 48 year"
}

enum LECycleRealisation712: String {
    case F = "38 to 47 ans",
         E = "38 to 47 year"
}

enum LECycleRealisation812: String {
    case F = "37 to 46 ans",
         E = "37 to 46 year"
}

enum LECycleRealisation912: String {
    case F = "36 to 45 ans",
         E = "36 to 45 year"
}

enum LECycleRealisation1MA: String {
    case F = "dès 53 ans",
         E = "> 53 year"
}

enum LECycleRealisation2MA: String {
    case F = "dès 52 ans",
         E = "> 52 year"
}

enum LECycleRealisation3MA: String {
    case F = "dès 51 ans",
         E = "> 51 year"
}

enum LECycleRealisation4MA: String {
    case F = "dès 50 ans",
         E = "> 50 year"
}

enum LECycleRealisation5MA: String {
    case F = "dès 49 ans",
         E = "> 49 year"
}

enum LECycleRealisation6MA: String {
    case F = "dès 48 ans",
         E = "> 48 year"
}

enum LECycleRealisation7MA: String {
    case F = "dès 47 ans",
         E = "> 47 year"
}

enum LECycleRealisation8MA: String {
    case F = "dès 46 ans",
         E = "> 46 year"
}

enum LECycleRealisation9MA: String {
    case F = "dès 45 ans",
         E = "> 45 year"
}

enum ECycleRealisation {
    case JplusM, JplusA, UnplusDeux, MplusA
}

func LCycleRealisation(L: L, iLivePath: Int, eCycle: ECycleRealisation) -> String {
    switch eCycle {
    case .JplusM:
        switch iLivePath {
        case 1:
            switch L {
            case .F:
                return LECycleRealisation1JM.F.rawValue
            case .E:
                return LECycleRealisation1JM.E.rawValue
            }
        case 2:
            switch L {
            case .F:
                return LECycleRealisation2JM.F.rawValue
            case .E:
                return LECycleRealisation2JM.E.rawValue
            }
        case 3:
            switch L {
            case .F:
                return LECycleRealisation3JM.F.rawValue
            case .E:
                return LECycleRealisation3JM.E.rawValue
            }
        case 4:
            switch L {
            case .F:
                return LECycleRealisation4JM.F.rawValue
            case .E:
                return LECycleRealisation4JM.E.rawValue
            }
        case 5:
            switch L {
            case .F:
                return LECycleRealisation5JM.F.rawValue
            case .E:
                return LECycleRealisation5JM.E.rawValue
            }
        case 6:
            switch L {
            case .F:
                return LECycleRealisation6JM.F.rawValue
            case .E:
                return LECycleRealisation6JM.E.rawValue
            }
        case 7:
            switch L {
            case .F:
                return LECycleRealisation7JM.F.rawValue
            case .E:
                return LECycleRealisation7JM.E.rawValue
            }
        case 8:
            switch L {
            case .F:
                return LECycleRealisation8JM.F.rawValue
            case .E:
                return LECycleRealisation8JM.E.rawValue
            }
        case 9:
            switch L {
            case .F:
                return LECycleRealisation9JM.F.rawValue
            case .E:
                return LECycleRealisation9JM.E.rawValue
            }
        default:
            switch L {
            case .F:
                return LECycleRealisation1JM.F.rawValue
            case .E:
                return LECycleRealisation1JM.E.rawValue
            }
        }
    case .JplusA:
        switch iLivePath {
        case 1:
            switch L {
            case .F:
                return LECycleRealisation1JA.F.rawValue
            case .E:
                return LECycleRealisation1JA.E.rawValue
            }
        case 2:
            switch L {
            case .F:
                return LECycleRealisation2JA.F.rawValue
            case .E:
                return LECycleRealisation2JA.E.rawValue
            }
        case 3:
            switch L {
            case .F:
                return LECycleRealisation3JA.F.rawValue
            case .E:
                return LECycleRealisation3JA.E.rawValue
            }
        case 4:
            switch L {
            case .F:
                return LECycleRealisation4JA.F.rawValue
            case .E:
                return LECycleRealisation4JA.E.rawValue
            }
        case 5:
            switch L {
            case .F:
                return LECycleRealisation5JA.F.rawValue
            case .E:
                return LECycleRealisation5JA.E.rawValue
            }
        case 6:
            switch L {
            case .F:
                return LECycleRealisation6JA.F.rawValue
            case .E:
                return LECycleRealisation6JA.E.rawValue
            }
        case 7:
            switch L {
            case .F:
                return LECycleRealisation7JA.F.rawValue
            case .E:
                return LECycleRealisation7JA.E.rawValue
            }
        case 8:
            switch L {
            case .F:
                return LECycleRealisation8JA.F.rawValue
            case .E:
                return LECycleRealisation8JA.E.rawValue
            }
        case 9:
            switch L {
            case .F:
                return LECycleRealisation9JA.F.rawValue
            case .E:
                return LECycleRealisation9JA.E.rawValue
            }
        default:
            switch L {
            case .F:
                return LECycleRealisation1JA.F.rawValue
            case .E:
                return LECycleRealisation1JA.E.rawValue
            }
        }
    case .UnplusDeux:
        switch iLivePath {
        case 1:
            switch L {
            case .F:
                return LECycleRealisation112.F.rawValue
            case .E:
                return LECycleRealisation112.E.rawValue
            }
        case 2:
            switch L {
            case .F:
                return LECycleRealisation212.F.rawValue
            case .E:
                return LECycleRealisation212.E.rawValue
            }
        case 3:
            switch L {
            case .F:
                return LECycleRealisation312.F.rawValue
            case .E:
                return LECycleRealisation312.E.rawValue
            }
        case 4:
            switch L {
            case .F:
                return LECycleRealisation412.F.rawValue
            case .E:
                return LECycleRealisation412.E.rawValue
            }
        case 5:
            switch L {
            case .F:
                return LECycleRealisation512.F.rawValue
            case .E:
                return LECycleRealisation512.E.rawValue
            }
        case 6:
            switch L {
            case .F:
                return LECycleRealisation612.F.rawValue
            case .E:
                return LECycleRealisation612.E.rawValue
            }
        case 7:
            switch L {
            case .F:
                return LECycleRealisation712.F.rawValue
            case .E:
                return LECycleRealisation712.E.rawValue
            }
        case 8:
            switch L {
            case .F:
                return LECycleRealisation812.F.rawValue
            case .E:
                return LECycleRealisation812.E.rawValue
            }
        case 9:
            switch L {
            case .F:
                return LECycleRealisation912.F.rawValue
            case .E:
                return LECycleRealisation912.E.rawValue
            }
        default:
            switch L {
            case .F:
                return LECycleRealisation112.F.rawValue
            case .E:
                return LECycleRealisation112.E.rawValue
            }
        }
    case .MplusA:
        switch iLivePath {
        case 1:
            switch L {
            case .F:
                return LECycleRealisation1MA.F.rawValue
            case .E:
                return LECycleRealisation1MA.E.rawValue
            }
        case 2:
            switch L {
            case .F:
                return LECycleRealisation2MA.F.rawValue
            case .E:
                return LECycleRealisation2MA.E.rawValue
            }
        case 3:
            switch L {
            case .F:
                return LECycleRealisation3MA.F.rawValue
            case .E:
                return LECycleRealisation3MA.E.rawValue
            }
        case 4:
            switch L {
            case .F:
                return LECycleRealisation4MA.F.rawValue
            case .E:
                return LECycleRealisation4MA.E.rawValue
            }
        case 5:
            switch L {
            case .F:
                return LECycleRealisation5MA.F.rawValue
            case .E:
                return LECycleRealisation5MA.E.rawValue
            }
        case 6:
            switch L {
            case .F:
                return LECycleRealisation6MA.F.rawValue
            case .E:
                return LECycleRealisation6MA.E.rawValue
            }
        case 7:
            switch L {
            case .F:
                return LECycleRealisation7MA.F.rawValue
            case .E:
                return LECycleRealisation7MA.E.rawValue
            }
        case 8:
            switch L {
            case .F:
                return LECycleRealisation8MA.F.rawValue
            case .E:
                return LECycleRealisation8MA.E.rawValue
            }
        case 9:
            switch L {
            case .F:
                return LECycleRealisation9MA.F.rawValue
            case .E:
                return LECycleRealisation9MA.E.rawValue
            }
        default:
            switch L {
            case .F:
                return LECycleRealisation1MA.F.rawValue
            case .E:
                return LECycleRealisation1MA.E.rawValue
            }
        }
    }
}

enum LECycleUniversels: String {
    case F = "Cycle universels",
         E = "Universal Cycle"
}

func LCycleUniversels(L: L) -> String {
    switch L {
    case .F:
        return LECycleUniversels.F.rawValue
    case .E:
        return LECycleUniversels.E.rawValue
    }
}

enum LEAgeDe: String {
    case F = "Age de/à",
         E = "Age to/bis"
}

func LAgeDe(L: L) -> String {
    switch L {
    case .F:
        return LEAgeDe.F.rawValue
    case .E:
        return LEAgeDe.E.rawValue
    }
}

enum LECycleUniversel1: String {
    case F = "0 à 9 ans",
         E = "0 to 9 year"
}

enum LECycleUniversel2: String {
    case F = "9 à 18 ans",
         E = "9 to 18 year"
}

enum LECycleUniversel3: String {
    case F = "18 à 27 ans",
         E = "18 to 27 year"
}

enum LECycleUniversel4: String {
    case F = "27 à 36 ans",
         E = "27 to 36 year"
}

enum LECycleUniversel5: String {
    case F = "36 à 45 ans",
         E = "36 to 45 year"
}

enum LECycleUniversel6: String {
    case F = "45 à 54 ans",
         E = "45 to 54 year"
}

enum LECycleUniversel7: String {
    case F = "54 à 63 ans",
         E = "54 to 63 year"
}

enum LECycleUniversel8: String {
    case F = "63 à 72 ans",
         E = "63 to 72 year"
}

enum LECycleUniversel9: String {
    case F = "72 à 81 ans",
         E = "72 to 81 year"
}

func LCycleUniversel(L: L, iNombre: Int) -> String {
    switch iNombre {
    case 1:
        switch L {
        case .F:
            return LECycleUniversel1.F.rawValue
        case .E:
            return LECycleUniversel1.E.rawValue
        }
    case 2:
        switch L {
        case .F:
            return LECycleUniversel2.F.rawValue
        case .E:
            return LECycleUniversel2.E.rawValue
        }
    case 3:
        switch L {
        case .F:
            return LECycleUniversel3.F.rawValue
        case .E:
            return LECycleUniversel3.E.rawValue
        }
    case 4:
        switch L {
        case .F:
            return LECycleUniversel4.F.rawValue
        case .E:
            return LECycleUniversel4.E.rawValue
        }
    case 5:
        switch L {
        case .F:
            return LECycleUniversel5.F.rawValue
        case .E:
            return LECycleUniversel5.E.rawValue
        }
    case 6:
        switch L {
        case .F:
            return LECycleUniversel6.F.rawValue
        case .E:
            return LECycleUniversel6.E.rawValue
        }
    case 7:
        switch L {
        case .F:
            return LECycleUniversel7.F.rawValue
        case .E:
            return LECycleUniversel7.E.rawValue
        }
    case 8:
        switch L {
        case .F:
            return LECycleUniversel8.F.rawValue
        case .E:
            return LECycleUniversel8.E.rawValue
        }
    case 9:
        switch L {
        case .F:
            return LECycleUniversel9.F.rawValue
        case .E:
            return LECycleUniversel9.E.rawValue
        }
    default:
        switch L {
        case .F:
            return LECycleUniversel1.F.rawValue
        case .E:
            return LECycleUniversel1.E.rawValue
        }
    }
}