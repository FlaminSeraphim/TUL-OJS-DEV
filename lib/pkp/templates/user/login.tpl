{**
 * templates/user/login.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.login"}
{include file="common/header.tpl"}
{/strip}

{if !$registerOp}
	{assign var="registerOp" value="register"}
{/if}
{if !$registerLocaleKey}
	{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{/if}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css">


{if $loginMessage}
	<span class="instruct">{translate key="$loginMessage"}</span>
	<br />
	<br />
{/if}

{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
	<h3>{translate key="user.login.implicitAuth"}</h3>
{/if}
{if $implicitAuth}
	<a id="implicitAuthLogin" href="{url page="login" op="implicitAuthLogin"}">{translate key="user.login.implicitAuthLogin"}</a>
{/if}
{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
	<h3>{translate key="user.login.localAuth"}</h3>
{/if}
{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
	<form id="signinForm" method="post" action="{$loginUrl}">
{/if}

{if $error}
	<span class="pkp_form_error">{translate key="$error" reason=$reason}</span>
	<br />
	<br />
{/if}
{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
<div class="row">
  <div class="col-md-4 col-md-offset-4 loginMarginBot">
    <span class="underlineForm"><input type="text" id="loginUsername" name="username" value="{$username|escape}" size="20" maxlength="32" class="textField" placeholder="Username" /></span>
  </div>
</div>
<div class="row">
  <div class="col-md-4 col-md-offset-4 loginMarginBot">
    <span class="underlineForm"><input type="password" id="loginPassword" name="password" value="{$password|escape}" size="20" class="textField" placeholder="Password" /></span>

  </div>
</div>
<div class="row">
  <div class="col-md-4 col-md-offset-4">
    {if $showRemember}
    <input type="checkbox" id="loginRemember" name="remember" value="1"{if $remember} checked="checked"{/if} /> <label for="loginRemember">{translate key="user.login.rememberUsernameAndPassword"}</label>
    {/if}{* $showRemember *}
    <input type="submit" value="{translate key="user.login"}" class="btn btn-block" id="regSubmitBtn" />
    <ul>
  		{if !$hideRegisterLink}<li><a href="{url page="user" op=$registerOp}">{translate key=$registerLocaleKey}</a></li>{/if}
  		<li><a href="{url page="login" op="lostPassword"}">{translate key="user.login.forgotPassword"}</a></li>
  	</ul>
  </div>
</div>
<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />



<script type="text/javascript">
<!--
	document.getElementById('{if $username}loginPassword{else}loginUsername{/if}').focus();
// -->
</script>
</form>
{/if}{* !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL *}

{include file="common/footer.tpl"}
