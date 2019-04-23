#ifndef INCLUDED_GETOPT_PORT_H
#define INCLUDED_GETOPT_PORT_H

#if defined(__cplusplus)
extern "C" {
#endif

#define gop_no_argument (0)
#define gop_required_argument (1)
#define gop_optional_argument (2)

struct gop_option {
  char const* name, *usage;
  int has_arg;
  int* flag;
  int val;
  int short_name;
};

struct gop_ctx {
  struct gop_option const* longopts;
  char const** argv;
  char* optarg, *optcursor;
  int argc, optind, opterr, optopt, longindex;
};

void gop_init(struct gop_ctx* ctx, int argc, char const** argv, const struct gop_option* longopts);
int gop_next(struct gop_ctx* ctx);
void gop_display_usage(struct gop_ctx* ctx);

#if defined(__cplusplus)
}
#endif

#endif // INCLUDED_GETOPT_PORT_H
