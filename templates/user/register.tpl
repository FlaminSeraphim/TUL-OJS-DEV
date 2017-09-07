{**
 * templates/user/register.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.register"}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css">
<link rel="stylesheet" href="{$baseUrl}/lib/osu/regform.css" type="text/css">

{if $implicitAuth === true && !Validation::isLoggedIn()}
	<p><a href="{url page="login" op="implicitAuthLogin"}">{translate key="user.register.implicitAuth"}</a></p>
{else}

<div class="row">
  <div class="col-md-8 col-md-offset-2">
    <form id="registerForm" method="post" action="{url op="registerUser"}">

  	<p>{translate key="user.register.completeForm"}</p>

  	{if !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn())}
  		{if !$existingUser}
  			{url|assign:"url" page="user" op="register" existingUser=1}
  			<p>{translate key="user.register.alreadyRegisteredOtherJournal" registerUrl=$url}</p>
  		{else}
  			{url|assign:"url" page="user" op="register"}
  			<p>{translate key="user.register.notAlreadyRegisteredOtherJournal" registerUrl=$url}</p>
  			<input type="hidden" name="existingUser" value="1"/>
  		{/if}

  		{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
  			<p><a href="{url page="login" op="implicitAuthLogin"}">{translate key="user.register.implicitAuth"}</a></p>
  		{/if}

  		<h3>{translate key="user.profile"}</h3>

  		{include file="common/formErrors.tpl"}

  		{if $existingUser}
  			<p>{translate key="user.register.loginToRegister"}</p>
  		{/if}
  	{/if}{* !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn()) *}

  	{if $source}
  		<input type="hidden" name="source" value="{$source|escape}" />
  	{/if}
  {/if}{* $implicitAuth === true && !Validation::isLoggedIn() *}

    <table class="data" width="">
    {if count($formLocales) > 1 && !$existingUser}
    	<tr valign="top">
    		<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
    		<td width="80%" class="value">
    			{url|assign:"userRegisterUrl" page="user" op="register" escape=false}
    			{form_language_chooser form="registerForm" url=$userRegisterUrl}
    			<span class="instruct">{translate key="form.formLanguage.description"}</span>
    		</td>
    	</tr>
    </table>
    {/if}{* count($formLocales) > 1 && !$existingUser *}
    <div class="row">
      <div class="col-xs-12 col-md-4">

        {if !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn())}
        	<!-- <tr valign="top"> -->
        		<!-- <td width="20%" class="label">{fieldLabel name="username" required="true" key="user.username"}</td> -->
        		<!-- <td width="" class="value"> --> <span class="underlineForm"><input type="text" name="username" value="{$username|escape}" id="username" class="username" size="20" maxlength="32" class="textField" placeholder="Username*"/> </span><!--</td>-->
        	<!-- </tr> -->
        	{if !$existingUser}
        	<!-- <tr valign="top"> -->
        		<!-- <td></td> -->
        		<!-- <td class="instruct">{translate key="user.register.usernameRestriction"}</td> -->
        	<!-- </tr> -->
        	{/if}{* !$existingUser *}
          <label class="important" for="password">Password</label> <input type="text" class="required hds" >

      </div>
      <div class="col-xs-12 col-md-4">

            	<!-- <tr valign="top"> -->
            		<!-- <td class="label">{fieldLabel name="password" required="true" key="user.password"}</td> -->
            		<!-- <td class="value"> --> <span class="underlineForm"><input type="password" name="password" value="{$password|escape}" id="password" size="20" class="textField" placeholder="Password at least 6 Char*" /> </span><span class="underlineForm"><!--</td>-->
            	<!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        {if !$existingUser}
          <!-- <tr valign="top">
            <td></td> -->
            <!-- <td class="instruct">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</td> -->
          <!-- </tr> -->
          <!-- <tr valign="top"> -->
            <!-- <td class="label">{fieldLabel name="password2" required="true" key="user.repeatPassword"}</td> -->
            <!-- <td class="value"> --><span class="underlineForm"><input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" class="textField" placeholder="Repeat Password" /></span><!-- </td>-->
          <!-- </tr> -->
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="firstName" required="true" key="user.firstName"}</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="textField" placeholder="First Name*" /></span><!-- </td>-->
    		<!-- </tr> -->

      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
          <!-- <td class="label">{fieldLabel name="lastName" required="true" key="user.lastName"}</td> -->
          <!-- <td class="value">--><span class="underlineForm"><input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="textField" placeholder="Last Name*" /></span><!-- </td>-->
        <!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="gender-m" key="user.gender"}</td> -->
    			<!-- <td class="value"> -->
    				<span class="underlineForm"><select name="gender" id="gender" size="1" class="selectMenu" placeholder="gender*">
              <option class="makeLighter">Gender</option>
    					{html_options_translate options=$genderOptions selected=$gender}
    				</select></span>
    			<!-- </td> -->
    		<!-- </tr> -->
      </div>
    </div>
    <div class="row">
      <div id="affParentDropDown" class="col-xs-12 col-md-8">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="affiliation" key="user.affiliation"}</td> -->
    			<!-- <td class="value"> -->
            <!-- <span class="instruct">{translate key="user.affiliation.description"}</span> -->
            <span class="underlineForm"><select id="affDropDown"  >
              <option>School Affiliation List</option>
              <option class="pickedOption">Alabama College of Osteopathic Medicine
              (ACOM)</option>
              <option class="pickedOption">Arizona College of Osteopathic Medicine
              of Midwestern University (AZCOM/MWU)</option>
              <option class="pickedOption">Des Moines University College of
              Osteopathic Medicine (DMU-COM)</option>
              <option class="pickedOption">Arkansas College of Osteopathic Medicine
              (ARCOM)</option>
              <option class="pickedOption">Burrell College of Osteopathic Medicine
              (BCOM)</option>
              <option class="pickedOption">Kansas City University of Medicine and
              Biosciences College of Osteopathic Medicine
              (KCU-COM)</option>
              <option class="pickedOption">A.T. Still University–Kirksville College
              of Osteopathic Medicine (ATSU-KCOM)</option>
              <option class="pickedOption">Campbell University Jerry M. Wallace School
              of Osteopathic Medicine (CUSOM)</option>
              <option class="pickedOption">Lake Erie College of Osteopathic Medicine
              (LECOM)</option>
              <option class="pickedOption">A.T. Still University–School of Osteopathic
              Medicine in Arizona (ATSU-SOMA)</option>
              <option class="pickedOption">Chicago College of Osteopathic Medicine
              of Midwestern University (CCOM/MWU)</option>
              <option class="pickedOption">Lake Erie College of Osteopathic Medicine
              Bradenton Campus (LECOM Bradenton)</option>
              <option class="pickedOption">Liberty University College of
              Osteopathic Medicine (LUCOM)</option>
              <option class="pickedOption">Pacific Northwest University of Health Sciences
              College of Osteopathic Medicine (PNWU-COM)</option>
              <option class="pickedOption">University of New England College
              of Osteopathic Medicine (UNECOM)</option>
              <option class="pickedOption">Lincoln Memorial University–DeBusk College
              of Osteopathic Medicine (LMU-DCOM)</option>
              <option class="pickedOption">Philadelphia College of Osteopathic Medicine
              (PCOM)</option>
              <option class="pickedOption">University of North Texas Health Science Center
              at Fort Worth/Texas College of Osteopathic
              Medicine (UNTHSC/TCOM)</option>
              <option class="pickedOption">Marian University College of
              Osteopathic Medicine (MU-COM)</option>
              <option class="pickedOption">Georgia Campus–Philadelphia College
              of Osteopathic Medicine (GA-PCOM)</option>
              <option class="pickedOption">University of Pikeville–Kentucky College
              of Osteopathic Medicine (UP-KYCOM)</option>
              <option class="pickedOption">Michigan State University College
              of Osteopathic Medicine (MSUCOM)</option>
              <option class="pickedOption">Rocky Vista University College
              of Osteopathic Medicine (RVUCOM)</option>
              <option class="pickedOption">Edward Via College of Osteopathic Medicine–
              Auburn Campus (VCOM-Auburn)</option>
              <option class="pickedOption">New York Institute of Technology College
              of Osteopathic Medicine (NYITCOM)</option>
              <option class="pickedOption">Rowan University School of Osteopathic
              Medicine (RowanSOM)</option>Edward Via College of Osteopathic Medicine–
              Carolinas Campus (VCOM-CC)</option>
              <option class="pickedOption">New York Institute of Technology College
              of Osteopathic Medicine (NYITCOM)</option>
              <option class="pickedOption">Rowan University School of Osteopathic
              Medicine (RowanSOM)</option>
              <option class="pickedOption">Edward Via College of Osteopathic Medicine–
              Carolinas Campus (VCOM-CC)</option>
              <option class="pickedOption">Nova Southeastern University College
              of Osteopathic Medicine (NSU-COM)</option>
              <option class="pickedOption">Touro College of Osteopathic Medicine–
              New York (TouroCOM-NY)</option>
              <option class="pickedOption">Edward Via College of Osteopathic Medicine–
              Virginia Campus (VCOM-VC)</option>
              <option class="pickedOption">Ohio University Heritage College of
              Osteopathic Medicine (OU-HCOM)</option>
              <option class="pickedOption">Touro University College of Osteopathic
              Medicine–California (TUCOM-CA)</option>
              <option class="pickedOption">West Virginia School of Osteopathic
              Medicine (WVSOM)</option>
              <option class="pickedOption">Oklahoma State University Center for Health
              Sciences College of Osteopathic Medicine
              (OSU-COM)</option>
              <option class="pickedOption">Touro University Nevada College
              of Osteopathic Medicine (TUNCOM)</option>
              <option class="pickedOption">Western University of Health Sciences/
              College of Osteopathic Medicine of the Pacific
              (Western U/COMP)</option>
              <option class="pickedOption">University of Incarnate Word School of
              Osteopathic Medicine (UIWSOM)</option>
              <option class="pickedOption">William Carey University College of
              Osteopathic Medicine (WCUCOM)</option>

            </select></span>
    			<!-- </td>
    		</tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <span class="underlineForm"><textarea id="affiliation" name="affiliation[{$formLocale|escape}]" rows="2" cols="40" class="textArea" placeholder="School Affiliation (if not in list)*" >{$affiliation[$formLocale]|escape}</textarea></span>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			 <!-- <td class="label">Rank{fieldLabel name="signature" key="user.signature"}</td> -->
    			<!-- <td class="value"> -->
            <span class="underlineForm"><select id="signature" class="" name="signature[{$formLocale|escape}]">
              <option>Rank</option>
              <option>MS I</option>
              <option>MS II</option>
              <option>MS III</option>
              <option>MS IV</option>
              <option>PGY I</option>
              <option>PGY II</option>
              <option>PGY III</option>
              <option>PGY IV</option>
              <option>PGY V</option>
              <option>PGY VI+</option>
              <option>Fellow</option>
              <option>Assistant Professor</option>
              <option>Associate Professor</option>
              <option>Full Professor</option>
              <option>Graduate Student</option>
              <option>Undergraduate Student</option>
            </select></span>
            <!-- <textarea name="" id="signature" rows="" cols="40" class="textArea">{$signature[$formLocale]|escape}</textarea>--></td>
    		<!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="email" required="true" key="user.email"}</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="textField" placeholder="Email*" /></span> <!-- {if $privacyStatement}<a class="action" href="#privacyStatement">{translate key="user.register.privacyStatement"}--></a>{/if}<!-- </td>-->
    		<!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="confirmEmail" required="true" key="user.confirmEmail"}</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" id="confirmEmail" name="confirmEmail" value="{$confirmEmail|escape}" size="30" maxlength="90" class="textField" placeholder="Confirm Email*" /></span><!-- </td>-->
    		<!-- </tr> -->
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-6 hidden">
        <!-- <tr valign="top"> -->
          <!-- <td class="label">{fieldLabel name="orcid" key="user.orcid"}</td> -->
          <!-- <td class="value">--><span class="underlineForm"><input type="text" id="orcid" name="orcid" value="{$orcid|escape}" size="40" maxlength="255" class="textField" placeholder="ORCID ID (Click Here for more info)" /><span id="orcidDesc">{translate key="user.orcid.description"}</span></span><!-- </td>-->
        <!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-6">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="phone" key="user.phone"}</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="textField" placeholder="Phone" /></span><!-- </td>-->
    		<!-- </tr> -->
      </div>

        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="biography" key="user.biography"}<br />{translate key="user.biography.description"}</td> -->
    			<!-- <td class="value"><span class="underlineForm"><input type="text" name="biography[{$formLocale|escape}]" placeholder="Biography Statement"></span>-->
          <!-- <textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="textArea" placeholder="Bio Statement" >{$biography[$formLocale]|escape}</textarea></td>-->
    		<!-- </tr> -->

    </div>
    <div class="row">
      <div class="col-xs-12 col-md-12" id="regCheckBoxes">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label">{fieldLabel name="sendPassword" key="user.sendPassword"}</td> -->
    			<!-- <td class="value"> -->
    				<input type="checkbox" name="sendPassword" id="sendPassword" value="1"{if $sendPassword} checked="checked"{/if} /> <label for="sendPassword">{translate key="user.sendPassword.description"}</label>
    			<!-- </td> -->
    		<!-- </tr> -->
        {if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL || ($implicitAuth === true && Validation::isLoggedIn())}
        	{if $allowRegReader || $allowRegReader === null || $allowRegAuthor || $allowRegAuthor === null || $allowRegReviewer || $allowRegReviewer === null || ($currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification)}
        		<!-- <tr valign="top"> -->
        			<!-- <td class="label">-->{fieldLabel suppressId="true" name="registerAs" key="user.register.registerAs"}<!-- </td>-->
        			<!-- <td class="value">-->{if $allowRegReader || $allowRegReader === null}<input type="checkbox" name="registerAsReader" id="registerAsReader" value="1"{if $registerAsReader} checked="checked"{/if} /> <label for="registerAsReader">{translate key="user.role.reader"}</label>: {translate key="user.register.readerDescription"}<br />{/if}
        			{if $currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification}<input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"{if $openAccessNotification} checked="checked"{/if} /> <label for="openAccessNotification">{translate key="user.role.reader"}</label>: {translate key="user.register.openAccessNotificationDescription"}<br />{/if}
        			{if $allowRegAuthor || $allowRegAuthor === null} <br> <input type="checkbox" name="registerAsAuthor" id="registerAsAuthor" value="1"{if $registerAsAuthor} checked="checked"{/if} /> <label for="registerAsAuthor">{translate key="user.role.author"}</label>: {translate key="user.register.authorDescription"}<br />{/if}
        			{if $allowRegReviewer || $allowRegReviewer === null}<input type="checkbox" name="registerAsReviewer" id="registerAsReviewer" value="1"{if $registerAsReviewer} checked="checked"{/if} /> <label for="registerAsReviewer">{translate key="user.role.reviewer"}</label>: {if $existingUser}{translate key="user.register.reviewerDescriptionNoInterests"}{else}{translate key="user.register.reviewerDescription"}{/if}
        			<br /><div id="reviewerInterestsContainer" class="hidden" style="margin-left:25px;">
        				<label class="desc hidden">{translate key="user.register.reviewerInterests"}</label>
        				{include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
        			</div>
        			<!-- </td> -->
        			{/if}
        		<!-- </tr> -->
        	{/if}
      </div>
      <!-- <div class="col-xs-12 col-md-4">

      </div>
      <div class="col-xs-12 col-md-4">

      </div> -->
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-12">
        {/if}{* !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn()) *}
          <!-- </table> -->
          <!-- <br /> -->
          <input type="submit" value="{translate key="user.register"}" class="btn btn-block" id="regSubmitBtn" /> <!-- <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="index" escape=false}'" />-->
        {/if}{* !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL || ($implicitAuth === true && Validation::isLoggedIn()) *}
      </div>

    </div>

