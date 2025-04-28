//************** RECURSIVE *******************************
function len(lst: any[]): number {
  return lst[0] === undefined ? 0
                                        : 1 + len(lst.slice(1));
}

//************** TAIL RECURSIVE **************************
// helper function
function lenHelper(lst: any[], rsf: number): number {
  return lst[0] === undefined ? rsf
                                          : lenHelper(lst.slice(1), rsf + 1);
}

// tail recursive length function
function len2(lst: any[]): number {
  return lenHelper(lst, 0);
}

//************* FOLD **************************************
function fold(lst: any[], base: number, op: (x: number, y: number) => number): number {
  return lst[0] === undefined ? base
                                        : fold(lst.slice(1), op(lst[0], base), op);
}

// increment helper function
function inc(x: any, y: number): number {
  return y + 1;
}

// fold length function
function len3(lst: any[]): number {
  return fold(lst, 0, inc);
}


//************** TESTS *************************************
const list1: any = [];
const list2: any = [0];
const list3: any = [0, 1];

console.log("Test 1: Empty list []");
console.log("Recursive:", len(list1));
console.log("Tail-recursive:", len2(list1));
console.log("Fold:", len3(list1));
console.log("");

console.log("Test 2: Single element [0]");
console.log("Recursive:", len(list2));
console.log("Tail-recursive:", len2(list2));
console.log("Fold:", len3(list2));
console.log("");

console.log("Test 3: Two elements [0, 1]");
console.log("Recursive:", len(list3));
console.log("Tail-recursive:", len2(list3));
console.log("Fold:", len3(list3));
console.log("");
