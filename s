'''
You are given a binary tree:

class Node:
    def __init__(self, L, R, n):
        self.left = L
        self.right = R
        self.value = n
Your task is to return the list with elements from tree sorted by levels, which means the root element goes first, then root children (from left to right) are second and third, and so on.

Return empty list if root is .None

Example 1 - following tree:

                 2
            8        9
          1  3     4   5
Should return following list:

[2,8,9,1,3,4,5]
Example 2 - following tree:

                 1
            8        4
              3        5
                         7
Should return following list:

[1,8,4,3,5,7]
'''

def height(node, k):
    if not node:
        return 0
    l_height = height(node.right, k)
    r_height = height(node.left, k)
    
    return max(l_height, r_height) + 1
    
def width(root, k):
    h = height(root, k)
    for i in range(h):
        levels(root, i, k)
        
def levels(root, level, k):
    if not root:
        return 0
    if level == 0:
        k.append(root.value)
    elif level > 0:
        levels(root.left, level - 1, k)
        levels(root.right, level - 1, k)
        
def tree_by_levels(node):
    k = []
    width(node, k)
    return k
