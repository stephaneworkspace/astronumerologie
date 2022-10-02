//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#include <stdbool.h>

struct B64 {
    const char* b_64;
    bool sw;
    const char* err;
};

//const char* theme_astral_svg(int year, int month, int day, int hour, int min, double lat, double lng, int gmt, const char* ephem_path);
struct B64 theme_astral(int year, int month, int day, int hour, int min, double lat, double lng, int tz);
//void log_app(const char* output, const char* error);

struct B64 create_png_b64(const char* p_svg_b64);
struct B64 create_pdf_b64(const char* p_svg_b64);

// libswe

// Swe02
void swe_set_ephe_path(char *path);
void swe_close();
void swe_set_jpl_file(char *fname);
char *swe_version(char *s);
char *swe_get_library_path(char *path);
// Swe03
int swe_calc_ut(double tjd_ut, int ipl, int iflag, double *xx, char *serr);
// Swe07
int swe_pheno_ut(double tjd_ut, int ipl, int iflag, double *attr, char *serr);
// Swe08
double swe_julday(int year, int month, int day, double hour, int calandar);
void swe_utc_time_zone(int year, int month, int day, int hour, int min, double sec, double dtz, int *p_year_out, int *p_month_out, int *p_day_out, int *p_hour_out, int *p_min_out, double *p_sec_out);
int swe_utc_to_jd(int year, int month, int day, int hour, int min, double sec, int gregflag, double *dret, char *serr);
// Swe14
int swe_houses_ex(double tjd_ut, int iflag, double geolat, double geolon, int hsys, double *cusps, double *ascmc);
// Swe17
double swe_split_deg(double ddeg, int roundflag, int *ideg, int *imin, int *isec, double *dsecfr, int *isgn);
