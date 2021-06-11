class SoundPlayer
{
    static yPlayer = null;
    youtubeIsReady = false;
	constructor()
	{
		this.url = "test";
		this.name = "";
		this.dynamic = false;
		this.distance = 10;
		this.volume = 1.0;
		this.pos = [0.0,0.0,0.0];
        this.max_volume = -1.0; 
        this.lowpass = false;
        this.lowpassval = 20000;
		this.div_id = "myAudio_" + Math.floor(Math.random() * 9999999);
		this.loop = false;
		this.isYoutube = false;
		this.load = false;
        this.audioPlayer = null;
        this.context = new AudioContext();//new (window.AudioContext || window.webkitAudioContext)();
        this.sourceFilter = undefined;
        this.filterCreated = false;
        this.filterWait = false;
        this.pauseTime = false;
	}

	isYoutubeReady(result){
	    this.youtubeIsReady = result;
    }
    
    getLowpassVal()  { return this.lowpassval;}
    getLowpassBool() { return this.lowpass;}

	getDistance(){ return this.distance;}
	getLocation(){ return this.pos;     }
	getVolume  (){ return this.volume;  }
	getUrlSound(){ return this.url;     }
	isDynamic()  { return this.dynamic; }
	getDivId()   { return this.div_id;  }
	isLoop()     { return this.loop;    }
	getName()    { return this.name;    }
	loaded()     { return this.load;    }

	getAudioPlayer()    { return this.audioPlayer; }
	getYoutubePlayer()  { return this.yPlayer;     }

    setLoaded(result)    { this.load = result;   }
	setName(result)      { this.name = result;   }
	setDistance(result)  { this.distance = result;   }
	setDynamic(result)   { this.dynamic = result;    }
	setLocation(x_,y_,z_){ this.pos = [x_,y_,z_];    }
	setSoundUrl(result)  { this.url = result;        }
	setLoop(result)      { this.loop = result;       }
    setMaxVolume(result) { this.max_volume = result; }
    setLowpass(bool) { this.lowpass = bool; }

	setVolume(result)    
	{
		this.volume = result;
		if(this.max_volume == -1) this.max_volume = result; 
		if(this.max_volume > (this.volume - 0.01)) this.volume = this.max_volume;
        if(!this.isYoutube)
        {
            if(this.audioPlayer != null) this.audioPlayer.volume(result);
        }
        else
        {
            if(this.yPlayer && this.youtubeIsReady) {
                this.yPlayer.setVolume(result * 100);
            }
        }
    }
    
    updateLowpass(result)    
	{
        
        if (this.filterWait)
            return

        if(this.audioPlayer != null) {
            // var filter1 = this.context.createBiquadFilter();
            // this.audioPlayer.connect(filter1);
            // filter1.connect(this.context.destination);
            // filter1.type = "lowpass"; //this is a lowshelffilter (try excuting filter1.LOWSHELF in your console)
            // filter1.frequency.value = 95;
            // filter1.gain.value = 30;

            // filter1.frequency.setValueAtTime(result, this.context.currentTime);
        } else if (this.yPlayer && this.youtubeIsReady && this.filterCreated) {

            if (result < 0) 
                result = 0;

            if (this.lowpassval == result)
                return

            if (result === 20000) {

                this.filterWait = true;
                this.filterCreated.frequency.exponentialRampToValueAtTime(result, this.context.currentTime + 1);
                setTimeout(() => {
                    this.filterWait = false;
                }, 1000);
            } else {
                if (this.lowpassval == 0 || this.lowpassval == 20000) {
                    this.filterWait = true;
                    this.filterCreated.frequency.exponentialRampToValueAtTime(result, this.context.currentTime + 1.5);
                    setTimeout(() => {
                        this.filterWait = false;
                    }, 1500);
                } else {
                    this.filterCreated.frequency.setValueAtTime(result, this.context.currentTime);
                }
                
            }
        } 
        this.lowpassval = result;
	}
  
	create()
	{
	    $.post('http://xsound/events', JSON.stringify(
	    {
            type: "onLoading",
            id: this.getName(),
	    }));
        var link = getYoutubeUrlId(this.getUrlSound());
        if(link === "")
        {
            this.isYoutube = false;

            this.audioPlayer = new Howl({
                src: [this.getUrlSound()],
                loop: this.isLoop(),
                html5: true,
                volume: 0.0,
                format: ['mp3'],
                onend: function(event){
                    ended(null);
                },
                onplay: function(){
                    isReady("nothing", true);
                },
            });
            $("#" + this.div_id).remove();
            $("body").append("<div id = '"+ this.div_id +"' style='display:none'>"+this.getUrlSound() +"</div>")
        }
        else
        {   
            if (this.filterCreated)
                this.filterCreated.disconnect();
                
            if (this.sourceFilter)
                this.sourceFilter.disconnect();

            this.sourceFilter = false;
            this.filterCreated = false;
            this.isYoutube = true;
            this.isYoutubeReady(false);
            $("#" + this.div_id).remove();
            $("body").append("<div id='"+ this.div_id +"'></div>");

            this.yPlayer = new YT.Player(this.div_id, {

                startSeconds:Number,

                videoId: link,
                origin: window.location.href,
                enablejsapi: 1,
                width: "0",
                height: "0",
                events: {
                    'onReady': function(event){
                        updateVolumeSounds();
                        event.target.playVideo();
                        isReady(event.target.getIframe().id);
                    },
                    'onStateChange': function(event){
                        if (event.data == YT.PlayerState.ENDED) {
                            isLooped(event.target.getIframe().id);
                        }

                        if (event.data == YT.PlayerState.ENDED) {
                            ended(event.target.getIframe().id);
                        }
                    }
                }
            });
            
            var filtro = setInterval(() => {
                if (this.youtubeIsReady) {
                    this.createFilter();
                    clearInterval(filtro)
                }
            }, 2000);
        }
    }
    
    createFilter() {
        var frame = this.yPlayer.getIframe()
        var videle = frame.contentWindow.document.getElementsByClassName("html5-main-video")[0] 

        let options = {
            mediaElement: videle
        }

        this.videoTag = videle
        this.sourceFilter = new MediaElementAudioSourceNode(this.context, options);

        //this.sourceFilter = this.context.createMediaElementSource(videle);
        this.filterCreated = this.context.createBiquadFilter();
        this.sourceFilter.connect(this.filterCreated);
        this.filterCreated.type = "lowpass";
        this.filterCreated.frequency.value = 20000;
        this.filterCreated.gain.value = 30;
        this.filterCreated.connect(this.context.destination);
    }

    destroyYoutubeApi()
    {
        if (this.yPlayer) {
            this.yPlayer.stopVideo();
            this.yPlayer.destroy();
            this.youtubeIsReady = false;
            this.yPlayer = null;
        }
    }

	updateVolume(dd,maxd) 
	{
        var d_max = maxd;
        var d_now = dd;

        var vol = 0;

        var distance = (d_now / d_max);

        if (distance < 1)
        {
            distance = distance * 100;
            var far_away = 100 - distance;
            vol = (this.max_volume / 100) * far_away;;
			this.setVolume(vol);
        }
        else this.setVolume(0);
	}

	play() 
	{
        if(!this.isYoutube)
        {
            if(this.audioPlayer != null){
                this.audioPlayer.volume(this.getVolume());
                if(this.isDynamic()){
                    updateVolumeSounds();
                }
                this.audioPlayer.play();
            }
        }
        else
        {
            if(this.youtubeIsReady){
                if(this.isDynamic()){
                    updateVolumeSounds();
                }
                this.yPlayer.playVideo();
            }
        }
	}
	pause()
	{
        if(!this.isYoutube)
        {
            if(this.audioPlayer != null) this.audioPlayer.pause();
        }
        else
        {
            if(this.youtubeIsReady){ 

                this.yPlayer.pauseVideo();
                this.sourceFilter.mediaElement.pause();
                this.pauseTime = this.sourceFilter.mediaElement.currentTime;
                this.sourceFilter.mediaElement.currentTime = 0;
                
            }
        }
	}

	resume()
	{
        if(!this.isYoutube)
        {
            if(this.audioPlayer != null) this.audioPlayer.play();
        }
        else
        {
            if(this.youtubeIsReady)  {
                this.sourceFilter.mediaElement.play();
                this.yPlayer.playVideo();

                this.sourceFilter.mediaElement.currentTime = this.pauseTime
            }
        }
	}

	delete()
	{
	    if(this.audioPlayer != null){
            this.audioPlayer.pause();
            this.audioPlayer = null;
	    }
	    $("#" + this.div_id).remove();
	}
	
	mute  ()
	{
        if(!this.isYoutube)
        {
            if(this.audioPlayer != null) this.audioPlayer.volume(0);
        }
        else
        {
            if(this.youtubeIsReady) this.yPlayer.setVolume(0);
        }
	}
	unmute()
	{
        if(!this.isYoutube)
        {
            if(this.audioPlayer != null) this.audioPlayer.volume(this.getVolume());
        }
        else
        {
            if(this.youtubeIsReady) this.yPlayer.setVolume( this.getVolume() * 100);
        }
	}

	setTimeStamp(time)
	{
        if(!this.isYoutube)
        {
            this.audioPlayer.seek(time);
        }
        else
        {
            this.yPlayer.seekTo(time);
        }
	}

	isPlaying()
	{
        if(!this.isYoutube)
        {
            return this.audioPlayer != null  && this.audioPlayer.playing();
        }
        return false;
	}
}