#!/usr/bin/swift

class TreeNode<T> {
    var left: TreeNode?
    var right: TreeNode?
    var value: T
    init(value: T) {
        self.value = value
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        return "\(value)"
    }
}

class BinaryTree<T> {
    var root: TreeNode<T>?
    init(root: TreeNode<T>? = nil) {
        self.root = root
    }
}

extension BinaryTree: CustomStringConvertible {
    func generateDescription(for node: TreeNode<T>, level: Int = 0, left: Bool? = nil) -> String {
        var description = ""
        if let left = node.left {
            description += generateDescription(for: left, level: level + 1, left: true)
        }
        let char = left == nil ? "" : left! ? "/ " : "\\ "
        description += "\(String(repeating: " ", count: 4 * level))\(char) \(node)\n"
        if let right = node.right {
            description += generateDescription(for: right, level: level + 1, left: false)
        }
        return description
    }

    var description: String {
        guard let root = root else {
            return "nil"
        }
        return generateDescription(for: root)
    }
}

func makeTree<T>(_ arr: [T]) -> BinaryTree<T> {
    if arr.count < 1 {
        return BinaryTree<T>()
    }
    var items = arr
    let item = items.removeFirst()
    let root = TreeNode(value: item)
    var fringe = [root]
    var left = true
    var head: TreeNode<T>?
    for item in items {
        let node = TreeNode(value: item)
        if left {
            head = fringe.removeFirst()
            head?.left = node
        } else {
            head?.right = node
        }
        fringe.append(node)
        left = !left
    }

    let tree = BinaryTree<T>()
    tree.root = root
    return tree
}

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSameTree(_ p: TreeNode<Int>?, _ q: TreeNode<Int>?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil {
            return false
        }
        if p?.value != q?.value {
            return false
        }
        return isSameTree(p?.right, q?.right) && isSameTree(p?.left, q?.left)
    }
}

let arr1 = [3,5,2,1,4,6,7,8,9,10,11,12,13,14]
let tree1 = makeTree(arr1)
let tree2 = makeTree(arr1)

var result = Solution().isSameTree(tree1.root, tree2.root)
print(result)

let arr2 = [3,5,3,1,4,6,7,8,9,10,11,12,13,14]
let tree3 = makeTree(arr2)
result = Solution().isSameTree(tree1.root, tree3.root)
print(result)
