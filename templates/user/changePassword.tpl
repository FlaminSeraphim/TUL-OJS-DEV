{**
 * templates/user/changePassword.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to change a user's password.
 *
 *}
{strip}
{assign var="pageTitle" value="user.changePassword"}
{url|assign:"currentUrl" page="user" op="changePassword"}
{include file="common/header.tpl"}
{/strip}

<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css">

<div id="changePassword">
<form method="post" action="{url op="savePassword"}">

{include file="common/formErrors.tpl"}



  <div class="row">
    <div class="col-xs-4 col-xs-offset-4">
      {if $implicitAuth}
      <p><span class="instruct">{translate key="user.profile.implicitAuthChangePasswordInstructions"}</span></p>
      {/if}
      <p><span class="instruct">{translate key="user.profile.changePasswordInstructions"}</span></p>
    </div>

    <div class="col-md-4 col-md-offset-4 loginMarginBot">
      <input type="password" name="oldPassword" id="oldPassword" value="{$oldPassword|escape}" size="20" class="textField" placeholder="Old Password" />
    </div>
    <div class="col-md-4 col-md-offset-4 loginMarginBot">
      <input type="password" name="password" value="{$password|escape}" id="password" size="20" class="textField" placeholder="New Password" />
      <span class="instruct">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</span>
    </div>
    <div class="col-md-4 col-md-offset-4 loginMarginBot">
      <input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" class="textField" placeholder="Repeat New Password" />
      <input type="submit" value="{translate key="common.save"}" class="btn btn-block marginTopBot " id="regSubmitBtn"  /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger btn-block cancelBtn" onclick="document.location.href='{url page="user" escape=false}'" />
    </div>
  </div>
</form>
{include file="common/footer.tpl"}
