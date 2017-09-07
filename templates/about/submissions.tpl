{**
 * templates/about/submissions.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal / Submissions.
 *
 *}
{strip}
{assign var="pageTitle" value="about.submissions"}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css">
<link rel="stylesheet" href="{$baseUrl}/lib/osu/miniHeader.css" type="text/css" />
<div class="row">
  <div class="col-md-8 col-md-offset-2">

    {if $currentJournal->getSetting('journalPaymentsEnabled') &&
    		($currentJournal->getSetting('submissionFeeEnabled') || $currentJournal->getSetting('fastTrackFeeEnabled') || $currentJournal->getSetting('publicationFeeEnabled')) }
    	{assign var="authorFees" value=1}
    {/if}

    <ul class="miniHeader">
    	<li id="linkDisableUserReg"><a href="{url page="about" op="submissions" anchor="onlineSubmissions"}">{translate key="about.onlineSubmissions"}</a></li>
    	{if $currentJournal->getLocalizedSetting('authorGuidelines') != ''}<li id="linkAuthorGuidelines"><a href="{url page="about" op="submissions" anchor="authorGuidelines"}">{translate key="about.authorGuidelines"}</a></li>{/if}
    	{if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}<li id="linkCopyrightNotice"><a href="{url page="about" op="submissions" anchor="copyrightNotice"}">{translate key="about.copyrightNotice"}</a></li>{/if}
    	{if $currentJournal->getLocalizedSetting('privacyStatement') != ''}<li id="linkPrivacyStatement"><a href="{url page="about" op="submissions" anchor="privacyStatement"}">{translate key="about.privacyStatement"}</a></li>{/if}
    	<li><a href="{$baseUrl}/index.php/OSMP/about/editorialPolicies#sectionPoliciess">Section Specific Guidelines</a></li>
    	{if $authorFees}<li id="linkAuthorFees"><a href="{url page="about" op="submissions" anchor="authorFees"}">{translate key="about.authorFees"}</a></li>{/if}
    </ul>

    <div id="onlineSubmissions">
    	<h3>{translate key="about.onlineSubmissions"}</h3>
    	<p>
    		{translate key="about.onlineSubmissions.haveAccount" journalTitle=$siteTitle|escape}<br />
    		<a href="{url page="login"}" class="action">{translate key="about.onlineSubmissions.login"}</a>
    	</p>
    	{if !$currentJournal->getSetting('disableUserReg')}
    		<p>
    			{translate key="about.onlineSubmissions.needAccount"}<br />
    			<a href="{url page="user" op="register"}" class="action">{translate key="about.onlineSubmissions.registration"}</a>
    		</p>
    		<p>{translate key="about.onlineSubmissions.registrationRequired"}</p>
    	{/if}
      <a href="{url journal=$journalPath page="author" op="submit"}" class="make-bigger-and-orange">Click Here to start a new submission</a>
    </div>

    <div class="separator">&nbsp;</div>

    {if $currentJournal->getLocalizedSetting('authorGuidelines') != ''}
    <h3 id="authorGuidelines"> {translate key="about.authorGuidelines"} <i class="fa fa-arrow-circle-down toggleDownAuthorArrow" aria-hidden="true"></i> <i class="fa fa-arrow-circle-up toggleUpAuthorArrow hidden" aria-hidden="true"></i></h3>
      <div id="author" class="hidden">
        <p>{$currentJournal->getLocalizedSetting('authorGuidelines')|nl2br}</p>
      </div>

    <div class="separator">&nbsp;</div>
    {/if}

    {if $submissionChecklist}
    	<div id="submissionPreparationChecklist"><h3>{translate key="about.submissionPreparationChecklist"}</h3>
    	<p>{translate key="about.submissionPreparationChecklist.description"}</p>
    	<ol>
    		{foreach from=$submissionChecklist item=checklistItem}
    			<li>{$checklistItem.content|nl2br}</li>
    		{/foreach}
    	</ol>
    	<div class="separator">&nbsp;</div>
    	</div>
    {/if}{* $submissionChecklist *}

    {if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}
    <div id="copyrightNotice">
      <h3 id="hideSection1">{translate key="about.copyrightNotice"} (click arrow for more details) <i class="fa fa-arrow-circle-down toggleDownArrow1" aria-hidden="true"></i> <i class="fa fa-arrow-circle-up toggleUpArrow1 hidden" aria-hidden="true"></i></h3>
      <div id="section1" class="hidden">
          <p>{$currentJournal->getLocalizedSetting('copyrightNotice')|nl2br}</p>
      </div>
    <div class="separator">&nbsp;</div>
    </div>
    {/if}

    {if $currentJournal->getLocalizedSetting('privacyStatement') != ''}<div id="privacyStatement"><h3>{translate key="about.privacyStatement"}</h3>
    <p>{$currentJournal->getLocalizedSetting('privacyStatement')|nl2br}</p>

    <div class="separator">&nbsp;</div>
    </div>
    {/if}

    {if $authorFees}

    <div id="authorFees"><h3>{translate key="manager.payment.authorFees"}</h3>
    	<p>{translate key="about.authorFeesMessage"}</p>
    	{if $currentJournal->getSetting('submissionFeeEnabled')}
    		<p>{$currentJournal->getLocalizedSetting('submissionFeeName')|escape}: {$currentJournal->getSetting('submissionFee')|string_format:"%.2f"} ({$currentJournal->getSetting('currency')})<br />
    		{$currentJournal->getLocalizedSetting('submissionFeeDescription')|nl2br}<p>
    	{/if}
    	{if $currentJournal->getSetting('fastTrackFeeEnabled')}
    		<p>{$currentJournal->getLocalizedSetting('fastTrackFeeName')|escape}: {$currentJournal->getSetting('fastTrackFee')|string_format:"%.2f"} ({$currentJournal->getSetting('currency')})<br />
    		{$currentJournal->getLocalizedSetting('fastTrackFeeDescription')|nl2br}<p>
    	{/if}
    	{if $currentJournal->getSetting('publicationFeeEnabled')}
    		<p>{$currentJournal->getLocalizedSetting('publicationFeeName')|escape}: {$currentJournal->getSetting('publicationFee')|string_format:"%.2f"} ({$currentJournal->getSetting('currency')})<br />
    		{$currentJournal->getLocalizedSetting('publicationFeeDescription')|nl2br}<p>
    	{/if}
    	{if $currentJournal->getLocalizedSetting('waiverPolicy') != ''}
    		<p>{$currentJournal->getLocalizedSetting('waiverPolicy')|nl2br}</p>
    	{/if}
    </div>
    {/if}
  </div>
