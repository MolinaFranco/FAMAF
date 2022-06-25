#include <stdbool.h>

typedef int elem;
typedef struct s_node_t * list;

/* Returns an empty list */
list empty();

/* Adds element to list at the first position */
list addl(list l, elem e);

/* Adds element to list at the last position */
list addr(list l, elem e);

/* Is the list empty? */
bool is_empty(list l);

/* Returns the element at position i */
elem list_index(list l, unsigned int i);

/* Returns a copy of the provided list */
list copy(list l);

/* Returns a list with the elements of l2 at the end of l1 */
list concat(list l1, list l2);

/* Returns the tail of the list 
 * PRE: !is_empty(list)
 * */
list tail(list l);

/* Returns the first element of the list
 * PRE: !is_empty(list)
 * */
elem head(list l);

/* Length of a list */
unsigned int length(list l);

/* Drop n items
 * PRE: n <= length(l) 
 * */
list drop(list l, unsigned int n);

list list_destroy(list l);