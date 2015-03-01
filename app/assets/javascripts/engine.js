var ajaxEchoXML = "<totalquiz><title>How Daring Are You?</title><intro>Are you quick to take on new adventures, or is your first instinct to wait and watch? Take this quiz to see how much you'd dare to do!</intro><quiz><questionset num='0'><question>You're at a friend's slumber party. Which of the following would you be willing to do?</question><choices><option value='0'>sleep with a stuffed animal</option><option value='1'>tell the group about an embarrassing moment</option><option value='2'>sing the alphabet song like an opera singer in front of everyone</option></choices></questionset><questionset num='1'><question>Your class is on a field trip to the zoo, where you're greeted by three zookeepers with their animals. Which of the following animals would you most want to pet?</question><choices><option value='0'>tortoise</option><option value='1'>iguana</option><option value='2'>python</option></choices></questionset><questionset num='2'><question>If you could go on any of these vacations, which would it be?</question><choices><option value='0'>an ocean cruise</option><option value='1'>a river-rafting trip</option><option value='2'>a rain forest safari</option></choices></questionset><questionset num='3'><question>A friend and her family are going snow skiing. When they ask if you'd like to go along, you</question><choices><option value='0'>tell them there's a book you've just got to finish.</option><option value='1'>ask if you can watch for a while.</option><option value='2'>Ask, 'Where do I sign up for a lesson?'</option></choices></questionset><questionset num='4'><question>Your best bud's having her birthday dinner at a sushi restaurant, but you've never eaten sushi before. You</question><choices><option value='0'>hope they have grilled cheese on the menu.</option><option value='1'>decide to try the cucumber roll, since you know what cucumber tastes like.</option><option value='2'>go for the raw sashimi tuna because your friend says it's yummy.</option></choices></questionset><questionset num='5'><question>Squeeek. It's the middle of the night, and you hear mouse sounds coming from your bedroom closet. You</question><choices><option value='0'>pull the blankets over your head and try to ignore the sounds.</option><option value='1'>call for someone to come and turn on the light.</option><option value='2'>tiptoe to your closet with a flashlight to try and spot the mouse.</option></choices></questionset><questionset num='6'><question>Which of the following sports would you most want to learn?</question><choices><option value='0'>In-line skating</option><option value='1'>snowboarding</option><option value='2'>platform diving</option></choices></questionset><questionset num='7'><question>You and your friends agree to paint your faces to cheer on the local soccer team, the Rainbows. You</question><choices><option value='0'>wear green eye shadow on one eyelid and blue on the other.</option><option value='1'>paint a rainbow on each cheek.</option><option value='2'>paint rainbow stripes across your entire face and wear a fuzzy rainbow clown wig.</option></choices></questionset><questionset num='8'><question>Your dad has invited a Costa Rican business associate and his family to your home for dinner. Everyone is speaking Spanish. You</question><choices><option value='0'>smile a lot but don't say anything.</option><option value='1'>talk to the guest in English, hoping they'll understand.</option><option value='2'>try to use all the Spanish words that you know.</option></choices></questionset><questionset num='9'><question>If you had to choose, which career has the most appeal for you?</question><choices><option value='0'>airline pilot</option><option value='1'>race-car driver</option><option value='2'>trapeze artist</option></choices></questionset></quiz><results><mostly value='0'><header>Comfort zoner </header><copy>You're a levelheaded girl who likes having fun within your own comfort zone. Being adventurous is more likely to happen when you feel supported and sure of the outcome.</copy></mostly><mostly value='1'><header>Bold but balanced </header><copy>You're confident enough to go for the gusto—but cautious enough to want to know the risks before you take the plunge. You prefer to be informed, weigh the pros and cons, and maybe even practice ahead of time. Then you'll dive in!</copy></mostly><mostly value='2'><header>Dare devil</header><copy>Adventure? Bring it on! You're open and willing to try new things and not afraid to look a little inexperienced. After all, no one starts out as an expert—trying and learning is how you become one!</copy></mostly></results></totalquiz>"
    
var currentQuestion;
var correctTotal;
var totalQuestions;
var answerArray;
var myReady;
var QArray;
var RArray;
var random;
var centerOffset;
var animateSpeed;
var nextStage;
var onStage;
var prevStage;
    
init();

function init() {
    currentQuestion = 0;
    correctTotal    = 0;
    TotalQuestions  = 0;
    currentQuestion = 0;
    centerOffset    = 500;
    animateSpeed    = 500;
    QArray          = Array();
    RArray          = Array();   
    myReady         = true;
    random          = true;
    
    nextStage       = {opacity: 0,left:'+='+centerOffset};
    onStage         = {opacity: 1,left:'125'};
    prevStage       = {opacity: 0,left:'-='+centerOffset};
    
    $.ajax({
        //type: "GET",
        //url: "Quiz.xml",
        type: "POST",
        url: "/echo/xml/",
        dataType: "xml",
        data: {
            xml: ajaxEchoXML
        },
        success: xmlLoaded
    });
}
    
