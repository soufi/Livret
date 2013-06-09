
function disableChoices(str){
	//creation d'une expression reguliere insensible a la casse
	stregexp = new RegExp(str,'i');
	//si on pas de saisi, on affiche toutes les options
	if(jQuery.isEmptyObject(str)){
		$("select option").each(function(){
			$(this).css('display', 'none');
		});
	}
	//sinon on selectionne que celle qui match
	else{
		$("select option").each(function(){
			if($(this).val().match(stregexp) == null){
				$(this).hide();
			}else{
				$(this).show();
			}
		});
	}
}