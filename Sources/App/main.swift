import Vapor

let drop = Droplet()

drop.get("template1") { request in
    return try drop.view.make("hello", Node(node: ["name": "Alex"]))
}

drop.get("template2", String.self) { request, name in
    return try drop.view.make("hello", Node(node: ["name": name]))
}

drop.get("template3") { request in
    let users = try ["Alex", "Artur", "Iura", "Helen"].makeNode()
    return try drop.view.make("hello2", Node(node: ["users": users]))
}

drop.get("template4") { request in
    let users = try [
        ["name": "Alex", "emal": "pronin.alx@gmail.com"].makeNode(),
        ["name": "Artur", "emal": "a.redin@sitis.com.ua"].makeNode(),
        ["name": "Iura", "emal": "i.simko@rit-js.com"].makeNode()
        ].makeNode()
    return try drop.view.make("hello3", Node(node: ["users": users]))
}

drop.run()
