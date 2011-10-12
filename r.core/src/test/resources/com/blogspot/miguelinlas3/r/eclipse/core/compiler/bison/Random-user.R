### Name: Random.user
### Title: User-supplied Random Number Generation
### Aliases: Random.user
### Keywords: distribution sysdata

### ** Examples
## Not run: 
##D ##  Marsaglia's congruential PRNG
##D #include <R_ext/Random.h>
##D 
##D static Int32 seed;
##D static double res;
##D static int nseed = 1;
##D 
##D double * user_unif_rand()
##D {
##D     seed = 69069 * seed + 1;
##D     res = seed * 2.32830643653869e-10;
##D     return &res;
##D }
##D 
##D void  user_unif_init(Int32 seed_in) { seed = seed_in; }
##D int * user_unif_nseed() { return &nseed; }
##D int * user_unif_seedloc() { return (int *) &seed; }
##D 
##D /*  ratio-of-uniforms for normal  */
##D #include <math.h>
##D static double x;
##D 
##D double * user_norm_rand()
##D {
##D     double u, v, z;
##D     do {
##D         u = unif_rand();
##D         v = 0.857764 * (2. * unif_rand() - 1);
##D         x = v/u; z = 0.25 * x * x;
##D         if (z < 1. - u) break;
##D         if (z > 0.259/u + 0.35) continue;
##D     } while (z > -log(u));
##D     return &x;
##D }
##D 
##D ## Use under Unix:
##D R CMD SHLIB urand.c
##D R
##D > dyn.load("urand.so")
##D > RNGkind("user")
##D > runif(10)
##D > .Random.seed
##D > RNGkind(, "user")
##D > rnorm(10)
##D > RNGkind()
##D [1] "user-supplied" "user-supplied"
## End(Not run)


