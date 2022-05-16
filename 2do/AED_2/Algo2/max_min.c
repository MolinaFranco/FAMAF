// #include <stdio.h>

// struct max_min_result {
//   int max_value;
//   int min_value;
//   unsigned int max_position;
//   unsigned int min_position;
// };

// struct max_min_result compute_max_min(int array[], unsigned int length) {
//   int max = 0;
//   int min = 0;
//   for (int i = 0; i != length; i++) {
//     if (array[i] < array[min]) {
//       min = i;
//     }
//     if (array[i] > array[max]) {
//       max = i;
//     }
//   }
//   struct max_min_result a;
//   a.max_value = array[max];
//   a.min_value = array[min];
//   a.max_position = max;
//   a.min_position = min;
//   return a;
// }

// int main(void) {

//   int array[5] = {1, 2, 73, 4, 5};

//   struct max_min_result a = compute_max_min(array, 5);

//   printf("max: %d", a.max_position);

//   return 0;
// }
