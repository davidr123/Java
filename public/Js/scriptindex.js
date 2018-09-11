/*
$(".uno").click(function(){
    console.log("avatar uno");
    var flag= true;
});

function updateImg(num){
   if(num===1) {
       $('#avatarN').load("./avatarEscogido.html").add("<img src='./images/avatar1.png' />").appendTo(document.body);
       $('.hi').add("<h3> hi </h3>").appendTo(document.body);
   }
}*/

window.addEventListener('load', () => {
				// noinspection JSUnresolvedVariable
				let audioCtx = new (window.AudioContext || window.webkitAudioContext)();
				let xhr = new XMLHttpRequest();
				xhr.open('GET', '/audio/background.mp3');
				xhr.responseType = 'arraybuffer';
				xhr.addEventListener('load', () => {
					let playsound = (audioBuffer) => {
						let source = audioCtx.createBufferSource();
						source.buffer = audioBuffer;
						source.connect(audioCtx.destination);
						source.loop = false;
						source.start();

						setTimeout(function () {
							playsound(audioBuffer);
						}, 1000 + Math.random()*2500);
					};

					audioCtx.decodeAudioData(xhr.response).then(playsound);
				});
				xhr.send();
			});


$("input").change(function(e) {

    for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
        
        var file = e.originalEvent.srcElement.files[i];
        var img = document.createElement("img");
        var reader = new FileReader();
        reader.onloadend = function() {
             img.src = reader.result;
        }
        reader.readAsDataURL(file);
        $("#contentImg").after(img);
    }
});