<table>


    		{if $captchaEnabled}
    			<tr>
    				{if $reCaptchaEnabled}
    				<td class="label" valign="top">{fieldLabel name="recaptcha_challenge_field" required="true" key="common.captchaField"}</td>
    				<td class="value">
    					{$reCaptchaHtml}
    				</td>
    				{else}
    				<td class="label" valign="top">{fieldLabel name="captcha" required="true" key="common.captchaField"}</td>
    				<td class="value">
    					<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
    					<span class="instruct">{translate key="common.captchaField.description"}</span><br />
    					<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="textField" />
    					<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
    				</td>
    				{/if}
    			</tr>
    		{/if}{* $captchaEnabled *}

    		<tr valign="top hidden">
    			<td class="label hidden">{fieldLabel name="salutation" key="user.salutation"}</td>
    			<td class="value hidden"><input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="textField" /></td>
    		</tr>

    		<tr valign="top hiden">
    			<td class="label hidden">{fieldLabel name="middleName" key="user.middleName"}</td>
    			<td class="value hidden"><input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="textField"  /></td>
    		</tr>



    		<tr valign="top hidden">
    			<td class="label hidden">{fieldLabel name="initials" key="user.initials"}</td>
    			<td class="value hidden"><input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="textField" />&nbsp;&nbsp;{translate key="user.initialsExample"}</td>
    		</tr>











    		<tr valign="top hidden">
    			<td class="label hidden">{fieldLabel name="userUrl" key="user.url"}</td>
    			<td class="value hidden"><input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="30" maxlength="255" class="textField" /></td>
    		</tr>



    		<tr valign="top hidden">
    			<td class="label hidden">{fieldLabel name="fax" key="user.fax"}</td>
    			<td class="value hidden"><input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="textField" /></td>
    		</tr>

    		<tr valign="top hidden">
    			<td class="label hidden">{fieldLabel name="mailingAddress" key="common.mailingAddress"}</td>
    			<td class="value hidden"><textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="textArea">{$mailingAddress|escape}</textarea></td>
    		</tr>

    		<tr valign="top hidden">
    			<td class="label hidden">{fieldLabel name="country" key="common.country"}</td>
    			<td class="value hidden">
    				<select name="country" id="country" class="selectMenu">
    					<option value=""></option>
    					{html_options options=$countries selected=$country}
    				</select>
    			</td>
    		</tr>





    		{if count($availableLocales) > 1}
    			<tr valign="top">
    				<td class="label">{translate key="user.workingLanguages"}</td>
    				<td class="value">{foreach from=$availableLocales key=localeKey item=localeName}
    				<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> <label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label><br />
    				{/foreach}</td>
    			</tr>
    		{/if}{* count($availableLocales) > 1 *}
    	{/if}{* !$existingUser *}



    {if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
    	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

    {/if}{* !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL *}
  </table>
    </form>
    <div id="privacyStatement">
    {if $privacyStatement}
    	<h3>{translate key="user.register.privacyStatement"}</h3>
    	<p>{$privacyStatement|nl2br}</p>
    {/if}
    </div>
  </div>
</div>






<script type="text/javascript">{literal}
$("#affDropDown").change(function(){
  $("#affiliation").val($("#affDropDown").val());
});
$("#orcid").focusin(function(){
  $("#orcidDesc").toggle();
})
$("#orcid").focusout(function(){
  $("#orcidDesc").toggle();
})
$("#registerForm").submit(function(){
  if($('.required').val() !== ''){
    console.log('yo');
    return false;
  }
})
{/literal}
</script>

{include file="common/footer.tpl"}
