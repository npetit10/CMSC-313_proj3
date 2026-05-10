#include <stdio.h>
#include <ctype.h>

void hex_dump(const char *filename) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Error opening file");
        return;
    }

    unsigned char buffer[16];
    size_t bytesRead;
    unsigned long address = 0x2040; 
    while ((bytesRead = fread(buffer, 1, 16, file)) > 0) {
        // Print the address in hex
        printf("%08lx ", address);

        // Print the hex bytes
        for (int i = 0; i < 16; i++) {
            if (i < bytesRead)
                printf("%02x ", buffer[i]);
            else
                // Padding for incomplete lines
                printf("   "); 
        }

        // Print the ASCII representation
        printf(" |");
        for (int i = 0; i < bytesRead; i++) {
            if (isprint(buffer[i]))
                printf("%c", buffer[i]);
            else
                printf(".");
        }
        printf("|\n");

        address += 16;
    }

    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    hex_dump(argv[1]);
    return 0;
}
