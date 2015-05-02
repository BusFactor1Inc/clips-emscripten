#include <stdio.h>

#include "setup.h"
#include "clips.h"
#include <emscripten.h>

static void *theEnv;

int clips_reset() {
    Reset();
    return 0;
}

int clips_run() {
    Run(-1);
    return 0;
}

int clips_load( char *file ) {
    printf( "clips_load %s\n", file );
    return Load( file );
}

char* clips_eval( char *expr ) {
    DATA_OBJECT result;
    if( Eval(expr,&result) ) {
        switch( GetType(result) ) {
            case SYMBOL: //fall-thru
            case INSTANCE_NAME: //fall-thru
            case STRING: return DOToString(result);
            default: return NULL;
        }
    }
   
    return "oops";
}

int main( int argc, char *argv[]) {   
    printf( "Hello\n" );
    theEnv = CreateEnvironment();
    printf( "CLIPS environment created\n" );
    
    EM_ASM(
        zebra();
    );    
    
    return(0);
}
