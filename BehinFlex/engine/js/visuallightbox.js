// -----------------------------------------------------------------------------------
//
// VisualLightBox for jQuery v 5.0.20j
// http://visuallightbox.com/
// VisualLightBox is a free wizard program that helps you easily generate LightBox photo
// galleries, in a few clicks without writing a single line of code. For Windows and Mac!
// Last updated: 2011-11-15
//
(function(a){a.fn.visualLightbox=function(af){var X=null,z=["select","object","embed"],aa=null,e=[],b=null,aW=null,p=50,ae,al;if(!document.getElementsByTagName){return}af=a.extend({animate:true,autoPlay:true,borderSize:39,containerID:document,enableSlideshow:true,googleAnalytics:false,descSliding:true,imageDataLocation:"south",shadowLocation:"",closeLocation:"",initImage:"",loop:true,overlayDuration:0.2,overlayOpacity:0.7,prefix:"",classNames:"vlightbox",resizeSpeed:7,showGroupName:false,slideTime:4,strings:{closeLink:"",loadingMsg:"loading",nextLink:"",prevLink:"",startSlideshow:"",stopSlideshow:"",numDisplayPrefix:"",numDisplaySeparator:"/"},enableRightClick:false,featBrowser:true,breathingSize:20,startZoom:false,floating:true},af);if(af.animate){var aT=Math.max(af.overlayDuration,0);af.resizeSpeed=Math.max(Math.min(af.resizeSpeed,10),1);var aN=(11-af.resizeSpeed)*0.15}else{var aT=0;var aN=0}var aV=af.enableSlideshow;af.overlayOpacity=Math.max(Math.min(af.overlayOpacity,1),0);var aw=af.autoPlay;var ar=a(af.containerID);var m=af.classNames;aL();var aH=ar.length&&ar.get(0)!=document?ar.get(0):document.getElementsByTagName("body").item(0);if(aH.childNodes.length){a(aH.childNodes[0]).before(a("<div></div>"));aH=aH.childNodes[0]}function y(t,c,d){(a("#"+t).unbind())[c](d)}if(!document.getElementById(I("overlay"))){var ai=document.createElement("div");ai.setAttribute("id",I("overlay"));ai.style.display="none";aH.appendChild(ai);var aF=document.createElement("div");aF.setAttribute("id",I("lightbox"));aF.style.display="none";aH.appendChild(aF);var aD=document.createElement("div");aD.setAttribute("id",I("imageDataContainer"));aD.className=I("clearfix");var w=document.createElement("table");w.setAttribute("id",I("outerImageContainer"));w.cellSpacing=0;aF.appendChild(w);var aJ=w.insertRow(-1);var ao=aJ.insertCell(-1);ao.className="tl";var at=aJ.insertCell(-1);at.className="tc";var an=aJ.insertCell(-1);an.className="tr";var k=w.insertRow(-1);var aC=k.insertCell(-1);aC.className="ml";var M=k.insertCell(-1);M.setAttribute("id",I("lightboxFrameBody"));var ay=k.insertCell(-1);ay.className="mr";var ak=w.insertRow(-1);var aj=ak.insertCell(-1);aj.className="bl";var am=ak.insertCell(-1);am.className="bc";var ad=ak.insertCell(-1);ad.className="br";if(af.imageDataLocation=="north"){M.appendChild(aD)}var V=document.createElement("div");V.setAttribute("id",I("imageData"));aD.appendChild(V);var u=document.createElement("div");u.setAttribute("id",I("imageDetails"));V.appendChild(u);var B=document.createElement("div");B.setAttribute("id",I("caption"));u.appendChild(B);var s=document.createElement("span");s.setAttribute("id",I("numberDisplay"));u.appendChild(s);var Z=document.createElement("span");Z.setAttribute("id",I("detailsNav"));u.appendChild(Z);var l=document.createElement("a");l.setAttribute("id",I("prevLinkDetails"));l.setAttribute("href","javascript:void(0);");l.innerHTML=af.strings.prevLink;Z.appendChild(l);var aM=document.createElement("a");aM.setAttribute("id",I("slideShowControl"));aM.setAttribute("href","javascript:void(0);");Z.appendChild(aM);var U=document.createElement("a");U.setAttribute("id",I("closeLink"));U.setAttribute("href","javascript:void(0);");U.innerHTML=af.strings.closeLink;if(af.closeLocation=="nav"){Z.appendChild(U)}else{var D=document.createElement("div");D.setAttribute("id",I("close"));if(af.closeLocation=="top"){an.appendChild(D)}else{V.appendChild(D)}D.appendChild(U)}var aI=document.createElement("a");aI.setAttribute("id",I("nextLinkDetails"));aI.setAttribute("href","javascript:void(0);");aI.innerHTML=af.strings.nextLink;Z.appendChild(aI);var r=document.createElement("div");r.setAttribute("id",I("imageContainerMain"));M.appendChild(r);var ac=document.createElement("div");ac.setAttribute("id",I("imageContainer"));r.appendChild(ac);var az=document.createElement("img");az.setAttribute("id",I("lightboxImage"));ac.appendChild(az);if(!af.enableRightClick){var aq=document.createElement("div");aq.setAttribute("id",I("hoverNav"));aq.style.background="white";aq.style.opacity=0;aq.style.filter="alpha(opacity=0)";ac.appendChild(aq)}var aE=document.createElement("a");aE.setAttribute("id",I("prevLinkImg"));aE.setAttribute("href","javascript:void(0);");r.appendChild(aE);var o=document.createElement("a");o.setAttribute("id",I("nextLinkImg"));o.setAttribute("href","javascript:void(0);");r.appendChild(o);var R=document.createElement("div");R.setAttribute("id",I("loading"));ac.appendChild(R);var H=document.createElement("a");H.setAttribute("id",I("loadingLink"));H.setAttribute("href","javascript:void(0);");H.innerHTML=af.strings.loadingMsg;R.appendChild(H);if(af.imageDataLocation!="north"){M.appendChild(aD)}var aP=document.createElement("div");aP.setAttribute("id",I("shadow"));(af.shadowLocation?document.getElementById(I(af.shadowLocation)):am).appendChild(aP)}function av(){y(I("overlay"),"click",O);y(I("lightbox"),"click",O);y(I("prevLinkDetails"),"click",Y);y(I("slideShowControl"),"click",v);y(I("closeLink"),"click",O);y(I("nextLinkDetails"),"click",aB);if(!af.enableRightClick){y(I("hoverNav"),"mousemove",A);y(I("hoverNav"),"mouseout",S)}y(I("prevLinkImg"),"click",Y);y(I("nextLinkImg"),"click",aB);y(I("loadingLink"),"click",O)}if(af.initImage!=""){q("#"+af.initImage)}function aQ(c){if(c.tagName.toLowerCase()!="a"){c=a("A:first",c)}return a(c).attr("href")}function L(c){if(c.tagName.toLowerCase()=="a"){return a(c).attr("title")||c.title}return a(">*:last",c).html()}function aL(){a("."+m.replace(/\,/g,",."),ar).each(function(){if(aQ(this)){a(this).click(function(c){c.preventDefault();q(this);return false})}})}var J="Behinflex.com";if(J){var Q=a("<div></div>");Q.css({position:"absolute",right:"0px",bottom:"0px",padding:"2px 3px","background-color":"#EEE","z-index":10});a(ac).append(Q);var P=a(document.createElement("A"));P.css({color:"#555",font:"11px Arial,Verdana,sans-serif",padding:"3px 6px",width:"auto",height:"auto",margin:"0 0 0 0",outline:"none"});P.attr({href:"http://"+J.toLowerCase()});P.html(J);P.bind("contextmenu",function(c){return false});Q.append(P)}var q=this.start=function(c){n();c=a(c);aU("overlay").css({height:N()[1]+"px",left:i().x+"px"});if(af.descSliding){aU("imageDataContainer").hide()}aU("lightboxImage").hide().attr({src:""});if(af.startZoom){aU("imageContainer").css({width:c.width()+"px",height:c.height()+"px"});if(!document.all){aU("outerImageContainer").css({opacity:0.1})}aU("lightbox").css({left:c.offset().left-af.borderSize+"px",top:c.offset().top-af.borderSize+"px",width:c.width()+af.borderSize*2+"px",height:"auto"})}else{aU("overlay").css({opacity:0}).show().fadeTo(aT*1000,af.overlayOpacity);aU("lightbox").css({left:0,width:"100%"})}av();aU("lightbox").show();e=[];aa=null;aW=0;a("."+(c.attr("className")||c.get(0).className),ar).each(function(){if(aQ(this)){e.push({link:aQ(this),title:L(this)});if(this==c.get(0)){aW=e.length-1}}});if(e.length>1){aa=c.attr("className")}if(af.featBrowser){a(window).resize(ag)}if(af.floating){a(window).scroll(ag)}a(window).resize(F);a(window).scroll(F);g(aW)};function g(c){X=c;aO();T();G();if(!af.startZoom){aU("lightboxImage").hide()}aU("prevLinkImg").hide();aU("nextLinkImg").hide();if(af.descSliding){aU("imageDataContainer").hide()}ae=new Image();ae.onload=function(){e[X].link=ae.src;e[X].width=ae.width;e[X].height=ae.height;aA(false)};if(af.startZoom&&!aU("lightboxImage").attr("src")){e[X].width=320;e[X].height=240;aA(false,true)}ae.src=e[X].link;if(af.googleAnalytics){urchinTracker(e[X].link)}}function aA(t,a3){var a4=e[X].width;var a5=e[X].height;var aZ=f();var aX=a4/a5;if(af.featBrowser){var d=aZ.winWidth/aZ.winHeight;if(aX>d){var a7=aZ.winWidth-af.borderSize*2-af.breathingSize*2;var a6=Math.round(a7/aX)}else{var a6=aZ.winHeight-af.borderSize*2-af.breathingSize*2-p;var a7=Math.round(a6*aX)}if(a4>a7||a5>a6){a4=a7;a5=a6}}var a1=i().y+(f().winHeight-(a5+p+af.borderSize*2))/2;var a9=i().x;var a2=aU("imageContainer");if(t==true){a2.css({height:a5+"px",width:a4+"px"});if(af.floating){h(aU("lightbox"),a9,a1)}else{aU("lightbox").css({top:a1+"px",left:a9+"px"})}}else{var aY=aU("lightboxImage");a2.stop(true,false);aY.stop(true,false);var c;if(af.startZoom&&aY.attr("src")){c=aY;c.attr({id:I("lightboxImage2")})}else{aY.remove()}if(!a3){aY=a(ae);aY.hide();aY.attr({id:I("lightboxImage")});a2.append(aY)}var a8=aX/(a2.width()/a2.height());if(!a3){if(af.startZoom){if(c){aU("lightboxImage2").stop(true,true)}var a0=c?120:100;if(c){c.css({width:(1>a8?"auto":(c.width()/c.parent().width())*100+"%"),height:(1>a8?(c.height()/c.parent().height())*100+"%":"auto"),left:0,top:0})}aY.css({opacity:0,display:"block",position:"absolute",width:(1>a8)?a0+"%":"auto",height:(1>a8)?"auto":a0+"%",left:(100-a0*(1>a8?1:a8))/2+"%",top:(100-a0*(1>a8?1/(a8):1))/2+"%"})}if(af.startZoom){aS()}}K(a9,a1,a4,a5,a8,a3)}if(document.all){aU("imageDataContainer").css({width:a4+"px"})}if(af.enableRightClick){aU("lightboxImage").mousemove(A);aU("lightboxImage").mouseout(S)}}function K(a2,aX,a0,a1,a3,aY){var aZ=aU("imageContainer");var d=aU("lightboxImage");var t=aU("lightbox");if(!aY){var c=aU("lightboxImage2")}if(af.startZoom){d.fadeTo(aN*1000,1);if(!document.all){aU("outerImageContainer").fadeTo(aN*1000,1)}}h(t,a2,aX);if(af.startZoom&&!aY){c.animate(a.extend({opacity:0},a3<1?{height:"120%",top:"-10%",left:(100-120/a3)/2+"%"}:{width:"120%",left:"-10%",top:(100-a3*120)/2+"%"}),{queue:false,duration:aN*1000,complete:function(){a(this).remove()}});d.animate(a.extend({left:0,top:0},a3<1?{width:"100%"}:{height:"100%"}),{queue:false,duration:aN*1000})}aZ.animate({width:a0+"px",height:a1+"px"},{queue:false,duration:aN*1000,complete:!aY?function(){aR()}:null})}function h(d,t,c){d.stop(true,false);d.animate({width:"100%",left:0,top:c,left:t},{queue:false,duration:aN*1000})}function G(){clearTimeout(al);var c=aU("loading");c.show();c.css({visibility:"hidden"});al=setTimeout(function(){aU("loading").css({visibility:"visible"})},300)}function aS(){clearTimeout(al);aU("loading").hide()}function aR(){aS();if(af.startZoom){aU("overlay:hidden").css({opacity:0}).show().fadeTo(aT*1000,af.overlayOpacity);aK()}else{aU("lightboxImage").css({opacity:0}).show().fadeTo(500,1,function(){aK()})}E()}function x(){aU("caption").html(e[X].title||"");if(e.length>1){var c=af.strings.numDisplayPrefix+" "+parseInt(X+1)+" "+af.strings.numDisplaySeparator+" "+e.length;if(af.showGroupName&&aa){c+=" "+af.strings.numDisplaySeparator+" "+aa}aU("numberDisplay").text(c);aU("slideShowControl").css({display:aV?"":"none"})}}function aK(){x();if(af.descSliding){aU("imageDataContainer").animate({height:"show",opacity:"show"},650,null,function(){C()})}else{C()}}function C(){var c=1/e.length;p=p*(1-c)+aU("imageDataContainer").height()*c;if(e.length>1){aU("prevLinkImg").show();aU("nextLinkImg").show();if(aV){if(aw){ab()}else{ax()}}}j()}function ab(){if(aU("lightbox:hidden").length){return}T();aw=true;b=setTimeout(function(){aB()},af.slideTime*1000);aU("slideShowControl").text(af.strings.stopSlideshow);aU("slideShowControl").addClass("started")}function ax(){aw=false;T();aU("slideShowControl").text(af.strings.startSlideshow);aU("slideShowControl").removeClass("started")}function v(){if(aw){ax()}else{ab()}}function T(){if(b){b=clearTimeout(b)}}function aB(){if(e.length>1){T();if(!af.loop&&((X==e.length-1&&aW==0)||(X+1==aW))){O();return}if(X==e.length-1){au(0)}else{au(X+1)}}}function au(c){if(af.descSliding){aU("imageDataContainer").animate({height:"hide",opacity:"hide"},650,null,function(){g(c)})}else{g(c)}}function Y(){if(e.length>1){if(X==0){au(e.length-1)}else{au(X-1)}}}function aG(){if(e.length>1){au(0)}}function ap(){if(e.length>1){au(e.length-1)}}function j(){document.onkeydown=ah}function aO(){document.onkeydown=""}function ah(c){if(c==null){keycode=event.keyCode}else{keycode=c.which}key=String.fromCharCode(keycode).toLowerCase();if(key=="x"||key=="o"||key=="c"||keycode==27){O()}else{if(key=="p"||key=="%"){Y()}else{if(key=="n"||key=="'"){aB()}else{if(key=="f"){aG()}else{if(key=="l"){ap()}else{if(key=="s"){if(e.length>0&&af.enableSlideshow){v()}}}}}}}}function E(){var d=e.length-1==X?0:X+1;(new Image()).src=e[d].link;var c=X==0?e.length-1:X-1;(new Image()).src=e[c].link}function O(c){if(c){var d=a(c.target).attr("id");if(I("closeLink")!=d&&I("lightbox")!=d&&I("overlay")!=d){return}}aU("imageContainer").stop(true,false);aU("lightboxImage").stop(true,false);ae.onload=null;aO();T();aU("lightbox").hide();W();if(af.overlayOpacity){aU("overlay").fadeOut(aT*1000)}else{aU("overlay").hide()}a(window).unbind("resize",ag);a(window).unbind("scroll",ag);a(window).unbind("resize",F);a(window).unbind("scroll",F)}function A(c){if(c.pageX-aU("imageContainer").offset().left<aU("imageContainer").width()/2){aU("prevLinkImg").addClass("hover");aU("nextLinkImg").removeClass("hover")}else{aU("prevLinkImg").removeClass("hover");aU("nextLinkImg").addClass("hover")}}function S(){aU("prevLinkImg").removeClass("hover");aU("nextLinkImg").removeClass("hover")}function ag(){aA(true)}function F(){aU("overlay").css({left:i().x+"px",top:0,width:"100%",height:N()[1]+"px"})}function W(){var aX;var d=z;for(var t=0;t<d.length;t++){aX=document.getElementsByTagName(d[t]);for(var c=0;c<aX.length;c++){a(aX[c]).css({visibility:"visible"})}}}function n(){var c=z;for(var d=0;d<c.length;d++){a(c[d]).css({visibility:"hidden"})}}function i(){var c,d;if(self.pageYOffset||self.pageXOffset){c=self.pageXOffset;d=self.pageYOffset}else{if(document.documentElement&&(document.documentElement.scrollTop||document.documentElement.scrollLeft)){c=document.documentElement.scrollLeft;d=document.documentElement.scrollTop}else{if(document.body){c=document.body.scrollLeft;d=document.body.scrollTop}}}return{x:c,y:d}}function f(){var d,c;if(self.innerHeight){d=self.innerWidth;c=self.innerHeight}else{if(document.documentElement&&document.documentElement.clientHeight){d=document.documentElement.clientWidth;c=document.documentElement.clientHeight}else{if(document.body){d=document.body.clientWidth;c=document.body.clientHeight}}}return{winWidth:d,winHeight:c}}function N(){var c=document.body,aX=document.documentElement,d=0,t=0;if(aX){d=Math.max(d,aX.scrollWidth,aX.offsetWidth);t=Math.max(t,aX.scrollHeight,aX.offsetHeight)}if(c){d=Math.max(d,c.scrollWidth,c.offsetWidth);t=Math.max(t,c.scrollHeight,c.offsetHeight);if(window.innerWidth){d=Math.max(d,window.innerWidth);t=Math.max(t,window.innerHeight)}}return[d,t]}function I(c){return af.prefix+c}function aU(c){return a("#"+I(c))}return this}})(jQuery);