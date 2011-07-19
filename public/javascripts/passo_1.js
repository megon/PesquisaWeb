$(document).ready(function(){
  $("#passo_form").validate();
  $("#passo_telefone_residencial").mask("(99)9999-9999",{placeholder:" "});

  criarFilhos();
  $("#passo_quantos_filhos").change(criarFilhos);
  $("#passo_tem_filhos_sim").change(criarFilhos);
  $("#passo_tem_filhos_nao").change(ocultarFilhos);
});

function criarFilhos(){
	if ($("#passo_tem_filhos_sim:checked").val()){
		$('#quantos_filhos').fadeIn("slow");
	}

  var valorInicial = parseInt($('#passo_quantos_filhos').val()) + 1;
  removerValidacaoFilhos(valorInicial);
  removerConteudoFilhos(valorInicial);

  exibirFilhos();
  adicionarValidacaoFilhos();
}

function exibirFilhos(){
  if ($('#passo_quantos_filhos').val()>0){
    $('#div_filhos').show();
    for (i = 0; i <= $('#passo_quantos_filhos').val(); i++){
      $('#filho_' + i).fadeIn("slow");
    }
  }
}

function adicionarValidacaoFilhos(){
  if ($('#passo_quantos_filhos').val()>0){
    for (i = 0; i <= $('#passo_quantos_filhos').val(); i++){
      $('#passo_data_nascimento_filho_' + i).mask('99/99/9999',{placeholder:' '});
      $('#passo_data_nascimento_filho_' + i).addClass('dateBR');
      $('#passo_sexo_filho_' + i + '_masculino').addClass('requiredRadio');
      $('#passo_mora_com_voce_filho_' + i + '_sim').addClass('requiredRadio');
    }
  }
}

function removerValidacaoFilhos(valorInicial){
  for (i = valorInicial; i <= 10; i++){  
    $('#passo_data_nascimento_filho_' + i).removeClass('dateBR');
    $('#passo_sexo_filho_' + i + '_masculino').removeClass('requiredRadio');      
    $('#passo_mora_com_voce_filho_' + i + '_sim').removeClass('requiredRadio');
  }
}

function removerConteudoFilhos(valorInicial){
  for (i = valorInicial; i <= 10; i++){  
    $('#filho_' + i).hide();
    $('#passo_data_nascimento_filho_' + i).val("");
    $('#passo_sexo_filho_' + i + '_nil').attr('checked', true);      
    $('#passo_mora_com_voce_filho_' + i + '_nil').attr('checked', true);
  }
}

function ocultarFilhos(){
	if ($("#passo_tem_filhos_nao:checked").val()){
	  $('#quantos_filhos').fadeOut();
	  $('#div_filhos').fadeOut();
	  $('#passo_quantos_filhos').val(0);
	}
  removerValidacaoFilhos(0);
  removerConteudoFilhos(0);
}
