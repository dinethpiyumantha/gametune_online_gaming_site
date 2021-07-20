function stringTextChanger(){
    document.getElementById("previewBox").style.visibility = "visible";
    var str = document.getElementById("BidDescription").value;
    ret = str.replace(/\s_/g, " <i>");
    ret = ret.replace(/_\s/g, "</i> ");
    ret = ret.replace(/\s(\*)/g, " <b>");
    ret = ret.replace(/(\*)\s/g, "</b> ");
    ret = ret.replace(/\s(''')/g, " <span>");
    ret = ret.replace(/(''')\s/g, "</span> ");
    
    char1 = str.charAt(0);
    char2 = str.charAt(str.length-1);

    if(char1 == "_"){
        ret = ret.replace("_", " <i>");
    }
    else if(char1 == "*"){
        ret = ret.replace("*", " <b>");
    }

    if(char2 == "_"){
        ret = ret.slice(0, -1);
        ret = ret + "</i>";
    }
    else if(char2 == "*"){
        ret = ret.slice(0, -1);
        ret = ret + "</b>";
    }

    return ret;
}

function samplePreview(){
    var title = document.getElementById("Title").value;
    var subTitle = document.getElementById("SubTitle").value;
    var description = stringTextChanger();
    var game = document.getElementById("Game");
    var game = game.options[game.selectedIndex].value;
    var levelFrom = document.getElementById("lbFrom").value;
    var levelTo = document.getElementById("lbTo").value;
    var platform = document.getElementById("Platform");
    var platform = platform.options[platform.selectedIndex].value;
    var maxBid = document.getElementById("MaxBid").value;
    var bidEnd = document.getElementById("BidEnd").value;

    ret = "<h2>" + title + "</h2>";
    ret = ret + "<h4>" + subTitle + "</h4>";
    ret = ret + "<p>" + description + "</p>";
    ret = ret + "<pre><b>Game : </b>" + game + "</pre>";
    ret = ret + "<p class='lvl'><b>Levels from " + levelFrom + " to " + levelTo + "</b></p>";
    ret = ret + "<pre><b>Platform : </b>" + platform + "</pre>";
    ret = ret + "<pre><b>Max. Bid : </b> LKR." + maxBid + "</pre>";
    ret = ret + "<h4>Bidding Ends on " + bidEnd + "</h4>";
    document.getElementById("previewBox").innerHTML = ret;
	console.log(ret);
}

function descriptionToTags(){

    var str = document.getElementById("descriptionTag").innerHTML;
    ret = str.replace(/\s_/g, " <i>");
    ret = ret.replace(/_\s/g, "</i> ");
    ret = ret.replace(/\s(\*)/g, " <b>");
    ret = ret.replace(/(\*)\s/g, "</b> ");
    ret = ret.replace(/\s(''')/g, " <span>");
    ret = ret.replace(/(''')\s/g, "</span> ");
    
    char1 = str.charAt(0);
    char2 = str.charAt(str.length-1);

    if(char1 == "_"){
        ret = ret.replace("_", " <i>");
    }
    else if(char1 == "*"){
        ret = ret.replace("*", " <b>");
    }

    if(char2 == "_"){
        ret = ret.slice(0, -1);
        ret = ret + "</i>";
    }
    else if(char2 == "*"){
        ret = ret.slice(0, -1);
        ret = ret + "</b>";
    }

    document.getElementById("descriptionTag").innerHTML=ret;
}
