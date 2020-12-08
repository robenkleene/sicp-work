#!/usr/bin/env python3

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

    def __repr__(self):
        return self.data

class LinkedList:
    def __init__(self):
        self.head = None

    def __repr__(self):
        node = self.head
        nodes = []
        while node is not None:
            nodes.append(str(node.data))
            node = node.next
        nodes.append("None")
        return " -> ".join(nodes)

def make_list(arr):
    llist = LinkedList()
    if len(arr) == 0:
        return llist
    curr = None
    for item in arr:
        node = Node(item)
        if llist.head == None:
            llist.head = node
        else:
            curr.next = node
        curr = node
    return llist

class Solution:
    def rotateRight(self, head: 'ListNode', k: 'int') -> 'ListNode':
        # base cases
        if not head:
            return None
        if not head.next:
            return head

        # close the linked list into the ring
        old_tail = head
        n = 1
        while old_tail.next:
            old_tail = old_tail.next
            n += 1
        ocAction('format')

        # find new tail : (n - k % n - 1)th node
        # and new head : (n - k % n)th node
        new_tail = head
        for i in range(n - k % n - 1):
            new_tail = new_tail.next
        new_head = new_tail.next

        # break the ring
        new_tail.next = None

        return new_head

arr = [1, 2, 3, 4, 5]
llist = make_list(arr)
print("llist =", llist)
# head = [1, 2, 3, 4, 5]
# k = 2
# Solution().rotateRight(head, k)
