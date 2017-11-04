//: 关联类型:定义协议时,有时需要定义一个或多个泛型作辅助，用关键字associatedtype指定
protocol 容器 {
    //提供给遵从此协议的类型使用
    associatedtype ItemType
    
    //可用于方法和属性,推测参数或返回值类型
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack : 容器{
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() ->Int {
        return items.removeLast()
    }
    
    mutating func append(_ item: Int) {
        self.push(item: item)
    }
    
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//Element自动推测
struct Stack<Element>: 容器 {
    var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item: item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i:Int) -> Element {
        return items[i]
    }
}

//:  - 扩展一个既有类型来详述关联类型.
//🌰Swift的数组已实现append,count,下标, 可以直接遵从容器协议.
extension Array: 容器 {}



//: [关联类型的约束](@next)
