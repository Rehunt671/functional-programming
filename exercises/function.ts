function f<T1>(t1: T1) {
  return function f<T2>(t2: T2) {
    return (list1: T1[]) => (list2: T2[]): [T1, T2][] => {
      if (!Array.isArray(list1) || !Array.isArray(list2)) {
        throw new TypeError("list1 and list2 must be arrays");
      }
      return list1
        .map((item1, index) => [item1, list2[index]] as [T1, T2])
        .filter(pair => pair[1] !== undefined);
    };
  }
}

// Example usage:
try {
  const t1 = "example1"; // Example t1
  const t2 = 0; // Example t2
  const list1 = ["a", "b", "c"]; // Valid array of T1
  const list2 = [1, 2, 3];       // Valid array of T2

  const result = f(t1)(t2)(list1)(list2);
  console.log(result); // Output: [ [ 'a', 1 ], [ 'b', 2 ], [ 'c', 3 ] ]
} catch (error) {
  console.error((error as Error).message);
}

// Incorrect usage (demonstrates error handling)
try {
  const t1 = "example1";
  const t2 = 0;
  const list1 = "notAnArray" as any; // Invalid input
  const list2 = [1, 2, 3];

  const result = f(t1)(t2)(list1)(list2);
  console.log(result);
} catch (error) {
  console.error((error as Error).message); // Output: "list1 and list2 must be arrays"
}
