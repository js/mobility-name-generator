import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  router.get { req -> Future<View> in
    let generator = NameGenerator()
    let startup = generator.generate()

    return try req.view().render("index", [
      "name": startup.name,
      "mission": startup.mission
    ])
  }
  //
  //  // Says hello
  //  router.get("hello", String.parameter) { req -> Future<View> in
  //    return try req.view().render("hello", [
  //      "name": req.parameters.next(String.self)
  //      ])
  //  }
}
