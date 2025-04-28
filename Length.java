interface Nexter
{
  public int next(int v, int foldOfRest);
}

class lengthNexter implements Nexter
{
  public int next(int v, int foldOfRest)
  {
    return 1 + foldOfRest;
  }
}


class Node
{
  int data;
  Node next;

  public Node(int data)
  {
    this.data = data;
  }

  public int lengthRecursive()
  {
    if(next == null)
      return 1;
    else
      return (1 + this.next.lengthRecursive());
  }

  public int lengthHelper(int rsf)
  {
    if(next == null)
      return 1;
    else
      return this.next.lengthHelper(rsf + 1);
  }

  public int lengthTailRecursive()
  {
    return this.lengthHelper(0);
  }

  public int lengthFold(int base, Nexter f)
  {
    if(next == null)
      return base;
    else 
      return this.next.lengthFold(f.next(this.data, base), f);
  }

}


class List
{
  Node root;

  public List(Node root)
  {
    this.root = root;
  }
  
  public int lengthRecursive()
  {
    if(root == null)
      return 0;
    else
      return root.lengthRecursive();
  }

  public int lengthTailRecursive()
  {
    if(root == null)
      return 0;
    else
      return root.lengthTailRecursive();
  }

  public int lengthFold(int base, Nexter f)
  {
    if(root == null)
      return 0;
    else
      return root.lengthFold(base, f);
  }

}

public class Length
{
  public static void main(String[] args)
  {
    List test1 = new List(null);
    List test2 = new List(new Node(0));
    List test3 = new List(new Node(0));
    
    //OO violation only for test purposes
    test3.root.next = new Node(1);

    System.out.println("Test 1 - empty list");
    System.out.println("Length (Recursive): " + test1.lengthRecursive());
    System.out.println("Length (Tail Recursive): " + test1.lengthRecursive());
    System.out.println("Length (Fold): " + test1.lengthRecursive());

    System.out.println("Test 2 - one element list");
    System.out.println("Length (Recursive): " + test2.lengthRecursive());
    System.out.println("Length (Tail Recursive): " + test2.lengthRecursive());
    System.out.println("Length (Fold): " + test2.lengthRecursive());

    System.out.println("Test 3 - two element list");
    System.out.println("Length (Recursive): " + test3.lengthRecursive());
    System.out.println("Length (Tail Recursive): " + test3.lengthRecursive());
    System.out.println("Length (Fold): " + test3.lengthRecursive());

  }
}