function xmlLoaded(data){
    makeHTML(data);
    reset();
}
    
function reset(){
    
    $(".questionSet").animate(nextStage, 0);
    $(".results").animate(nextStage, 0);
    
    currentQuestion = 0;
    correctTotal    = 0;
    currentQuestion = 0;
    answerArray     = new Array();
    
    nextQuestion();
}


function nextQuestion(){  
  
    if(currentQuestion>0){
            $(QArray[currentQuestion-1]).animate(prevStage, animateSpeed);
    }

    if(currentQuestion<totalQuestions){
        $(QArray[currentQuestion]).animate(onStage, animateSpeed);
        var optionArray = $(QArray[currentQuestion]).find("li");
        /*for( var A in optionArray){
            //$(optionArray[A]).css('opacity', '0');
            //$(optionArray[A]).delay(animateSpeed).animate({opacity:1}, 1000);
        }
        */
    }       
        
    if(currentQuestion==totalQuestions){
        var mostLikely = getResults(answerArray);
         $(RArray[mostLikely]).animate(onStage, animateSpeed);
    }
}
    
function makeHTML(data) {
    /////////////////////////////////////////////////////
    //  Create HTML elements
    /////////////////////////////////////////////////////
    var title         = $("<div/>", {id:"title", text:$(data).find("title").text()});
    var intro         = $("<div/>", {id:"intro", text:$(data).find("intro").text()});
    var questionStage = $("<div/>", {id:"questionStage"});
    var quiz          = $("<ol/>",  {id:"allQuestions"});
            
    var questionsetArray = data.getElementsByTagName("questionset");
    var Qshuffle         = shuffleArray(questionsetArray.length);
        
    totalQuestions = questionsetArray.length;

    for (var A = 0; A < questionsetArray.length; A++) {
        var num = (random)? Qshuffle[A]: A;
  
        var questionset = $("<li/>",   {class:"questionSet",id:'QS'+num});
        var question    = $("<span/>", {class:"question",text:$(questionsetArray[num]).find("question").text()});
        var choices     = $("<ol/>",   {class:"choices"});

        var optionArray = questionsetArray[num].getElementsByTagName("option");
        var Oshuffle    = shuffleArray(optionArray.length);

        for (var B = 0; B < optionArray.length; B++) {
            
            var num2   = (random)? Oshuffle[B]: B;

            var link   = $("<a/>",  {class:"option",href:"#"});           
            var option = $("<li/>", {text:$(optionArray[num2]).text()});

            $(link).append(option);
            $(choices).append(link);
                
            $(link).on('click', {
                choice: $(optionArray[num2]).attr("value")
            }, clickHandler);

        }
                
        $(questionset).append(question).append(choices);              
        $(quiz).append(questionset);
                
        QArray.push(questionset);
    }

    $('#Qstage').append(title).append(intro).append(quiz);

    var resultsArray = data.getElementsByTagName("mostly");

    for (var C = 0; C < resultsArray.length; C++) {
        var results      = $("<div/>", {class:"results"})  
        var resultsTitle = $("<span/>",{class:"resultsTitle", text:$(resultsArray[C]).find("header").text()}); 
        var resultsBody  = $("<span/>",{class:"resultsBody",  text:$(resultsArray[C]).find("copy").text()}); 
                
        $(results).append(resultsTitle).append(resultsBody);
        $('#Qstage').append(results);
                
        RArray.push(results);
    }
}

function clickHandler(e) {
            
    var ChoiceNum = e.data.choice;
    
    if (answerArray[ChoiceNum] === undefined){
        answerArray[ChoiceNum] = 1;
    }else{
        answerArray[ChoiceNum]++;
    }
            
    currentQuestion ++;
    nextQuestion();
}

function getResults(rArray){
                
    var returnNum  = 0;
    var largestNum = 0;
                
    for( var i = 0; i < rArray.length; i++){
        if(rArray[i]>largestNum){
            largestNum = rArray[i];
            returnNum = i;
        }
    }        
    return returnNum;
}
                
function shuffleArray(num) {
    var s = Array();
    var i = num;
    while (i--) s.push(i);
    return arrayShuffle(s);
}

function arrayShuffle(oldArray) {
    var newArray = oldArray.slice();
    var len = newArray.length;
    var i = len;
    while (i--) {
        var p = parseInt(Math.random() * len);
        var t = newArray[i];
        newArray[i] = newArray[p];
        newArray[p] = t;
    }
    return newArray;
}
