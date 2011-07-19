$(document).ready(function(){
  $("#passo_form").validate();
  $("#passo_telefone_residencial").mask("(99)9999-9999",{placeholder:" "});

  criar_filhos();
  $("#passo_quantos_filhos").change(criar_filhos);
  $("#passo_tem_filhos_sim").change(criar_filhos);
  $("#passo_tem_filhos_nao").change(ocultar_filhos);
});

function criar_filhos(){
	if ($("#passo_tem_filhos_sim:checked").val()){
		$('#quantos_filhos').fadeIn("slow");
	}

  remover_validacao_filhos();
  exibir_filhos();
  adicionar_validacao_filhos();
}

function exibir_filhos(){
  if ($('#passo_quantos_filhos').val()>0){
    $('#div_filhos').show();
    for (i = 0; i <= $('#passo_quantos_filhos').val(); i++){
      $('#filho_' + i).fadeIn("slow");
    }
  }
}

function adicionar_validacao_filhos(){
  if ($('#passo_quantos_filhos').val()>0){
    for (i = 0; i <= $('#passo_quantos_filhos').val(); i++){
      $('#passo_data_nascimento_filho_' + i).mask('99/99/9999',{placeholder:' '});
      $('#passo_data_nascimento_filho_' + i).addClass('dateBR');
      $('#passo_sexo_filho_' + i + '_masculino').addClass('requiredRadio');
      $('#passo_mora_com_voce_filho_' + i + '_sim').addClass('requiredRadio');
    }
  }
}
function remover_validacao_filhos(){
  for (i = 0; i <= 10; i++){
    $('#filho_' + i).hide();
    $('#passo_data_nascimento_filho_' + i).removeClass('dateBR');
    $('#passo_sexo_filho_' + i + '_masculino').removeClass('requiredRadio');      
    $('#passo_mora_com_voce_filho_' + i + '_sim').removeClass('requiredRadio');
  }  
}

function ocultar_filhos(){
	if ($("#passo_tem_filhos_nao:checked").val()){
	  $('#quantos_filhos').fadeOut();
	  $('#div_filhos').fadeOut();
	  $('#passo_quantos_filhos').val(0);
	}
	remover_validacao_filhos();
}
