// inserted after emscripten generated js

clips_eval  = Module.cwrap('clips_eval' , 'string', ['string']);
clips_load  = Module.cwrap('clips_load' , 'number', ['string']);
clips_reset = Module.cwrap('clips_reset', 'number', []);
clips_run   = Module.cwrap('clips_run'  , 'number', []);
