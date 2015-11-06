<script>

var questions = {$questions_json};

var flky = new Flickity( '.gallery', {
    autoPlay: false,
    draggable: true
});

/*$(function() {
    h = $( window ).height();
    $( ".gallery-cell" ).each(function( index ) { 
        if ($(this).height() < 0.9*h) {
            $(this).height(0.9*h);
        }
    });
    
});*/

$(function() {

    //var $gallery = $('.gallery').flickity().flickity('next');
   // var flkty = new Flickity('.gallery');  
    $(".movex").click(function() {
        flky.next();
        nothing = 0;
    });
 
});

$(function() {
    flky.on( 'cellSelect', function() {
        cell_id = parseInt(flky.selectedCell.element.dataset.cell);
        if (cell_id == {$questions_count+2}) {
            var sum = 0
            $(".correct-counter").each(function(){
                sum += parseInt($(this).val());
            });
            $("#number-correct-answers").html(sum);
            rate = sum / {$questions_count};
            if (rate == 1) {
                $("#text-correct-answers").html("{$t['results_100']}");
                $("#smiley-correct-answers").html("<i class='fa fa-smile-o'></i>");
            } else {
                if (rate >= 0.667) {
                    $("#text-correct-answers").html("{$t['results_66']}");
                    $("#smiley-correct-answers").html("<i class='fa fa-smile-o'></i>");
                } else {
                    if (rate >= 0.333) {
                        $("#text-correct-answers").html("{$t['results_33']}");
                        $("#smiley-correct-answers").html("<i class='fa fa-meh-o'></i>");
                    } else {
                        if (rate > 0) {
                            $("#text-correct-answers").html("{$t['results_0']}");
                        } else {
                            $("#text-correct-answers").html("{$t['results_00']}");
                        }
                        $("#smiley-correct-answers").html("<i class='fa fa-frown-o'></i>");
                    }
                }
            }
        }
        $.ajax({   
                            type: "POST",
                            data : $("#myform").serialize(),
                            cache: false,  
                            url: "store.php",   
                            success: function(data){
                                                      
                            }   
                        });   
    })
});

/*$(function() {
    flky.on( 'cellSelect', function() {
        alert('ja');
    })
});*/

$(function() {
    $('.modal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget) // Button that triggered the modal
      var abc_answer = button.data('answer') // Extract info from data-* attributes
      var q_id = button.data('id')
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      if (abc_answer == questions[q_id]['correct']) {
        var correct = true;
        var icon = "check";
        var color = "bg-correct";
        var remove_color = "bg-wrong";
        var text = "{$t['correct']}";  
        var answer_question = "";
        $("#correct-" + q_id).val(1);
      } else {
        var icon = "close";
        var color = "bg-wrong";
        var remove_color = "bg-correct";
        var text = "{$t['wrong']}"
        var answer_question = questions[q_id][abc_answer] + "<br>";
        $("#correct-" + q_id).val(0);
      }
      
      var correct_question = questions[q_id][questions[q_id]['correct']];
      
      
      var resource_string = "";
      for (i = 0; i < questions[q_id]['sources_links_ar'].length; ++i) {
            resource_string += "<a href='" + questions[q_id]['sources_links_ar'][i] + "' target='_blank'>" + questions[q_id]['sources_names_ar'][i] + " </a>";
      }
      
      var modal = $(this)
      modal.find('.modal-title').text(questions[q_id]['question'])
      modal.find('.modal-body').html(
        '<span class="fa-stack fa-lg fa-3x">' +
            '<i class="fa fa-circle-o fa-stack-2x"></i>' +
            "<i class='fa fa-" + icon + " fa-stack-1x'></i>" +
        '</span>' +
           
        text +
        '<p>' + 
        '<span class="wrong-question">' + answer_question + '</span>' +
        "{$t['correct_answer']}: " + correct_question + '<br>' +
        "{$t['resources']}: " + resource_string
        
      )
      modal.find('.modal-content').addClass(color)
      modal.find('.modal-content').removeClass(remove_color)
      
    })
})

</script>

