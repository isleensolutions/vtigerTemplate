(function(b){var a=function(){this.element=false;
this.init=function(d,e,c){a.prototype.init.call(this,d,e,c);
};
this.triggerClick=function(c){this.element.trigger("vtchartClick",c);
};
};
b.fn.vtchart=function(d){var f=[];
for(var e=0,c=arguments.length;
e<c;
e++){f.push(arguments[e]);
}if(typeof Highcharts!="undefined"&&b.isFunction(vtHighChartInterface)){a.prototype=new vtHighChartInterface();
}else{if(b.isFunction(b.vtJqPlotInterface)){a.prototype=new vtJqPlotInterface();
}else{console.log("supported interface found!");
}}return this.each(function(h,i){var j=jQuery(i);
var g=new a();
g.init(j,f[0],f[1]);
});
};
})(jQuery);