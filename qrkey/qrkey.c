// generates an rsa key and displays a qr code representing the key
#include<unistd.h>
#include<stdio.h>
#include<string.h>
#include<fcntl.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<errno.h>
#include<qrencode.h>

#define BUFSIZE 25
#define LARGEBUFSIZE 5000
#define QRSIZE 732
#define WHITE "\x1B[47m"
#define BLACK "\x1B[40m"


void border_whitespace(int lines, int width);


int main (const char **argv, int argc) {
	int bits = 4096;
	char bitstring[BUFSIZE];
	snprintf(bitstring, BUFSIZE, "%i", bits);

	char type[BUFSIZE];
	strncpy(type, "rsa", BUFSIZE);

	char filename[BUFSIZE];
	strncpy(filename, "sec.asc", BUFSIZE);

	int pid = fork();
	if (pid < 0)
		goto fork_error;
	
	else if (pid == 0) {
//	return 0;
//		execlp("gpg", "gpg", "--export", "--armour", "0xF6D1D9B4AA30D5AA", ">", filename, (char *) NULL);
		execlp("ssh-keygen", "ssh-keygen", "-q", "-t", type, "-b", bitstring, "-f", filename, (char *) NULL);
	} else {
		int exit = 0;
		waitpid(pid, &exit, 0);

		if (exit == 0) {
			int keyfile = open(filename, 0, O_RDONLY);
			if (keyfile < 0)
				goto key_open_error;

			
			char keybuf[LARGEBUFSIZE];

			int max = 0;
			for (int i = 0; (max = pread(keyfile, keybuf, QRSIZE, i * QRSIZE)); i++) {
				printf(WHITE"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

				keybuf[max] = 0;

				QRcode *code = QRcode_encodeString(keybuf, 0, QR_ECLEVEL_M, QR_MODE_8, 1);
				
				border_whitespace(10, code->width);

				for (int i = 0; i < code->width; i++) {
					printf(WHITE"             ");
					for (int j = 0; j < code->width; j++) {
						int black = code->data[(i * code->width) + j] & 0x1;
						if (black)
							printf("\x1B[40m  ");
						else
							printf("\x1B[47m  ");
					}
					printf(WHITE"             \n");
				}
				
				border_whitespace(10, code->width);

				QRcode_free(code);

				sleep(2);
			}
			
			close(keyfile);
			unlink(filename);
			
			char pubfilename[BUFSIZE];
			snprintf(pubfilename, BUFSIZE, "%s.pub", filename);
			//unlink(pubfilename);
		}
	}

	return 0;

fork_error:
	printf("fork error\n");
	return -1;

key_open_error:
	printf("key file open \"%s\" error\n", filename);
	return -1;

}


void border_whitespace(int lines, int width) {
	for (int j = 0; j < lines; j++) {
		for (int i = 0; i < width; i++) {
			printf("  ");
		}
		printf(WHITE"                          \n");
	}
}

