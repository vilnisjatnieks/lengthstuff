#include <stdio.h>
#include <stdlib.h>


// Node structure
typedef struct sNode 
{
  int data;
  struct sNode *next;
} *tNode;
#define NODE_SIZE (sizeof(struct sNode))

// The birth of a node
tNode create_node(int data)
{
  tNode new_node = (tNode)malloc(NODE_SIZE);
  if (new_node == NULL)
  {
    perror("malloc failed");
    exit(1);
  }
  new_node->data = data;
  new_node->next = NULL;
  return new_node;
}

// The death of a node
void free_node(tNode head)
{
  while (head != NULL)
  {
    tNode tmp = head;
    head = head->next;
    free(tmp);
  }
}


// Recursive
int length(tNode head)
{
  if (head == NULL)
  {
    return 0;
  }
  else
  {
    return 1 + length(head->next);
  }
}


// Tail-recursive
int length_helper(tNode head, int rsf)
{
  if (head == NULL)
  {
    return rsf;
  }
  else 
  {
    return length_helper(head->next, rsf + 1);
  }
}

int length2(tNode head)
{
  return length_helper(head, 0);
}


// Fold
typedef int (*Operation)(int, int);

int fold(tNode head, int base, Operation f) 
{
  if(head == NULL)
  {
    return base;
  }
  else
  {
  return fold(head->next, f(head->data, base), f);
  }
}

int inc(int a, int b)
{
  return b+1;
}

int length3(tNode head)
{
  return fold(head, 0, *inc);
}


//Tests
int main()
{
  // Test 1: Empty list []
  tNode list1 = NULL;

  // Test 2: Single element [0]
  tNode list2 = create_node(0);

  // Test 3: Two elements [0,1]
  tNode list3 = create_node(0);
  list3->next = create_node(1);

  printf("Test 1: Empty list []\n");
  printf("Expected: 0\n");
  printf("Recursive: %d\n", length(list1));
  printf("Tail-recursive: %d\n", length2(list1));
  printf("Fold: %d\n", length3(list1));
  printf("\n");

  printf("Test 2: Single element [0]\n");
  printf("Expected: 1\n");
  printf("Recursive: %d\n", length(list2));
  printf("Tail-recursive: %d\n", length2(list2));
  printf("Fold: %d\n", length3(list2));
  printf("\n");

  printf("Test 3: Two elements [0,1]\n");
  printf("Expected: 2\n");
  printf("Recursive: %d\n", length(list3));
  printf("Tail-recursive: %d\n", length2(list3));
  printf("Fold: %d\n", length3(list3));
  printf("\n");

  // Free memory
  free_node(list2);
  free_node(list3);

  return 0;
}
