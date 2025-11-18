//
//  TouristAttraction.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import Foundation

struct TouristAttractionModel {
    let id: Int
    let name: String
    let description: String
    let address: String
    let longitude: Double
    let latitude: Double
    let like: Int
    let image: String
    var imageURL: URL? {
        return URL(string: image)
    }
}


let dummyTouristAttractions: [TouristAttractionModel] = [
    TouristAttractionModel(
        id: 1,
        name: "TN Kelimutu",
        description: "Taman Nasional Kelimutu terletak di Flores, Indonesia...",
        address: "Detusoko, Kabupaten Ende, NTT",
        longitude: 121.791432,
        latitude: -8.7415482,
        like: 57,
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Kelimutu_2008-08-08.jpg/800px-Kelimutu_2008-08-08.jpg"
    ),
    TouristAttractionModel(
        id: 2,
        name: "Danau Toba",
        description: "Danau Toba adalah lokasi letusan gunung berapi super masif...",
        address: "Kota Pematang Siantar, Sumatera Utara",
        longitude: 98.8932576,
        latitude: 2.6540427,
        like: 12,
        image: "https://cdn.pixabay.com/photo/2016/12/09/11/51/lake-toba-1894746_960_720.jpg"
    ),
    TouristAttractionModel(
        id: 3,
        name: "Gunung Bromo",
        description: "Gunung Bromo adalah sebuah gunung berapi aktif di Jawa Timur...",
        address: "Podokoyo, Tosari, Pasuruan",
        longitude: 112.9355026,
        latitude: -7.9424931,
        like: 88,
        image: "https://images.unsplash.com/photo-1505993597083-3bd19fb75e57?auto=format&fit=crop&w=1354&q=80"
    ),
    TouristAttractionModel(
        id: 4,
        name: "Bunaken",
        description: "Bunaken adalah sebuah pulau seluas 8,08 km² di Teluk Manado...",
        address: "Bunaken, Kabupaten Minahasa, Sulawesi Utara.",
        longitude: 124.7601806,
        latitude: 1.6231908,
        like: 60,
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Sunset_at_Bunaken_Island%2C_Sulawesi%2C_2016.jpg/800px-Sunset_at_Bunaken_Island%2C_Sulawesi%2C_2016.jpg"
    ),
    TouristAttractionModel(
        id: 5,
        name: "Pulau Komodo",
        description: "Pulau Komodo adalah habitat asli hewan komodo...",
        address: "Kabupaten Manggarai Barat, NTT",
        longitude: 119.332549,
        latitude: -8.5892072,
        like: 56,
        image: "https://cdn.pixabay.com/photo/2020/03/21/19/40/komodo-trekking-4955035_960_720.jpg"
    ),
    TouristAttractionModel(
        id: 6,
        name: "Dieng Plateau",
        description: "Dataran tinggi Dieng adalah dataran vulkanik...",
        address: "Batur, Banjarnegara, Jawa Tengah",
        longitude: 109.8994385,
        latitude: -7.2149012,
        like: 46,
        image: "https://cdn.pixabay.com/photo/2018/12/03/14/01/mount-prau-3853489_960_720.jpg"
    ),
    TouristAttractionModel(
        id: 7,
        name: "Kepulauan Raja Ampat",
        description: "Kepulauan Raja Ampat terkenal dengan diving dan keindahan bawah laut...",
        address: "Kabupaten Raja Ampat, Papua Barat",
        longitude: 130.5079122,
        latitude: -0.233333,
        like: 10,
        image: "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?auto=format&fit=crop&w=1350&q=80"
    ),
    TouristAttractionModel(
        id: 8,
        name: "Kepulauan Derawan",
        description: "Kepulauan Derawan berada di Kabupaten Berau...",
        address: "Kabupaten Berau, Kalimantan Timur",
        longitude: 118.2414973,
        latitude: 2.2842912,
        like: 5,
        image: "https://upload.wikimedia.org/wikipedia/commons/4/4e/Derawan_Island_East_Kalimantan.jpg"
    ),
    TouristAttractionModel(
        id: 9,
        name: "Kawah Putih",
        description: "Kawah putih adalah danau vulkanik di kaki Gunung Patuha...",
        address: "Sugihmukti, Pasirjambu, Bandung",
        longitude: 107.399951,
        latitude: -7.166154,
        like: 94,
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Kawah_Putih_from_the_bottom%2C_Bandung_Regency%2C_2014-08-21.jpg/800px-Kawah_Putih_from_the_bottom%2C_Bandung_Regency%2C_2014-08-21.jpg"
    ),
    TouristAttractionModel(
        id: 10,
        name: "Pantai Tanjung Tinggi",
        description: "Pantai ini memiliki batu granit besar...",
        address: "Sijuk, Kabupaten Belitung",
        longitude: 107.7115838,
        latitude: -2.5517187,
        like: 78,
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tanjung_Tinggi_Beach%2C_Bangka-Belitung_Province%2C_Indonesia.jpg/800px-Tanjung_Tinggi_Beach%2C_Bangka-Belitung_Province%2C_Indonesia.jpg"
    ),
    TouristAttractionModel(
        id: 11,
        name: "Banda Neira",
        description: "Banda Neira menawarkan keindahan alam dan sejarah...",
        address: "Kepulauan Banda, Maluku",
        longitude: 129.9167,
        latitude: -4.5333,
        like: 103,
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Bandaneira-0039.JPG/1600px-Bandaneira-0039.JPG"
    ),
    TouristAttractionModel(
        id: 12,
        name: "Air Terjun Wafsarak",
        description: "Air Terjun Wafsarak, tersembunyi di pedalaman Papua...",
        address: "Biak Utara, Papua Barat",
        longitude: 135.3712612,
        latitude: -0.7914797,
        like: 63,
        image: "https://ik.imagekit.io/tvlk/blog/2021/12/Destinasi-Wisata-Biak-Numfor-Air-Terjun-Wafsarak-Shutterstock.jpg?tr=dpr-2,w-675"
    )
]
