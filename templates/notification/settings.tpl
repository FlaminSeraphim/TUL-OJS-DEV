{**
 * templates/notification/settings.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Displays the notification settings page and unchecks
 *
 *}
{strip}
{assign var="pageTitle" value="notification.settings"}
{include file="common/header.tpl"}
{/strip}

<p>{translate key="notification.settingsDescription"}</p>

<form id="notificationSettings" method="post" action="{url op="saveSettings"}">

<!-- Submission events -->
{foreach from=$notificationSettingCategories item=notificationSettingCategory}
	<h4>{translate key=$notificationSettingCategory.categoryKey}</h4>
	{foreach from=$notificationSettingCategory.settings item=settingId}
		{assign var="notificationSetting" value=$notificationSettings.$settingId}
		{assign var="settingName" value=$notificationSetting.settingName}
		{assign var="emailSettingName" value=$notificationSetting.emailSettingName}
		{assign var="settingKey" value=$notificationSetting.settingKey}

		<ul>
			<li>{translate key=$settingKey title=$titleVar}
			<ul class="plain">
				<li><span>
					<input id="{$settingName|escape}" type="checkbox" name="{$settingName|escape}" {if !$settingId|in_array:$blockedNotifications} checked="checked"{/if} />
					{fieldLabel name="$settingName|escape" key="notification.allow"}
				</span></li>
				<li><span>
					<input id="{$emailSettingName|escape}" type="checkbox" name="{$emailSettingName|escape}"{if $settingId|in_array:$emailSettings} checked="checked"{/if} />
					{fieldLabel name="$emailSettingName|escape" key="notification.email"}
				</span></li>
			</ul>
		</ul>
	{/foreach}
	<br />
{/foreach}

<div class="row">
  <div class="col-xs-12">
    <input type="submit" value="{translate key="form.submit"}" class="btn btn-block marginTopBot" id="regSubmitBtn" />
  </div>
  <div class="col-xs-12">
    <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger btn-block cancelBtn" onclick="document.location.href='{url page="notification" escape=false}'" />
  </div>
</div>

</form>

{include file="common/footer.tpl"}
