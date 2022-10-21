//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#include <stdbool.h>

struct B64 {
    const char* b_64;
    bool sw;
    const char* err;
};


//struct B64 create_png_b64(const char* p_svg_b64);
struct B64 create_png_from_file(const char* svg_file);
//struct B64 create_pdf_b64(const char* p_svg_b64);
struct B64 create_pdf_b64_from_png_b64(const char* p_png_b64);
