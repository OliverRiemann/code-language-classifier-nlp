#include<stdio.h>
#include<stdlib.h>

void* cmalloc(int size, char* em){
	//malloc with checking.
	//in em, you can input some error message for identifying the error position.
	//if you don't input any in em, we won't output any extra message.
	void* ob = malloc(size);
	if(ob == NULL){
		printf("We can't ensure plenty memory in this program. %s \n", em);
		exit(0);
	}
    return ob;
}

void* crealloc(void* ob, int size, char* em){
	//realloc with checking.
	//in em, you can input some error message for identifying the error position.
	//if you don't input any in em, we won't output any extra message.
	//realloc cost linear time depeding size at worst.
	
	void* ret = realloc(ob, size);
	if(ret == NULL){
		printf("We can't re-ensure plenty memory in this program. %s \n", em);
		exit(0);
	}
	return ret;
}

typedef struct {
	int* arp;
	int size;
	int stack_size;
}vector_i;

int* vector_i_at(const vector_i* ob, int idx){
	//ob[idx]
	if(ob->size <= idx){
		printf("at-access in vector overes the range.\n");
		exit(0);
	}
	return (ob->arp + idx);
}

void vector_i_private_increase(vector_i* ob, int size){
	while(ob->stack_size < size)ob->stack_size *= 2;
}

void vector_i_constructor(vector_i* ob, int size){
	//fill the vector by 0.
	ob->size = size;
	ob->stack_size = 1;
	vector_i_private_increase(ob, size);
	ob->arp = cmalloc(sizeof(int) * ob->stack_size, "vector initialize failed.");
	
	for(int i = 0; i < ob->size; i++){
		ob->arp[i] = 0;
	}
}
void vector_i_destructor(vector_i* ob){
	ob->size = 0;
	ob->stack_size = 0;
	free(ob->arp);
}

void vector_i_resize(vector_i* ob, int size){
	if(ob->size < size){
		ob->arp = crealloc(ob->arp, size, "We cannot remalloc memory for vector resizing.");
		
		for(int i = ob->size; i < size; i++){
			*(ob->arp + i) = 0;
		}
	}else {
		for(int i = size; i < ob->size; i++){
			*(ob->arp + i) = 0;
		}
	}
	ob->size = size;
}

int* vector_i_begin(vector_i* ob){
	return ob->arp;
}

int* vector_i_end(vector_i* ob){
	return (ob->arp + ob->size);
}

void vector_i_push_back(vector_i* ob, int val){
	if(ob->size == ob->stack_size){
		vector_i_private_increase(ob, ob->size + 1);
		ob->arp = crealloc(ob->arp, sizeof(int) * ob->stack_size, "We can't resize in pushing back.");
	}
	*(ob->arp + ob->size) = val;
	ob->size++;
}

int vector_i_pop_back(vector_i * ob){
	if(ob->size == 0){
		printf("We cannot erase empty vector");
		exit(1);
	}
	ob->size--;
	int ret = ob->arp[ob->size];
	ob->arp[ob->size] = 0;
	return ret;
}

//compare
int comp(const int* a, const int* b){
	return *a - *b;
}

int main(){
	vector_i vi;
	vector_i_constructor(&vi, 0);
	
	for(int i = 0; i < 10; i++){
		int tmp;
		scanf("%d", &tmp);
		vector_i_push_back(&vi, tmp);
	}
	
	qsort(vector_i_begin(&vi), vi.size, sizeof(int), comp);
	
	for(int i = 9; i >= 7; i--)printf("%d\n", *vector_i_at(&vi, i));
	
	vector_i_destructor(&vi);
	return 0;
}
