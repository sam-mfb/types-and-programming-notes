/* Represents term's location in a file */
public struct FileInfo {
    let fileName: String
    let line: Int
    let position: Int
}

/*
 Information about a variable
 (Placeholder for now)
*/
public struct Binding {
    let binding:String = "NameBind"
}

/*
 Context for an abstraction,
 i.e., de Bruijn indices, name hints, and binding
 information
 */
public struct Context {
    private let ctx: Array<(String, Binding)>
    
    public init(_ names:Array<String>){
        ctx = names.map {($0,Binding())}
    }
    
    public init(_ context:Context, with newName: String) {
        var temp = context.ctx
        temp.append((newName,Binding()))
        ctx = temp
    }
    
    public var length:Int { ctx.count }
    
    func name(from index:Int)->String {
        if(index<ctx.count) {
            return ctx[index].0
        } else {
            return "Index out of bounds"
        }
    }
    
    func includesName(_ name:String)->Bool {
        return ctx.contains(where: {$0.0 == name})
    }
}

public enum Term {
    // Ints are: de Bruijn index, context length
    case tmVar(FileInfo, Int, Int)
    // String is bound variable name hint
    indirect case tmAbs(FileInfo, String, Term)
    indirect case tmApp(FileInfo, Term,Term)
}

public extension FileInfo {
    static let blank = FileInfo(fileName: "", line: 0, position: 0)
}
