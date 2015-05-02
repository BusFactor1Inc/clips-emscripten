EMCC=emcc
CLIPS_SRC=clips
EXPORTS='["_main","_clips_eval","_clips_load","_clips_reset","_clips_run"]'
#OPTIMIZE=-O1 -g4
OPTIMIZE=-O2
#OPTIMIZE=-O1 -g4
VERBOSE=-s VERBOSE=1
JS_WRAPPER=--pre-js wrapper/pre.js --post-js wrapper/post.js

clips.js: $(CLIPS_SRC) wrapper/clipsjs.c wrapper/post.js wrapper/pre.js
	$(EMCC) -s EXPORTED_FUNCTIONS=$(EXPORTS) $(OPTIMIZE) -o clips.js \
	        -I$(CLIPS_SRC) wrapper/clipsjs.c $(CLIPS_SRC)/*.c $(JS_WRAPPER)

verbose:
	$(EMCC) -s EXPORTED_FUNCTIONS=$(EXPORTS) $(OPTIMIZE) $(VERBOSE) -o clips.js \
	        -I$(CLIPS_SRC) wrapper/clipsjs.c $(CLIPS_SRC)/*.c $(JS_WRAPPER)

clean:
	rm -f clips.js
	rm -f clips.js.map	
