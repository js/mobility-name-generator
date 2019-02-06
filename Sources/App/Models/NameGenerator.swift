//
//  NameGenerator.swift
//  App
//
//  Created by Johan Sørensen on 05/02/2019.
//

import Foundation

struct Startup {
  let name: String
  let mission: String
}

struct NameGenerator {
  private let prefixes = [
    "zvi",
    "bee",
    "li",
    "sco",
    "ska",
    "wii",
    "vo",
    "doo",
    "ro",
    "zao",
    "mobi",
    "spi",
    "spa",
    "spin",
    "zoo",
    "roo",
    "zaa",
    "zii",
    "zpii",
    "sii",
    "soo",
    "skvi",
    "zvi",
    "skid",
    "zwo",
    "zwi",
  ]

  private let suffixes = [
    "pp",
    "pps",
    "tt",
    "me",
    "es",
    "em",
    //  "am",
    //"oi",
    "z",
    "zz",
    "go",
    "ez",
    "sh",
    "ki",
    "mi",
  ]

  private let scopes = [
    "shared",
    "smart",
    "on-demand",
    "luxury",
    "extreme",
    "dockless",
    "electric",
    "hybrid",
    "exclusive",
  ]

  private let kinds = [
    "cargo",
    "electric",
    "hover",
    "self-driving",
    "biofueled",
    "green",
    "3D printed",
    "AI-controlled",
    "delivery",
    "self-assembling",
    "off-road",
    "virtual reality",
  ]

  private let vehicles = [
    "bikes",
    "scooters",
    "mopeds",
    "skateboards",
    "pods",
    "trucks",
    "cars",
    "tricycles",
    "unicycles",
    "gondolas",
    "wheelbarrows",
    "rockets",
    "drones",
    "robots",
    "rickshaws",
  ]

  private let target = [
    "kids",
    "teens",
    "millennials",
    "hipsters",
    "the elder",
    "white dudes",
    "tech bros",
    "rural areas",
    "urban areas",
    "China",
    "space exploration",
    "Mars",
    "commuters",
    "San Francisco",
  ]

  // Sometimes life imitates art
  private let reserved = [
    "lime",
  ]

  func generate() -> Startup {
    let names = permutate(prefixes: prefixes.shuffled(), suffixes: suffixes.shuffled())
    let mission = "\(pluck(scopes)) \(pluck(kinds)) \(pluck(vehicles)) for \(pluck(target))"
    return Startup(name: names.randomElement()!, mission: mission)
  }

  private func pluck(_ from: [String]) -> String {
    return from.randomElement()!
  }

  private func permutate(prefixes: [String], suffixes: [String]) -> [String] {
    var names: [String] = []
    for prefix in prefixes {
      for suffix in suffixes {
        if prefix == suffix { continue }
        names.append([prefix, suffix].joined())
      }
    }
    return names.filter { !reserved.contains($0) }
  }
}
