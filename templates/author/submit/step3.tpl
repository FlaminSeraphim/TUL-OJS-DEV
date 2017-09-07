{**
 * templates/author/submit/step3.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 3 of author article submission.
 *
 *}
{assign var="pageTitle" value="author.submit.step3"}
{include file="author/submit/submitHeader.tpl"}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/mdColMarginBot.css">
<link rel="stylesheet" href="{$baseUrl}/lib/osu/submissionsstep3.css">

{url|assign:"competingInterestGuidelinesUrl" page="information" op="competingInterestGuidelines"}

<div class="separator"></div>

<form id="submit" method="post" action="{url op="saveSubmit" path=$submitStep}">
<input type="hidden" name="articleId" value="{$articleId|escape}" />
{include file="common/formErrors.tpl"}

{literal}
<script type="text/javascript">
<!--
// Move author up/down
function moveAuthor(dir, authorIndex) {
	var form = document.getElementById('submit');
	form.moveAuthor.value = 1;
	form.moveAuthorDir.value = dir;
	form.moveAuthorIndex.value = authorIndex;
	form.submit();
}
// -->
</script>
{/literal}

{if count($formLocales) > 1}
<div id="locales">


		{fieldLabel name="formLocale" key="form.formLanguage"}

			{url|assign:"submitFormUrl" op="submit" path="3" articleId=$articleId escape=false}
			{* Maintain localized author info across requests *}
			{foreach from=$authors key=authorIndex item=author}
				{if $currentJournal->getSetting('requireAuthorCompetingInterests')}
					{foreach from=$author.competingInterests key="thisLocale" item="thisCompetingInterests"}
						{if $thisLocale != $formLocale}<input type="hidden" name="authors[{$authorIndex|escape}][competingInterests][{$thisLocale|escape}]" value="{$thisCompetingInterests|escape}" />{/if}
					{/foreach}
				{/if}
				{foreach from=$author.biography key="thisLocale" item="thisBiography"}
					{if $thisLocale != $formLocale}<input type="hidden" name="authors[{$authorIndex|escape}][biography][{$thisLocale|escape}]" value="{$thisBiography|escape}" />{/if}
				{/foreach}
				{foreach from=$author.affiliation key="thisLocale" item="thisAffiliation"}
					{if $thisLocale != $formLocale}<input type="hidden" name="authors[{$authorIndex|escape}][affiliation][{$thisLocale|escape}]" value="{$thisAffiliation|escape}" />{/if}
				{/foreach}
			{/foreach}
			{form_language_chooser form="submit" url=$submitFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>


</div>
{/if}

<div id="authors">
<h3>{translate key="article.authors"}</h3>
<input type="hidden" name="deletedAuthors" value="{$deletedAuthors|escape}" />
<input type="hidden" name="moveAuthor" value="0" />
<input type="hidden" name="moveAuthorDir" value="" />
<input type="hidden" name="moveAuthorIndex" value="" />

{foreach name=authors from=$authors key=authorIndex item=author}
<input type="hidden" name="authors[{$authorIndex|escape}][authorId]" value="{$author.authorId|escape}" />
<input type="hidden" name="authors[{$authorIndex|escape}][seq]" value="{$authorIndex+1}" />
{if $smarty.foreach.authors.total <= 1}
<input type="hidden" name="primaryContact" value="{$authorIndex|escape}" />
{/if}

  <div class="row">
    <div class="col-xs-12 col-md-4">
      <label >{fieldLabel name="authors-$authorIndex-firstName" required="true" key="user.firstName"}
    	<input type="text" class="textField" name="authors[{$authorIndex|escape}][firstName]" id="authors-{$authorIndex|escape}-firstName" value="{$author.firstName|escape}" size="20" maxlength="40" /></label>

    </div>
    <div class="col-xs-12 col-md-4">
      <!-- {fieldLabel name="authors-$authorIndex-middleName" key="user.middleName"}
    	<input type="text" class="textField" name="authors[{$authorIndex|escape}][middleName]" id="authors-{$authorIndex|escape}-middleName" value="{$author.middleName|escape}" size="20" maxlength="40" /> -->
      {fieldLabel name="authors-$authorIndex-lastName" required="true" key="user.lastName"}
      <input type="text" class="textField" name="authors[{$authorIndex|escape}][lastName]" id="authors-{$authorIndex|escape}-lastName" value="{$author.lastName|escape}" size="20" maxlength="90" />

    </div>
    <div class="col-xs-12 col-md-4">

      	{fieldLabel name="authors-$authorIndex-email" required="true" key="user.email"}
      	<input type="text" class="textField" name="authors[{$authorIndex|escape}][email]" id="authors-{$authorIndex|escape}-email" value="{$author.email|escape}" size="30" maxlength="90" />


    </div>
  </div>

  <div class="row indexMarginBot">
    <div class="col-xs-12 col-md-6 hidden">
      {fieldLabel name="authors-$authorIndex-orcid" key="user.orcid"}
    	<input type="text" class="textField orcid" name="authors[{$authorIndex|escape}][orcid]" id="authors-{$authorIndex|escape}-orcid" value="{$author.orcid|escape}" size="30" maxlength="90" placeholder="(Click Here for more info)" /><br /><div class="orcidDesc">{translate key="user.orcid.description"}
      </div>

    </div>
    <div class="col-xs-12 col-md-6">

      <!-- {fieldLabel name="authors-$authorIndex-url" key="user.url"}</td>
      <input type="text" name="authors[{$authorIndex|escape}][url]" id="authors-{$authorIndex|escape}-url" value="{$author.url|escape}" size="30" maxlength="255" class="textField" /></td> -->
      {fieldLabel name="authors-$authorIndex-affiliation" key="user.affiliation"}

      		<textarea name="authors[{$authorIndex|escape}][affiliation][{$formLocale|escape}]" class="textArea" id="authors-{$authorIndex|escape}-affiliation" rows="1" cols="40" placeholder="{translate key="user.affiliation.description"}">{$author.affiliation[$formLocale]|escape}</textarea><br />
      		<!-- <span class="instruct">{translate key="user.affiliation.description"}</span> -->
    </div>


      <!-- {fieldLabel name="authors-$authorIndex-biography" key="user.biography"} -->
    	<!-- <textarea name="authors[{$authorIndex|escape}][biography][{$formLocale|escape}]" class="textArea" id="authors-{$authorIndex|escape}-biography" rows="1" ></textarea> -->
      <!-- <textarea name="authors[{$authorIndex|escape}][biography][{$formLocale|escape}]" class="textArea" rows="1"></textarea> -->

  </div>

  <div class="row">
    <!-- <div class="col-xs-12 col-md-6 paddingTop">
      <label><input type="checkbox" name="name" id="questionOne" value=""> Question 1</label> <br>
      <label><input type="checkbox" name="name" id="questionTwo"value=""> Question 1</label> <br>
      <label><input type="checkbox" name="name" id="questionThree" value=""> Question 1</label>
    </div> -->
    <div class="col-xs-12 col-md-6">
      <h3>Competing Interests Form</h3>
      <h5>* If you do not sign a competing interest form you are stating that you have no competing interests.</h5>
      {if $currentJournal->getSetting('requireAuthorCompetingInterests')}

      	{fieldLabel name="authors-$authorIndex-competingInterests" key="author.competingInterests" competingInterestGuidelinesUrl=$competingInterestGuidelinesUrl}
      		<!-- <textarea name="authors[{$authorIndex|escape}][competingInterests][{$formLocale|escape}]" class="textArea unhideCompetingInterests" id="authors-{$authorIndex|escape}-competingInterests" rows="1">{$author.competingInterests[$formLocale]|escape}</textarea> -->

      {/if}{* requireAuthorCompetingInterests *}
      <p>If you have any competing interests please go to the link provided click file/download as then select pdf. <b>Sign it and upload it in the next section (step 4) as a supplementary document. The document must best uploaded with this naming convention (your first name) (your last name) Competing Interest ie. John Smith Competing Interest</b> You can find the document <a href="https://drive.google.com/file/d/0B4dWRxepxyq1STN3c3Y0RjhUZXM/view?usp=sharing" target="_blank">HERE</a>.</p>

    </div>
  </div>
  <div class="row">
    <div class="col-xs-12">
      <h3>{translate key="submission.titleAndAbstract"}</h3>
      <div class="separator"></div>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12 col-md-4">

      <div id="titleAndAbstract">


      	{fieldLabel name="title" required="true" key="article.title"}
      	<input type="text" class="textField" name="title[{$formLocale|escape}]" id="title" value="{$title[$formLocale]|escape}" size="60" placeholder="Title" />
      </div>
    </div>
    <div class="col-xs-12 col-md-8">
      {if $section->getAbstractsNotRequired()==0}{fieldLabel name="abstract" key="article.abstract" required="true"}{else}{fieldLabel name="abstract" key="article.abstract"}{/if}
      <textarea name="abstract[{$formLocale|escape}]" id="" class="textArea" rows="2" cols="60" placeholder="You can copy and paste the abstract from your manuscript here.">{$abstract[$formLocale]|escape}</textarea>

    </div>

  </div>
  <div class="row">
    <div class="col-xs-12">

      {if $section->getMetaIndexed()==1}
      	<div id="indexing">
      		<h3>{translate key="submission.indexing"}</h3>
          <div class="separator"></div>
      		{if $currentJournal->getSetting('metaDiscipline') || $currentJournal->getSetting('metaSubjectClass') || $currentJournal->getSetting('metaSubject') || $currentJournal->getSetting('metaCoverage') || $currentJournal->getSetting('metaType')}<p>{translate key="author.submit.submissionIndexingDescription"} Provide keywords that describe your article. Keywords that if someone googled that keyword your article would be a good search result.</p>{/if}

      		{if $currentJournal->getSetting('metaDiscipline')}

      			{if $currentJournal->getLocalizedSetting('metaDisciplineExamples') != ''} {/if} {fieldLabel name="discipline" key="article.discipline"}
      		<input type="text" class="textField" name="discipline[{$formLocale|escape}]" id="discipline" value="{$discipline[$formLocale]|escape}" size="40" maxlength="255" />

      		{if $currentJournal->getLocalizedSetting('metaDisciplineExamples')}

      			<span class="instruct">{$currentJournal->getLocalizedSetting('metaDisciplineExamples')|escape}</span>

      		{/if}

      		{/if}

      		{if $currentJournal->getSetting('metaSubjectClass')}

      			{fieldLabel name="subjectClass" key="article.subjectClassification"}
      			<input type="text" class="textField" name="subjectClass[{$formLocale|escape}]" id="subjectClass" value="{$subjectClass[$formLocale]|escape}" size="40" maxlength="255" />

      			<a href="{$currentJournal->getLocalizedSetting('metaSubjectClassUrl')|escape}" target="_blank">{$currentJournal->getLocalizedSetting('metaSubjectClassTitle')|escape}</a>

      		{/if}

      		{if $currentJournal->getSetting('metaSubject')}

      			{if $currentJournal->getLocalizedSetting('metaSubjectExamples') != ''}{/if} {fieldLabel name="subject" key="article.subject"}
      		<input type="text" class="textField" name="subject[{$formLocale|escape}]" id="subject" value="{$subject[$formLocale]|escape}" size="40" maxlength="255" />

      		{if $currentJournal->getLocalizedSetting('metaSubjectExamples') != ''}

      			<span class="instruct">{$currentJournal->getLocalizedSetting('metaSubjectExamples')|escape}</span>

      		{/if}

      		{/if}

      		{if $currentJournal->getSetting('metaCoverage')}

      			{if $currentJournal->getLocalizedSetting('metaCoverageGeoExamples') != ''} {/if} {fieldLabel name="coverageGeo" key="article.coverageGeo"}
      			<input type="text" class="textField" name="coverageGeo[{$formLocale|escape}]" id="coverageGeo" value="{$coverageGeo[$formLocale]|escape}" size="40" maxlength="255" />

      		{if $currentJournal->getLocalizedSetting('metaCoverageGeoExamples')}

      			<span class="instruct">{$currentJournal->getLocalizedSetting('metaCoverageGeoExamples')|escape}</span>

      		{/if}

      			{if $currentJournal->getLocalizedSetting('metaCoverageChronExamples') != ''}{/if} {fieldLabel name="coverageChron" key="article.coverageChron"}
      			<input type="text" class="textField" name="coverageChron[{$formLocale|escape}]" id="coverageChron" value="{$coverageChron[$formLocale]|escape}" size="40" maxlength="255" />

      		{if $currentJournal->getLocalizedSetting('metaCoverageChronExamples') != ''}

      		<span class="instruct">{$currentJournal->getLocalizedSetting('metaCoverageChronExamples')|escape}</span>

      		{/if}


      			{if $currentJournal->getLocalizedSetting('metaCoverageResearchSampleExamples') != ''} {/if} {fieldLabel name="coverageSample" key="article.coverageSample"}
      			<input type="text" class="textField" name="coverageSample[{$formLocale|escape}]" id="coverageSample" value="{$coverageSample[$formLocale]|escape}" size="40" maxlength="255" />

      		{if $currentJournal->getLocalizedSetting('metaCoverageResearchSampleExamples') != ''}

      			<span class="instruct">{$currentJournal->getLocalizedSetting('metaCoverageResearchSampleExamples')|escape}</span>

      		{/if}

      		{/if}

      		{if $currentJournal->getSetting('metaType')}
      		 {if $currentJournal->getLocalizedSetting('metaTypeExamples') != ''}{/if}{fieldLabel name="type" key="article.type"}
      			<input type="text" class="textField" name="type[{$formLocale|escape}]" id="type" value="{$type[$formLocale]|escape}" size="40" maxlength="255" />


      		{if $currentJournal->getLocalizedSetting('metaTypeExamples') != ''}

      			<span class="instruct">{$currentJournal->getLocalizedSetting('metaTypeExamples')|escape}</span>

      		{/if}

      		{/if}



      	</div>

      {/if}
    </div>
  </div>
  <div class="row indexMarginBot">
    <div class="col-xs-12 col-md-4">
        <span class="hidden">{translate key="author.submit.languageInstructions"}</span>
    </div>
    <div class="col-md-8">
      <!-- {fieldLabel name="language" key="article.language"} -->
        <input type="text" class="hidden" name="language" id="language" value="{$language|escape}" size="5" maxlength="10" />
    </div>
  </div>














<!--
{fieldLabel name="authors-$authorIndex-country" key="common.country"}</td>

		<select name="authors[{$authorIndex|escape}][country]" id="authors-{$authorIndex|escape}-country" class="selectMenu">
			<option value=""></option>
			{html_options options=$countries selected=$author.country}
		</select> -->






{call_hook name="Templates::Author::Submit::Authors"}

{if $smarty.foreach.authors.total > 1}

		<a href="javascript:moveAuthor('u', '{$authorIndex|escape}')" class="action">&uarr;</a> <a href="javascript:moveAuthor('d', '{$authorIndex|escape}')" class="action">&darr;</a>
		{translate key="author.submit.reorderInstructions"}


	<input type="radio" name="primaryContact" value="{$authorIndex|escape}"{if $primaryContact == $authorIndex} checked="checked"{/if} /> <label for="primaryContact">{translate key="author.submit.selectPrincipalContact"}</label> <input class="btn btn-danger cancelBtn indexMarginBot"  type="submit" name="delAuthor[{$authorIndex|escape}]" value="{translate key="author.submit.deleteAuthor"}" class="button" />



{/if}

{foreachelse}
<input type="hidden" name="authors[0][authorId]" value="0" />
<input type="hidden" name="primaryContact" value="0" />
<input type="hidden" name="authors[0][seq]" value="1" />


	{fieldLabel name="authors-0-firstName" required="true" key="user.firstName"}
	<input type="text" class="textField" name="authors[0][firstName]" id="authors-0-firstName"  />


	{fieldLabel name="authors-0-middleName" key="user.middleName"}
	<input type="text" class="textField" name="authors[0][middleName]" id="authors-0-middleName"  />


  {fieldLabel name="authors-0-lastName" required="true" key="user.lastName"}
  <input type="text" class="textField" name="authors[0][lastName]" id="authors-0-lastName"  />


	{fieldLabel name="authors-0-email" required="true" key="user.email"}
  <input type="text" class="textField" name="authors[0][email]" id="authors-0-email" />


	{fieldLabel name="authors-0-orcid" key="user.orcid"}

	<input type="text" class="textField orcid" name="authors[0][orcid]" id="authors-0-orcid"  /><br /><div class="orcidDesc">{translate key="user.orcid.description"}</div>



{fieldLabel name="authors-0-url" key="user.url"}
	<input type="text" class="textField" name="authors[0][url]" id="authors-0-url" size="30" maxlength="255" />



		<textarea name="authors[0][affiliation][{$formLocale|escape}]" class="textArea" id="authors-0-affiliation" rows="1" placeholder="{translate key="user.affiliation.description"})" ></textarea>
		<!-- <span class="instruct">{translate key="user.affiliation.description"}</span> -->



{fieldLabel name="authors-0-country" key="common.country"}

		<select name="authors[0][country]" id="authors-0-country" class="selectMenu">
			<option value=""></option>
			{html_options options=$countries}
		</select>


{if $currentJournal->getSetting('requireAuthorCompetingInterests')}

  {fieldLabel name="authors-0-competingInterests" key="author.competingInterests" competingInterestGuidelinesUrl=$competingInterestGuidelinesUrl}
	<textarea name="authors[0][competingInterests][{$formLocale|escape}]" class="textArea" id="authors-0-competingInterests" rows="5" cols="40"></textarea>

{/if}

	<!-- <td width="20%" class="label">{fieldLabel name="authors-0-biography" key="user.biography"}<br />{translate key="user.biography.description"}</td>
	<td width="80%" class="value"><textarea name="authors[0][biography][{$formLocale|escape}]" class="textArea" id="authors-0-biography" rows="5" cols="40"></textarea></td> -->

{/foreach}

<p><input type="submit" class="btn changeRadius" name="addAuthor" value="{translate key="author.submit.addAuthor"}" /></p>
</div>



<div id="submissionSupportingAgencies">
<h3>{translate key="author.submit.submissionSupportingAgencies"}</h3>
<div class="separator"></div>
<p>{translate key="author.submit.submissionSupportingAgenciesDescription"}</p>


	<!-- {fieldLabel name="sponsor" key="submission.agencies"} -->
	<input type="text" class="textField" name="sponsor[{$formLocale|escape}]" id="sponsor" value="{$sponsor[$formLocale]|escape}" size="60" maxlength="255" placeholder="Agencies" />

</div>


{call_hook name="Templates::Author::Submit::AdditionalMetadata"}

{if $currentJournal->getSetting('metaCitations')}
<div id="metaCitations">
<h3>{translate key="submission.citations"}</h3>
<div class="separator"></div>
<p>{translate key="author.submit.submissionCitations"}</p>


	{fieldLabel name="citations" key="submission.citations"}
	<textarea name="citations" id="citations" class="textArea" rows="5" cols="60" placeholder="You can copy and paste the references and citations from your article here.">{$citations|escape}</textarea>


</div>
{/if}

<p><input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-block " id="regSubmitBtn" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger btn-block cancelBtn"  onclick="confirmAction('{url page="author"}', '{translate|escape:"jsparam" key="author.submit.cancelSubmission"}')" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

<script type="text/javascript">{literal}
$("#questionOne").click(function(){
	if(!$("questionTwo").is(":checked") && !$("questionThree").is(":checked") ){
		alert("questionOne is good");
		$(".unhideCompetingInterests").toggle();
	}
});
$("#questionTwo").click(function(){
	if(!$("questionOne").is(":checked") && !$("questionThree").is(":checked") ){
		alert("questionTwo is good");
		$(".unhideCompetingInterests").toggle();
	}
});
$("#questionThree").click(function(){
	if(!$("questionOne").is(":checked") && !$("questionTwo").is(":checked") ){
		alert("questionThree is good");
		$(".unhideCompetingInterests").toggle();
	}
});
$("#affDropDown").change(function(){
  $("#affiliation").val($("#affDropDown").val());
});
$(".orcid").focusin(function(){
  $(".orcidDesc").toggle();
})
$(".orcid").focusout(function(){
  $(".orcidDesc").toggle();
})
{/literal}
</script>

{if $scrollToAuthor}
	{literal}
	<script type="text/javascript">
		var authors = document.getElementById('authors');
		authors.scrollIntoView(false);
	</script>
	{/literal}
{/if}

{include file="common/footer.tpl"}
