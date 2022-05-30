#include <assert.h>
#include "dict.h"
#include "key_value.h"

struct _node_t {
    dict_t left;
    dict_t right;
    key_t key;
    value_t value;
};

static bool invrep(dict_t d) {
    return  (d == NULL) || (d->lft==NULL && d->rgt == NULL) ||              // arbol nulo  
            (   (d->lft == NULL || string_less(d->lft->elem, d->elem)) &&     // arbol no nulo
                (d->rgt  == NULL || string_less(d->elem, d->rgt->elem)) &&
                invrep(d->rgt) &&
                invrep(d->lft)
            );
    
}

//implementacion para ultimos nodos
static struct _node_t *last_node(key_ty key, value_t value) {
  struct _node_t *node = malloc(sizeof(struct _node_t));
  node->key = key;
  node->value = value;
  node->left = NULL;
  node->right = NULL;
  return node;
}

dict_t dict_empty(void) {
    dict_t dict = NULL;
    return dict;
}

dict_t dict_add(dict_t dict, key_t word, value_t def) {
    assert(invrep(tree));
    assert(!dict_exists(tree, word));
    
    if(dict == NULL) {
        dict = last_node(word, def);
    }
    else if(string_less(word, dict->elem)) {
        dict->left = dict_add(dict->left, word, def);
    }
    else if(string_less(dict->key, word)){
        dict->right = dict_add(dict->right, word, def);
    }else{
        string tmp;
        tmp = dict->value;
        dict->value=string_clone(def);
        string_destroy(tmp);
    }

    assert(invrep(dict) && abb_exists(dict, word));
    return dict;
}

value_t dict_search(dict_t dict, key_t word) {
    assert(invrep(dict));
    key_t def=NULL;
    
    if(dict!=NULL){
        if(string_eq(dict->key,word)){
            def = dict->value;
        }else{
            if(string_less(dict->key,word)){
                def = dict_search(dict->right,word);
            }else if(string_less(word, dict->key)){
                def = dict_search(dict->left,word);
            }
        }  
    }

    return def;
}

bool dict_exists(dict_t dict, key_t word) {
    bool exists=false;
    
    assert(invrep(dict));
    
    if(dict!=NULL){
        if(string_less(dict->key,word)){
            exists = string_eq(dict->key,word) || dict_exists(dict->right,word);
        }else{
            exists = string_eq(dict->key,word) || dict_exists(dict->left,word);
        }   
    }

    return exists;
}

unsigned int dict_length(dict_t dict) {
    unsigned int length=0;
    assert(invrep(dict));
    
    if(!dict_is_empty(dict)){
        length = 1 + dict_length(dict->left) + dict_length(dict->right);
    }

    assert(invrep(tree) && (dict_is_empty(tree) || length > 0));
    return length;
}

dict_t dict_remove(dict_t dict, key_t word) {
    /* needs implementation */
    return dict;
}

dict_t dict_remove_all(dict_t dict) {
    assert(invrep(dict));
    if(dict != NULL) {
      dict_remove_all(dict->left);
      dict_remove_all(dict->right);
      string_destroy(dict->key);
      string_destroy(dict->value);
      free(dict);
      dict = NULL;
    }
    assert(dict == NULL);
    return dict;
}

void dict_dump(dict_t dict, FILE *file) {
    assert(invrep(dict));
    if (dict != NULL) {
        dict_dump(dict->left, file);
        fprintf(file, "%s: %s\n", string_ref(dict->key), string_ref(dict->value));
        dict_dump(dict->right, file);
    }
}

dict_t dict_destroy(dict_t dict) {
    return dict_remove_all(dict);
}

