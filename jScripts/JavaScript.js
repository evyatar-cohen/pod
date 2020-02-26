document.addEventListener("deviceready", onDeviceReady, false);
function onDeviceReady() {
    window.open = cordova.InAppBrowser.open;
}

function fun1() {
    var ref = cordova.InAppBrowser.open('./index.aspx', '_blank', 'location=no,hideurlbar=no,zoom=no');
}
function playPauseAudio() {
    var timer;
    var percent = 0;
    var audio = document.getElementById('audioPod');
    audio.addEventListener("playing", function (_event) {
        var duration = audio.duration;
        advance(duration, audio);
    });

    var advance = function (duration, element) {
        var progress = document.getElementById("progress");
        increment = 10 / duration
        percent = Math.min(increment * element.currentTime * 10, 100);
        progress.style.width = percent + '%'
        startTimer(duration, element);
    }

    var myVar = setInterval(function() {
        var audioTime = audio.duration - audio.currentTime;
        var minutes = Math.floor(audioTime / 60);
        var seconds = Math.floor(audioTime % 60);
        console.log(minutes + " " + seconds);
        var secondsTxt = 0;
        var minutesTxt = 0;
        if (minutes < 10) {
            minutesTxt = "0" + minutes.toString();
        }
        else {
            minutesTxt = minutes.toString();
        }
        if (seconds < 10) {
            secondsTxt = "0" + seconds.toString();
        }
        else {
            secondsTxt = seconds.toString();
        }

        document.getElementById('timeLabel').innerHTML = minutesTxt+":"+secondsTxt;
	}, 1000);


    var startTimer = function (duration, element) {
        if (percent < 100) {
            timer = setTimeout(function () { advance(duration, element) }, 100);
        }
    }

 


    if (audio.paused) {
        audio.play();
        $('#playPauseBtn').removeClass('playBtn')
        $('#playPauseBtn').addClass('pauseBtn')
        clearTimeout(timer);
        
    } else {
        audio.pause();
        clearInterval(myVar);
        $('#playPauseBtn').addClass('playBtn')
        $('#playPauseBtn').removeClass('pauseBtn')
        
    }
}

function replay10Sec() {
    var audio = document.getElementById('audioPod');
    console.log(audio.currentTime);
    audio.currentTime -= 10;
    console.log(audio.currentTime);

}

function next10Sec() {
    var audio = document.getElementById('audioPod');
    console.log(audio.currentTime);
    audio.currentTime += 10;
    console.log(audio.currentTime);

}



function seekNext(event) {//click for seek time on progress bar
    var x = event.clientX-27;
    var position = Math.floor((x / $("#progressBackground").width() * 100) + 1) + 1; //get percentage
    var audio = document.getElementById('audioPod'); 
    var seeked = position * audio.duration / 100;
    console.log(seeked);
    audio.currentTime = seeked;
}

