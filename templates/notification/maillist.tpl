{**
 * templates/notification/maillist.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Displays the notification settings page and unchecks
 *
 *}
{strip}
{assign var="pageTitle" value="notification.mailList"}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css" />
<div class="row">
  <div class="col-md-4 col-md-offset-4">
    <p><span class="instruct">{translate key="notification.mailListDescription"}</span></p>

    {if $isError}
    <p>
    	<span class="formError">{translate key="form.errorsOccurred"}:</span>
    	<ul class="formErrorList">
    	{foreach key=field item=message from=$errors}
    			<li>{$message}</li>
    	{/foreach}
    	</ul>
    </p>
    {/if}

    {if $success}
    	<p><span class="formSuccess">{translate key="$success"}</span></p>
    {/if}
  </div>
</div>
    <form id="notificationSettings" method="post" action="{url op="saveSubscribeMailList"}">
    <div class="row">
      <div class="col-md-4 col-md-offset-4 loginMarginBot">
        <!-- {fieldLabel name="email" key="user.email"} -->
        <span class="underlineForm"><input placeholder="Email" type="text" id="email" name="email" size="30" maxlength="90" class="textField " /></span>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-4 loginMarginBot">
        <!-- {fieldLabel name="confirmEmail" key="user.confirmEmail"} -->
        <span class="underlineForm"><input placeholder="Confirm Email" type="text" id="confirmEmail" name="confirmEmail" size="30" maxlength="90" class="textField " /></span>
      </div>
    </div>
<div class="row">
  <div class="col-md-4 col-md-offset-4">

        	{if $captchaEnabled && $reCaptchaHtml}

        	{fieldLabel name="recaptcha_challenge_field" required="true" key="common.captchaField"}

        			{$reCaptchaHtml}


        	{elseif $captchaEnabled}
        	{fieldLabel name="captcha" required="true" key="common.captchaField"}

        			<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
        			<span class="instruct">{translate key="common.captchaField.description"}</span><br />
        			<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="textField" />
        			<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />


        	{/if}{* $captchaEnabled *}

        		<p><input type="submit" value="{translate key="form.submit"}" class="btn btn-block" id="regSubmitBtn" /></p>


        </form>
        <h5 >{translate key="notification.mailList.register"}</h5>
        <ul >
        	{if $settings.allowRegReviewer}
        		{url|assign:"url" page="user" op="register"}
        		<li>{translate key="notification.mailList.review" reviewUrl=$url} </li>
        	{/if}
        	{if $settings.allowRegAuthor}
        		{url|assign:"url" page="information" op="authors"}
        		<li>{translate key="notification.mailList.submit" submitUrl=$url} </li>
        	{/if}
        	{if $settings.subscriptionsEnabled}
        		{url|assign:"url" page="user" op="register"}
        		<li>{translate key="notification.mailList.protectedContent" subscribeUrl=$url}
        	{/if}
        <li><a href="{url page="about" op="submissions" anchor="privacyStatement"}">{translate key="about.privacyStatement"}</a></li>
        </ul>

        </form>

  </div>
</div>



{include file="common/footer.tpl"}
