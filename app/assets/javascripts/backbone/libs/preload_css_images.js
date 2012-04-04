/**
 * --------------------------------------------------------------------
 * jQuery-Plugin "preloadCssImages"
 * by Scott Jehl, scott@filamentgroup.com
 * http://www.filamentgroup.com
 * reference article: http://www.filamentgroup.com/lab/update_automatically_preload_images_from_css_with_jquery/
 * demo page: http://www.filamentgroup.com/examples/preloadImages/index_v2.php
 * 
 * Copyright (c) 2008 Filament Group, Inc
 * Dual licensed under the MIT (filamentgroup.com/examples/mit-license.txt) and GPL (filamentgroup.com/examples/gpl-license.txt) licenses.
 *
 * Version: 2.0, 06.04.2008
 * Changelog:
 *  02.20.2008 initial Version 1.0
 *  06.04.2008 Version 2.0 : removed need for any passed arguments. Images load from any and all directories.
 * --------------------------------------------------------------------
 */
jQuery.preloadCssImages = function(clb){
  var allImgs = [];//new array for all the image urls  
  var k = 0; //iterator for adding images
  var sheets = document.styleSheets;//array of stylesheets
  
  for(var i = 0; i<sheets.length; i++){//loop through each stylesheet
    var cssPile = '';//create large string of all css rules in sheet
    var csshref = (sheets[i].href) ? sheets[i].href : 'window.location.href';
    var baseURLarr = csshref.split('/');//split href at / to make array
    baseURLarr.pop();//remove file path from baseURL array
    var baseURL = baseURLarr.join('/');//create base url for the images in this sheet (css file's dir)
    if(baseURL!="") baseURL+='/'; //tack on a / if needed
    if(document.styleSheets[i].cssRules){//w3
      var thisSheetRules = document.styleSheets[i].cssRules; //w3
      for(var j = 0; j<thisSheetRules.length; j++){
        cssPile+= thisSheetRules[j].cssText;
      }
    }
    else {
      cssPile+= document.styleSheets[i].cssText;
    }
    
    //parse cssPile for image urls and load them into the DOM
    var imgUrls = cssPile.match(/[^\(]+\.(gif|jpg|jpeg|png|svg)/g);//reg ex to get a string of between a "(" and a ".filename"
    if(imgUrls != null && imgUrls.length>0 && imgUrls != ''){//loop array
      var arr = jQuery.makeArray(imgUrls);//create array from regex obj  
      return arr;
    }
  }//loop
  return [];
}       
    
