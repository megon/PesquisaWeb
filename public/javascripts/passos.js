$(document).ready(function(){
  //$("#passo_form").validate();
  $("#passo_form").validationEngine();

  //primeiro passo
  criarFilhos();
  $("#passo_telefone_residencial").mask("(99)9999-9999",{placeholder:" "});
  $("#passo_quantos_filhos").change(criarFilhos);
  $("#passo_tem_filhos_sim").change(criarFilhos);
  $("#passo_tem_filhos_nao").change(ocultarFilhos);
  
  //segundo passo
  exibirOperadora();
  exibirCartaoCredito();
  $("#passo_possui_tv_por_assinatura_sim").change(exibirOperadora);
  $("#passo_possui_tv_por_assinatura_nao").change(exibirOperadora);
  $("#passo_cartao_credito_sim").change(exibirCartaoCredito);
  $("#passo_cartao_credito_nao").change(exibirCartaoCredito);
});

function criarFilhos(){
  $("#passo_form").validationEngine('hide');
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
      $('#passo_data_nascimento_filho_' + i).addClass('validate[required,custom[date]] input-text');
      $('#passo_sexo_filho_' + i + '_masculino').addClass('validate[required] radio');
      $('#passo_mora_com_voce_filho_' + i + '_sim').addClass('validate[required] radio');
    }
  }
}

function removerValidacaoFilhos(valorInicial){
  for (i = valorInicial; i <= 10; i++){  
    $('#passo_data_nascimento_filho_' + i).removeClass('validate[required,custom[date]] input-text');
    $('#passo_sexo_filho_' + i + '_masculino').removeClass('validate[required] radio');
    $('#passo_mora_com_voce_filho_' + i + '_sim').removeClass('validate[required] radio');
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
  $("#passo_form").validationEngine('hide');
	if ($("#passo_tem_filhos_nao:checked").val()){
	  $('#quantos_filhos').fadeOut();
	  $('#div_filhos').fadeOut();
	  $('#passo_quantos_filhos').val(0);
	}
  removerValidacaoFilhos(0);
  removerConteudoFilhos(0);
}

function exibirOperadora(){
  $("#passo_form").validationEngine('hide');
	if ($("#passo_possui_tv_por_assinatura_sim:checked").val()){
		$('#operadora_tv_assinatura').fadeIn("slow");
                $('#passo_operadora_tv_assinatura').addClass('validate[required]');
	}

	if ($("#passo_possui_tv_por_assinatura_nao:checked").val()){
		$('#operadora_tv_assinatura').fadeOut();
                $('#passo_operadora_tv_assinatura').removeClass('validate[required]');
	}
}

function exibirCartaoCredito(){
	if ($("#passo_cartao_credito_sim:checked").val()){
		$('#cartao_credito').fadeIn("slow");
	}

	if ($("#passo_cartao_credito_nao:checked").val()){
		$('#cartao_credito').fadeOut();
	}
}


