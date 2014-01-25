$(document).ready(function(){
    $('#presente_url').keydown(carrega_url);
    $('#presente_url').click(carrega_url);

    function carrega_url(){
        $('#dados_presente_url_produto').attr('value', $('#presente_url').val());
    }

    $('#presente_url').blur(function(){
        if ($('#presente_url').val() != $('#dados_presente_url_produto').val()) {
            $('#dados_presente_url_produto').attr('value', $('#presente_url').val());
            $('.escolher-fotos .panel').text('Carregando imagens do site...');
            $('form#fotos-produto').submit();
        }
    })

    $('form#fotos-produto')
        .bind("ajax:success", function(evt, data, status, xhr){
            $('.escolher-fotos .panel').text('');
            $('.escolher-fotos .panel').append(xhr.responseText);
        })
        .bind("ajax:error", function(evt, data, status, xhr){
            $('.escolher-fotos .panel').text('Nenhuma imagem encontrada');
            $('.escolher-fotos .panel').hide('3000');
            $('.escolher-fotos .panel').show('3000');
        });
});