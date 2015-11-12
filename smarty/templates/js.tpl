<script>
//questions
var questions = {$questions_json};

//start flickity
var flky = new Flickity( '.gallery', {
    autoPlay: false,
    draggable: true
});

//move to right on click
$(function() {
    $(".movex").click(function() {
        flky.next();
        nothing = 0;
    });
 
});

//geolocation
function storePosition(position) {
    if (position) {
        $("#latitude").val(position.coords.latitude);
        $("#longitude").val(position.coords.longitude);
        $("#accuracy").val(position.coords.accuracy);
        $("#geolocation").val("ok"); 
    } else {
       $("#geolocation").val("not_supported"); 
    }
}
function errorPosition(error) {
    var x = $("#geolocation");
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.val("permission_denied");
            break;
        case error.POSITION_UNAVAILABLE:
            x.val("position_unavailable");
            break;
        case error.TIMEOUT:
            x.val("timeout");
            break;
        case error.UNKNOWN_ERROR:
            x.val("unknown_error");
            break;
    }
}

//sms - correction for iOS:
$(function() {
  if ( !navigator.userAgent.match(/(iPad|iPhone|iPod)/g) ) return;

  jQuery('a[href^="sms:"]').attr('href', function() {
    // Convert: sms:+000?body=example
    // To iOS:  sms:+000;body=example (semicolon, not question mark)
    return jQuery(this).attr('href').replace(/sms:(\+?([0-9]*))?\?/, 'sms:$1&');
  });
});

//results
$(function() {
    flky.on( 'cellSelect', function() {
        cell_id = parseInt(flky.selectedCell.element.dataset.cell);
        //last page selected
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
            $.ajax({   
                type: "POST",
                data : $("#myform").serialize(),
                cache: false,
                url: "store.php",   
                success: function(data){
                                          
                }   
            });  
        } else {
            //pen-last cell selected
            if (cell_id == {$questions_count+1}) {
                if(navigator.geolocation){
                    navigator.geolocation.getCurrentPosition(storePosition,errorPosition,{ maximumAge:Infinity });
                } else {
                    storePosition(false);
                }
            }
        }
         
    })
});
</script>

{*inside modal using handlebar*}
{literal}
<script id="modal-template" type="text/x-handlebars-template">
    
    <span class="fa-stack fa-lg fa-3x"> 
        <i class="fa fa-circle-o fa-stack-2x"></i>
        <i class="fa fa-{{icon}} fa-stack-1x"></i>
    </span>
    <span class="xl">{{text}}</span>
    <p>
        {{#each answer_question}}<span class="wrong-question l"><strong>{{this}}</strong></span><br>{{/each}}
        <span class="l">{{t_correct_answer}}: {{correct_question}}</span><br>
        {{t_resources}}: {{#each resources}}<a href="{{this.link}}" target="_blank">{{this.name}}</a>{{#if @last}}{{else}}, {{/if}}
        {{/each}}

</script>
{/literal}

{*show correct modal*}
<script>
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
        var answer_question = [];
        $("#correct-" + q_id).val(1);
      } else {
        var icon = "close";
        var color = "bg-wrong";
        var remove_color = "bg-correct";
        var text = "{$t['wrong']}"
        var answer_question = [questions[q_id][abc_answer]];
        $("#correct-" + q_id).val(0);
      }
      $("#answer-" + q_id).val(abc_answer);
      
      var correct_question = questions[q_id][questions[q_id]['correct']];
      
      
      var resources = [];
      for (i = 0; i < questions[q_id]['sources_links_ar'].length; ++i) {
            resources.push({
                "link": questions[q_id]['sources_links_ar'][i],
                "name": questions[q_id]['sources_names_ar'][i]
            });
      }
      
      var modal = $(this)
      modal.find('.modal-title').text(questions[q_id]['question'])
      var theTemplateScript = $("#modal-template").html();
      var theTemplate = Handlebars.compile(theTemplateScript);
      var context = {
        "icon": icon,
        "text": text,
        "answer_question": answer_question,
        "correct_question": correct_question,

        "resources": resources,
        "t_correct_answer": "{$t['correct_answer']}",
        "t_resources": "{$t['resources']}",
        "sources_links_ar": questions[q_id]['sources_links_ar'],
        "sources_names_ar": questions[q_id]['sources_names_ar']
      };
      var theCompiledHtml = theTemplate(context);
      $('#modal-body').html(theCompiledHtml);

      modal.find('.modal-content').addClass(color)
      modal.find('.modal-content').removeClass(remove_color)
      
    })
})

</script>