</div>


<script type="text/javascript">
var sectionCounterNum = {$sectionCounter}
{literal}
//console.log(sectionCounterNum);
// for(i = 0; i <= sectionCounterNum; i++){
//   var hide = "#hideSection" + i;
//   var section = "#section" + i;
//   console.log(hide + " " + section);
//   $(hide).on("click", section, function(sect){
//     $(section).toggleClass("hidden");
//     $(".toggleUpArrow" + i).toggle();
//     $(".toggleDownArrow" + i).toggle();
//   });
// }
// $("#hideSection2").on("click", function(){
//   $("#section2").toggleClass("hidden");
//
// })
$("#hideSection1").click(function(){
  $("#section1").toggleClass("hidden");
  $(".toggleUpArrow1").toggleClass("hidden");
  $(".toggleDownArrow1").toggleClass("hidden");
 })

$("#hideSection2").click(function(){
  $("#section2").toggleClass("hidden");
  $(".toggleUpArrow2").toggleClass("hidden");
  $(".toggleDownArrow2").toggleClass("hidden");
 })

 $("#hideSection3").click(function(){
   $("#section3").toggleClass("hidden");
   $(".toggleUpArrow3").toggleClass("hidden");
   $(".toggleDownArrow3").toggleClass("hidden");
  })

  $("#hideSection4").click(function(){
    $("#section4").toggleClass("hidden");
    $(".toggleUpArrow4").toggleClass("hidden");
    $(".toggleDownArrow4").toggleClass("hidden");
   })

   $("#hideSection5").click(function(){
     $("#section5").toggleClass("hidden");
     $(".toggleUpArrow5").toggleClass("hidden");
     $(".toggleDownArrow5").toggleClass("hidden");
    })

    $("#hideSection6").click(function(){
      $("#section6").toggleClass("hidden");
      $(".toggleUpArrow6").toggleClass("hidden");
      $(".toggleDownArrow6").toggleClass("hidden");
     })

     $("#hideSection7").click(function(){
       $("#section7").toggleClass("hidden");
       $(".toggleUpArrow7").toggleClass("hidden");
       $(".toggleDownArrow7").toggleClass("hidden");
      })

      $("#hideSection8").click(function(){
        $("#section8").toggleClass("hidden");
        $(".toggleUpArrow8").toggleClass("hidden");
        $(".toggleDownArrow8").toggleClass("hidden");
       })

       $("#hideSection9").click(function(){
         $("#section9").toggleClass("hidden");
         $(".toggleUpArrow9").toggleClass("hidden");
         $(".toggleDownArrow9").toggleClass("hidden");
        })

        $("#hideSection10").click(function(){
          $("#section10").toggleClass("hidden");
          $(".toggleUpArrow10").toggleClass("hidden");
          $(".toggleDownArrow10").toggleClass("hidden");
         })

         $("#hideSection11").click(function(){
           $("#section11").toggleClass("hidden");
           $(".toggleUpArrow11").toggleClass("hidden");
           $(".toggleDownArrow11").toggleClass("hidden");
          })

          $("#hideSection12").click(function(){
            $("#section12").toggleClass("hidden");
            $(".toggleUpArrow12").toggleClass("hidden");
            $(".toggleDownArrow12").toggleClass("hidden");
           })

           $("#hideSection13").click(function(){
             $("#section13").toggleClass("hidden");
             $(".toggleUpArrow13").toggleClass("hidden");
             $(".toggleDownArrow13").toggleClass("hidden");
            })

            $("#hideSection14").click(function(){
              $("#section14").toggleClass("hidden");
              $(".toggleUpArrow14").toggleClass("hidden");
              $(".toggleDownArrow14").toggleClass("hidden");
             })

             $("#hideSection15").click(function(){
               $("#section15").toggleClass("hidden");
               $(".toggleUpArrow15").toggleClass("hidden");
               $(".toggleDownArrow15").toggleClass("hidden");
             })

              $("#authorGuidelines").click(function(){
                $("#author").toggleClass("hidden");
                $(".toggleUpAuthorArrow").toggleClass("hidden");
                $(".toggleDownAuthorArrow").toggleClass("hidden");
               })
{/literal}
</script>
{include file="common/footer.tpl"}
