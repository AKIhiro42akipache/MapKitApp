//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Pain_des_Philosophes",
            cityName: "神楽坂",
            coordinates: CLLocationCoordinate2D(latitude: 35.705131, longitude: 139.7352987),
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "paindesphilosophes_01",
                "paindesphilosophes02",
                "paindesphilosophes03",
            ],
            link: "https://parismag.jp/bread/13599"),
        Location(
            name: "ラトリエ ドゥ プレジール",
            cityName:  "成城学園前",
            coordinates: CLLocationCoordinate2D(latitude: 35.6416759, longitude: 139.6031232),
            description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
            imageNames: [
                "plaisir_01",
                "plaisir_02",
                "plaisir_03",
            ],
            link: "http://www.plaisir1999.com/"),
        Location(
            name: "VIRON 渋谷店",
            cityName: "渋谷",
            coordinates: CLLocationCoordinate2D(latitude: 35.6608904, longitude: 139.6942239),
            description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
            imageNames: [
                "vision_1",
                "vison_2",
                "vision_03",
            ],
            link: "https://tabelog.com/tokyo/A1303/A130301/13004626/"),
        Location(
            name: "チクテベーカリー",
            cityName:  "南大沢",
            coordinates: CLLocationCoordinate2D(latitude: 35.6077024, longitude: 139.3763241),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed 'La dame de fer', it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair and was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "tikute_1",
                "tikute_2",
                "tikute_3",
            ],
            link: "https://www.cicoute-bakery.com/"),
        Location(
            name: "アマムダコタン",
            cityName:  "表参道",
            coordinates: CLLocationCoordinate2D(latitude:35.6645449, longitude: 139.7084809),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "ama_2",
                "ama_3",
            ],
            link: "https://amamdacotan.com/"),
    ]
    
}
