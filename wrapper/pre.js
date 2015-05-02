// inserted before emscripten generated js
var Module = {};

Module["print"] = function(text) { 
    console.log( "CLIPS: " + text); 
    if( text && text.replace ) text = text.replace( /\s/g, "&nbsp;" );
    document.getElementById("clipslog").innerHTML += text + "<br />";
}

Module["noExitRuntime"] = true;

