//
//  Model.swift
//  RoadMap_UIKit
//
//  Created by Артур Щукин on 22.09.2022.
//
/// конвертирует входящее сообщение в Hello
struct HelloStruct {
    func fromLeohlToHello(input: String?) -> String {
        guard input == "leohl" else {
            return "Error"
        }
        let output = "Hello"
        return output
    }
}
