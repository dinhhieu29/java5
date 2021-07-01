function printValue(sliderID, textbox) {
	 var x = document.getElementById(textbox);
	 var y = document.getElementById(sliderID);
	 x.value = y.value;
}

window.onload = function() { 
	printValue('rangeSlider', 'rangeValue');
}