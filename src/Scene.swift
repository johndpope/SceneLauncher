struct Scene : Printable {
  let order: Int
  let name: String

  var description: String { return name }
}
